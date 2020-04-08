<?php

include_once 'modules/Vtiger/CRMEntity.php';

class Leave extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_leave';
        var $table_index= 'id';

        var $customFieldTable = Array('');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_leave');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_leave' => 'id'
				);

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Employee' => Array('employ_id'),
                'From Date' => Array('from_date'),
                'To Date' => Array('to_date'),
                'Leave Type' => Array('hrm_leave_type'),
				'Assigned To'=>Array('assigned_user_id')

        );
        var $list_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Employee' => 'employ_id',
                'From Date' => 'from_date',
                'To Date' => 'to_date',
                'Leave Type' => 'hrm_leave_type',
                'Assigned To' => 'assigned_user_id',
        );

        // Make the field link to detail view
       // var $list_link_field = 'exampleamount';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Employee' => Array('employ_id'),
                'From Date' => Array('from_date'),
                'To Date' => Array('to_date'),
                'Leave Type' => Array('hrm_leave_type'),
				'Assigned To'=>Array('assigned_user_id')
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Employee' => 'employ_id',
                'From Date' => 'from_date',
                'To Date' => 'to_date',
                'Leave Type' => 'hrm_leave_type',
                'Assigned To' => 'assigned_user_id',
        );

        // For Popup window record selection
        var $popup_fields = Array ('employ_id','from_date','to_date','hrm_leave_type','assigned_user_id');

        // For Alphabetical search
        var $def_basicsearch_col = '';

        // Column value to use on detail view record text display
        var $def_detailview_recname = '';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('');

        var $default_order_by = '';
        var $default_sort_order='ASC';

    function getNonAdminAccessControlQuery($module, $user, $scope = '') {
        require('user_privileges/user_privileges_' . $user->id . '.php');
        require('user_privileges/sharing_privileges_' . $user->id . '.php');
        $query = ' ';
        $tabId = getTabid($module);
        if ($is_admin == false && $profileGlobalPermission[1] == 1 && $profileGlobalPermission[2]
            == 1 && $defaultOrgSharingPermission[$tabId] == 3) {
            $tableName = 'vt_tmp_u' . $user->id;
            $sharingRuleInfoVariable = $module . '_share_read_permission';
            $sharingRuleInfo = $$sharingRuleInfoVariable;
            $sharedTabId = null;
            if (!empty($sharingRuleInfo) && (count($sharingRuleInfo['ROLE']) > 0 ||
                    count($sharingRuleInfo['GROUP']) > 0)) {
                $tableName = $tableName . '_t' . $tabId;
                $sharedTabId = $tabId;
            } elseif ($module == 'Calendar' || !empty($scope)) {
                $tableName .= '_t' . $tabId;
            }
            $this->setupTemporaryTable($tableName, $sharedTabId, $user, $current_user_parent_role_seq, $current_user_groups);
            // for secondary module we should join the records even if record is not there(primary module without related record)
            if($scope == ''){
                if($module != 'Leave'){
                    $query = " INNER JOIN $tableName $tableName$scope ON $tableName$scope.id = " .
                        "vtiger_crmentity$scope.smownerid ";
                }
            }else{
                $query = " INNER JOIN $tableName $tableName$scope ON $tableName$scope.id = " .
                    "vtiger_crmentity$scope.smownerid OR vtiger_crmentity$scope.smownerid IS NULL";
            }
        }
        return $query;
    }
}