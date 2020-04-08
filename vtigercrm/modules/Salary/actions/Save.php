<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class Salary_Save_Action extends Vtiger_Save_Action {

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
			} else {
				$loadUrl = $recordModel->getDetailViewUrl();
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
	protected function getRecordModelFromRequest(Vtiger_Request $request) {
	    $adb = PearDatabase::getInstance();
		$moduleName = $request->getModule();
		$recordId = $request->get('record');

		$moduleModel = Vtiger_Module_Model::getInstance($moduleName);

		if(!empty($recordId)) {
			$recordModel = Vtiger_Record_Model::getInstanceById($recordId, $moduleName);
			$recordModel->set('id', $recordId);
			$recordModel->set('mode', 'edit');
		} else {
			$recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
			$recordModel->set('mode', '');
		}

		$fieldModelList = $moduleModel->getFields();
		foreach ($fieldModelList as $fieldName => $fieldModel) {
			$fieldValue = $request->get($fieldName, null);
			$fieldDataType = $fieldModel->getFieldDataType();
			if($fieldDataType == 'time'){
				$fieldValue = Vtiger_Time_UIType::getTimeValueWithSeconds($fieldValue);
			}
			if($fieldValue !== null) {
				if(!is_array($fieldValue) && $fieldDataType != 'currency') {
					$fieldValue = trim($fieldValue);
				}

				$return_module = $request->get('returnmodule');
				if($return_module =='Employee'){
                    $return_record = $request->get('returnrecord');
                    $salary_id = $request->get('record');
                    $query_employ_id = "SELECT
                                      r.crmid
                                FROM
                                    vtiger_crmentityrel AS r
                                INNER JOIN vtiger_crmentity AS c ON r.relcrmid = c.crmid
                                WHERE
                                    c.deleted = 0
                                AND (
                                    module = 'Employee'
                                    AND relmodule = 'Salary'
                                )
                                AND relcrmid = ?";
                    $res_employid = $adb->pquery($query_employ_id,array($salary_id));
                    $employId = $adb->query_result($res_employid, 0, 'crmid');
                    if($employId){
                        if($fieldName =='hr_salary_action' && $fieldValue=='Accept'){
                            $official_after_change = $request->get('salary_after');
                            $adb->pquery("UPDATE vtiger_hrm_employee SET official_salary = ? WHERE employid = ?",array($official_after_change,$employId));
                        }
                    }
                }

				$recordModel->set($fieldName, $fieldValue);
			}
		}
		return $recordModel;
	}
}
