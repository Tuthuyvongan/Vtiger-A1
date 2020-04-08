<?php

include_once 'modules/Vtiger/CRMEntity.php';

class Employee extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_employee';
        var $table_index= 'employid';

        var $customFieldTable = Array('vtiger_hrm_employcf', 'employid');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_employee', 'vtiger_hrm_employcf');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_employee' => 'employid',
                'vtiger_hrm_employcf'=>'employid');

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'First Name' => 'firstname',
                'Assigned To' => 'assigned_user_id',
        );
        var $list_fields_name = Array (
                /* Format: Field Label => fieldname */
                'First Name' => 'firstname',
                'Assigned To' => 'assigned_user_id',
        );

        // Make the field link to detail view
       // var $list_link_field = 'exampleamount';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'First Name' => Array('firstname'),
                'Assigned To' => Array('vtiger_crmentity','assigned_user_id'),
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
                'First Name' => 'firstname',
                'Assigned To' => 'assigned_user_id',
        );

        // For Popup window record selection
        var $popup_fields = Array ('firstname','lastname','assigned_user_id','date_of_birth','address','city');

        // For Alphabetical search
        var $def_basicsearch_col = 'lastname';

        // Column value to use on detail view record text display
        var $def_detailview_recname = 'lastname';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('assigned_user_id');

        var $default_order_by = 'lastname';
        var $default_sort_order='ASC';

        var $related_module_table_index = array(
            'Emails' => array('table_name' => 'vtiger_seactivityrel', 'table_index' => 'crmid', 'rel_index' => 'activityid')
        );

    function vtlib_handler($modulename, $event_type) {

        if($event_type == 'module.postinstall') {

            global $adb;
            $sql = "UPDATE vtiger_tab SET `presence` = 1 WHERE `name` = 'SettingHrm'";
            $adb->query($sql);
            self::hideSalaryTab();
			self::hideRelatedLeaveTab();

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

    function hideSalaryTab(){
        global $adb;
        $sql = "SELECT tabid FROM `vtiger_tab` WHERE name = 'Salary'";
        $rsTab = $adb->pquery($sql,array());
        $tabid = $adb->query_result($rsTab,0,'tabid');
        if($tabid){
            $adb->pquery("UPDATE vtiger_app2tab SET visible = 0 WHERE tabid = ?",array($tabid));
        }
    }
	
	function hideRelatedLeaveTab(){
        global $adb;
        $adb->pquery("UPDATE vtiger_relatedlists SET actions = '' WHERE label = 'Leave'",array());
    }

    function get_emails($id, $cur_tab_id, $rel_tab_id, $actions=false) {

        global $log, $singlepane_view,$currentModule,$current_user, $adb;
        $log->debug("Entering get_emails(".$id.") method ...");
        $this_module = $currentModule;

        $related_module = vtlib_getModuleNameById($rel_tab_id);
        require_once("modules/$related_module/$related_module.php");
        $other = new $related_module();
        vtlib_setup_modulevars($related_module, $other);
        $singular_modname = vtlib_toSingular($related_module);

        $parenttab = getParentTab();

        if($singlepane_view == 'true')
            $returnset = '&return_module='.$this_module.'&return_action=DetailView&return_id='.$id;
        else
            $returnset = '&return_module='.$this_module.'&return_action=CallRelatedList&return_id='.$id;

        $button = '';

        $button .= '<input type="hidden" name="email_directing_module"><input type="hidden" name="record">';

        if($actions) {
            if(is_string($actions)) $actions = explode(',', strtoupper($actions));
            if(in_array('ADD', $actions) && isPermitted($related_module,1, '') == 'yes') {
                $button .= "<input title='". getTranslatedString('LBL_ADD_NEW')." ". getTranslatedString($singular_modname)."' accessyKey='F' class='crmbutton small create' onclick='fnvshobj(this,\"sendmail_cont\");sendmail(\"$this_module\",$id);' type='button' name='button' value='". getTranslatedString('LBL_ADD_NEW')." ". getTranslatedString($singular_modname)."'></td>";
            }
        }

        $entityIds = $id;

        $userNameSql = getSqlForNameInDisplayFormat(array('first_name'=>'vtiger_users.first_name', 'last_name' => 'vtiger_users.last_name'), 'Users');

        $query = "SELECT case when (vtiger_users.user_name not like '') then $userNameSql else vtiger_groups.groupname end as user_name,
			vtiger_activity.activityid, vtiger_activity.subject, vtiger_activity.activitytype, vtiger_crmentity.modifiedtime,
			vtiger_crmentity.crmid, vtiger_crmentity.smownerid, vtiger_activity.date_start,vtiger_activity.time_start, vtiger_seactivityrel.crmid as parent_id
			FROM vtiger_activity, vtiger_seactivityrel, vtiger_hrm_employee, vtiger_users, vtiger_crmentity
			LEFT JOIN vtiger_groups ON vtiger_groups.groupid=vtiger_crmentity.smownerid
			WHERE vtiger_seactivityrel.activityid = vtiger_activity.activityid
				AND vtiger_seactivityrel.crmid IN (".$entityIds.")
				AND vtiger_users.id=vtiger_crmentity.smownerid
				AND vtiger_crmentity.crmid = vtiger_activity.activityid
				AND vtiger_activity.activitytype='Emails'
				AND vtiger_hrm_employee.employid = ".$id."
				AND vtiger_crmentity.deleted = 0";

        $return_value = GetRelatedList($this_module, $related_module, $other, $query, $button, $returnset);

        if($return_value == null) $return_value = Array();
        $return_value['CUSTOM_BUTTON'] = $button;

        $log->debug("Exiting get_emails method ...");
        return $return_value;
    }

    function setRelationTables($secmodule){
        $rel_tables =  array (
            "Emails" => array("vtiger_seactivityrel"=>array("crmid","activityid"),"vtiger_hrm_employee"=>"employid"),
        );
        return $rel_tables[$secmodule];
    }


    function get_related_list($id, $cur_tab_id, $rel_tab_id, $actions = false) {

        global $currentModule, $app_strings, $singlepane_view;

        $parenttab = getParentTab();

        $related_module = vtlib_getModuleNameById($rel_tab_id);

        $other = CRMEntity::getInstance($related_module);

        // Some standard module class doesn't have required variables
        // that are used in the query, they are defined in this generic API
        vtlib_setup_modulevars($currentModule, $this);
        vtlib_setup_modulevars($related_module, $other);

        $singular_modname = 'SINGLE_' . $related_module;

        $button = '';
        if ($actions) {
            if (is_string($actions))
                $actions = explode(',', strtoupper($actions));
            if (in_array('SELECT', $actions) && isPermitted($related_module, 4, '') == 'yes') {
                $button .= "<input title='" . getTranslatedString('LBL_SELECT') . " " . getTranslatedString($related_module) . "' class='crmbutton small edit' " .
                    " type='button' onclick=\"return window.open('index.php?module=$related_module&return_module=$currentModule&action=Popup&popuptype=detailview&select=enable&form=EditView&form_submit=false&recordid=$id&parenttab=$parenttab','test','width=640,height=602,resizable=0,scrollbars=0');\"" .
                    " value='" . getTranslatedString('LBL_SELECT') . " " . getTranslatedString($related_module, $related_module) . "'>&nbsp;";
            }
            if (in_array('ADD', $actions) && isPermitted($related_module, 1, '') == 'yes') {
                $button .= "<input type='hidden' name='createmode' id='createmode' value='link' />" .
                    "<input title='" . getTranslatedString('LBL_ADD_NEW') . " " . getTranslatedString($singular_modname) . "' class='crmbutton small create'" .
                    " onclick='this.form.action.value=\"EditView\";this.form.module.value=\"$related_module\"' type='submit' name='button'" .
                    " value='" . getTranslatedString('LBL_ADD_NEW') . " " . getTranslatedString($singular_modname, $related_module) . "'>&nbsp;";
            }
        }

        // To make the edit or del link actions to return back to same view.
        if ($singlepane_view == 'true')
            $returnset = "&return_module=$currentModule&return_action=DetailView&return_id=$id";
        else
            $returnset = "&return_module=$currentModule&return_action=CallRelatedList&return_id=$id";

        $query = "SELECT vtiger_crmentity.*, $other->table_name.*";

        $userNameSql = getSqlForNameInDisplayFormat(array('first_name'=>'vtiger_users.first_name',
            'last_name' => 'vtiger_users.last_name'), 'Users');
        $query .= ", CASE WHEN (vtiger_users.user_name NOT LIKE '') THEN $userNameSql ELSE vtiger_groups.groupname END AS user_name";

        $more_relation = '';
        if($related_module != 'Leave' && $related_module != 'Salary'){
            if (!empty($other->related_tables)) {
                foreach ($other->related_tables as $tname => $relmap) {
                    $query .= ", $tname.*";

                    // Setup the default JOIN conditions if not specified
                    if (empty($relmap[1]))
                        $relmap[1] = $other->table_name;
                    if (empty($relmap[2]))
                        $relmap[2] = $relmap[0];
                    $more_relation .= " LEFT JOIN $tname ON $tname.$relmap[0] = $relmap[1].$relmap[2]";
                }
            }
        }

        $query .= " FROM $other->table_name";
        $query .= " INNER JOIN vtiger_crmentity ON vtiger_crmentity.crmid = $other->table_name.$other->table_index";
        $query .= " INNER JOIN vtiger_crmentityrel ON (vtiger_crmentityrel.relcrmid = vtiger_crmentity.crmid OR vtiger_crmentityrel.crmid = vtiger_crmentity.crmid)";
        $query .= $more_relation;
        $query .= " LEFT  JOIN vtiger_users ON vtiger_users.id = vtiger_crmentity.smownerid";
        $query .= " LEFT  JOIN vtiger_groups ON vtiger_groups.groupid = vtiger_crmentity.smownerid";
        $query .= " WHERE vtiger_crmentity.deleted = 0 AND (vtiger_crmentityrel.crmid = $id OR vtiger_crmentityrel.relcrmid = $id)";
        if($related_module == 'Leads') {
            $query .= " AND vtiger_leaddetails.converted=0 ";
        }

        $return_value = GetRelatedList($currentModule, $related_module, $other, $query, $button, $returnset);

        if ($return_value == null)
            $return_value = Array();
        $return_value['CUSTOM_BUTTON'] = $button;

        return $return_value;
    }
	
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
                if($module != 'Employee'){
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
	
	function get_attachments($id, $cur_tab_id, $rel_tab_id, $actions = false) {

        global $currentModule, $app_strings, $singlepane_view,$adb;
        $this_module = $currentModule;
        $parenttab = getParentTab();

        $related_module = vtlib_getModuleNameById($rel_tab_id);
        $other = CRMEntity::getInstance($related_module);

        // Some standard module class doesn't have required variables
        // that are used in the query, they are defined in this generic API
        vtlib_setup_modulevars($related_module, $other);

        $singular_modname = vtlib_toSingular($related_module);
        $button = '';
        if ($actions) {
            if (is_string($actions))
                $actions = explode(',', strtoupper($actions));
            if (in_array('SELECT', $actions) && isPermitted($related_module, 4, '') == 'yes') {
                $button .= "<input title='" . getTranslatedString('LBL_SELECT') . " " . getTranslatedString($related_module) . "' class='crmbutton small edit' type='button' onclick=\"return window.open('index.php?module=$related_module&return_module=$currentModule&action=Popup&popuptype=detailview&select=enable&form=EditView&form_submit=false&recordid=$id&parenttab=$parenttab','test','width=640,height=602,resizable=0,scrollbars=0');\" value='" . getTranslatedString('LBL_SELECT') . " " . getTranslatedString($related_module) . "'>&nbsp;";
            }
            if (in_array('ADD', $actions) && isPermitted($related_module, 1, '') == 'yes') {
                $button .= "<input type='hidden' name='createmode' id='createmode' value='link' />" .
                    "<input title='" . getTranslatedString('LBL_ADD_NEW') . " " . getTranslatedString($singular_modname) . "' class='crmbutton small create'" .
                    " onclick='this.form.action.value=\"EditView\";this.form.module.value=\"$related_module\"' type='submit' name='button'" .
                    " value='" . getTranslatedString('LBL_ADD_NEW') . " " . getTranslatedString($singular_modname) . "'>&nbsp;";
            }
        }

        // To make the edit or del link actions to return back to same view.
        if ($singlepane_view == 'true')
            $returnset = "&return_module=$this_module&return_action=DetailView&return_id=$id";
        else
            $returnset = "&return_module=$this_module&return_action=CallRelatedList&return_id=$id";

        $userNameSql = getSqlForNameInDisplayFormat(array('first_name'=>'vtiger_users.first_name',
            'last_name' => 'vtiger_users.last_name'), 'Users');
        $query = "select case when (vtiger_users.user_name not like '') then $userNameSql else vtiger_groups.groupname end as user_name," .
            "'Documents' ActivityType,vtiger_attachments.type  FileType,crm2.modifiedtime lastmodified,vtiger_crmentity.modifiedtime,
				vtiger_seattachmentsrel.attachmentsid attachmentsid, vtiger_crmentity.smownerid smownerid, vtiger_notes.notesid crmid,
				vtiger_notes.notecontent description,vtiger_notes.*
				from vtiger_notes
				inner join vtiger_senotesrel on vtiger_senotesrel.notesid= vtiger_notes.notesid
				left join vtiger_notescf ON vtiger_notescf.notesid= vtiger_notes.notesid
				inner join vtiger_crmentity on vtiger_crmentity.crmid= vtiger_notes.notesid and vtiger_crmentity.deleted=0
				inner join vtiger_crmentity crm2 on crm2.crmid=vtiger_senotesrel.crmid
				LEFT JOIN vtiger_groups
				ON vtiger_groups.groupid = vtiger_crmentity.smownerid
				left join vtiger_seattachmentsrel  on vtiger_seattachmentsrel.crmid =vtiger_notes.notesid
				left join vtiger_attachments on vtiger_seattachmentsrel.attachmentsid = vtiger_attachments.attachmentsid
				left join vtiger_users on vtiger_crmentity.smownerid= vtiger_users.id
				where ";

        $sql = "SELECT candidate_id FROM vtiger_hrm_employee WHERE employid = ?";
        $rs = $adb->pquery($sql,array($id));
        $candidate_id = $adb->query_result($rs,0,'candidate_id');
        if($candidate_id){
            $query .= "( crm2.crmid=" . $id;
            $query .= " OR crm2.crmid=".$candidate_id." )";
        }else{
            $query .= "crm2.crmid=" . $id;
        }

        $return_value = GetRelatedList($this_module, $related_module, $other, $query, $button, $returnset);

        if ($return_value == null)
            $return_value = Array();
        $return_value['CUSTOM_BUTTON'] = $button;
        return $return_value;
    }

}