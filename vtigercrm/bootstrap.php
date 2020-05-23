<?php
include_once 'vtlib/Vtiger/Module.php';

$Vtiger_Utils_Log = true;

$MODULENAME='HinhThucTruyenThong';
$module_instance = Vtiger_Module::getInstance($MODULENAME);
if($module_instance || file_exists('modules/'.$MODULENAME))
{
	echo 'Module already present - choose a different name.';
}
else
{
	$moduleInstance = new Vtiger_Module();
	$moduleInstance->name = $MODULENAME;
	$moduleInstance->parent = 'Marketing';
	$moduleInstance->save();
	
	//Schema setup
	$moduleInstance->initTables();
	
	echo "Init tables....OK\n";
	
	//Field Setup
	$block = new Vtiger_Block();
    $block->label = 'LBL_'. strtoupper($moduleInstance->name) . '_INFORMATION';
	$moduleInstance->addBlock($block);
	echo "add block LBL_CUSTOMERENTERPRISE_INFORMATION .... OK\n";
	
	$blockcf = new Vtiger_Block();
    $blockcf->label = 'LBL_CUSTOM_INFORMATION';
    $moduleInstance->addBlock($blockcf);
	echo "add block LBL_CUSTOM_INFORMATION .... OK\n";
	
	//Customer information
	$field1 = new Vtiger_Field();
	$field1->name = 'httt';
	$field1->label = 'Hinh thuc truyen thong';
	$field1->uitype = 8;
	$field1->column = $field1->name;
	$field1->columntype = 'VARCHAR(255)';
	$field1->typeofdata = 'V~M';
	$block->addField($field1);
	
	$moduleInstance->setEntityIdentifier($field1);
	
	$field2 = new Vtiger_Field();
	$field2->name = 'motachitiet';
	$field2->label = 'Mo ta chi tiet';
	$field2->uitype = 21;
	$field2->column = $field2->name;
	$field2->typeofdata = 'V~O';
	$block->addField($field2);
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