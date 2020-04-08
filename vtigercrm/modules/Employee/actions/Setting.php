<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 4/26/2019
 * Time: 3:17 PM
 */

class Employee_Setting_Action extends Vtiger_BasicAjax_Action {

    function __construct() {
        parent::__construct();
        $this->exposeMethod('editLicense');
    }

    public function process(Vtiger_Request $request)
    {
        $mode = $request->getMode();
        if(!empty($mode)) {
            echo $this->invokeExposedMethod($mode, $request);
            return;
        }
    }

    public function editLicense(Vtiger_Request $request){
        global $site_URL;
        $type = $request->get('type');
        $license_key = $request->get('license_key');
        if($type=='reactivate'){
            $_api_url = "https://cmsmart.net/activedomain";
            $_vendor = 'netbase'; /* Vendor is shopname vendor in the profile */
            $_sku = 'MGX1327'; /* SKU is code for each product */
            $_license_key = $license_key; /* License Key is the license in the product order */
            $_domain_name = base64_encode($site_URL); /*This domain must be obtained from the website url active license*/
            $_link_check_active = $_api_url . '/' . $_vendor . '/' . $_sku . '/' . $_license_key . '/' . $_domain_name;
            $result	= json_decode(file_get_contents($_link_check_active),true);
            $result['license'] = $_license_key;
            if($result['code']==5 || $result['code']==6){
                $licen_json = json_encode($result);
                file_put_contents('modules/Employee/license.json',$licen_json);
                $message_text = 'Your Licence Key Reactivated Successfully';
            }else{
                $message_text = $result['data'];
            }
            $response = new Vtiger_Response();
            $response->setResult(array("code"=>$result['code'],"message"=>$message_text,'license_key'=>$_license_key));
            $response->emit();
        }
        if($type=='deactivate'){
            $_api_url = "https://cmsmart.net/removedomain";
            $_vendor = 'netbase'; /* Vendor is shopname vendor in the profile */
            $_sku = 'MGX1327'; /* SKU is code for each product */
            $_license_key = $license_key; /* License Key is the license in the product order */
            $_domain_name = base64_encode($site_URL); /*This domain must be obtained from the website url active license*/
            $_link_check_remove = $_api_url . '/' . $_vendor . '/' . $_sku . '/' . $_license_key . '/' . $_domain_name;
            print_r($_link_check_remove);
            $return	= json_decode(file_get_contents($_link_check_remove),true);
            if($return['data'] != ''){
                $licen_json = '';
                file_put_contents('modules/Employee/license.json',$licen_json);
                $message_text = $return['data'];
            }
            $response = new Vtiger_Response();
            $response->setResult(array("code"=>1,"message"=>$message_text));
            $response->emit();
        }
        if($type=='activate'){
            $_api_url = "https://cmsmart.net/activedomain";
            $_vendor = 'netbase'; /* Vendor is shopname vendor in the profile */
            $_sku = 'MGX1327'; /* SKU is code for each product */
            $_license_key = $license_key; /* License Key is the license in the product order */
            $_domain_name = base64_encode($site_URL); /*This domain must be obtained from the website url active license*/
            $_link_check_active = $_api_url . '/' . $_vendor . '/' . $_sku . '/' . $_license_key . '/' . $_domain_name;
            $result	= json_decode(file_get_contents($_link_check_active),true);
            $result['license'] = $_license_key;
            if($result['code']==5 || $result['code']==6){
                $licen_json = json_encode($result);
                file_put_contents('modules/Employee/license.json',$licen_json);
                $message_text = 'Your Licence Key Reactivated Successfully';
            }else{
                $message_text = $result['data'];
            }
            $response = new Vtiger_Response();
            $response->setResult(array("code"=>$result['code'],"message"=>$message_text,'license_key'=>$_license_key));
            $response->emit();
        }
    }
}