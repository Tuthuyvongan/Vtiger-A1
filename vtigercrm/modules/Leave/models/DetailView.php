<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class Leave_DetailView_Model extends Vtiger_DetailView_Model {

    public function getDetailViewLinks($linkParams) {
        $linkTypes = array('DETAILVIEWBASIC','DETAILVIEW');
        $moduleModel = $this->getModule();
        $recordModel = $this->getRecord();

        $moduleName = $moduleModel->getName();
        $recordId = $recordModel->getId();

        $detailViewLink = array();
        $linkModelList = array();

        $canEdit = false;
        if($moduleName=='Leave'){
            $recordModel = Vtiger_Record_Model::getInstanceById($recordId,$moduleName);
            $smCreator = $recordModel->getCreatorId($recordId);
            if($smCreator == Users_Record_Model::getCurrentUserModel()->getId() || Users_Record_Model::getCurrentUserModel()->getUserRoleName()=='Vice President'){
                $canEdit = true;
            }
        }

        if(Users_Privileges_Model::isPermitted($moduleName, 'EditView', $recordId) || $canEdit) {
            $detailViewLinks[] = array(
                'linktype' => 'DETAILVIEWBASIC',
                'linklabel' => 'LBL_EDIT',
                'linkurl' => $recordModel->getEditViewUrl(),
                'linkicon' => ''
            );

            foreach ($detailViewLinks as $detailViewLink) {
                $linkModelList['DETAILVIEWBASIC'][] = Vtiger_Link_Model::getInstanceFromValues($detailViewLink);
            }
        }

        if(Users_Privileges_Model::isPermitted($moduleName, 'Delete', $recordId)) {
            $deletelinkModel = array(
                'linktype' => 'DETAILVIEW',
                'linklabel' => sprintf("%s %s", getTranslatedString('LBL_DELETE', $moduleName), vtranslate('SINGLE_'. $moduleName, $moduleName)),
                'linkurl' => 'javascript:Vtiger_Detail_Js.deleteRecord("'.$recordModel->getDeleteUrl().'")',
                'linkicon' => ''
            );
            $linkModelList['DETAILVIEW'][] = Vtiger_Link_Model::getInstanceFromValues($deletelinkModel);
        }

        if($moduleModel->isDuplicateOptionAllowed('CreateView', $recordId)) {
            $duplicateLinkModel = array(
                'linktype' => 'DETAILVIEWBASIC',
                'linklabel' => 'LBL_DUPLICATE',
                'linkurl' => $recordModel->getDuplicateRecordUrl(),
                'linkicon' => ''
            );
            $linkModelList['DETAILVIEW'][] = Vtiger_Link_Model::getInstanceFromValues($duplicateLinkModel);
        }

        if($this->getModule()->isModuleRelated('Emails') && Vtiger_RecipientPreference_Model::getInstance($this->getModuleName())) {
            $emailRecpLink = array('linktype' => 'DETAILVIEW',
                'linklabel' => vtranslate('LBL_EMAIL_RECIPIENT_PREFS',  $this->getModuleName()),
                'linkurl' => 'javascript:Vtiger_Index_Js.showRecipientPreferences("'.$this->getModuleName().'");',
                'linkicon' => '');
            $linkModelList['DETAILVIEW'][] = Vtiger_Link_Model::getInstanceFromValues($emailRecpLink);
        }

        $linkModelListDetails = Vtiger_Link_Model::getAllByType($moduleModel->getId(),$linkTypes,$linkParams);
        foreach($linkTypes as $linkType) {
            if(!empty($linkModelListDetails[$linkType])) {
                foreach($linkModelListDetails[$linkType] as $linkModel) {
                    // Remove view history, needed in vtiger5 to see history but not in vtiger6
                    if($linkModel->linklabel == 'View History') {
                        continue;
                    }
                    $linkModelList[$linkType][] = $linkModel;
                }
            }
            unset($linkModelListDetails[$linkType]);
        }

        $relatedLinks = $this->getDetailViewRelatedLinks();

        foreach($relatedLinks as $relatedLinkEntry) {
            $relatedLink = Vtiger_Link_Model::getInstanceFromValues($relatedLinkEntry);
            $linkModelList[$relatedLink->getType()][] = $relatedLink;
        }

        $widgets = $this->getWidgets();
        foreach($widgets as $widgetLinkModel) {
            $linkModelList['DETAILVIEWWIDGET'][] = $widgetLinkModel;
        }

        $currentUserModel = Users_Record_Model::getCurrentUserModel();
        if($currentUserModel->isAdminUser()) {
            $settingsLinks = $moduleModel->getSettingLinks();
            foreach($settingsLinks as $settingsLink) {
                $linkModelList['DETAILVIEWSETTING'][] = Vtiger_Link_Model::getInstanceFromValues($settingsLink);
            }
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
