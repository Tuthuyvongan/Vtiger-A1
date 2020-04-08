<?php

/* +***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 * *********************************************************************************** */

class JD_Edit_View extends Vtiger_Edit_View {

	public function process(Vtiger_Request $request) {

		$moduleName = $request->getModule();

		$recordId = $request->get('record');
		$recordModel = $this->record;
		if(!$recordModel){
			if (!empty($recordId)) {
				$recordModel = Vtiger_Record_Model::getInstanceById($recordId, $moduleName);
			} else {
				$recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
			}
			$this->record = $recordModel;
		}

		$tasklist = $recordModel->getTaskLists($recordId);
		$viewer = $this->getViewer($request);
		$viewer->assign('TASK_LIST', $tasklist);

        parent::process($request);

	}

}
