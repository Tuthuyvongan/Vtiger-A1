<?php

include_once 'modules/Vtiger/CRMEntity.php';

class SettingWeight extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_weight';
        var $table_index= 'id';

        var $customFieldTable = Array('');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_weight');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_weight' => 'id'
				);

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Weight' => Array('weight')

        );
        var $list_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Weight' => 'weight'
        );

        // Make the field link to detail view
       // var $list_link_field = 'exampleamount';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Weight' => Array('weight')
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Weight' => 'weight'
        );

        // For Popup window record selection
        var $popup_fields = Array ('weight');

        // For Alphabetical search
        var $def_basicsearch_col = 'weight';

        // Column value to use on detail view record text display
        var $def_detailview_recname = 'weight';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('weight');

        var $default_order_by = 'weight';
        var $default_sort_order='ASC';
}