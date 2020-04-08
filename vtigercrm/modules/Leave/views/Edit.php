<?php

/* +***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 * *********************************************************************************** */

class Leave_Edit_View extends Vtiger_Edit_View {


    public function checkPermission(Vtiger_Request $request) {
        $moduleName = $request->getModule();
        $record = $request->get('record');

        $actionName = 'CreateView';
        if ($record && !$request->get('isDuplicate')) {
            $actionName = 'EditView';
        }

        $canEdit = false;
        if($moduleName=='Leave' && $record){
            $recordModel = Vtiger_Record_Model::getInstanceById($record,$moduleName);
            $smCreator = $recordModel->getCreatorId($record);
            if($smCreator == Users_Record_Model::getCurrentUserModel()->getId() || in_array(Users_Record_Model::getCurrentUserModel()->getUserRoleName(),array('Vice President','HR','hR','Hr','hr'))){
                $canEdit = true;
            }
        }

        if(!Users_Privileges_Model::isPermitted($moduleName, $actionName, $record)) {
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

    public function process(Vtiger_Request $request) {
        $viewer = $this->getViewer ($request);
        $moduleName = $request->getModule();
        $record = $request->get('record');
        $assignUserTmp = $this->getEmployAssignUser();

        $roleName = $this->getHRRoleNameByUserId(Users_Record_Model::getCurrentUserModel()->getId());
        $employData = $this->getCurrentEmployee();
        $leaveBalance = 0;
        $leaveAccepted = 0;

        if(!empty($record) && $request->get('isDuplicate') == true) {
            $recordModel = $this->record?$this->record:Vtiger_Record_Model::getInstanceById($record, $moduleName);
            $viewer->assign('MODE', '');

            //While Duplicating record, If the related record is deleted then we are removing related record info in record model
            $mandatoryFieldModels = $recordModel->getModule()->getMandatoryFieldModels();
            foreach ($mandatoryFieldModels as $fieldModel) {
                if ($fieldModel->isReferenceField()) {
                    $fieldName = $fieldModel->get('name');
                    if (Vtiger_Util_Helper::checkRecordExistance($recordModel->get($fieldName))) {
                        $recordModel->set($fieldName, '');
                    }
                }
            }
        }else if(!empty($record)) {
            $recordModel = $this->record?$this->record:Vtiger_Record_Model::getInstanceById($record, $moduleName);
            $leaveBalance = $this->getLeaveBalanceByEmployId($recordModel->get('employ_id'));
            $leaveAccepted = $recordModel->getLeaveAccepted($recordModel->get('employ_id'));
            $leaveBalance = $leaveBalance - $leaveAccepted;
            $viewer->assign('RECORD_ID', $record);
            $viewer->assign('MODE', 'edit');
        } else {
            $recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
            $recordModel->set('assigned_user_id',$assignUserTmp);
            if($moduleName=='Leave'){
                $recordModel->set('employ_id',$employData['employid']);
            }
            $leaveBalance = $this->getLeaveBalanceByEmployId($employData['employid']);
            $leaveAccepted = $recordModel->getLeaveAccepted($employData['employid']);
            $leaveBalance = $leaveBalance - $leaveAccepted;
            $viewer->assign('MODE', '');
        }
        if(!$this->record){
            $this->record = $recordModel;
        }
        $showAction = false;
        if($record){
            $currentAction = $recordModel->get('hrm_leave_action');
            $currentUserId = Users_Record_Model::getCurrentUserModel()->getId();
            $assignedUserId = $recordModel->get('assigned_user_id');
            if($currentUserId == $assignedUserId || $roleName =='Vice President'){
                $showAction = true;
            }
        }

        $moduleModel = $recordModel->getModule();
        $fieldList = $moduleModel->getFields();
        $requestFieldList = array_intersect_key($request->getAllPurified(), $fieldList);

        $relContactId = $request->get('contact_id');
        if ($relContactId && $moduleName == 'Calendar') {
            $contactRecordModel = Vtiger_Record_Model::getInstanceById($relContactId);
            $requestFieldList['parent_id'] = $contactRecordModel->get('account_id');
        }

        foreach($requestFieldList as $fieldName=>$fieldValue){
            $fieldModel = $fieldList[$fieldName];
            $specialField = false;
            // We collate date and time part together in the EditView UI handling
            // so a bit of special treatment is required if we come from QuickCreate
            if ($moduleName == 'Calendar' && empty($record) && $fieldName == 'time_start' && !empty($fieldValue)) {
                $specialField = true;
                // Convert the incoming user-picked time to GMT time
                // which will get re-translated based on user-time zone on EditForm
                $fieldValue = DateTimeField::convertToDBTimeZone($fieldValue)->format("H:i");

            }

            if ($moduleName == 'Calendar' && empty($record) && $fieldName == 'date_start' && !empty($fieldValue)) {
                $startTime = Vtiger_Time_UIType::getTimeValueWithSeconds($requestFieldList['time_start']);
                $startDateTime = Vtiger_Datetime_UIType::getDBDateTimeValue($fieldValue." ".$startTime);
                list($startDate, $startTime) = explode(' ', $startDateTime);
                $fieldValue = Vtiger_Date_UIType::getDisplayDateValue($startDate);
            }
            if($fieldModel->isEditable() || $specialField) {
                $recordModel->set($fieldName, $fieldModel->getDBInsertValue($fieldValue));
            }

        }

        $recordStructureInstance = Vtiger_RecordStructure_Model::getInstanceFromRecordModel($recordModel, Vtiger_RecordStructure_Model::RECORD_STRUCTURE_MODE_EDIT);
        $picklistDependencyDatasource = Vtiger_DependencyPicklist::getPicklistDependencyDatasource($moduleName);

        $viewer->assign('PICKIST_DEPENDENCY_DATASOURCE',Vtiger_Functions::jsonEncode($picklistDependencyDatasource));
        $viewer->assign('RECORD_STRUCTURE_MODEL', $recordStructureInstance);
        $viewer->assign('RECORD_STRUCTURE', $recordStructureInstance->getStructure());
        $viewer->assign('MODULE', $moduleName);
        $viewer->assign('CURRENTDATE', date('Y-n-j'));
        $viewer->assign('USER_MODEL', Users_Record_Model::getCurrentUserModel());



        $viewer->assign('EMPLOYID',$employData['employid']);
        $viewer->assign('EMPLOYNAME',$employData['name']);
        $viewer->assign('ROLENAME',$roleName);
        $viewer->assign('LEAVE_BALANCE',$leaveBalance);
        $viewer->assign('CURRENT_ACTION',$currentAction);
        $viewer->assign('SHOW_ACTION',$showAction);

        $isRelationOperation = $request->get('relationOperation');

        //if it is relation edit
        $viewer->assign('IS_RELATION_OPERATION', $isRelationOperation);
        if($isRelationOperation) {
            $viewer->assign('SOURCE_MODULE', $request->get('sourceModule'));
            $viewer->assign('SOURCE_RECORD', $request->get('sourceRecord'));
        }

        // added to set the return values
        if($request->get('returnview')) {
            $request->setViewerReturnValues($viewer);
        }
        $viewer->assign('MAX_UPLOAD_LIMIT_MB', Vtiger_Util_Helper::getMaxUploadSize());
        $viewer->assign('MAX_UPLOAD_LIMIT_BYTES', Vtiger_Util_Helper::getMaxUploadSizeInBytes());
        if($request->get('displayMode')=='overlay'){
            $viewer->assign('SCRIPTS',$this->getOverlayHeaderScripts($request));
            $viewer->view('OverlayEditView.tpl', $moduleName);
        }
        else{
            $viewer->view('EditView.tpl', $moduleName);
        }

	}

	public function getCurrentEmployee(){
	    global $adb;
	    $userRecordModel = Users_Record_Model::getCurrentUserModel();
	    $result = $adb->pquery("SELECT employid, CONCAT(firstname, ' ', lastname) AS name FROM vtiger_hrm_employee WHERE user_id = ?",array($userRecordModel->getId()));
	    $data = array();
	    while ($row = $adb->fetchByAssoc($result)){
            $data['employid'] = $row['employid'];
            $data['name'] = $row['name'];
        }
        return $data;
    }

    public function getEmployAssignUser(){
	    global $adb;
        $user_id = Users_Record_Model::getCurrentUserModel()->getId();
        $sql = "SELECT
                        vc.smownerid
                    FROM
                        vtiger_hrm_employee as he
                    INNER JOIN vtiger_crmentity as vc ON vc.crmid = he.employid
                    INNER JOIN vtiger_users as vu ON vu.id = vc.smownerid
                    WHERE he.user_id = ?";
        $resultEmployId = $adb->pquery($sql,array($user_id));
        $assign_to = $adb->query_result($resultEmployId,0,'smownerid');
        return $assign_to;
    }

    public function getHRRoleNameByUserId($user_id){
        global $adb;
        $sql = "SELECT
                vr.rolename
                FROM
                    vtiger_users as vu
                INNER JOIN vtiger_user2role as ur ON vu.id = ur.userid
                INNER JOIN vtiger_role as vr ON vr.roleid = ur.roleid
                WHERE vu.id = ?";
        $result = $adb->pquery($sql,array($user_id));
        $roleName = $adb->query_result($result,0,'rolename');
        return $roleName;
    }

    public function getLeaveBalanceByEmployId($employ_id){
        global $adb;
        $currentUserRecordModel = Users_Record_Model::getCurrentUserModel();
        $user_id = $currentUserRecordModel->getId();
        $result = $adb->pquery("SELECT
                                        he.official_date
                                    FROM
                                        vtiger_hrm_employee AS he
                                    INNER JOIN vtiger_crmentity AS vc ON vc.crmid = he.employid
                                    INNER JOIN vtiger_users AS vu ON vu.id = he.user_id
                                    WHERE vc.deleted = 0 
                                    AND
                                        he.employid = ?",array($employ_id));
        $start_work_date = $adb->query_result($result,0,'official_date');
        $leaveBalance = 0;
        if($start_work_date != ''){
            $now = date('Y-m-d');

            if(date('Y',strtotime($start_work_date)) != date('Y',strtotime($now))){
                $start_work_date = date('Y-m-d', strtotime('first day of january this year'));
            }

            $start_work_date = date_create($start_work_date);
            $now = date_create($now);
            $leaveBalance =date_diff($start_work_date,$now)->format("%a")/30;
            $leaveBalance = number_format($leaveBalance,2);

            return $leaveBalance;
        }

    }

}
