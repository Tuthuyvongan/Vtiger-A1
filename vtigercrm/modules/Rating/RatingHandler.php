<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class RatingHandler extends VTEventHandler {


    function handleEvent($eventName, $entityData)
    {
        global $adb;
    
        if($eventName == 'vtiger.entity.aftersave.final') {
            $moduleName = $entityData->getModuleName();
            if($moduleName != 'Rating'){
                return;
            }
            $task_name = $entityData->get('task_name');
            $roles = $this->getAllRoleId();
            $moduleModel = Settings_Picklist_Module_Model::getInstance('KPI');
            $fieldModel = Settings_Picklist_Field_Model::getInstance('kpi_type', $moduleModel);
            $moduleModel->addPickListValues($fieldModel, $task_name, $roles, '');
        }
    }

    public function getAllRoleId(){
        global $adb;
        $sql = "SELECT roleid FROM vtiger_role";
        $result = $adb->pquery($sql,array());
        $roles = array();
        while ($row = $adb->fetchByAssoc($result)){
            $roles[] = $row['roleid'];
        }
        return $roles;
    }

}


?>
