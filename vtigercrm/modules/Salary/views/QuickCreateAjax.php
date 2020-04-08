<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class Salary_QuickCreateAjax_View extends Vtiger_QuickCreateAjax_View {

	public function checkPermission(Vtiger_Request $request) {
		$moduleName = $request->getModule();

		if (!(Users_Privileges_Model::isPermitted($moduleName, 'CreateView'))) {
			throw new AppException(vtranslate('LBL_PERMISSION_DENIED', $moduleName));
		}
	}

	public function process(Vtiger_Request $request) {
	    global $adb;
		$moduleName = $request->getModule();

		$recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
		$moduleModel = $recordModel->getModule();
		
		$fieldList = $moduleModel->getFields();
		$requestFieldList = array_intersect_key($request->getAll(), $fieldList);

		foreach($requestFieldList as $fieldName => $fieldValue){
			$fieldModel = $fieldList[$fieldName];
			if($fieldModel->isEditable()) {
				$recordModel->set($fieldName, $fieldModel->getDBInsertValue($fieldValue));
			}
		}

		$fieldsInfo = array();
		foreach($fieldList as $name => $model){
			$fieldsInfo[$name] = $model->getFieldInfo();
		}

        //Custom for Salary Module
        $employId = $request->get('returnrecord');
        $employData = $this->getCurrentEmployeeData($employId);
        $recordModel->set('employ_id',$employData['employid']);
        $recordModel->set('current_salary',$employData['official_salary']);
        $employRecordModel = Vtiger_Record_Model::getInstanceById($employId,'Employee');
        $salary_department_id = $employRecordModel->get('salary_department');
        $departmentData = $this->getSalaryDepartmentData($salary_department_id);

        $increase_date_before = '';
        $currentSalary = $employData['official_salary'];
        $recentSalaryIncreaseDate = $this->getRecentSalaryIncrease($employId);
        if($recentSalaryIncreaseDate != ''){
            $recentSalaryIncreaseDate = date('Y-m-d',strtotime($recentSalaryIncreaseDate));
            $increase_date_before = $recentSalaryIncreaseDate;
        }else{
            $increase_date_before = $employData['official_date'];
        }

        $recordModel->set('before_increase_date',$increase_date_before);
        $months = $this->countMonthFromDate($increase_date_before);
        if($currentSalary != ''){
            $sql_next_salary = "SELECT
                            salary
                            FROM
                                `vtiger_hrm_settingdepartmentcust`
                            WHERE department_id = ?
                            order by abs(salary - $currentSalary) LIMIT 1";
            $rs_next_salary = $adb->pquery($sql_next_salary,array($salary_department_id));
            $next_salary = $adb->query_result($rs_next_salary,0,'salary');
        }

		if($salary_department_id !='' && $next_salary != ''){
            $salary_next_real = $this->getNextSalaryInDepartment($salary_department_id,$next_salary);
        }
        $recordModel->set('salary_after',$salary_next_real);

		$recordStructureInstance = Vtiger_RecordStructure_Model::getInstanceFromRecordModel($recordModel, Vtiger_RecordStructure_Model::RECORD_STRUCTURE_MODE_QUICKCREATE);
		$picklistDependencyDatasource = Vtiger_DependencyPicklist::getPicklistDependencyDatasource($moduleName);

		$viewer = $this->getViewer($request);
		$viewer->assign('PICKIST_DEPENDENCY_DATASOURCE', Vtiger_Functions::jsonEncode($picklistDependencyDatasource));
		$viewer->assign('CURRENTDATE', date('Y-n-j'));
		$viewer->assign('MODULE', $moduleName);
		$viewer->assign('SINGLE_MODULE', 'SINGLE_'.$moduleName);
		$viewer->assign('MODULE_MODEL', $moduleModel);
		$viewer->assign('RECORD_STRUCTURE_MODEL', $recordStructureInstance);
		$viewer->assign('RECORD_STRUCTURE', $recordStructureInstance->getStructure());
		$viewer->assign('USER_MODEL', Users_Record_Model::getCurrentUserModel());
		$viewer->assign('FIELDS_INFO', json_encode($fieldsInfo));

		$viewer->assign('SCRIPTS', $this->getHeaderScripts($request));

		$viewer->assign('MAX_UPLOAD_LIMIT_MB', Vtiger_Util_Helper::getMaxUploadSize());
		$viewer->assign('MAX_UPLOAD_LIMIT_BYTES', Vtiger_Util_Helper::getMaxUploadSizeInBytes());
		echo $viewer->view('QuickCreate.tpl',$moduleName,true);

	}

	public function getHeaderScripts(Vtiger_Request $request) {
		$moduleName = $request->getModule();
		$jsFileNames = array(
			"modules.$moduleName.resources.Edit"
		);
		$jsScriptInstances = $this->checkAndConvertJsScripts($jsFileNames);
		return $jsScriptInstances;
	}

    public function getCurrentEmployeeData($employ_id){
        global $adb;
        $result = $adb->pquery("SELECT
                                        he.employid,
                                        he.official_salary,
                                        he.official_date
                                    FROM
                                        vtiger_hrm_employee AS he
                                    INNER JOIN vtiger_crmentity AS vc ON vc.crmid = he.employid
                                    WHERE
                                        vc.deleted = 0
                                    AND he.employid = ?",array($employ_id));
        $dataEmploy = [];
        while ($row = $adb->fetchByAssoc($result)){
            $dataEmploy['employid'] = $row['employid'];
            $dataEmploy['official_salary'] = $row['official_salary'];
            $dataEmploy['official_date'] = $row['official_date'];
        }
        return $dataEmploy;
    }

    public function getRecentSalaryIncrease($employId){
        global $adb;
        $result = $adb->pquery("SELECT
                                        MAX(r.relcrmid) AS max_salary_id
                                    FROM
                                        vtiger_crmentityrel AS r
                                    INNER JOIN vtiger_crmentity AS c ON r.relcrmid = c.crmid
                                    INNER JOIN vtiger_hrm_salaryreference AS s ON c.crmid = s.id
                                    WHERE
                                        c.deleted = 0
                                    AND (
                                        module = 'Employee'
                                        AND relmodule = 'Salary'
                                    )
                                    AND s.hr_salary_action ='Accept'
                                    AND r.crmid = ?",array($employId));
        $max_salary_id = $adb->query_result($result,0,'max_salary_id');
        $rs_before_increase_date = $adb->pquery("SELECT
                                                            s.review_date
                                                        FROM
                                                            `vtiger_hrm_salaryreference` AS s
                                                        INNER JOIN vtiger_crmentity AS c ON c.crmid = s.id
                                                        WHERE
                                                            id = ?
                                                        LIMIT 1",array($max_salary_id));
        $date_before = $adb->query_result($rs_before_increase_date,0,'review_date');
        return $date_before;
    }

    public function getKPISalaryDepartment($employ_id){
        global $adb;
        $sql = "SELECT salary_department FROM vtiger_hrm_employee WHERE employid = ?";
        $res = $adb->query($sql,array($employ_id));
        $salary_department_id = $adb->query_result($res,0,'salary_department');
        return $salary_department_id;
    }

    public function getSalaryDepartmentData($department_id){
        global $adb;
        $sql = "SELECT * FROM vtiger_hrm_settingdepartmentcust WHERE department_id = ?";
        $rs = $adb->pquery($sql,array($department_id));
        $data = [];
        while ($row = $adb->fetchByAssoc($rs)){
            $data[] = $row;
        }
        return $data;
    }

    public function countMonthFromDate($date){
        $date1 = $date;
        $date2 = date('Y-m-d');

        $ts1 = strtotime($date1);
        $ts2 = strtotime($date2);

        $year1 = date('Y', $ts1);
        $year2 = date('Y', $ts2);

        $month1 = date('m', $ts1);
        $month2 = date('m', $ts2);

        $diff = (($year2 - $year1) * 12) + ($month2 - $month1);
        return $diff;
    }

    public function getNextSalaryInDepartment($departmentId,$salary){
        $adb = PearDatabase::getInstance();
        $sql = "SELECT
                    salary
                FROM
                    `vtiger_hrm_settingdepartmentcust`
                WHERE department_id = ?
                AND salary = ?";
        $result = $adb->pquery($sql,array($departmentId,$salary));
        $salary = $adb->query_result($result,0,'salary');
        $sql_rel_id = "SELECT
                            salary
                        FROM
                            `vtiger_hrm_settingdepartmentcust`
                        WHERE
                            salary > $salary 
                        AND department_id = ?
                        LIMIT 1";
        $result_rel_id = $adb->pquery($sql_rel_id,array($departmentId));
        $real_salary = $adb->query_result($result_rel_id,0,'salary');
        return $real_salary;
    }

}