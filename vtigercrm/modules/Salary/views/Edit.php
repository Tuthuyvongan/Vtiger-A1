<?php

/* +***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 * *********************************************************************************** */

class Salary_Edit_View extends Vtiger_Edit_View {


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
            if($smCreator == Users_Record_Model::getCurrentUserModel()->getId() || Users_Record_Model::getCurrentUserModel()->getUserRoleName()=='Vice President'){
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
            $viewer->assign('RECORD_ID', $record);
            $viewer->assign('MODE', 'edit');
        } else {
            $recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
            $viewer->assign('MODE', '');
        }
        if(!$this->record){
            $this->record = $recordModel;
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

    public function getCurrentSalaryByEmployeeId($employ_id){
        global $adb;
        $result = $adb->pquery("SELECT
                                        he.official_salary
                                    FROM
                                        vtiger_hrm_employee AS he
                                    INNER JOIN vtiger_crmentity AS vc ON vc.crmid = he.employid
                                    INNER JOIN vtiger_users AS vu ON vu.id = he.user_id
                                    WHERE
                                        vc.deleted = 0
                                    AND he.employid = ?",array($employ_id));
        $official_salary = $adb->query_result($result,0,'official_salary');
        return $official_salary;
    }

}
