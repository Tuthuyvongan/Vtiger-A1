<?php /* Smarty version Smarty-3.1.7, created on 2020-05-21 17:21:48
         compiled from "E:\Software\XAMPP\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\Settings\Vtiger\ConfigEditorDetail.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3179554205ec6b8ac4866c3-63261652%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8cb572f1ebce366410ee19398845cf1a1bb87a89' => 
    array (
      0 => 'E:\\Software\\XAMPP\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Settings\\Vtiger\\ConfigEditorDetail.tpl',
      1 => 1587079614,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3179554205ec6b8ac4866c3-63261652',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'CURRENT_USER_MODEL' => 0,
    'QUALIFIED_MODULE' => 0,
    'MODEL' => 0,
    'FIELD_NAME' => 0,
    'FIELD_DATA' => 0,
    'FIELD_DETAILS' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5ec6b8ac54733',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ec6b8ac54733')) {function content_5ec6b8ac54733($_smarty_tpl) {?>



<div  class="detailViewContainer" id="ConfigEditorDetails"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 "><?php $_smarty_tpl->tpl_vars['WIDTHTYPE'] = new Smarty_variable($_smarty_tpl->tpl_vars['CURRENT_USER_MODEL']->value->get('rowheight'), null, 0);?><div class="contents "><div class="clearfix"><h4 class="pull-left"><?php echo vtranslate('LBL_CONFIG_EDITOR',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</h4><div class="btn-group pull-right"><button class="btn btn-default editButton" data-url='<?php echo $_smarty_tpl->tpl_vars['MODEL']->value->getEditViewUrl();?>
' type="button" title="<?php echo vtranslate('LBL_EDIT',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"><?php echo vtranslate('LBL_EDIT',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</button></div></div><hr><br><div class="detailViewInfo"><?php $_smarty_tpl->tpl_vars['FIELD_DATA'] = new Smarty_variable($_smarty_tpl->tpl_vars['MODEL']->value->getViewableData(), null, 0);?><?php  $_smarty_tpl->tpl_vars['FIELD_DETAILS'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['FIELD_DETAILS']->_loop = false;
 $_smarty_tpl->tpl_vars['FIELD_NAME'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['MODEL']->value->getEditableFields(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['FIELD_DETAILS']->key => $_smarty_tpl->tpl_vars['FIELD_DETAILS']->value){
$_smarty_tpl->tpl_vars['FIELD_DETAILS']->_loop = true;
 $_smarty_tpl->tpl_vars['FIELD_NAME']->value = $_smarty_tpl->tpl_vars['FIELD_DETAILS']->key;
?><div class="row form-group"><div class="col-lg-4 col-md-4 col-sm-4 fieldLabel"><label><?php if ($_smarty_tpl->tpl_vars['FIELD_NAME']->value=='upload_maxsize'){?><?php if ($_smarty_tpl->tpl_vars['FIELD_DATA']->value[$_smarty_tpl->tpl_vars['FIELD_NAME']->value]>5){?><?php echo vtranslate($_smarty_tpl->tpl_vars['FIELD_DETAILS']->value['label'],$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value,$_smarty_tpl->tpl_vars['FIELD_DATA']->value[$_smarty_tpl->tpl_vars['FIELD_NAME']->value]);?>
<?php }else{ ?><?php echo vtranslate($_smarty_tpl->tpl_vars['FIELD_DETAILS']->value['label'],$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value,5);?>
<?php }?><?php }else{ ?><?php echo vtranslate($_smarty_tpl->tpl_vars['FIELD_DETAILS']->value['label'],$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?></label></div><div  class="col-lg-8 col-md-8 col-sm-8 fieldValue break-word"><div><?php if ($_smarty_tpl->tpl_vars['FIELD_NAME']->value=='default_module'){?><?php echo vtranslate($_smarty_tpl->tpl_vars['FIELD_DATA']->value[$_smarty_tpl->tpl_vars['FIELD_NAME']->value],$_smarty_tpl->tpl_vars['FIELD_DATA']->value[$_smarty_tpl->tpl_vars['FIELD_NAME']->value]);?>
<?php }elseif($_smarty_tpl->tpl_vars['FIELD_DETAILS']->value['fieldType']=='checkbox'){?><?php echo vtranslate($_smarty_tpl->tpl_vars['FIELD_DATA']->value[$_smarty_tpl->tpl_vars['FIELD_NAME']->value],$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php if ($_smarty_tpl->tpl_vars['FIELD_NAME']->value=='email_tracking'){?><div class="input-info-addon"><a class="fa fa-question-circle" data-toggle="tooltip" data-placement="right" title="<?php echo vtranslate('LBL_PERSONAL_EMAIL_TRACKING_INFO',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"></a></div><?php }?><?php }elseif($_smarty_tpl->tpl_vars['FIELD_NAME']->value=='default_reply_to'){?><?php echo vtranslate($_smarty_tpl->tpl_vars['FIELD_DATA']->value[$_smarty_tpl->tpl_vars['FIELD_NAME']->value]);?>
<div class="input-info-addon"><a class="fa fa-info-circle" data-toggle="tooltip" data-placement="right" title="<?php echo vtranslate('LBL_DEFAULT_REPLY_TO_INFO',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
"></a></div><?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['FIELD_DATA']->value[$_smarty_tpl->tpl_vars['FIELD_NAME']->value];?>
<?php }?><?php if ($_smarty_tpl->tpl_vars['FIELD_NAME']->value=='upload_maxsize'){?>&nbsp;<?php echo vtranslate('LBL_MB',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
<?php }?></div></div></div><?php } ?></div></div></div></div>
<?php }} ?>