<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class KPIHandler extends VTEventHandler {


    function handleEvent($eventName, $entityData)
    {
        global $adb;

        if($eventName == 'vtiger.entity.aftersave.final') {
            $recordId = $entityData->getId();
            $moduleName = $entityData->getModuleName();
            if($moduleName != 'KPI'){
                return;
            }
            if($moduleName == 'KPI'){
                $kpi_assigned_to = $entityData->get('assigned_user_id');
                $rs_employee = $adb->pquery("SELECT vc.crmid as employ_id FROM vtiger_crmentity AS vc INNER JOIN vtiger_hrm_employee AS he ON he.employid = vc.crmid WHERE he.user_id = ?",array($kpi_assigned_to));
                $employ_id = $adb->query_result($rs_employee,0,'employ_id');
                if($employ_id){
                    $rs_check = $adb->pquery("SELECT * FROM vtiger_crmentityrel WHERE crmid = ? AND relcrmid = ?",array($employ_id,$recordId));
                    if($adb->num_rows($rs_check)){
                        return;
                    }else{
                        $adb->pquery("INSERT INTO vtiger_crmentityrel(`crmid`,`module`,`relcrmid`,`relmodule`) VALUES(?,?,?,?)",array($employ_id,'Employee',$recordId,'KPI'));
                    }
                }

            }
        }
    }
}


?>
