<?php

include_once 'modules/Vtiger/CRMEntity.php';

class KPI extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_kpi';
        var $table_index= 'id';

        var $customFieldTable = Array('vtiger_hrm_kpicf', 'id');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_kpi', 'vtiger_hrm_kpicf');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_kpi' => 'id',
                'vtiger_hrm_kpicf'=>'id');

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
				'KPI Name' => Array('kpi_name'),
				'Type' => Array('kpi_type'),
				'Department' => Array('kpi_department'),
                'Assigned To' => Array('crmentity','smownerid'),
        );
        var $list_fields_name = Array (
                /* Format: Field Label => fieldname */
				'KPI Name' => 'kpi_name',
				'Type' => 'kpi_type',
				'Department' => 'kpi_department',
                'Assigned To' => 'assigned_user_id',
                
        );

        // Make the field link to detail view
        var $list_link_field = 'kpi_name';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'KPI Name' => Array('kpi_name'),
				'Type' => Array('kpi_type'),
				'Department' => Array('kpi_department'),
                'Assigned To' => Array('crmentity','smownerid'),
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
                'KPI Name' => 'kpi_name',
				'Type' => 'kpi_type',
				'Department' => 'kpi_department',
                'Assigned To' => 'assigned_user_id',
        );

        // For Popup window record selection
        var $popup_fields = Array ('kpi_name');

        // For Alphabetical search
        var $def_basicsearch_col = 'kpi_name';

        // Column value to use on detail view record text display
        var $def_detailview_recname = 'kpi_name';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('assigned_user_id');

        var $default_order_by = 'kpi_name';
        var $default_sort_order='ASC';

 /**
        * Invoked when special actions are performed on the module.
        * @param String Module name
        * @param String Event Type
        */

}