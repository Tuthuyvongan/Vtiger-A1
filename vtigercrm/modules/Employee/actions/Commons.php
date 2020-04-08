<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 4/26/2019
 * Time: 3:17 PM
 */

class Employee_Commons_Action extends Vtiger_BasicAjax_Action {

    function __construct() {
        parent::__construct();
        $this->exposeMethod('updateStatus');
        $this->exposeMethod('checkEmployEmail');
        $this->exposeMethod('syncUserToEmployee');
    }

    public function process(Vtiger_Request $request)
    {
        $mode = $request->getMode();
        if(!empty($mode)) {
            echo $this->invokeExposedMethod($mode, $request);
            return;
        }
    }

    public function updateStatus(Vtiger_Request $request){
        global $adb;

        $employeeId = $request->get('record');
        $status = $request->get('status');
        $employData = $this->getEmployDataByRecordId($employeeId);

        if($status=='Inactive'){
            $adb->pquery("UPDATE vtiger_hrm_employee SET flag = '' WHERE employid = ?",array($employeeId));
            $rs_userId = $adb->pquery('SELECT
                                                he.user_id 
                                            FROM
                                                vtiger_hrm_employee AS he
                                            INNER JOIN vtiger_crmentity AS vc ON vc.crmid = he.employid
                                            INNER JOIN vtiger_users AS vu ON vu.id = he.user_id
                                            WHERE vc.deleted = 0
                                            AND he.employid = ?',array($employeeId));
            $userId = $adb->query_result($rs_userId,0,'user_id');
            $adb->pquery('UPDATE vtiger_users SET status = "Inactive" WHERE id = ?',array($userId));
            $rs_cadidate = $adb->pquery("SELECT candidate_id FROM vtiger_hrm_employee WHERE employid = ?",array($employeeId));
            $candidate_id = $adb->query_result($rs_cadidate,0,'candidate_id');

            if($candidate_id > 0){
                $adb->pquery("UPDATE vtiger_hrm_candidate SET `status` = ? WHERE id = ?",array($status,$candidate_id));
            }else{
                $candidateModel = Vtiger_Record_Model::getCleanInstance('Candidates');
                $candidateModel->set('mode','');
                $candidateModel->set('firstname',$employData['firstname']);
                $candidateModel->set('lastname',$employData['lastname']);
                $candidateModel->set('email',$employData['email']);
                $candidateModel->save();
                $cadidateId = $candidateModel->getId();
                $adb->pquery("UPDATE vtiger_hrm_employee SET candidate_id = ? WHERE employid = ?",array($cadidateId,$employeeId));
            }

        }else{
            $rs_userId = $adb->pquery('SELECT
                                                he.user_id 
                                            FROM
                                                vtiger_hrm_employee AS he
                                            INNER JOIN vtiger_crmentity AS vc ON vc.crmid = he.employid
                                            INNER JOIN vtiger_users AS vu ON vu.id = he.user_id
                                            WHERE vc.deleted = 0
                                            AND he.employid = ?',array($employeeId));
            $userId = $adb->query_result($rs_userId,0,'user_id');
            $adb->pquery('UPDATE vtiger_users SET status = "Active" WHERE id = ?',array($userId));

            $rs_max_history = $adb->pquery("SELECT MAX(id) as max_id FROM `hrm_employee_history` WHERE employ_id = ?",array($employeeId));
            $historyMaxId = $adb->query_result($rs_max_history,0,'max_id');
            $rs_getOldFlag = $adb->pquery("SELECT action FROM hrm_employee_history WHERE id = ?",array($historyMaxId));
            $oldAction = $adb->query_result($rs_getOldFlag,0,'action');
            $adb->pquery("UPDATE vtiger_hrm_employee SET flag = ? WHERE employid = ?",array($oldAction,$employeeId));
            $rs_cadidate = $adb->pquery("SELECT candidate_id FROM vtiger_hrm_employee WHERE employid = ?",array($employeeId));
            $candidate_id = $adb->query_result($rs_cadidate,0,'candidate_id');

            if($candidate_id > 0){
                $adb->pquery("UPDATE vtiger_hrm_candidate SET `status` = ? WHERE id = ?",array($status,$candidate_id));
            }else{
                $candidateModel = Vtiger_Record_Model::getCleanInstance('Candidates');
                $candidateModel->set('mode','');
                $candidateModel->set('firstname',$employData['firstname']);
                $candidateModel->set('lastname',$employData['lastname']);
                $candidateModel->set('email',$employData['email']);
                $candidateModel->save();
                $cadidateId = $candidateModel->getId();
                $adb->pquery("UPDATE vtiger_hrm_employee SET candidate_id = ? WHERE employid = ?",array($cadidateId,$employeeId));
            }
        }


    }
    public function checkEmployEmail(Vtiger_Request $request){
        global $adb;
        $email = $request->get('email');
        if(!empty($email)){
            $rs_email = $adb->pquery("SELECT employid FROM vtiger_hrm_employee WHERE email = ?",array($email));
            $count = $adb->num_rows($rs_email);

            if($count > 0){
                $response = 'Email already exists';
            }
            echo $response;
        }
    }

    public function getEmployDataByRecordId($recordId){
        global $adb;
        $sql = "SELECT firstname, lastname, email FROM vtiger_hrm_employee WHERE employid = ?";
        $result = $adb->pquery($sql,array($recordId));
        $data = array();
        while ($row = $adb->fetchByAssoc($result)){
            $data['firstname'] = $row['firstname'];
            $data['lastname'] = $row['lastname'];
            $data['email'] = $row['email'];
        }
        return $data;
    }

    public function syncUserToEmployee(){
        global $adb;
        $sqlUsers = "SELECT * FROM vtiger_users";
        $resultUsers = $adb->pquery($sqlUsers,array());
        $userData = array();
        while ($row = $adb->fetchByAssoc($resultUsers)){
            $userData[] = $row;
        }

        foreach ($userData as $key => $value){
            $sql_check_user = "SELECT * FROM vtiger_hrm_employee INNER JOIN vtiger_crmentity ON vtiger_crmentity.crmid=vtiger_hrm_employee.employid WHERE vtiger_crmentity.deleted=0 AND user_id=?";
            $rs_check = $adb->pquery($sql_check_user,array($value['id']));
            if($adb->num_rows($rs_check)){
                $employ_id = $adb->query_result($rs_check,0,'employid');
                $autoEmployNumber = 'EMPL'.$value['id'];
                $moduleName = 'Employee';
                $recordModel = Vtiger_Record_Model::getInstanceById($employ_id,$moduleName);
                $recordModel->set('mode', 'edit');
                $recordModel->set('firstname',$value['first_name']);
                $recordModel->set('lastname',$value['last_name']);
                $recordModel->set('email',$value['email1']);
                $recordModel->set('user_id',$value['id']);
                $recordModel->set('address',$value['address_street']);
                $recordModel->set('country',$value['address_country']);
                $recordModel->set('city',$value['address_city']);
                $recordModel->set('employ_number',$autoEmployNumber);
                $recordModel->save();
            }else{
                $autoEmployNumber = 'EMPL'.$value['id'];
                $moduleName = 'Employee';
                $recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
                $recordModel->set('mode', '');
                $recordModel->set('firstname',$value['first_name']);
                $recordModel->set('lastname',$value['last_name']);
                $recordModel->set('email',$value['email1']);
                $recordModel->set('user_id',$value['id']);
                $recordModel->set('address',$value['address_street']);
                $recordModel->set('country',$value['address_country']);
                $recordModel->set('city',$value['address_city']);
                $recordModel->set('employ_number',$autoEmployNumber);
                $recordModel->set('assigned_user_id',$value['id']);
                $recordModel->save();
            }
        }
        echo "Create Employee success !";
    }

}