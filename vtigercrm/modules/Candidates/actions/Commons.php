<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 4/26/2019
 * Time: 3:17 PM
 */

class Candidates_Commons_Action extends Vtiger_BasicAjax_Action {

    function __construct() {
        parent::__construct();
        $this->exposeMethod('updateNote');
        $this->exposeMethod('checkExistEmail');
    }

    public function process(Vtiger_Request $request)
    {
        $mode = $request->getMode();
        if(!empty($mode)) {
            echo $this->invokeExposedMethod($mode, $request);
            return;
        }
    }

    public function updateNote(Vtiger_Request $request){
        global $adb;
        $candidateId = $request->get('record');
        $note_id = $request->get('note_id');
        $note_content = $request->get('note_content');

        $adb->pquery("UPDATE hrm_employee_history SET note = ? WHERE employ_id = ? AND id = ?",array($note_content,$candidateId,$note_id));

        $rs_note = $adb->pquery("SELECT note FROM hrm_employee_history WHERE employ_id = ? AND id = ?",array($candidateId,$note_id));
        $note_updated = $adb->query_result($rs_note,0,'note');
        echo $note_updated;
    }

    public function checkExistEmail(Vtiger_Request $request){
        global $adb;
        $email = $request->get('email');
        if(!empty($email)){
            $rs_email = $adb->pquery("SELECT id FROM vtiger_hrm_candidate WHERE email = ?",array($email));
            $count = $adb->num_rows($rs_email);

            if($count > 0){
                $response = 'Email already exists';
            }
            echo $response;
        }
    }

    public function moveToActiveCandidate(Vtiger_Request $request){
        global $adb;
        $activeStatge = $request->get('active_stage');
        $recordId = $request->get('record');
        $currentFlag = $request->get('current_flag');
        $currentStatus = $request->get('current_status');

        if(!empty($activeStatge)){
            $adb->pquery("UPDATE vtiger_hrm_employee SET flag = '' WHERE candidate_id = ?",array($recordId));
            $adb->pquery("UPDATE vtiger_hrm_candidate SET status = 'Potential' WHERE id = ?",array($recordId));
        }else{
            $adb->pquery("UPDATE vtiger_hrm_employee SET flag = ? WHERE candidate_id = ?",array($currentFlag,$recordId));
            $adb->pquery("UPDATE vtiger_hrm_candidate SET status = ? WHERE id = ?",array($currentStatus,$recordId));
        }
    }

}