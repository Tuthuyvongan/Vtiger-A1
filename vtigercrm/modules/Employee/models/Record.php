<?php
/**
 * Created by PhpStorm.
 * User: Netbase
 * Date: 4/23/2019
 * Time: 9:52 AM
 */

class Employee_Record_Model extends Vtiger_Record_Model {

    public function getImageDetails() {
        $db = PearDatabase::getInstance();
        $imageDetails = array();
        $recordId = $this->getId();
        $sql_userid = "SELECT
                            user_id
                        FROM
                            vtiger_hrm_employee ve
                        INNER JOIN vtiger_crmentity vc ON vc.crmid = ve.employid
                        WHERE
                            vc.deleted = 0
                        AND ve.employid = ?";
        $result_userid = $db->pquery($sql_userid,array($recordId));
        $user_id = $db->query_result($result_userid,'user_id',0);
        if ($user_id) {
            // Not a good approach to get all the fields if not required(May lead to Performance issue)
            $query = "SELECT vtiger_attachments.attachmentsid, vtiger_attachments.path, vtiger_attachments.name FROM vtiger_attachments
                                  LEFT JOIN vtiger_salesmanattachmentsrel ON vtiger_salesmanattachmentsrel.attachmentsid = vtiger_attachments.attachmentsid
                                  WHERE vtiger_salesmanattachmentsrel.smid=?";

            $result = $db->pquery($query, array($user_id));

            $imageId = $db->query_result($result, 0, 'attachmentsid');
            $imagePath = $db->query_result($result, 0, 'path');
            $imageName = $db->query_result($result, 0, 'name');

            //decode_html - added to handle UTF-8 characters in file names
            $imageOriginalName = urlencode(decode_html($imageName));

            $imageDetails[] = array(
                'id' => $imageId,
                'orgname' => $imageOriginalName,
                'path' => $imagePath.$imageId,
                'name' => $imageName
            );
        }
        return $imageDetails;
    }

    public function getCreatorId($recordId){
        global $adb;
        $sql = "SELECT user_id FROM vtiger_hrm_employee AS he INNER JOIN vtiger_crmentity AS vc ON vc.crmid=he.employid WHERE vc.deleted=0 AND employid=?";
        $result = $adb->pquery($sql,array($recordId));
        $smCreator = $adb->query_result($result,0,'user_id');
        return $smCreator;
    }

}