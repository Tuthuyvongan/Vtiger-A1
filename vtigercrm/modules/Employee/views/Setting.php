<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 9/25/2019
 * Time: 5:11 PM
 */

class Employee_Setting_View extends Vtiger_Index_View {

    public function preProcess(Vtiger_Request $request, $display = true)
    {
        parent::preProcess($request, false);
        $viewer = $this->getViewer($request);
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
        if ($display) {
            $this->preProcessDisplay($request);
        }
    }


    public function process(Vtiger_Request $request)
    {
        global $site_URL;
        $moduleName = $request->getModule();
        $viewer = $this->getViewer($request);
        $moduleModel = Vtiger_Module_Model::getInstance($moduleName);

        $license_key = $request->get('licensekey');
        $link_file_license = 'modules/Employee/license.json';
        if (file_exists($link_file_license))
        {
            $licenses = json_decode(file_get_contents($link_file_license));
            $license_key = $licenses->license;
            $version_type = $licenses->type;
        }
        $viewer->assign('LICENSE',$licenses);
        $viewer->assign('COMPANY_SITE',$site_URL);
        $viewer->assign('VERSION_TYPE',$version_type);
        $viewer->assign('LICENSE_KEY',$license_key);
        $viewer->assign('REQUEST_INSTANCE', $request);
        $companyDetails = new Settings_Vtiger_CompanyDetails_Model();
        $viewer->assign('COMPANY_DETAILS',$companyDetails->getInstance());
        $viewer->view('Install.tpl', $moduleName);
    }
    public function validateRequest(Vtiger_Request $request)
    {
        $request->validateReadAccess();
    }

    function getHeaderScripts(Vtiger_Request $request)
    {
        $headerScriptInstances = parent::getHeaderScripts($request);
        $moduleName = $request->getModule();
        $jsFileNames = array(
            'modules.Vtiger.resources.Vtiger',
            "modules.$moduleName.resources.Setting",
            "~libraries/jquery/jquery.stickytableheaders.min.js",
        );
        $jsScriptInstances = $this->checkAndConvertJsScripts($jsFileNames);
        $headerScriptInstances = array_merge($headerScriptInstances, $jsScriptInstances);
        return $headerScriptInstances;
    }

}