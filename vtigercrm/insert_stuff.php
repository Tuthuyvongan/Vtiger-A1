<?php
include_once 'vtlib/Vtiger/Module.php';

$Vtiger_Utils_Log = true;

$moduleInstance =  Vtiger_Module::getInstance('Campaigns');

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

$fieldPTTT = new Vtiger_Field();
$fieldPTTT->name = 'phuongtientruyenthong';
$fieldPTTT->label = 'Phuong tien truyen thong';
$fieldPTTT->uitype = 15;
$fieldPTTT->table = 'vtiger_phuongtientruyenthong';
$fieldPTTT->column = 'phuongtientruyenthong';
$block->addField($fieldPTTT);