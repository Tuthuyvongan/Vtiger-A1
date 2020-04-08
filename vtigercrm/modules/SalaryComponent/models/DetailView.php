<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class SalaryComponent_DetailView_Model extends Vtiger_DetailView_Model {

    public function getDetailViewLinks($linkParams) {

        $recordModel = $this->getRecord();
        $currentUserModel = Users_Privileges_Model::getCurrentUserPrivilegesModel();

        $linkModelList = parent::getDetailViewLinks($linkParams);

        $emailModuleModel = Vtiger_Module_Model::getInstance('Emails');

        if($currentUserModel->hasModulePermission($emailModuleModel->getId())) {

            $basicActionLink = array(
                'linktype' => 'DETAILVIEWBASIC',
                'linklabel' => 'LBL_SEND_EMAIL',
                'linkurl' => 'javascript:Vtiger_Detail_Js.triggerSendEmail("index.php?module='.$this->getModule()->getName().
                    '&view=MassActionAjax&mode=showComposeEmailForm&step=step1","Emails");',
                'linkicon' => ''
            );
            $linkModelList['DETAILVIEWBASIC'][] = Vtiger_Link_Model::getInstanceFromValues($basicActionLink);
        }

        return $linkModelList;

    }

    public function getDetailViewRelatedLinks() {
        $recordModel = $this->getRecord();
        $moduleName = $recordModel->getModuleName();
        $parentModuleModel = $this->getModule();
        $relatedLinks = array();

        if($parentModuleModel->isSummaryViewSupported()) {
            $relatedLinks = array(array(
                'linktype' => 'DETAILVIEWTAB',
                'linklabel' => vtranslate('LBL_SUMMARY', $moduleName),
                'linkKey' => 'LBL_RECORD_SUMMARY',
                'linkurl' => $recordModel->getDetailViewUrl() . '&mode=showDetailViewByMode&requestMode=summary',
                'linkicon' => ''
            ));
        }
        //link which shows the summary information(generally detail of record)
        $relatedLinks[] = array(
            'linktype' => 'DETAILVIEWTAB',
            'linklabel' => vtranslate('LBL_DETAILS', $moduleName),
            'linkKey' => 'LBL_RECORD_DETAILS',
            'linkurl' => $recordModel->getDetailViewUrl().'&mode=showDetailViewByMode&requestMode=full',
            'linkicon' => ''
        );

        if($parentModuleModel->isTrackingEnabled()) {
            $relatedLinks[] = array(
                'linktype' => 'DETAILVIEWTAB',
                'linklabel' => 'LBL_UPDATES',
                'linkurl' => $recordModel->getDetailViewUrl().'&mode=showRecentActivities&page=1',
                'linkicon' => ''
            );
        }


        $relationModels = $parentModuleModel->getRelations();

        foreach($relationModels as $relation) {
            //TODO : Way to get limited information than getting all the information
            $link = array(
                'linktype' => 'DETAILVIEWRELATED',
                'linklabel' => $relation->get('label'),
                'linkurl' => $relation->getListUrl($recordModel),
                'linkicon' => '',
                'relatedModuleName' => $relation->get('relatedModuleName'),
                'linkid' => $relation->getId()
            );
            $relatedLinks[] = $link;
        }

        return $relatedLinks;
    }

    /**
     * Function to get the detail view widgets
     * @return <Array> - List of widgets , where each widget is an Vtiger_Link_Model
     */
    public function getWidgets() {
        $moduleModel = $this->getModule();
        $widgets = array();

        if($moduleModel->isTrackingEnabled()) {
            $widgets[] = array(
                'linktype' => 'DETAILVIEWWIDGET',
                'linklabel' => 'LBL_UPDATES',
                'linkurl' => 'module='.$this->getModuleName().'&view=Detail&record='.$this->getRecord()->getId().
                    '&mode=showRecentActivities&page=1&limit=5',
            );
        }

        $modCommentsModel = Vtiger_Module_Model::getInstance('ModComments');
        if($moduleModel->isCommentEnabled() && $modCommentsModel->isPermitted('DetailView')) {
            $widgets[] = array(
                'linktype' => 'DETAILVIEWWIDGET',
                'linklabel' => 'ModComments',
                'linkurl' => 'module='.$this->getModuleName().'&view=Detail&record='.$this->getRecord()->getId().
                    '&mode=showRecentComments&page=1&limit=5'
            );
        }

        $userPrivilegesModel = Users_Privileges_Model::getCurrentUserPrivilegesModel();
        $documentsInstance = Vtiger_Module_Model::getInstance('Documents');
        if($userPrivilegesModel->hasModuleActionPermission($documentsInstance->getId(), 'DetailView') && $moduleModel->isModuleRelated('Documents')) {
            $createPermission = $userPrivilegesModel->hasModuleActionPermission($documentsInstance->getId(), 'CreateView');
            $widgets[] = array(
                'linktype' => 'DETAILVIEWWIDGET',
                'linklabel' => 'Documents',
                'linkName'	=> $documentsInstance->getName(),
                'linkurl' => 'module='.$this->getModuleName().'&view=Detail&record='.$this->getRecord()->getId().
                    '&relatedModule=Documents&mode=showRelatedRecords&page=1&limit=5',
                'action'	=>	($createPermission == true) ? array('Add') : array(),
                'actionURL' =>	$documentsInstance->getQuickCreateUrl()
            );
        }

        $widgetLinks = array();
        foreach ($widgets as $widgetDetails) {
            $widgetLinks[] = Vtiger_Link_Model::getInstanceFromValues($widgetDetails);
        }

        return $widgetLinks;
    }
}
