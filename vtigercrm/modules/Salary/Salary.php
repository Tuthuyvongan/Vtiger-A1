<?php

include_once 'modules/Vtiger/CRMEntity.php';

class Salary extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_salaryreference';
        var $table_index= 'id';

        var $customFieldTable = Array('');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_salaryreference');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_salaryreference' => 'id'
				);

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Employee' => Array('employ_id'),
                'Current Salary' => Array('current_salary'),
                'Increase Date Before' => Array('before_increase_date'),
                'After Increase Salary' => Array('salary_after'),
                'Reviewer' => Array('reviewer'),
                'HR Action' => Array('hr_salary_action'),
				'Assigned To'=>Array('assigned_user_id')

        );
        var $list_fields_name = Array (
                /* Format: Field Label => fieldname */
                'Employee' => 'employ_id',
            'Current Salary' => 'current_salary',
            'Increase Date Before' => 'before_increase_date',
            'After Increase Salary' => 'salary_after',
            'Reviewer' => 'reviewer',
            'HR Action' => 'hr_salary_action',
                'Assigned To' => 'assigned_user_id',
        );

        // Make the field link to detail view
       // var $list_link_field = 'exampleamount';

        // For Popup listview and UI type support
        var $search_fields = Array(
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
            'Employee' => Array('employ_id'),
            'Current Salary' => Array('current_salary'),
            'Increase Date Before' => Array('before_increase_date'),
            'After Increase Salary' => Array('salary_after'),
            'Reviewer' => Array('reviewer'),
            'HR Action' => Array('hr_salary_action'),
            'Assigned To'=>Array('assigned_user_id')
        );
        var $search_fields_name = Array (
                /* Format: Field Label => fieldname */
            'Employee' => 'employ_id',
            'Current Salary' => 'current_salary',
            'Increase Date Before' => 'before_increase_date',
            'After Increase Salary' => 'salary_after',
            'Reviewer' => 'reviewer',
            'HR Action' => 'hr_salary_action',
            'Assigned To' => 'assigned_user_id',
        );

        // For Popup window record selection
        var $popup_fields = Array ('employ_id','current_salary','before_increase_date','salary_after','reviewer','hr_salary_action','assigned_user_id');

        // For Alphabetical search
        var $def_basicsearch_col = '';

        // Column value to use on detail view record text display
        var $def_detailview_recname = '';

        // Used when enabling/disabling the mandatory fields for the module.
        // Refers to vtiger_field.fieldname values.
        var $mandatory_fields = Array('');

        var $default_order_by = '';
        var $default_sort_order='ASC';


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
}