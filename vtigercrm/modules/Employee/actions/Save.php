<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class Employee_Save_Action extends Vtiger_Save_Action {

	public function checkPermission(Vtiger_Request $request) {
		$moduleName = $request->getModule();
		$record = $request->get('record');
        $canEdit = false;
        if($moduleName=='Employee' && $record){
            $recordModel = Vtiger_Record_Model::getInstanceById($record,$moduleName);
            $smCreator = $recordModel->getCreatorId($record);
            if($smCreator == Users_Record_Model::getCurrentUserModel()->getId()){
                $canEdit = true;
            }
        }

		$actionName = ($record) ? 'EditView' : 'CreateView';
		if(!Users_Privileges_Model::isPermitted($moduleName, $actionName, $record)) {
            if(!$canEdit){
                throw new AppException(vtranslate('LBL_PERMISSION_DENIED'));
            }
		}

		if(!Users_Privileges_Model::isPermitted($moduleName, 'Save', $record)) {
            if(!$canEdit){
                throw new AppException(vtranslate('LBL_PERMISSION_DENIED'));
            }
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
	    global $adb;
		$moduleName = $request->getModule();
		$recordId = $request->get('record');
		$employee_status = $request->get('employ_status');

		$moduleModel = Vtiger_Module_Model::getInstance($moduleName);

        $rs_roleid = $adb->pquery("SELECT roleid FROM vtiger_role WHERE rolename = 'Sales Person'",array());
        $roleid = $adb->query_result($rs_roleid,0,'roleid');

        $rs_user = $adb->pquery("SELECT user_id FROM vtiger_hrm_employee WHERE employid = ?",array($recordId));
        $count_user = $adb->num_rows($rs_user);

        $employ_first = $request->get('firstname');
        $employ_last = $request->get('lastname');
        $employ_email = $request->get('email');

        if(!empty($recordId)) {
            $recordModel = Vtiger_Record_Model::getInstanceById($recordId, $moduleName);
            $recordModel->set('id', $recordId);
            $recordModel->set('mode', 'edit');

            $employData = $this->getEmployDataByRecordId($recordId);
            if($employee_status=='Inactive'){
                $adb->pquery("UPDATE vtiger_hrm_employee SET flag = '' WHERE employid = ?",array($recordId));
                $rs_userId = $adb->pquery('SELECT
                                                he.user_id 
                                            FROM
                                                vtiger_hrm_employee AS he
                                            INNER JOIN vtiger_crmentity AS vc ON vc.crmid = he.employid
                                            INNER JOIN vtiger_users AS vu ON vu.id = he.user_id
                                            WHERE vc.deleted = 0
                                            AND he.employid = ?',array($recordId));
                $userId = $adb->query_result($rs_userId,0,'user_id');
                $adb->pquery('UPDATE vtiger_users SET status = "Inactive" WHERE id = ?',array($userId));

                $rs_cadidate = $adb->pquery("SELECT candidate_id FROM vtiger_hrm_employee WHERE employid = ?",array($recordId));
                $candidate_id = $adb->query_result($rs_cadidate,0,'candidate_id');

                if($candidate_id > 0){
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET `status` = ? WHERE id = ?",array($employee_status,$candidate_id));
                }else{
                    $candidateModel = Vtiger_Record_Model::getCleanInstance('Candidates');
                    $candidateModel->set('mode','');
                    $candidateModel->set('firstname',$employData['firstname']);
                    $candidateModel->set('lastname',$employData['lastname']);
                    $candidateModel->set('email',$employData['email']);
                    $candidateModel->save();
                    $cadidateId = $candidateModel->getId();
                    if($cadidateId){
                        $adb->pquery("UPDATE vtiger_hrm_employee SET candidate_id = ? WHERE employid = ?",array($cadidateId,$recordId));
                        $adb->pquery('UPDATE vtiger_hrm_candidate SET `status` = "Inactive" WHERE id = ?',array($cadidateId));
                    }
                }

            }else{
                $rs_userId = $adb->pquery('SELECT
                                                he.user_id 
                                            FROM
                                                vtiger_hrm_employee AS he
                                            INNER JOIN vtiger_crmentity AS vc ON vc.crmid = he.employid
                                            INNER JOIN vtiger_users AS vu ON vu.id = he.user_id
                                            WHERE vc.deleted = 0
                                            AND he.employid = ?',array($recordId));
                $userId = $adb->query_result($rs_userId,0,'user_id');
                $adb->pquery('UPDATE vtiger_users SET status = "Active" WHERE id = ?',array($userId));

                $rs_cadidate = $adb->pquery("SELECT candidate_id FROM vtiger_hrm_employee WHERE employid = ?",array($recordId));
                $candidate_id = $adb->query_result($rs_cadidate,0,'candidate_id');

                if($candidate_id > 0){
                    $adb->pquery("UPDATE vtiger_hrm_candidate SET `status` = ? WHERE id = ?",array($employee_status,$candidate_id));
                }else{
                    $candidateModel = Vtiger_Record_Model::getCleanInstance('Candidates');
                    $candidateModel->set('mode','');
                    $candidateModel->set('firstname',$employData['firstname']);
                    $candidateModel->set('lastname',$employData['lastname']);
                    $candidateModel->set('email',$employData['email']);
                    $candidateModel->save();
                    $cadidateId = $candidateModel->getId();
                    if($cadidateId){
                        $adb->pquery("UPDATE vtiger_hrm_employee SET candidate_id = ? WHERE employid = ?",array($cadidateId,$recordId));
                        $adb->pquery('UPDATE vtiger_hrm_candidate SET `status` = "Active" WHERE id = ?',array($cadidateId));
                    }
                }
            }

        } else {
            $recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
            $recordModel->set('mode', '');
            $userModuleName = "Users";
            $userRecordModel = Vtiger_Record_Model::getCleanInstance($userModuleName);
            $userRecordModel->set('mode','');
            $userRecordModel->set('user_password','admin');
            $userRecordModel->set('confirm_password','admin');
            $userRecordModel->set('roleid',$roleid);
            $userRecordModel->set('is_admin','off');
            $userRecordModel->set('status','Active');
            $userRecordModel->set('first_name',$employ_first);
            $userRecordModel->set('last_name',$employ_last);
            $userRecordModel->set('email1',$employ_email);
            $userRecordModel->save();

            $user_id = $userRecordModel->getId();
            $firstname = $userRecordModel->get('first_name');
            $tmpl_str = explode(' ',$firstname);
            $firname_string = '';
            foreach ($tmpl_str as $tmp){
                $firname_string .= $tmp;
            }
            $lastname = $userRecordModel->get('last_name');
            $user_str_1 = $this->convertVNtoLatinString($firname_string);
            $user_str_1 = strtolower($user_str_1);
            $user_str_2 = $this->convertVNtoLatinString($lastname);
            $user_str_2 = strtolower($user_str_2);
            $arr_user_str = explode(" ",$user_str_2);
            $username_str = $user_str_1.".".$arr_user_str[0][0]."".$arr_user_str[1][0];
            $adb->pquery("UPDATE vtiger_users SET user_name = ? WHERE id = ?",array($username_str,$user_id));
            //Make user name string from firstname and lastanme

            if(empty($recordModel->get('employ_number'))){
                $autoEmployNumber = 'EMPL'.$userRecordModel->getId();
                $recordModel->set('employ_number',$autoEmployNumber);
            }
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
                $recordModel->set($fieldName, $fieldValue);
            }
        }
        if(empty($recordId)){
            $recordModel->set('user_id',$user_id);
        }
        return $recordModel;
    }

    public function getEmployDataByRecordId($recordId){
        global $adb;
        $sql = "SELECT firstname, lastname, email FROM vtiger_hrm_employee WHERE employid = ?";
        $result = $adb->pquery($sql,array($recordId));
        $data = array();
        while ($row = $adb->fetchByAssoc($result)){
            $data['firstname'] = $row['firstname'];
            $data['lastname'] = $row['lastname'];
            $data['email'] = $row['email'];
        }
        return $data;
    }

    function convertVNtoLatinString($str) {
        $str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
        $str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
        $str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
        $str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
        $str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
        $str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
        $str = preg_replace("/(đ)/", 'd', $str);

        $str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
        $str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
        $str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
        $str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
        $str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
        $str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
        $str = preg_replace("/(Đ)/", 'D', $str);
        return $str;
    }

}
