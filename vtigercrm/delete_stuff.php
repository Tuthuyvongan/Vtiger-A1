<?php
include_once 'vtlib/Vtiger/Module.php';

$Vtiger_Utils_Log = true;

$moduleInstance =  Vtiger_Module::getInstance('Campaigns');
$ptttInstance = Vtiger_Module::getInstance('PhuongTienTruyenThong');
if($moduleInstance == NULL) 
{
    echo 'Failed to get Module instance\n';
    exit;
}

$block = Vtiger_Block::getInstance('LBL_CAMPAIGN_INFORMATION',$moduleInstance);

if($block == NULL) 
{
    echo 'Failed to get Block LBL_CAMPAIGN_INFORMATION instance';
    exit;
}

$field = Vtiger_Field::getInstance('phuongtientruyenthong',$moduleInstance);

if($field == NULL) 
{
    echo 'Failed to get field instance phuongtientruyenthong\n';
    exit;
}

if($ptttInstance == NULL)
{
    echo 'Failed to get module instance phuongtientruyenthong\n';
    exit;
}
//$moduleInstance->setRelatedList($ptttInstance,'PhuongTienTruyenThong',array('SELECT'));
$moduleInstance->unsetRelatedList($ptttInstance,'PhuongTienTruyenThong','get_related_list');
$field->delete();
echo 'Success\n';