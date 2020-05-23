<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************/

include_once 'modules/Vtiger/CRMEntity.php';

class PhuongTienTruyenThong extends Vtiger_CRMEntity {
    var $table_name = 'vtiger_phuongtientruyenthong';
    var $table_index= 'phuongtientruyenthongid';

    /**
     * Mandatory table for supporting custom fields.
     */
    var $customFieldTable = Array('vtiger_phuongtientruyenthongcf', 'phuongtientruyenthongid');

    /**
     * Mandatory for Saving, Include tables related to this module.
     */
    var $tab_name = Array('vtiger_crmentity', 'vtiger_phuongtientruyenthong', 'vtiger_phuongtientruyenthongcf');

    /**
     * Mandatory for Saving, Include tablename and tablekey columnname here.
     */
    var $tab_name_index = Array(
        'vtiger_crmentity' => 'crmid',
        'vtiger_phuongtientruyenthong' => 'phuongtientruyenthongid',
        'vtiger_phuongtientruyenthongcf'=>'phuongtientruyenthongid');

    /**
     * Mandatory for Listing (Related listview)
     */
    var $list_fields = Array (
        /* Format: Field Label => Array(tablename, columnname) */
        // tablename should not have prefix 'vtiger_'
        'Mo ta chi tiet'=> Array('phuongtientruyenthong','motachitiet'),
        'Phuong tien truyen thong' => Array('phuongtientruyenthong', 'pttt'),
        );
    var $list_fields_name = Array (
        /* Format: Field Label => fieldname */
        'Mo ta chi tiet'=>'motachitiet',
        'Phuong tien truyen thong' => 'pttt',
        );

    // Make the field link to detail view
    var $list_link_field = 'pttt';

    // For Popup listview and UI type support
    var $search_fields = Array(
        /* Format: Field Label => Array(tablename, columnname) */
        // tablename should not have prefix 'vtiger_'
        'Phuong tien truyen thong' => Array('phuongtientruyenthong', 'pttt'),
        );
    var $search_fields_name = Array (
        /* Format: Field Label => fieldname */
        'Phuong tien truyen thong' => 'pttt',
        );

    // For Popup window record selection
    var $popup_fields = Array ('pttt');

    // For Alphabetical search
    var $def_basicsearch_col = 'pttt';

    // Column value to use on detail view record text display
    var $def_detailview_recname = 'pttt';

    // Used when enabling/disabling the mandatory fields for the module.
    // Refers to vtiger_field.fieldname values.
    var $mandatory_fields = Array('pttt');

    var $default_order_by = 'pttt';
    var $default_sort_order='ASC';

    /**
     * Invoked when special actions are performed on the module.
     * @param String Module name
     * @param String Event Type
     */
    function vtlib_handler($moduleName, $eventType) {
        global $adb;
        if($eventType == 'module.postinstall') {
            // TODO Handle actions after this module is installed.
        } else if($eventType == 'module.disabled') {
            // TODO Handle actions before this module is being uninstalled.
        } else if($eventType == 'module.preuninstall') {
            // TODO Handle actions when this module is about to be deleted.
            global $adb;
            $sql = 'DROP TABLE vtiger_phuongtientruyenthongcf; DROP TABLE vtiger_phuongtientruyenthong;';
            $adb->query($sql);
        } else if($eventType == 'module.preupdate') {
            // TODO Handle actions before this module is updated.
        } else if($eventType == 'module.postupdate') {
            // TODO Handle actions after this module is updated.
        }
    }
    
}