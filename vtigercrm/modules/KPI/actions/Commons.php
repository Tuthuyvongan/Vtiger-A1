<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 4/26/2019
 * Time: 3:17 PM
 */

class KPI_Commons_Action extends Vtiger_BasicAjax_Action {

    function __construct() {
        parent::__construct();
        $this->exposeMethod('getRatingWeight');
    }

    public function process(Vtiger_Request $request)
    {
        $mode = $request->getMode();
        if(!empty($mode)) {
            echo $this->invokeExposedMethod($mode, $request);
            return;
        }
    }

    public function getRatingWeight(Vtiger_Request $request){
        global $adb;
        $type_name = $request->get('type_name');
        $response = array();
        if($type_name){
            $result = $adb->pquery("SELECT
                                            rw.task_name,
                                            hw.weight AS weight,
                                            rw.bonus,
                                            rw.fined 
                                        FROM
                                            `vtiger_hrm_rating` AS rw
                                            INNER JOIN vtiger_hrm_weight AS hw ON hw.id = rw.rating_weight 
                                        WHERE
                                            rw.task_name = ?",array($type_name));
            while ($row = $adb->fetchByAssoc($result)){
                $text = "The weight refer with ".$type_name.": ".$row['weight'];
                $response['task_name'] = $row['task_name'];
                $response['bonus'] = $row['bonus'];
                $response['fined'] = $row['fined'];
                $response['text'] = $text;
            }
        }
        return json_encode($response);
    }

}