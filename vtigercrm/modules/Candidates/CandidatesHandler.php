<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class CandidatesHandler extends VTEventHandler {

    function handleEvent($eventName, $entityData)
    {
        global $adb, $current_user;

        if($eventName == 'vtiger.entity.aftersave') {
            $moduleName = $entityData->getModuleName();

            if($moduleName != 'Candidates'){
                return;
            }

            if($moduleName == 'Candidates' && $_REQUEST['module']=='Candidates'){
                $recordId = $entityData->getId();
                $email = $entityData->get('email');
                $firstname = $entityData->get('firstname');

                $tmpl_str = explode(' ',$firstname);
                $firname_string = '';
                foreach ($tmpl_str as $tmp){
                    $firname_string .= $tmp;
                }
                $lastname = $entityData->get('lastname');
                $candidateModule = Vtiger_Module_Model::getCleanInstance('Candidates');
                $user_str_1 = $candidateModule->convertVNtoLatinString($firname_string);
                $user_str_1 = strtolower($user_str_1);
                $user_str_2 = $candidateModule->convertVNtoLatinString($lastname);
                $user_str_2 = strtolower($user_str_2);
                $arr_user_str = explode(" ",$user_str_2);
                $username_str = $user_str_1.".".$arr_user_str[0][0]."".$arr_user_str[1][0];

                $dateofbirth = $entityData->get('date_of_birth');
                $position = $entityData->get('position');
                $mobilePhone = $entityData->get('mobile');

                $candidate_action = $entityData->get('candidate_action');
				
				if($candidate_action != 'Hire'){
                    $candidate_status = 'Potential';
                }else{
                    $candidate_status = 'Active';
                    $rs_user = $adb->pquery("SELECT * FROM vtiger_users WHERE candidate = ?",array($recordId));
                    $count_user = $adb->num_rows($rs_user);
                    $rs_roleid = $adb->pquery("SELECT roleid FROM vtiger_role WHERE rolename = 'Sales Person'",array());
                    $roleid = $adb->query_result($rs_roleid,0,'roleid');

                    if($count_user){
                        $employ_user_id = $adb->query_result($rs_user,0,'id');
                        $userModuleName = "Users";
                        $userRecordModel = Vtiger_Record_Model::getInstanceById($employ_user_id,$userModuleName);
                        $userRecordModel->set('mode', 'edit');
                        $userRecordModel->set('user_name',$username_str);
                        $userRecordModel->set('first_name',$firstname);
                        $userRecordModel->set('last_name',$lastname);
                        $userRecordModel->set('email1',$email);
                        $userRecordModel->set('candidate',$recordId);
                        $userRecordModel->set('user_password','admin');
                        $userRecordModel->set('confirm_password','admin');
                        $userRecordModel->set('roleid',$roleid);
                        $userRecordModel->set('is_admin','off');
                        $userRecordModel->set('status',$candidate_status);
                        $userRecordModel->save();
                    }else{
                        $userModuleName = "Users";
                        $userRecordModel = Vtiger_Record_Model::getCleanInstance($userModuleName);
                        $userRecordModel->set('mode', '');
                        $userRecordModel->set('user_name',$username_str);
                        $userRecordModel->set('first_name',$firstname);
                        $userRecordModel->set('last_name',$lastname);
                        $userRecordModel->set('email1',$email);
                        $userRecordModel->set('candidate',$recordId);
                        $userRecordModel->set('user_password','admin');
                        $userRecordModel->set('confirm_password','admin');
                        $userRecordModel->set('roleid',$roleid);
                        $userRecordModel->set('is_admin','off');
                        $userRecordModel->set('status',$candidate_status);
                        $userRecordModel->save();
                        $employ_user_id = $userRecordModel->getId();
						$adb->pquery("UPDATE vtiger_users SET candidate = ? WHERE id = ?",array($recordId,$employ_user_id));
                    }
                }

                $employNumber = 'EMPL'.$employ_user_id;
                $rs_employee = $adb->pquery("SELECT * FROM vtiger_hrm_employee WHERE candidate_id = ?",array($recordId));
                $count_empl = $adb->num_rows($rs_employee);
                if($count_empl){
                    $employ_id = $adb->query_result($rs_employee,0,'employid');
                    $employeeModule = "Employee";
                    $recordModel = Vtiger_Record_Model::getInstanceById($employ_id,$employeeModule);
                    $recordModel->set('mode', 'edit');
                    $recordModel->set('firstname',$firstname);
                    $recordModel->set('lastname',$lastname);
                    $recordModel->set('date_of_birth',$dateofbirth);
                    $recordModel->set('mobile',$mobilePhone);
                    $recordModel->set('position',$position);
                    $recordModel->set('email',$email);
                    $recordModel->set('private_email',$email);
                    $recordModel->set('candidate_id',$recordId);
                    $recordModel->set('user_id',$employ_user_id);
                    $recordModel->set('assigned_user_id',$employ_user_id);
                    if(empty($recordModel->get('employ_number'))){
                        $recordModel->set('employ_number',$employNumber);
                    }
                    $recordModel->save();
                }else{
                    $employeeModule = "Employee";
                    $recordModel = Vtiger_Record_Model::getCleanInstance($employeeModule);
                    $recordModel->set('mode', '');
                    $recordModel->set('firstname',$firstname);
                    $recordModel->set('lastname',$lastname);
                    $recordModel->set('email',$email);
                    $recordModel->set('private_email',$email);
                    $recordModel->set('date_of_birth',$dateofbirth);
                    $recordModel->set('mobile',$mobilePhone);
                    $recordModel->set('position',$position);
                    $recordModel->set('employ_number',$employNumber);
                    $recordModel->set('candidate_id',$recordId);
                    $recordModel->set('user_id',$employ_user_id);
                    $recordModel->set('assigned_user_id',$employ_user_id);
                    $recordModel->save();
                }

            }
        }
    }
}

?>
