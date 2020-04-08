<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class SalaryComponent_Record_Model extends Vtiger_Record_Model {

	/**
	 * Function returns the url for create event
	 * @return <String>
	 */

    public function getKPISalaryDepartment($recordId){
        global $adb;
        $sql = "SELECT * FROM vtiger_hrm_settingdepartmentcust WHERE department_id = ? ORDER BY id ASC";
        $result = $adb->pquery($sql,array($recordId));
        $data = array();
        $i = 1;
        while ($row = $adb->fetchByAssoc($result)){
            $data[$i]['id'] = $row['id'];
            $data[$i]['experience'] = $row['experience'];
            $data[$i]['salary'] = $row['salary'];
            $data[$i]['qualification'] = $row['qualification'];
            $data[$i]['management_scale'] = $row['management_scale'];
            $data[$i]['time_to_review'] = $row['time_to_review'];
            $data[$i]['level1'] = $row['level1'];
            $data[$i]['level2'] = $row['level2'];
            $data[$i]['level3'] = $row['level3'];
            $i++;
        }
        return $data;
    }


}
