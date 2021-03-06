<?php

/* +***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 * *********************************************************************************** */

class SalaryComponent_Detail_View extends Vtiger_Detail_View {

	function __construct() {
		parent::__construct();
	}

	public function showModuleDetailView(Vtiger_Request $request) {
		$recordId = $request->get('record');
		$moduleName = $request->getModule();

		// Getting model to reuse it in parent 
		if (!$this->record) {
			$this->record = Vtiger_DetailView_Model::getInstance($moduleName, $recordId);
		}
		$recordModel = $this->record->getRecord();

		$jdRecordModel = Vtiger_Record_Model::getInstanceById($recordId,$moduleName);
        $salaryIncreasePeriod = $jdRecordModel->getKPISalaryDepartment($recordId);

		$viewer = $this->getViewer($request);
		$viewer->assign('IMAGE_DETAILS', $recordModel->getImageDetails());
        $viewer->assign('SALARY_REF', $salaryIncreasePeriod);
        $viewer->assign('RECORD', $recordId);

		return parent::showModuleDetailView($request);
	}

    function showModuleBasicView($request) {
        $recordId = $request->get('record');
        $moduleName = $request->getModule();

        $jdRecordModel = Vtiger_Record_Model::getInstanceById($recordId,$moduleName);
        $salaryIncreasePeriod = $jdRecordModel->getKPISalaryDepartment($recordId);

        $viewer = $this->getViewer($request);
        $viewer->assign('SALARY_REF', $salaryIncreasePeriod);

        return parent::showModuleDetailView($request);
    }
}
