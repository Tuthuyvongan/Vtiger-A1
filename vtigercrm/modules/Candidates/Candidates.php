<?php

include_once 'modules/Vtiger/CRMEntity.php';

class Candidates extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_candidate';
        var $table_index= 'id';

        var $customFieldTable = Array('vtiger_hrm_candidatecf', 'id');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_candidate', 'vtiger_hrm_candidatecf');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_candidate' => 'id',
                'vtiger_hrm_candidatecf'=>'id');

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'First Name' => Array('firstname'),
                'Last Name' => Array('lastname'),
                'Primary Email' => Array('email'),
				'Assigned To' => Array('crmentity','smownerid')
        );
        var $list_fields_name = Array (
                /* Format: Field Label => fieldname */
                'First Name' => 'firstname',
                'Last Name' => 'lastname',
                'Primary Email' => 'email',
				'Assigned To' => 'assigned_user_id'
        );

        // Make the field link to detail view
       // var $list_link_field = 'exampleamount';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'First Name' => Array('firstname'),
                'Last Name' => Array('lastname'),
                'Primary Email' => Array('email'),
                'Assigned To' => Array('vtiger_crmentity','assigned_user_id'),
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
                'First Name' => 'firstname',
                'Last Name' => 'lastname',
                'Primary Email' => 'email',
                'Assigned To' => 'assigned_user_id',
        );

        // For Popup window record selection
        var $popup_fields = Array ('firstname','lastname','email');

        // For Alphabetical search
        var $def_basicsearch_col = 'firstname';

        // Column value to use on detail view record text display
        var $def_detailview_recname = 'firstname';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('firstname','assigned_user_id');

        var $default_order_by = 'firstname';
        var $default_sort_order='ASC';
		
		function vtlib_handler($modulename, $event_type) {
			if($event_type == 'module.postinstall') {
				// add Candidate field to users module
				self::addCandidateToUser();
			} else if($event_type == 'module.disabled') {
				// TODO Handle actions when this module is disabled.
			} else if($event_type == 'module.enabled') {
				// TODO Handle actions when this module is enabled.
			} else if($event_type == 'module.preuninstall') {
				// TODO Handle actions when this module is about to be deleted.
			} else if($event_type == 'module.preupdate') {
				// TODO Handle actions before this module is updated.
			} else if($event_type == 'module.postupdate') {
				// TODO Handle actions after this module is updated.
			}
		}
		
		static function addCandidateToUser() {
			global $currentModule, $adb;
			$sql_2 = "ALTER TABLE `vtiger_users` ADD `candidate` VARCHAR(255)";
			$adb->query($sql_2);
		}
		
}