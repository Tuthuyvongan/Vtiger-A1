<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 4/23/2019
 * Time: 9:37 AM
 */


class Salary_Detail_View extends Vtiger_Detail_View {

    function checkPermission(Vtiger_Request $request) {
        $moduleName = $request->getModule();
        $recordId = $request->get('record');

        $canEdit = false;
        if($moduleName=='Leave'){
            $recordModel = Vtiger_Record_Model::getInstanceById($recordId,$moduleName);
            $smCreator = $recordModel->getCreatorId($recordId);
            if($smCreator == Users_Record_Model::getCurrentUserModel()->getId() || Users_Record_Model::getCurrentUserModel()->getUserRoleName()=='Vice President'){
                $canEdit = true;
            }
        }

        $recordPermission = Users_Privileges_Model::isPermitted($moduleName, 'DetailView', $recordId);
        if(!$recordPermission) {
            if(!$canEdit){
                throw new AppException(vtranslate('LBL_PERMISSION_DENIED'));
            }
        }

        if ($recordId) {
            $recordEntityName = getSalesEntityType($recordId);
            if ($recordEntityName !== $moduleName) {
                throw new AppException(vtranslate('LBL_PERMISSION_DENIED'));
            }
        }
        return true;
    }

}