<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

class Employee_Index_View extends Vtiger_Index_View {

    public function preProcess(Vtiger_Request $request, $display = true)
    {
        parent::preProcess($request, false);

        $viewer = $this->getViewer($request);
        $kpi_data = $this->getKPIdata();
        $menuNames = $this->getHRMMenu();
        //Menu after Permission
        $showModule = array();
        foreach ($menuNames as $menuName) {
            $moduleModel = Vtiger_Module_Model::getInstance($menuName);
            $currentUser = Users_Record_Model::getCurrentUserModel();
            $userPrivilegesModel = Users_Privileges_Model::getInstanceById($currentUser->getId());
            $permissionModel = $userPrivilegesModel->get('profile_tabs_permission');
            $permission2 = $permissionModel[$moduleModel->getId()];
            if ($permission2 == 0) {
                $showModule[] = $menuName;
            }
        }
        //Menu after Permission
        $moduleName = $request->getModule();
        if (!empty($moduleName)) {
            $moduleModel = Vtiger_Module_Model::getInstance($moduleName);
            $currentUser = Users_Record_Model::getCurrentUserModel();
            $userPrivilegesModel = Users_Privileges_Model::getInstanceById($currentUser->getId());
            $permission = $userPrivilegesModel->hasModulePermission($moduleModel->getId());
            $viewer->assign('MODULE', $moduleName);

            if (!$permission) {
                $viewer->assign('MESSAGE', vtranslate('LBL_PERMISSION_DENIED'));
                $viewer->view('OperationNotPermitted.tpl', $moduleName);
                exit;
            }

            $linkParams = array('MODULE' => $moduleName, 'ACTION' => $request->get('view'));
            $linkModels = $moduleModel->getSideBarLinks($linkParams);

            $viewer->assign('QUICK_LINKS', $linkModels);
            $this->setModuleInfo($request, $moduleModel);
        }
        $viewer->assign('CURRENT_USER_MODEL', Users_Record_Model::getCurrentUserModel());
        $viewer->assign('REQUEST_INSTANCE', $request);
        $viewer->assign('CURRENT_VIEW', $request->get('view'));
        $viewer->assign('KPIS', $kpi_data);
        $viewer->assign('HRM_MENUS', $menuNames);
        $viewer->assign('SHOW_MODULES', $showModule);
        if ($display) {
            $this->preProcessDisplay($request);
        }
    }


    public function process(Vtiger_Request $request)
    {
        $dataWidget = array();
        $dataWidget['Employee'] = $this->getDataForEmployeeWidget();
        $dataWidget['Leave'] = $this->getDataForLeaveWidget();
        $dataWidget['KPI'] = $this->getDataforKPIWidget();
        $dataWidget['Candidates'] = $this->getDataForCandidateWidget();
        $moduleName = $request->getModule();
        $viewer = $this->getViewer($request);
        $viewer->assign('ACTIVITIES', $dataWidget);
        $viewer->view('Index.tpl', $moduleName);
    }

    /**
     * Function to get the list of Script models to be included
     * @param Vtiger_Request $request
     * @return <Array> - List of Vtiger_JsScript_Model instances
     */
    function getHeaderScripts(Vtiger_Request $request)
    {
        $headerScriptInstances = parent::getHeaderScripts($request);
        $moduleName = $request->getModule();

        $jsFileNames = array(
            'modules.Vtiger.resources.Vtiger',
            "modules.$moduleName.resources.$moduleName",
            "~libraries/jquery/jquery.stickytableheaders.min.js",
        );

        $jsScriptInstances = $this->checkAndConvertJsScripts($jsFileNames);
        $headerScriptInstances = array_merge($headerScriptInstances, $jsScriptInstances);
        return $headerScriptInstances;
    }

    public function validateRequest(Vtiger_Request $request)
    {
        $request->validateReadAccess();
    }

    public function getKPIdata()
    {
        global $adb, $current_user;
        $date = date('Y-m-d');
        $result = $adb->pquery("SELECT kpi.* FROM vtiger_hrm_kpi AS kpi INNER JOIN vtiger_crmentity AS ce ON ce.crmid = kpi.id INNER JOIN vtiger_users AS vu ON vu.id = ce.smownerid WHERE ce.deleted = 0 AND vu.id = ? AND kpi.due_date >= ? ORDER BY kpi.due_date DESC LIMIT 5", array($current_user->id, $date));
        $data = array();
        while ($row = $adb->fetchByAssoc($result)) {
            $data[] = $row;
        }
        return $data;
    }

    public function getHRMMenu()
    {
        global $adb;
        $rs_mod_nam = $adb->pquery("SELECT `name` FROM `vtiger_tab` WHERE parent = 'HRM' ORDER BY `name`", array());
        $moduleNames = array();
        while ($row = $adb->fetchByAssoc($rs_mod_nam)) {
            $moduleNames[] = $row['name'];
        }
        return $moduleNames;
    }

    public function getDataForEmployeeWidget()
    {
        $db = PearDatabase::getInstance();
        $currentUserModel = Users_Record_Model::getCurrentUserModel();
        $userId = $currentUserModel->getId();
        $roleName = $currentUserModel->getUserRoleName();
        $activities = array();
        if ($roleName == 'Vice President') {
            $query = "SELECT
                        vtiger_crmentity.crmid,
                        vtiger_hrm_employee.firstname,
                        vtiger_hrm_employee.lastname,
                        vtiger_hrm_employee.city,
                        vtiger_hrm_employee.address,
                        vtiger_crmentity.smownerid,
                        vtiger_hrm_employee.email,
                        vtiger_crmentity.modifiedtime,
                        vtiger_hrm_employee.employ_number,
                        vtiger_hrm_employee.employid,
                        vtiger_crmentity_user_field.starred 
                    FROM
                        vtiger_hrm_employee
                        INNER JOIN vtiger_crmentity ON vtiger_hrm_employee.employid = vtiger_crmentity.crmid
                        LEFT JOIN vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id
                        LEFT JOIN vtiger_groups ON vtiger_crmentity.smownerid = vtiger_groups.groupid
                        LEFT JOIN vtiger_crmentity_user_field ON vtiger_hrm_employee.employid = vtiger_crmentity_user_field.recordid 
                        AND vtiger_crmentity_user_field.userid = 1 
                    WHERE
                        vtiger_crmentity.deleted = 0 
                        AND vtiger_hrm_employee.employid > 0 
                        AND vtiger_users.`status` = 'Active' 
                    ORDER BY
                        vtiger_crmentity.modifiedtime DESC
                        LIMIT 0,5";
            $result = $db->pquery($query, array());
        } else {
            $query = "SELECT
                        vtiger_crmentity.crmid,
                        vtiger_hrm_employee.firstname,
                        vtiger_hrm_employee.lastname,
                        vtiger_hrm_employee.city,
                        vtiger_hrm_employee.address,
                        vtiger_crmentity.smownerid,
                        vtiger_hrm_employee.email,
                        vtiger_crmentity.modifiedtime,
                        vtiger_hrm_employee.employ_number,
                        vtiger_hrm_employee.employid,
                        vtiger_crmentity_user_field.starred 
                    FROM
                        vtiger_hrm_employee
                        INNER JOIN vtiger_crmentity ON vtiger_hrm_employee.employid = vtiger_crmentity.crmid
                        LEFT JOIN vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id
                        LEFT JOIN vtiger_groups ON vtiger_crmentity.smownerid = vtiger_groups.groupid
                        LEFT JOIN vtiger_crmentity_user_field ON vtiger_hrm_employee.employid = vtiger_crmentity_user_field.recordid 
                        AND vtiger_crmentity_user_field.userid = 1 
                    WHERE
                        vtiger_crmentity.deleted = 0 
                        AND vtiger_hrm_employee.employid > 0 
                        AND vtiger_users.`status` = 'Active'
                        AND vtiger_hrm_employee.user_id = ? 
                    ORDER BY
                        vtiger_crmentity.modifiedtime DESC
                        LIMIT 0,5";
            $result = $db->pquery($query, array($userId));
        }

        $numOfRows = $db->num_rows($result);
        for ($i = 0; $i < $numOfRows; $i++) {
            $newRow = $db->query_result_rowdata($result, $i);
            $model = Vtiger_Record_Model::getCleanInstance('Employee');
            $model->setData($newRow);
            $model->setId($newRow['crmid']);
            $activities[$newRow['crmid']] = $model;
        }
        return $activities;
    }

    public function getDataForCandidateWidget()
    {

        $db = PearDatabase::getInstance();
        $currentUserModel = Users_Record_Model::getCurrentUserModel();
        $userId = $currentUserModel->getId();
        $roleName = $currentUserModel->getUserRoleName();

        if ($roleName == 'Vice President') {
            $cand_query = "SELECT
                            vtiger_crmentity.crmid,
                            vtiger_hrm_candidate.firstname,
                            vtiger_hrm_candidate.lastname,
                            vtiger_hrm_candidate.email,
                            vtiger_crmentity.smownerid,
                            vtiger_crmentity.modifiedtime,
                            vtiger_hrm_candidate.candidate_action,
                            vtiger_hrm_candidate.id,
                            vtiger_crmentity_user_field.starred 
                        FROM
                            vtiger_hrm_candidate
                            INNER JOIN vtiger_crmentity ON vtiger_hrm_candidate.id = vtiger_crmentity.crmid
                            LEFT JOIN vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id
                            LEFT JOIN vtiger_groups ON vtiger_crmentity.smownerid = vtiger_groups.groupid
                            LEFT JOIN vtiger_crmentity_user_field ON vtiger_hrm_candidate.id = vtiger_crmentity_user_field.recordid 
                            AND vtiger_crmentity_user_field.userid = 1 
                        WHERE
                            vtiger_crmentity.deleted = 0 
                            AND vtiger_hrm_candidate.id > 0 
                            AND vtiger_hrm_candidate.`status` = 'Potential' 
                        ORDER BY
                            vtiger_crmentity.modifiedtime DESC 
                            LIMIT 0,
                            5";
            $cand_result = $db->pquery($cand_query, array());
        } else {
            $cand_query = "SELECT
                            vtiger_crmentity.crmid,
                            vtiger_hrm_candidate.firstname,
                            vtiger_hrm_candidate.lastname,
                            vtiger_hrm_candidate.email,
                            vtiger_crmentity.smownerid,
                            vtiger_crmentity.modifiedtime,
                            vtiger_hrm_candidate.candidate_action,
                            vtiger_hrm_candidate.id,
                            vtiger_crmentity_user_field.starred 
                        FROM
                            vtiger_hrm_candidate
                            INNER JOIN vtiger_crmentity ON vtiger_hrm_candidate.id = vtiger_crmentity.crmid
                            LEFT JOIN vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id
                            LEFT JOIN vtiger_groups ON vtiger_crmentity.smownerid = vtiger_groups.groupid
                            LEFT JOIN vtiger_crmentity_user_field ON vtiger_hrm_candidate.id = vtiger_crmentity_user_field.recordid 
                            AND vtiger_crmentity_user_field.userid = 1 
                        WHERE
                            vtiger_crmentity.deleted = 0 
                            AND vtiger_hrm_candidate.id > 0 
                            AND vtiger_hrm_candidate.`status` = 'Potential' 
                            AND vtiger_crmentity.smownerid = ?
                        ORDER BY
                            vtiger_crmentity.modifiedtime DESC 
                            LIMIT 0,
                            5";
            $cand_result = $db->pquery($cand_query, array($userId));
        }

        $activities = array();
        $numOfRows = $db->num_rows($cand_result);
        for ($i = 0; $i < $numOfRows; $i++) {
            $newRow = $db->query_result_rowdata($cand_result, $i);
            $model = Vtiger_Record_Model::getCleanInstance('Candidates');
            $model->setData($newRow);
            $model->setId($newRow['crmid']);
            $activities[$newRow['crmid']] = $model;
        }
        return $activities;
    }

    public function getDataForLeaveWidget()
    {
        $db = PearDatabase::getInstance();
        $currentUserModel = Users_Record_Model::getCurrentUserModel();
        $userId = $currentUserModel->getId();
        $roleName = $currentUserModel->getUserRoleName();

        if ($roleName == 'Vice President') {
            $leave_query = "SELECT
                            vtiger_crmentity.crmid,
                            vtiger_hrm_leave.employ_id,
                            (SELECT CONCAT(vtiger_hrm_employee.firstname,' ',vtiger_hrm_employee.lastname) AS employ_name FROM vtiger_hrm_employee WHERE vtiger_hrm_employee.employid = vtiger_hrm_leave.employ_id) AS employ_name,
                            vtiger_hrm_leave.from_date,
                            vtiger_hrm_leave.to_date,
                            vtiger_hrm_leave.hrm_leave_type,
                            vtiger_crmentity.smownerid,
                            vtiger_crmentity.modifiedtime,
                            vtiger_hrm_leave.hrm_leave_action,
                            vtiger_hrm_leave.partial_day,
                            vtiger_hrm_leave.note,
                            vtiger_hrm_leave.id,
                            vtiger_crmentity_user_field.starred 
                        FROM
                            vtiger_hrm_leave
                            INNER JOIN vtiger_crmentity ON vtiger_hrm_leave.id = vtiger_crmentity.crmid
                            LEFT JOIN vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id
                            LEFT JOIN vtiger_groups ON vtiger_crmentity.smownerid = vtiger_groups.groupid
                            LEFT JOIN vtiger_crmentity_user_field ON vtiger_hrm_leave.id = vtiger_crmentity_user_field.recordid 
                            AND vtiger_crmentity_user_field.userid = 1 
                        WHERE
                            vtiger_crmentity.deleted = 0 
                            AND vtiger_hrm_leave.id > 0 
                        ORDER BY
                            vtiger_crmentity.modifiedtime DESC 
                            LIMIT 0,5";
            $leave_rs = $db->pquery($leave_query, array());
        } else {
            $leave_query = "SELECT
                            vtiger_crmentity.crmid,
                            vtiger_hrm_leave.employ_id,
                            (SELECT CONCAT(vtiger_hrm_employee.firstname,' ',vtiger_hrm_employee.lastname) AS employ_name FROM vtiger_hrm_employee WHERE vtiger_hrm_employee.employid = vtiger_hrm_leave.employ_id) AS employ_name,
                            vtiger_hrm_leave.from_date,
                            vtiger_hrm_leave.to_date,
                            vtiger_hrm_leave.hrm_leave_type,
                            vtiger_crmentity.smownerid,
                            vtiger_crmentity.modifiedtime,
                            vtiger_hrm_leave.hrm_leave_action,
                            vtiger_hrm_leave.partial_day,
                            vtiger_hrm_leave.note,
                            vtiger_hrm_leave.id,
                            vtiger_crmentity_user_field.starred 
                        FROM
                            vtiger_hrm_leave
                            INNER JOIN vtiger_crmentity ON vtiger_hrm_leave.id = vtiger_crmentity.crmid
                            LEFT JOIN vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id
                            LEFT JOIN vtiger_groups ON vtiger_crmentity.smownerid = vtiger_groups.groupid
                            LEFT JOIN vtiger_crmentity_user_field ON vtiger_hrm_leave.id = vtiger_crmentity_user_field.recordid 
                            AND vtiger_crmentity_user_field.userid = 1 
                        WHERE
                            vtiger_crmentity.deleted = 0 
                            AND vtiger_hrm_leave.id > 0 
                            AND (vtiger_crmentity.smownerid = ? OR vtiger_crmentity.smcreatorid = ?)
                        ORDER BY
                            vtiger_crmentity.modifiedtime DESC
                            LIMIT 0,5";
            $leave_rs = $db->pquery($leave_query, array($userId, $userId));
        }

        $activities = array();
        $numOfRows = $db->num_rows($leave_rs);
        for ($i = 0; $i < $numOfRows; $i++) {
            $newRow = $db->query_result_rowdata($leave_rs, $i);
            $model = Vtiger_Record_Model::getCleanInstance('Leave');
            $model->setData($newRow);
            $model->setId($newRow['crmid']);
            $activities[$newRow['crmid']] = $model;
        }
        return $activities;
    }

    public function getDataforKPIWidget()
    {
        $db = PearDatabase::getInstance();
        $currentUserModel = Users_Record_Model::getCurrentUserModel();
        $currentUserId = $currentUserModel->getId();
        $roleName = $currentUserModel->getUserRoleName();

        if ($roleName == 'Vice President') {
            $kpi_query = "SELECT
                            vtiger_crmentity.crmid,
                            vtiger_hrm_kpi.kpi_name,
                            vtiger_hrm_kpi.kpi_type,
                            vtiger_hrm_kpi.kpi_department,
                            vtiger_hrm_kpi.start_date,
                            vtiger_hrm_kpi.kpi_status,
                            vtiger_hrm_kpi.due_date,
                            vtiger_hrm_kpi.api_manager,
                            vtiger_crmentity.smownerid,
                            vtiger_crmentity.modifiedtime,
                            vtiger_hrm_kpi.cf_01,
                            vtiger_hrm_kpi.cf_02,
                            vtiger_hrm_kpi.cf_07,
                            vtiger_hrm_kpi.id,
                            vtiger_crmentity_user_field.starred 
                        FROM
                            vtiger_hrm_kpi
                            INNER JOIN vtiger_crmentity ON vtiger_hrm_kpi.id = vtiger_crmentity.crmid
                            LEFT JOIN vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id
                            LEFT JOIN vtiger_groups ON vtiger_crmentity.smownerid = vtiger_groups.groupid
                            LEFT JOIN vtiger_crmentity_user_field ON vtiger_hrm_kpi.id = vtiger_crmentity_user_field.recordid 
                            AND vtiger_crmentity_user_field.userid = 1 
                        WHERE
                            vtiger_crmentity.deleted = 0 
                            AND vtiger_hrm_kpi.id > 0 
                        ORDER BY
                            vtiger_crmentity.modifiedtime DESC 
                            LIMIT 0,5";
            $kpi_rs = $db->pquery($kpi_query, array());
        } else {
            $kpi_query = "SELECT
                            vtiger_crmentity.crmid,
                            vtiger_hrm_kpi.kpi_name,
                            vtiger_hrm_kpi.kpi_type,
                            vtiger_hrm_kpi.kpi_department,
                            vtiger_hrm_kpi.start_date,
                            vtiger_hrm_kpi.kpi_status,
                            vtiger_hrm_kpi.due_date,
                            vtiger_hrm_kpi.api_manager,
                            vtiger_crmentity.smownerid,
                            vtiger_crmentity.modifiedtime,
                            vtiger_hrm_kpi.cf_01,
                            vtiger_hrm_kpi.cf_02,
                            vtiger_hrm_kpi.cf_07,
                            vtiger_hrm_kpi.id,
                            vtiger_crmentity_user_field.starred 
                        FROM
                            vtiger_hrm_kpi
                            INNER JOIN vtiger_crmentity ON vtiger_hrm_kpi.id = vtiger_crmentity.crmid
                            LEFT JOIN vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id
                            LEFT JOIN vtiger_groups ON vtiger_crmentity.smownerid = vtiger_groups.groupid
                            LEFT JOIN vtiger_crmentity_user_field ON vtiger_hrm_kpi.id = vtiger_crmentity_user_field.recordid 
                            AND vtiger_crmentity_user_field.userid = 1 
                        WHERE
                            vtiger_crmentity.deleted = 0 
                            AND vtiger_hrm_kpi.id > 0 
                            AND vtiger_crmentity.smownerid = ?
                        ORDER BY
                            vtiger_crmentity.modifiedtime DESC 
                            LIMIT 0,5";
            $kpi_rs = $db->pquery($kpi_query, array($currentUserId));
        }
        $activities = array();
        $numOfRows = $db->num_rows($kpi_rs);
        for ($i = 0; $i < $numOfRows; $i++) {
            $newRow = $db->query_result_rowdata($kpi_rs, $i);
            $model = Vtiger_Record_Model::getCleanInstance('KPI');
            $model->setData($newRow);
            $model->setId($newRow['crmid']);
            $activities[$newRow['crmid']] = $model;
        }
        return $activities;
    }
}