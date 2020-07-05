<?php
include_once 'vtlib/Vtiger/Module.php';

$Vtiger_Utils_Log = true;

$MODULENAME='Chat';
$module_instance = Vtiger_Module::getInstance($MODULENAME);
if($module_instance || file_exists('modules/'.$MODULENAME))
{
	echo 'Module already present - choose a different name.';
}
else
{
	$moduleInstance = new Vtiger_Module();
	$moduleInstance->name = $MODULENAME;
	$moduleInstance->parent = 'Tools';
	$moduleInstance->save();
	
	//Schema setup
	$moduleInstance->initTables();
	
	echo "Init tables....OK\n";
	
	//Field Setup
	$block = new Vtiger_Block();
    $block->label = 'LBL_'. strtoupper($moduleInstance->name) . '_INFORMATION';
	$moduleInstance->addBlock($block);
	echo "add block LBL_CHAT_INFORMATION .... OK\n";
	
	$blockcf = new Vtiger_Block();
    $blockcf->label = 'LBL_CUSTOM_INFORMATION';
    $moduleInstance->addBlock($blockcf);
	echo "add block LBL_CUSTOM_INFORMATION .... OK\n";
	
	//Customer information
	$field1 = new Vtiger_Field();
	$field1->name = 'message_id';
	$field1->label = 'Message ID';
	$field1->uitype = 1;
	$field1->column = $field1->name;
	$field1->columntype = 'VARCHAR(255)';
	$field1->typeofdata = 'V~M';
	$block->addField($field1);
	
	$moduleInstance->setEntityIdentifier($field1);
	
	echo "add message_id field .... OK\n";
	
	$field2 = new Vtiger_Field();
	$field2->name = 'to_user_id';
	$field2->label = 'To User ID';
	$field2->uitype = 7;
	$field2->column = $field2->name;
	$field2->columntype = 'INT(11)';
	$field2->typeofdata = 'I~M';
	$block->addField($field2);
	
	echo "add to_user_id field .... OK\n";
	
	$field3 = new Vtiger_Field();
	$field3->name = 'from_user_id';
	$field3->label = 'From User ID';
	$field3->uitype = 7;
	$field3->column = $field3->name;
	$field3->columntype = 'INT(11)';
	$field3->typeofdata = 'I~M';
	$block->addField($field3);
	
	echo "add from_user_id field .... OK\n";
	
	$field4 = new Vtiger_Field();
	$field4->name = 'chat_message';
	$field4->label = 'Chat Message';
	$field4->uitype = 21;
	$field4->column = $field4->name;
	$field4->columntype = 'TEXT';
	$field4->typeofdata = 'V~M';
	$block->addField($field4);
	
	echo "add chat_message field .... OK\n";
	
	$field5 = new Vtiger_Field();
	$field5->name = 'chat_timestamp';
	$field5->label = 'Timestamp';
	$field5->uitype = 5;
	$field5->column = 'TIMESTAMP';
	$field5->typeofdata = 'D~M';
	$field5->defaultvalue = 'current_timestamp()';
	$block->addField($field5);
	
	echo "add chat_timestamp field .... OK\n";
	
	$field6 = new Vtiger_Field();
	$field6->name = 'status';
	$field6->label = 'Status';
	$field6->uitype = 7;
	$field6->column = $field6->name;
	$field6->columntype = 'INT(1)';
	$field6->typeofdata = 'I~M';
	$block->addField($field6);
	
	echo "add status field .... OK\n";
	// Recommended common fields every Entity module should have (linked to core table)

        $mfield2 = new Vtiger_Field();
        $mfield2->name = 'createdtime';
        $mfield2->label= 'Created Time';
        $mfield2->table = 'vtiger_crmentity';
        $mfield2->column = 'createdtime';
        $mfield2->uitype = 70;
        $mfield2->typeofdata = 'DT~O';
        $mfield2->displaytype= 2;
        $block->addField($mfield2);

        $mfield3 = new Vtiger_Field();
        $mfield3->name = 'modifiedtime';
        $mfield3->label= 'Modified Time';
        $mfield3->table = 'vtiger_crmentity';
        $mfield3->column = 'modifiedtime';
        $mfield3->uitype = 70;
        $mfield3->typeofdata = 'DT~O';
        $mfield3->displaytype= 2;
        $block->addField($mfield3);

        /* NOTE: Vtiger 7.1.0 onwards */
        $mfield4 = new Vtiger_Field();
        $mfield4->name = 'source';
        $mfield4->label = 'Source';
        $mfield4->table = 'vtiger_crmentity';
        $mfield4->displaytype = 2; // to disable field in Edit View
        $mfield4->quickcreate = 3;
        $mfield4->masseditable = 0;
        $block->addField($mfield4);

        $mfield5 = new Vtiger_Field();
        $mfield5->name = 'starred';
        $mfield5->label = 'starred';
        $mfield5->table = 'vtiger_crmentity_user_field';
        $mfield5->displaytype = 6;
        $mfield5->uitype = 56;
        $mfield5->typeofdata = 'C~O';
        $mfield5->quickcreate = 3;
        $mfield5->masseditable = 0;
        $block->addField($mfield5);

        $mfield6 = new Vtiger_Field();
        $mfield6->name = 'tags';
        $mfield6->label = 'tags';
        $mfield6->displaytype = 6;
        $mfield6->columntype = 'VARCHAR(1)';
        $mfield6->quickcreate = 3;
        $mfield6->masseditable = 0;
        $block->addField($mfield6);
        /* End 7.1.0 */
		
	//Filter setup
	$filter1 = new Vtiger_Filter();
	$filter1->name = 'All';
	$filter1->isdefault = true;
	$moduleInstance->addFilter($filter1);
	$filter1->addField($field1);
	
	//Sharing access setup
	$moduleInstance->setDefaultSharing();
	
	//Web service setup
	$moduleInstance->initWebservice();
	
	mkdir('modules/'.$MODULENAME);
	echo "OK\n";
}
?>