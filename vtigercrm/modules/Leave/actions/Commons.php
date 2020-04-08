<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 6/7/2019
 * Time: 4:52 PM
 */

class Leave_Commons_Action extends Vtiger_BasicAjax_Action {
    function __construct() {
        parent::__construct();
        $this->exposeMethod('changeEmployValue');
    }

    public function process(Vtiger_Request $request)
    {
        $mode = $request->getMode();
        if(!empty($mode)) {
            echo $this->invokeExposedMethod($mode, $request);
            return;
        }
    }

    public function changeEmployValue(Vtiger_Request $request){
        global $adb;
        $leaveRecordModel = Vtiger_Record_Model::getCleanInstance('Leave');
        $employId = $request->get('employ_value');
        $leaveBalanceVlue = $this->getLeaveBalance($employId);
        $leaveAccepted = $leaveRecordModel->getLeaveAccepted($employId);
        $leaveBalanceVlue = $leaveBalanceVlue - $leaveAccepted;
        if($leaveBalanceVlue){
            $msg = $leaveBalanceVlue;
            echo $msg;
        }
    }

    public function getLeaveBalance($employ_id){
        global $adb;
        $result = $adb->pquery("SELECT
                                        he.official_date
                                    FROM
                                        vtiger_hrm_employee AS he
                                    INNER JOIN vtiger_crmentity AS vc ON vc.crmid = he.employid
                                    INNER JOIN vtiger_users AS vu ON vu.id = he.user_id
                                    WHERE vc.deleted = 0 
                                    AND
                                        he.employid = ?",array($employ_id));
        $start_work_date = $adb->query_result($result,0,'official_date');
        $leaveBalance = 0;
        if($start_work_date != ''){
            $now = date('Y-m-d');
            if(date('Y',strtotime($start_work_date)) != date('Y',strtotime($now))){
                $start_work_date = date('Y-m-d', strtotime('first day of january this year'));
            }
            $start_work_date = date_create($start_work_date);
            $now = date_create($now);
            $leaveBalance =date_diff($start_work_date,$now)->format("%a")/30;
            $leaveBalance = number_format($leaveBalance,2);
            return $leaveBalance;
        }

    }

}