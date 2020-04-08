<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 4/26/2019
 * Time: 3:17 PM
 */

class JD_Commons_Action extends Vtiger_BasicAjax_Action {

    function __construct() {
        parent::__construct();
        $this->exposeMethod('saveTaskList');
        $this->exposeMethod('deleteTaskList');
    }

    public function process(Vtiger_Request $request)
    {
        $mode = $request->getMode();
        if(!empty($mode)) {
            echo $this->invokeExposedMethod($mode, $request);
            return;
        }
    }

    public function saveTaskList(Vtiger_Request $request){
        global $adb;
        $recordId = $request->get('record');
        $task_id = $request->get('task_id');
        $taskDescription = $request->get('task_description');

        if(empty($recordId))
            return;

        if(isset($task_id) && !empty($task_id)){
            $sql_update_task = "UPDATE vtiger_hrm_jd_tasks SET task_desc = ? WHERE id = ? AND jd_id = ?";
            $adb->pquery($sql_update_task,array($taskDescription,$task_id,$recordId));

            $sql_get_tasks = "SELECT * FROM vtiger_hrm_jd_tasks WHERE jd_id = ? ORDER BY id DESC";
            $result_task = $adb->pquery($sql_get_tasks,array($recordId));
            $content = '';
            $content .= '<tr style="font-weight: bold;height:30px;border: 1px solid black;width: 100%;">
                        <td style="border: 1px solid black;">Task ID</td>
                        <td style="border: 1px solid black;">Task Description</td>
                        <td style="width: 110px;">Action</td>
                        </tr>';
            $i = 1;
            while ($row = $adb->fetchByAssoc($result_task)){
                $content .= '<tr data-id="'.$row['id'].'" data-desc="'.$row['task_desc'].'" style="border-bottom: 1px solid black;border-top: solid 1px black;width: 100%;">
                           <!--<td style="border: 1px solid black;">'.$row['id'].'</td>--> 
                            <td style="border: 1px solid black;">'.$i.'</td>
                            <td style="border: 1px solid black;">'.$row['task_desc'].'</td>
                            <td style="border: 1px solid black;">
                            <input type="button" onclick="editTask(this);" value="Edit">
                            <input style="margin-left: 4px;" type="button" onclick="deleteTask(this);" value="Delete">
                            </td>
                            </tr>';
                $i++;
            }
            echo $content;
        }else{
            $sql_insert_task = "INSERT INTO vtiger_hrm_jd_tasks (`task_desc`,`jd_id`) VALUES (?,?)";
            $adb->pquery($sql_insert_task,array($taskDescription,$recordId));

            $sql_get_tasks = "SELECT * FROM vtiger_hrm_jd_tasks WHERE jd_id = ? ORDER BY id DESC";
            $result_task = $adb->pquery($sql_get_tasks,array($recordId));
            $content = '';
            $content .= '<tr style="font-weight: bold;height:30px;border: 1px solid black;width: 100%;">
                        <td style="border: 1px solid black;">Task ID</td>
                        <td style="border: 1px solid black;">Task Description</td>
                        <td style="width: 110px;">Action</td>
                        </tr>';
            $i = 1;
            while ($row = $adb->fetchByAssoc($result_task)){
                $content .= '<tr data-id="'.$row['id'].'" data-desc="'.$row['task_desc'].'" style="border: 1px solid black;width: 100%;">
                            <!--<td style="border: 1px solid black;">'.$row['id'].'</td> --> 
                            <td style="border: 1px solid black;">'.$i.'</td>
                            <td style="border: 1px solid black;">'.$row['task_desc'].'</td>
                            <td style="border: 1px solid black;">
                            <input type="button" onclick="editTask(this);" value="Edit">
                            <input style="margin-left: 4px;" type="button" onclick="deleteTask(this);" value="Delete">
                            </td>
                            </tr>';
                $i++;
            }
            echo $content;
        }

    }

    public function deleteTaskList(Vtiger_Request $request){
        global $adb;

        $recordId = $request->get('record');
        $task_id = $request->get('task_id');
        if(empty($task_id)){
            return;
        }
        $sql_delete_task = "DELETE FROM vtiger_hrm_jd_tasks WHERE jd_id = ? AND id = ?";
        $adb->pquery($sql_delete_task,array($recordId,$task_id));

        $sql_get_tasks = "SELECT * FROM vtiger_hrm_jd_tasks WHERE jd_id = ? ORDER BY id DESC";
        $result_task = $adb->pquery($sql_get_tasks,array($recordId));
        $content = '';
        $content .= '<tr style="font-weight: bold;height:30px;border: 1px solid black;">
                        <td style="border: 1px solid black;">Task ID</td>
                        <td style="border: 1px solid black;">Task Description</td>
                        <td style="border: 1px solid black;width:110px;">Action</td>
                        </tr>';
        $i = 1;
        while ($row = $adb->fetchByAssoc($result_task)){
            $content .= '<tr data-id="'.$row['id'].'" data-desc="'.$row['task_desc'].'" data-name="'.$row['task_name'].'" style="border: 1px solid black;">
                            <!--<td style="border: 1px solid black;">'.$row['id'].'</td> --> 
                            <td style="border: 1px solid black;">'.$i.'</td>
                            <td style="border: 1px solid black;">'.$row['task_desc'].'</td>
                            <td style="border: 1px solid black;">
                            <input type="button" onclick="editTask(this);" value="Edit">
                            <input style="margin-left: 4px;" type="button" onclick="deleteTask(this);" value="Delete"></td>
                            </tr>';
            $i++;
        }
        echo $content;

    }
}