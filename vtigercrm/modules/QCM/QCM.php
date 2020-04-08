<?php

include_once 'modules/Vtiger/CRMEntity.php';

class QCM extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_qcm';
        var $table_index= 'qcmid';

        var $customFieldTable = Array('vtiger_hrm_qcmcf', 'qcmid');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_qcm', 'vtiger_hrm_qcmcf');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_qcm' => 'qcmid',
                'vtiger_hrm_qcmcf'=>'qcmid');

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
            'QCM Code' => Array('qcm_code'),
            'QCM Title' => Array('qcm_title'),
            'Category' => Array('qcm_category'),
            'Classify' => Array('qcm_classify'),
            'Description' => Array('description'),
            'Fined' => Array('fined'),
            'Assigned To' => Array('vtiger_crmentity','assigned_user_id')
        );

        var $list_fields_name = Array (
            /* Format: Field Label => fieldname */
            'QCM Code' => 'qcm_code',
            'QCM Title' => 'qcm_title',
            'Category' => 'qcm_category',
            'Classify' => 'qcm_classify',
            'Description' => 'description',
            'Fined' => 'fined',
            'Assigned To' => 'assigned_user_id',
        );
        // Make the field link to detail view
       // var $list_link_field = 'exampleamount';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'QCM Code' => Array('qcm_code'),
                'QCM Title' => Array('qcm_title'),
                'Category' => Array('qcm_category'),
                'Classify' => Array('qcm_classify'),
                'Description' => Array('description'),
                'Fined' => Array('fined'),
                'Assigned To' => Array('vtiger_crmentity','assigned_user_id')
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
            'QCM Code' => 'qcm_code',
            'QCM Title' => 'qcm_title',
            'Category' => 'qcm_category',
            'Classify' => 'qcm_classify',
            'Description' => 'description',
            'Fined' => 'fined',
            'Assigned To' => 'assigned_user_id',
        );

        // For Popup window record selection
        var $popup_fields = Array ('qcm_title','qcm_category','qcm_classify','description','fined','assigned_user_id');

        // For Alphabetical search
        var $def_basicsearch_col = 'qcm_title';

        // Column value to use on detail view record text display
        var $def_detailview_recname = 'qcm_title';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('assigned_user_id');

        var $default_order_by = 'qcm_title';
        var $default_sort_order='ASC';
}