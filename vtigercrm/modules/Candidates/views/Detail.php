<?php

/* +***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 * *********************************************************************************** */

class Candidates_Detail_View extends Accounts_Detail_View {

	function __construct() {
		parent::__construct();
	}

    function preProcessTplName(Vtiger_Request $request) {
	    $candidateId = $request->get('record');
        $current_action = $this->getFlagActionByRecord($candidateId);
        $before_actions = $this->getBeforeActions($candidateId);
        $after_actions = $this->getAfterActions($candidateId);
        $allActionValue = ['Start','Shortlist','Schedule Interview','Mark Interview Passed','Offer Job','Hire'];
        $rejectActions = ['Reject after shortlist','Reject after SI','Reject after MIP','Reject after OJ','Reject'];
        $candidate_status = $this->getCandidateStatusById($candidateId);
        $show_progress = true;
        if(in_array($current_action,$rejectActions) || in_array($candidate_status,array('Inactive','Failed'))){
            $show_progress = false;
        }
        $viewer = $this->getViewer($request);
        $toolTipContents = array(
            'This is the beginning of CV before the cv stage to shortlist'=>'Start',
            'Schedule an interview for successful review candidate'=>'Shortlist',
            'After the interview, you need to discuss to decide whether the candidate is accepted or not'=>'Schedule Interview',
            'Great! This is a suitable candidate to become an employee in the company'=>'Mark Interview Passed',
            'Please provide the salary for the recruited candidate!'=>'Offer Job',
        );

        $viewer->assign('TIPS', $toolTipContents);
        $viewer->assign('CANDI_ACTIONS', $allActionValue);
        $viewer->assign('BEFORE_ACTIONS', $before_actions);
        $viewer->assign('AFTER_ACTIONS', $after_actions);
        $viewer->assign('ACTION', $current_action);
        $viewer->assign('SHOW_PROGRESS', $show_progress);
        return 'DetailViewPreProcess.tpl';
    }

	public function showModuleDetailView(Vtiger_Request $request) {
	    global $adb;
		$recordId = $request->get('record');
		$moduleName = $request->getModule();

		// Getting model to reuse it in parent 
		if (!$this->record) {
			$this->record = Vtiger_DetailView_Model::getInstance($moduleName, $recordId);
		}
		$recordModel = $this->record->getRecord();

        if (!empty($recordId)){
            $flag = $this->getFlagActionByRecord($recordId);
        }else{
            $flag = '';
        }

        $hideBlock = array();
        $blocks = $this->getCandidateBlocks();
        foreach ($blocks as $block){
            if($block=='LBL_CANDIDATE_INFORMATION'){
                continue;
            }
            if($flag=='Shortlist'){
                if($block=='LBL_SHORTLIST'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Schedule Interview'){
                if($block=='LBL_SCHEDULE_INTERVIEW'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Mark Interview Passed'){
                $hideBlock[] = $block;
            }
            if($flag=='Reject'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Reject after shortlist'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Reject after SI'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Reject after MIP'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Reject after OJ'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }

            if($flag=='Mark Interview Failed'){
                if($block=='LBL_MARK_INTERVEW_FAILED'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }

            if($flag==''){
                $hideBlock[] = $block;
            }

            if($flag=='Offer Job'){
                if($block=='LBL_OFFER_JOB'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Hire'){
                if($block=='LBL_MARK_INTERVEW_PASSED'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
        }

		$viewer = $this->getViewer($request);
		$viewer->assign('IMAGE_DETAILS', $recordModel->getImageDetails());
        $viewer->assign('FLAG', $flag);
        $viewer->assign('HIDE_BLOCKS', $hideBlock);
        $viewer->assign('RECORD', $recordId);

		return parent::showModuleDetailView($request);
	}

    function showModuleBasicView($request) {
        $recordId = $request->get('record');
        $moduleName = $request->getModule();

        if (!empty($recordId)){
            $flag = $this->getFlagActionByRecord($recordId);
        }else{
            $flag = '';
        }
        $hideBlock = array();
        $blocks = $this->getCandidateBlocks();
        foreach ($blocks as $block){
            if($block=='LBL_CANDIDATE_INFORMATION'){
                continue;
            }
            if($flag=='Shortlist'){
                if($block=='LBL_SHORTLIST'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Schedule Interview'){
                if($block=='LBL_SCHEDULE_INTERVIEW'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Mark Interview Passed'){
                $hideBlock[] = $block;
            }
            if($flag=='Reject'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Reject after shortlist'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Reject after SI'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Reject after MIP'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Reject after OJ'){
                if($block=='LBL_REJECT'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Mark Interview Failed'){
                if($block=='LBL_MARK_INTERVEW_FAILED'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag==''){
                $hideBlock[] = $block;
            }

            if($flag=='Offer Job'){
                if($block=='LBL_OFFER_JOB'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }
            if($flag=='Hire'){
                if($block=='LBL_MARK_INTERVEW_PASSED'){
                    continue;
                }else{
                    $hideBlock[] = $block;
                }
            }

        }
        $viewer = $this->getViewer($request);
        $viewer->assign('FLAG', $flag);
        $viewer->assign('HIDE_BLOCKS', $hideBlock);

        return parent::showModuleDetailView($request);
    }

    public function getFlagActionByRecord($recordId){
        global $adb;
        $sql = "SELECT flag FROM vtiger_hrm_employee WHERE candidate_id = ?";
        $params = array($recordId);
        $result = $adb->pquery($sql,$params);
        while ($row = $adb->fetchByAssoc($result)){
            $flag = $adb->query_result($result,0,'flag');
        }
        return $flag;
    }

    public function getCandidateBlocks(){
        global $adb;
        $rs_candidate_tab = $adb->pquery("SELECT tabid FROM vtiger_tab WHERE `name` = 'Candidates'",array());
        $tabid = $adb->query_result($rs_candidate_tab,0,'tabid');
        $rsBlockLabel = $adb->pquery("SELECT blocklabel FROM `vtiger_blocks` WHERE tabid = ?",array($tabid));
        $blocks = array();
        while ($row = $adb->fetchByAssoc($rsBlockLabel)){
            $blocks[] = $row['blocklabel'];
        }
        return $blocks;
    }


    public function getAfterActions($recordId){
        $after_action = array();
        $current_action = $this->getFlagActionByRecord($recordId);
        if($current_action ==''){
            $after_action = ['Start'];
            array_push($candidate_actions,$after_action);
        }elseif ($current_action =='Shortlist'){
            $after_action = ['Shortlist'];
            array_push($candidate_actions,$after_action);
        }elseif ($current_action=='Schedule Interview'){
            $after_action = ['Schedule Interview'];
            array_push($candidate_actions,$after_action);
        }elseif ($current_action=='Mark Interview Passed'){
            $after_action = ['Mark Interview Passed'];
            array_push($candidate_actions,$after_action);
        }elseif ($current_action=='Offer Job'){
            $after_action = ['Offer Job'];
            array_push($candidate_actions,$after_action);
        }
        return $after_action;
    }

    public function getBeforeActions($recordId){
        $before_action = array();
        $current_action = $this->getFlagActionByRecord($recordId);
        if($current_action ==''){
            $before_action = ['Start'];
            array_push($candidate_actions,$before_action);
        }elseif ($current_action =='Shortlist'){
            $before_action = ['Start'];
            array_push($candidate_actions,$before_action);
        }elseif ($current_action=='Schedule Interview'){
            $before_action = ['Start','Shortlist'];
            array_push($candidate_actions,$before_action);
        }elseif ($current_action=='Mark Interview Passed'){
            $before_action = ['Start','Shortlist','Schedule Interview'];
            array_push($candidate_actions,$before_action);
        }elseif ($current_action=='Offer Job'){
            $before_action = ['Start','Shortlist','Schedule Interview','Mark Interview Passed'];
            array_push($candidate_actions,$before_action);
        }elseif ($current_action=='Hire'){
            $before_action = ['Start','Shortlist','Schedule Interview','Mark Interview Passed','Mark Interview Failed','Offer Job'];
            array_push($candidate_actions,$before_action);
        }
        return $before_action;
    }

    public function getCandidateStatusById($candidate_id){
        $adb = PearDatabase::getInstance();
        $sql = "SELECT ca.`status` FROM vtiger_hrm_candidate AS ca INNER JOIN vtiger_crmentity AS c ON c.crmid = ca.id WHERE c.deleted = 0 AND ca.id = ?";
        $result = $adb->pquery($sql,array($candidate_id));
        if($adb->num_rows($result)){
            $status = $adb->query_result($result,0,'status');
        }
        return $status;
    }
}
