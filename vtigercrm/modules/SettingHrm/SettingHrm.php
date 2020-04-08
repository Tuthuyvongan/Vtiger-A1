<?php

include_once 'modules/Vtiger/CRMEntity.php';

class SettingHrm extends Vtiger_CRMEntity {
        var $table_name = 'vtiger_hrm_setting';
        var $table_index= 'id';

        var $customFieldTable = Array('');

        var $tab_name = Array('vtiger_crmentity', 'vtiger_hrm_setting');

        var $tab_name_index = Array(
                'vtiger_crmentity' => 'crmid',
                'vtiger_hrm_setting' => 'id'
				);

        var $list_fields = Array (
                /* Format: Field Label => Array(tablename, columnname) */
                // tablename should not have prefix 'vtiger_'
                'Name' => Array('name'),
				'Description'=>Array('description')

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
				'Description'=>Array('description')
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
        var $mandatory_fields = Array('name');

        var $default_order_by = 'name';
        var $default_sort_order='ASC';
		
		function vtlib_handler($modulename, $event_type) {
		
			if($event_type == 'module.postinstall') {
                global $adb;
                $sql = "INSERT INTO vtiger_parenttab VALUES('9','HRM','9','0')";
                $adb->query($sql);

                self::copyHrmStyle();

                self::copyMenuFile();

                self::pushLanguage();

                self::createHRMWidget();
				
                self::CustomListViewSQL();

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


        static function copyHrmStyle(){

            $src = 'layouts/v7/modules/SettingHrm/hrm';
            $dst = 'layouts/v7/skins/hrm';

            if (!is_dir($dst)) mkdir($dst);

            if (is_dir($src)) $dir_handle = opendir($src);

            if (!$dir_handle) return false;

            while ($file = readdir($dir_handle)) {
                if ($file != "." && $file != "..") {
                    if ( is_dir($src . '/' . $file) ) {
                        recurse_copy($src . '/' . $file,$dst . '/' . $file);
                    }
                    else {
                        copy($src . '/' . $file,$dst . '/' . $file);
                    }
                }
            }
            closedir($dir_handle);
            return true;
        }

        static function copyMenuFile(){
			
            $file_data = file_get_contents('modules/Vtiger/models/MenuStructure.php');

            $file_data2 = str_replace("array('MARKETING','SALES','INVENTORY','SUPPORT','PROJECT','TOOLS')","array('MARKETING','SALES','INVENTORY','SUPPORT','PROJECT','TOOLS','HRM')",$file_data);

            @file_put_contents('modules/Vtiger/models/MenuStructure.php',$file_data2);

            $file_data_menu = file_get_contents('modules/Vtiger/models/MenuStructure.php');
            $file_data_menu2 = str_replace("'TOOLS'		=> 'fa-wrench'","'TOOLS'		=> 'fa-wrench','HRM'		=> 'fa-users'",$file_data_menu);
            @file_put_contents('modules/Vtiger/models/MenuStructure.php',$file_data_menu2);
        }


		static function pushLanguage(){
            $language_data = file_get_contents('languages/en_us/Vtiger.php');
            $language_data2 = str_replace("'LBL_NEW' => 'New',","'LBL_HRM' => 'HRM','LBL_NEW' => 'New',",$language_data);
            file_put_contents('languages/en_us/Vtiger.php',$language_data2);
        }
		
		static function CustomListViewSQL(){
			//Custom for Employee
			$sqlData = @file_get_contents('include/QueryGenerator/EnhancedQueryGenerator.php');
			$string_search = 'foreach ($tableJoinCondition as $fieldName => $conditionInfo) {';
			$string_to_replace = 'if($_REQUEST[\'module\']==\'Employee\' && $_REQUEST[\'view\']==\'List\'){
						$sql .= \' LEFT JOIN vtiger_users AS vtiger_user_id ON vtiger_user_id.id = vtiger_hrm_employee.user_id\';
					}
					foreach ($tableJoinCondition as $fieldName => $conditionInfo) {';
			if(strpos($sqlData,$string_search) !== false){
				$sqlData2 = str_replace($string_search,$string_to_replace,$sqlData);
				@file_put_contents('include/QueryGenerator/EnhancedQueryGenerator.php',$sqlData2);
			}

			//Custom for Leave
			$sqlLeaveData = @file_get_contents('include/QueryGenerator/EnhancedQueryGenerator.php');
			$string_search_custom = '$tableList[$field->getTableName()] = $field->getTableName();';
			$string_to_replace_custom = 'if($_REQUEST[\'src_module\']==\'Leave\'){
								$tableList[\'vtiger_users\'] = \'vtiger_users\';
								$tableJoinMapping[\'vtiger_users\'] = \'LEFT JOIN\';
							}
							
							$tableList[$field->getTableName()] = $field->getTableName();';
			if(strpos($sqlLeaveData,$string_search_custom) !== false){
				$sqlLeaveData2 = str_replace($string_search_custom,$string_to_replace_custom,$sqlLeaveData);
				@file_put_contents('include/QueryGenerator/EnhancedQueryGenerator.php',$sqlLeaveData2);
			}
		}

        static function createHRMWidget(){
            $menu_data = @file_get_contents('layouts/v7/modules/Vtiger/partials/SidebarAppMenu.tpl');
            $txt = "\n <script type=\"text/javascript\">
	jQuery(document).ready(function () {
		var app_menu = jQuery(\"#app-menu\");
		var hrm_menu = app_menu.find(\"#HRM_modules_dropdownMenu\");
        hrm_menu.attr('data-default-url','index.php?module=Employee&view=Index&app=HRM');
    });
</script>";
            if(strpos($menu_data,$txt) === false){
                $myfile = @file_put_contents('layouts/v7/modules/Vtiger/partials/SidebarAppMenu.tpl', $txt.PHP_EOL , FILE_APPEND | LOCK_EX);
            }
        }
		
}