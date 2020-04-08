<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class Candidates_Save_Action extends Vtiger_Save_Action {

	public function checkPermission(Vtiger_Request $request) {
		$moduleName = $request->getModule();
		$record = $request->get('record');

		$actionName = ($record) ? 'EditView' : 'CreateView';
		if(!Users_Privileges_Model::isPermitted($moduleName, $actionName, $record)) {
			throw new AppException(vtranslate('LBL_PERMISSION_DENIED'));
		}

		if(!Users_Privileges_Model::isPermitted($moduleName, 'Save', $record)) {
			throw new AppException(vtranslate('LBL_PERMISSION_DENIED'));
		}

		if ($record) {
			$recordEntityName = getSalesEntityType($record);
			if ($recordEntityName !== $moduleName) {
				throw new AppException(vtranslate('LBL_PERMISSION_DENIED'));
			}
		}
	}
	
	public function validateRequest(Vtiger_Request $request) {
		return $request->validateWriteAccess();
	}

	public function process(Vtiger_Request $request) {
		try {
			$recordModel = $this->saveRecord($request);
			$candidate_action = $request->get('candidate_action');
			$recordId = $request->get('record');
			if ($request->get('returntab_label')){
				$loadUrl = 'index.php?'.$request->getReturnURL();
			} else if($request->get('relationOperation')) {
				$parentModuleName = $request->get('sourceModule');
				$parentRecordId = $request->get('sourceRecord');
				$parentRecordModel = Vtiger_Record_Model::getInstanceById($parentRecordId, $parentModuleName);
				//TODO : Url should load the related list instead of detail view of record
				$loadUrl = $parentRecordModel->getDetailViewUrl();
			} else if ($request->get('returnToList')) {
				$loadUrl = $recordModel->getModule()->getListViewUrl();
			} else if ($request->get('returnmodule') && $request->get('returnview')) {
				$loadUrl = 'index.php?'.$request->getReturnURL();
			}else{
				if($candidate_action == 'Hire'){
                    if($recordId){
                        $employId = $this->getEmployeeIdByCandidateId($recordId);
                        $loadUrl = 'index.php?module=Employee&view=Detail&record='.$employId.'&app=HRM';
                    }else{
						$loadUrl = $recordModel->getDetailViewUrl();
					}
                }else{
                    $loadUrl = $recordModel->getDetailViewUrl();
                }
			}
			//append App name to callback url
			//Special handling for vtiger7.
			$appName = $request->get('appName');
			if(strlen($appName) > 0){
				$loadUrl = $loadUrl.$appName;
			}
			header("Location: $loadUrl");
		} catch (DuplicateException $e) {
			$requestData = $request->getAll();
			$moduleName = $request->getModule();
			unset($requestData['action']);
			unset($requestData['__vtrftk']);

			if ($request->isAjax()) {
				$response = new Vtiger_Response();
				$response->setError($e->getMessage(), $e->getDuplicationMessage(), $e->getMessage());
				$response->emit();
			} else {
				$requestData['view'] = 'Edit';
				$requestData['duplicateRecords'] = $e->getDuplicateRecordIds();
				$moduleModel = Vtiger_Module_Model::getInstance($moduleName);

				global $vtiger_current_version;
				$viewer = new Vtiger_Viewer();

				$viewer->assign('REQUEST_DATA', $requestData);
				$viewer->assign('REQUEST_URL', $moduleModel->getCreateRecordUrl().'&record='.$request->get('record'));
				$viewer->view('RedirectToEditView.tpl', 'Vtiger');
			}
		} catch (Exception $e) {
			throw new Exception($e->getMessage());
		}
	}

	/**
	 * Function to save record
	 * @param <Vtiger_Request> $request - values of the record
	 * @return <RecordModel> - record Model of saved record
	 */
	public function saveRecord($request) {
		$recordModel = $this->getRecordModelFromRequest($request);
		if($request->get('imgDeleted')) {
			$imageIds = $request->get('imageid');
			foreach($imageIds as $imageId) {
				$status = $recordModel->deleteImage($imageId);
			}
		}
		$recordModel->save();
		if($request->get('relationOperation')) {
			$parentModuleName = $request->get('sourceModule');
			$parentModuleModel = Vtiger_Module_Model::getInstance($parentModuleName);
			$parentRecordId = $request->get('sourceRecord');
			$relatedModule = $recordModel->getModule();
			$relatedRecordId = $recordModel->getId();
			if($relatedModule->getName() == 'Events'){
				$relatedModule = Vtiger_Module_Model::getInstance('Calendar');
			}

			$relationModel = Vtiger_Relation_Model::getInstance($parentModuleModel, $relatedModule);
			$relationModel->addRelation($parentRecordId, $relatedRecordId);
		}
		$this->savedRecordId = $recordModel->getId();
		return $recordModel;
	}

	/**
	 * Function to get the record model based on the request parameters
	 * @param Vtiger_Request $request
	 * @return Vtiger_Record_Model or Module specific Record Model instance
	 */
	protected function getRecordModelFromRequest(Vtiger_Request $request)
    {
        global $adb;

        $moduleName = $request->getModule();
        $recordId = $request->get('record');
        $active_candidate = $request->get('active_candidate');

        $moduleModel = Vtiger_Module_Model::getInstance($moduleName);

        if (!empty($recordId)) {
            $recordModel = Vtiger_Record_Model::getInstanceById($recordId, $moduleName);
            $recordModel->set('id', $recordId);
            $recordModel->set('mode', 'edit');
        } else {
            $recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
            $recordModel->set('mode', '');
            $recordModel->set('status', 'Potential');
        }

        $fieldModelList = $moduleModel->getFields();
        foreach ($fieldModelList as $fieldName => $fieldModel) {
            $fieldValue = $request->get($fieldName, null);
            $fieldDataType = $fieldModel->getFieldDataType();
            if ($fieldDataType == 'time') {
                $fieldValue = Vtiger_Time_UIType::getTimeValueWithSeconds($fieldValue);
            }
            //Action for Candidate module
            $action_date = date('Y-m-d H:i:s');
            if ($fieldName == 'candidate_action' && $fieldValue == 'Shortlist') {
                global $adb;
                $shortListNote = $request->get('shortlist_note', null);
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $shortListNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
            }
            if ($fieldName == 'candidate_action' && $fieldValue == 'Schedule Interview') {
                global $adb;
                $interviewNote = $request->get('si_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $interviewNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
            }

            if ($fieldName == 'candidate_action' && $fieldValue == 'Mark Interview Passed') {
                global $adb;
                $interviewPassedNote = $request->get('mip_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $interviewPassedNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $start_work_date = $request->get('mip_swork');
                $start_work_date = date('Y-m-d', strtotime($start_work_date));
                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ?, start_work_date = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $start_work_date, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
            }

            if ($fieldName == 'candidate_action' && $fieldValue == 'Offer Job') {
                global $adb;
                $offerJobNote = $request->get('oj_note', null);
                $sqlInsertOfferJob = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $offerJobNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertOfferJob, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
            }

            if ($fieldName == 'candidate_action' && $fieldValue == 'Hire') {
                global $adb;
                $interviewPassedNote = $request->get('mip_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $interviewPassedNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $desired_salary = $request->get('mip_de_salary');
                $official_salary = $request->get('official_salary');
                $probality_period = $request->get('mip_probation');

                $start_work_date = $request->get('mip_swork');
                $start_work_date = date('Y-m-d', strtotime($start_work_date));
                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ?, start_work_date = ?,desired_salary = ?,official_salary = ?,probality_period =? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $start_work_date, $desired_salary, $official_salary, $probality_period, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
                $adb->pquery("UPDATE vtiger_users SET `status` = 'Active' WHERE candidate = ?", array($recordId));
                //$recordModel->set('status', 'Active');
                if (!empty($recordId)) {
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Active' WHERE id = ?", array($recordId));
                } else {
                    $recordModel->set('status', 'Active');
                }
            }

            if ($fieldName == 'candidate_action' && $fieldValue == 'Reject') {
                global $adb;
                $rejectNote = $request->get('reject_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $rejectNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
                if (!empty($recordId)) {
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Failed' WHERE id = ?", array($recordId));
                } else {
                    $recordModel->set('status', 'Failed');
                }
            }
            if ($fieldName == 'candidate_action' && $fieldValue == 'Reject after shortlist') {
                global $adb;
                $rejectNote = $request->get('reject_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $rejectNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
                if (!empty($recordId)) {
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Failed' WHERE id = ?", array($recordId));
                } else {
                    $recordModel->set('status', 'Failed');
                }
            }
            if ($fieldName == 'candidate_action' && $fieldValue == 'Reject after SI') {
                global $adb;
                $rejectNote = $request->get('reject_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $rejectNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
                if (!empty($recordId)) {
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Failed' WHERE id = ?", array($recordId));
                } else {
                    $recordModel->set('status', 'Failed');
                }
            }
            if ($fieldName == 'candidate_action' && $fieldValue == 'Reject after MIP') {
                global $adb;
                $rejectNote = $request->get('reject_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $rejectNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
                if (!empty($recordId)) {
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Failed' WHERE id = ?", array($recordId));
                } else {
                    $recordModel->set('status', 'Failed');
                }
            }
            if ($fieldName == 'candidate_action' && $fieldValue == 'Reject after OJ') {
                global $adb;
                $rejectNote = $request->get('reject_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $rejectNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
                if (!empty($recordId)) {
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Failed' WHERE id = ?", array($recordId));
                } else {
                    $recordModel->set('status', 'Failed');
                }
            }

            if ($fieldName == 'candidate_action' && $fieldValue == 'Mark Interview Failed') {
                global $adb;
                $mifNote = $request->get('mif_note');
                $sqlInsertShortList = "INSERT INTO hrm_employee_history(`employ_id`,`note`,`date`,`action`) VALUES(?,?,?,?)";
                $params = array($recordId, $mifNote, $action_date, $fieldValue);
                $adb->pquery($sqlInsertShortList, $params);

                $updateEmployFlag = "UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?";
                $updateParams = array($fieldValue, $recordId);
                $adb->pquery($updateEmployFlag, $updateParams);
                //$recordModel->set('status', 'Failed');
                if (!empty($recordId)) {
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Failed' WHERE id = ?", array($recordId));
                } else {
                    $recordModel->set('status', 'Failed');
                }
            }

            if ($active_candidate == 1) {
                $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Potential' WHERE id = ?", array($recordId));
                $adb->pquery("UPDATE vtiger_hrm_employee SET flag = '' WHERE candidate_id = ?", array($recordId));
                $adb->pquery("UPDATE vtiger_hrm_candidate SET candidate_action = '' WHERE id = ?", array($recordId));
            }

            //Action for Candidate module
            if ($fieldValue !== null) {
                if (!is_array($fieldValue) && $fieldDataType != 'currency') {
                    $fieldValue = trim($fieldValue);
                }
                $recordModel->set($fieldName, $fieldValue);
            }
        }
        return $recordModel;
    }

    public function getEmployeeIdByCandidateId($candidate_id){
        global $adb;
        $sql = "SELECT e.employid FROM vtiger_hrm_employee AS e INNER JOIN vtiger_crmentity AS c ON c.crmid = e.employid WHERE c.deleted = 0 AND candidate_id = ?";
        $result = $adb->pquery($sql,array($candidate_id));
        if($adb->num_rows($result)){
            $employ_id = $adb->query_result($result,0,'employid');
        }
        return $employ_id;
    }
}
