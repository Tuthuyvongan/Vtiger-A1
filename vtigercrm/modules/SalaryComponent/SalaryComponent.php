<?php

include_once 'modules/Vtiger/CRMEntity.php';

class SalaryComponent extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_settingdepartment';
        var $table_index= 'id';

        var $customFieldTable = Array('vtiger_hrm_settingdepartmentcf', 'id');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_settingdepartment', 'vtiger_hrm_settingdepartmentcf');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_settingdepartment' => 'id',
                'vtiger_hrm_settingdepartmentcf'=>'id');

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Name' => Array('name'),
                'Description' => Array('description'),

        );
        var $list_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Name' => 'name',
                'Description' => 'description',
        );

        // Make the field link to detail view
       // var $list_link_field = 'exampleamount';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Name' => Array('name'),
                 'Description' => Array('description'),
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Name' => 'name',
				'Description' => 'description',
        );

        // For Popup window record selection
        var $popup_fields = Array ('name','description');

        // For Alphabetical search
        var $def_basicsearch_col = 'name';

        // Column value to use on detail view record text display
        var $def_detailview_recname = 'name';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('');

        var $default_order_by = 'name';
        var $default_sort_order='ASC';
}