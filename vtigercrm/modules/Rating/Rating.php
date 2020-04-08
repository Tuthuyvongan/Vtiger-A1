<?php

include_once 'modules/Vtiger/CRMEntity.php';

class Rating extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_rating';
        var $table_index= 'id';

        var $customFieldTable = Array('vtiger_hrm_ratingcf', 'id');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_rating', 'vtiger_hrm_ratingcf');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_rating' => 'id',
                'vtiger_hrm_ratingcf'=>'id');

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Task Name' => Array('task_name'),
                'Weight' => Array('weight'),

        );
        var $list_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Task Name' => 'task_name',
                'Weight' => 'weight',
        );

        // Make the field link to detail view
       // var $list_link_field = 'exampleamount';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Task Name' => Array('task_name'),
				'Weight' => 'weight',
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Task Name' => 'task_name',
				'Weight' => 'weight',
        );

        // For Popup window record selection
        var $popup_fields = Array ('task_name');

        // For Alphabetical search
        var $def_basicsearch_col = 'task_name';

        // Column value to use on detail view record text display
        var $def_detailview_recname = 'task_name';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('task_name');

        var $default_order_by = 'task_name';
        var $default_sort_order='ASC';
}