<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class JD_Record_Model extends Vtiger_Record_Model {

	/**
	 * Function returns the url for create event
	 * @return <String>
	 */

    public function getTaskLists($recordId){
        global $adb;
        $sql = "SELECT * FROM vtiger_hrm_jd_tasks WHERE jd_id = ? ORDER BY id DESC";
        $result = $adb->pquery($sql,array($recordId));
        $data = array();
        $i = 1;
        while ($row = $adb->fetchByAssoc($result)){
            $data[$i]['task_id'] = $row['id'];
            $data[$i]['task_name'] = $row['task_name'];
            $data[$i]['task_description'] = $row['task_desc'];
            $i++;
        }
        return $data;
    }


}
