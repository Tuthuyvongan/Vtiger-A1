<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class LeaveHandler extends VTEventHandler {

    function handleEvent($eventName, $entityData)
    {
        global $adb, $current_user;

        if($eventName == 'vtiger.entity.aftersave') {
            $moduleName = $entityData->getModuleName();
            $recordId = $entityData->getId();
            $employId = $entityData->get('employ_id');
            if($moduleName != 'Leave'){
                return;
            }
            if($moduleName == 'Leave'){
                $adb->pquery("INSERT INTO vtiger_crmentityrel(`crmid`,`module`,`relcrmid`,`relmodule`) VALUES(?,?,?,?)",array($employId,'Employee',$recordId,'Leave'));
            }
        }
    }
}

?>
