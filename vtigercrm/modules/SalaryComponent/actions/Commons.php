<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 4/26/2019
 * Time: 3:17 PM
 */

class SalaryComponent_Commons_Action extends Vtiger_BasicAjax_Action {

    function __construct() {
        parent::__construct();
        $this->exposeMethod('saveSalaryList');
        $this->exposeMethod('deleteSalaryList');
    }

    public function process(Vtiger_Request $request)
    {
        $mode = $request->getMode();
        if(!empty($mode)) {
            echo $this->invokeExposedMethod($mode, $request);
            return;
        }
    }

    public function saveSalaryList(Vtiger_Request $request){
        global $adb;
        $recordId = $request->get('record');
        $line_id = $request->get('line_id');
        $experience = $request->get('experience');
        $salary = $request->get('salary');
        $qualification = $request->get('qualification');
        $management_scale = $request->get('management_scale');
        $time_to_review = $request->get('time_to_review');
        $level1 = $request->get('level1');
        $level2 = $request->get('level2');
        $level3 = $request->get('level3');

        if(empty($recordId))
            return;
        $td_style = 'style="border: 1px solid black !important;"';
        if(isset($line_id) && !empty($line_id)){
            $sql_update_task = "UPDATE vtiger_hrm_settingdepartmentcust SET experience = ?, salary = ?, qualification = ?, management_scale = ?, time_to_review = ?, level1 = ?, level2 = ?, level3 = ? WHERE id = ? AND department_id = ?";
            $adb->pquery($sql_update_task,array($experience,$salary,$qualification,$management_scale,$time_to_review,$level1,$level2,$level3,$line_id,$recordId));

            $sql_get_tasks = "SELECT * FROM vtiger_hrm_settingdepartmentcust WHERE department_id = ? ORDER BY id ASC";
            $result_task = $adb->pquery($sql_get_tasks,array($recordId));
            $content = '';
            $content .= '<tr>
								<td colspan="10"></td>
						</tr>
                        <tr style="font-weight: bold;border: 1px solid black">
                        <td align="center" '.$td_style.'>Id</td>
                        <td align="center" '.$td_style.'>Experience</td>
                        <td align="center" '.$td_style.'>Salary</td>
                        <td align="center" '.$td_style.'>Qualification</td>
                        <td align="center" '.$td_style.'>Management Scale</td>
                        <td align="center" '.$td_style.'>Time To Review </br> (Months)</td>
                        <td align="center" '.$td_style.'>Level 1</br> (2.6 -3)</td>
                        <td align="center" '.$td_style.'>Level 2</br> (3.1 -3.6)</td>
                        <td align="center" '.$td_style.'>Level 3</br> (> 3.6)</td>
                        <td align="center" style="width: 110px;">Action</td>
                        </tr>';
            $i = 1;
            while ($row = $adb->fetchByAssoc($result_task)){
                $content .= '<tr data-id="'.$row['id'].'" data-experience="'.$row['experience'].'" data-salary="'.$row['salary'].'" data-qualification="'.$row['qualification'].'" data-management_scale="'.$row['management_scale'].'" data-time_to_review="'.$row['time_to_review'].'" data-level1="'.$row['level1'].'" data-level2="'.$row['level2'].'" data-level3="'.$row['level3'].'" style="border: solid 1px black;">
                            <td align="center" '.$td_style.'>'.$i.'</td>
                            <td align="center" '.$td_style.'>'.html_entity_decode($row['experience']).'</td>
                            <td align="center" '.$td_style.'>'.number_format($row['salary'],0,'.',',').'</td>
                            <td align="center" '.$td_style.'>'.$row['qualification'].'</td>
                            <td align="center" '.$td_style.'>'.$row['management_scale'].'</td>
                            <td align="center" '.$td_style.'>'.$row['time_to_review'].'</td>
                            <td align="center" '.$td_style.'>'.$row['level1'].'</td>
                            <td align="center" '.$td_style.'>'.$row['level2'].'</td>
                            <td align="center" '.$td_style.'>'.$row['level3'].'</td>
                            <td align="center" style="border: 1px solid black;white-space: nowrap;">
                            <input type="button" onclick="editTask(this);" value="Edit">
                            <input style="margin-left: 4px;" type="button" onclick="deleteTask(this);" value="Delete">
                            </td>
                            </tr>';
                $i++;
            }
            echo $content;
        }else{
            $sql_insert_task = "INSERT INTO vtiger_hrm_settingdepartmentcust (`department_id`,`experience`,`salary`,`qualification`,`management_scale`,`time_to_review`,`level1`,`level2`,`level3`) VALUES (?,?,?,?,?,?,?,?,?)";
            $adb->pquery($sql_insert_task,array($recordId,$experience,$salary,$qualification,$management_scale,$time_to_review,$level1,$level2,$level3));

            $sql_get_tasks = "SELECT * FROM vtiger_hrm_settingdepartmentcust WHERE department_id = ? ORDER BY id ASC";
            $result_task = $adb->pquery($sql_get_tasks,array($recordId));
            $content = '';
            $content .= '<tr>
								<td colspan="10"></td>
						</tr>
                        <tr style="font-weight: bold;border: 1px solid black;">
                        <td align="center" '.$td_style.'>Id</td>
                        <td align="center" '.$td_style.'>Experience</td>
                        <td align="center" '.$td_style.'>Salary Level</td>
                        <td align="center" '.$td_style.'>Qualification</td>
                        <td align="center" '.$td_style.'>Management Scale</td>
                        <td align="center" '.$td_style.'>Time To Review </br>(Months)</td>
                        <td align="center" '.$td_style.'>Level 1</br> (2.6 -3)</td>
                        <td align="center" '.$td_style.'>Level 2</br> (3.1 -3.6)</td>
                        <td align="center" '.$td_style.'>Level 3</br> (> 3.6)</td>
                        <td align="center" style="width: 110px;">Action</td>
                        </tr>';
            $i = 1;
            while ($row = $adb->fetchByAssoc($result_task)){
                $content .= '<tr data-id="'.$row['id'].'" data-experience="'.$row['experience'].'" data-salary="'.$row['salary'].'" data-qualification="'.$row['qualification'].'" data-management_scale="'.$row['management_scale'].'" data-time_to_review="'.$row['time_to_review'].'" data-level1="'.$row['level1'].'" data-level2="'.$row['level2'].'" data-level3="'.$row['level3'].'" style="border: 1px solid black;">
                            <td align="center" '.$td_style.'>'.$i.'</td>
                            <td align="center" '.$td_style.'>'.html_entity_decode($row['experience']).'</td>
                            <td align="center" '.$td_style.'>'.number_format($row['salary'],0,'.',',').'</td>
                            <td align="center" '.$td_style.'>'.$row['qualification'].'</td>
                            <td align="center" '.$td_style.'>'.$row['management_scale'].'</td>
                            <td align="center" '.$td_style.'>'.$row['time_to_review'].'</td>
                             <td align="center" '.$td_style.'>'.$row['level1'].'</td>
                            <td align="center" '.$td_style.'>'.$row['level2'].'</td>
                            <td align="center" '.$td_style.'>'.$row['level3'].'</td>
                            <td align="center" style="border: 1px solid black;white-space: nowrap;">
                            <input type="button" onclick="editTask(this);" value="Edit">
                            <input style="margin-left: 4px;" type="button" onclick="deleteTask(this);" value="Delete">
                            </td>
                            </tr>';
                $i++;
            }
            echo $content;
        }

    }

    public function deleteSalaryList(Vtiger_Request $request){
        global $adb;
        $recordId = $request->get('record');
        $line_id = $request->get('line_id');
        if(empty($line_id)){
            return;
        }
        $td_style = 'style="border: 1px solid black !important;"';
        $sql_delete_task = "DELETE FROM vtiger_hrm_settingdepartmentcust WHERE department_id = ? AND id = ?";
        $adb->pquery($sql_delete_task,array($recordId,$line_id));
        $sql_get_tasks = "SELECT * FROM vtiger_hrm_settingdepartmentcust WHERE department_id = ? ORDER BY id ASC";
        $result_task = $adb->pquery($sql_get_tasks,array($recordId));
        $content = '';
        $content .= '<tr>
								<td colspan="10"></td>
						</tr>
<tr style="font-weight: bold;height:30px;border: 1px solid black;width: 100%;">
                        <td align="center" '.$td_style.'>Id</td>
                        <td align="center" '.$td_style.'>Experience</td>
                        <td align="center" '.$td_style.'>Salary Level</td>
                        <td align="center" '.$td_style.'>Qualification</td>
                        <td align="center" '.$td_style.'>Management Scale</td>
                        <td align="center" '.$td_style.'>Time To Review </br>(Months)</td>
                        <td align="center" '.$td_style.'>Level 1</br> (2.6 -3)</td>
                        <td align="center" '.$td_style.'>Level 2</br> (3.1 -3.6)</td>
                        <td align="center" '.$td_style.'>Level 3</br> (> 3.6)</td>
                        <td align="center" style="width: 110px;">Action</td>
                        </tr>';
        $i = 1;
        while ($row = $adb->fetchByAssoc($result_task)){
            $content .= '<tr data-id="'.$row['id'].'" data-experience="'.$row['experience'].'" data-specialize="'.$row['specialize'].'" data-salary="'.$row['salary'].'" data-qualification="'.$row['qualification'].'" data-management_scale="'.$row['management_scale'].'" data-time_to_review="'.$row['time_to_review'].'" data-level1="'.$row['level1'].'" data-level2="'.$row['level2'].'" data-level3="'.$row['level3'].'" style="border: 1px solid black;width: 100%;">
                            <td align="center" '.$td_style.'>'.$i.'</td>
                            <td align="center" '.$td_style.'>'.html_entity_decode($row['experience']).'</td>
                            <td align="center" '.$td_style.'>'.number_format($row['salary'],0,'.',',').'</td>
                            <td align="center" '.$td_style.'>'.$row['qualification'].'</td>
                            <td align="center" '.$td_style.'>'.$row['management_scale'].'</td>
                            <td align="center" '.$td_style.'>'.$row['time_to_review'].'</td>
                            <td align="center" '.$td_style.'>'.$row['level1'].'</td>
                            <td align="center" '.$td_style.'>'.$row['level2'].'</td>
                            <td align="center" '.$td_style.'>'.$row['level3'].'</td>
                            <td align="center" style="border: 1px solid black;white-space: nowrap;">
                            <input type="button" onclick="editTask(this);" value="Edit">
                            <input style="margin-left: 4px;" type="button" onclick="deleteTask(this);" value="Delete">
                            </td>
                            </tr>';
            $i++;
        }
        echo $content;

    }
}