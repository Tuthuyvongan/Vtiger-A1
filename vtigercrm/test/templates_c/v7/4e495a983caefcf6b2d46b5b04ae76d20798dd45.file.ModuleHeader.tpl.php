<?php /* Smarty version Smarty-3.1.7, created on 2020-05-16 14:04:22
         compiled from "E:\Software\XAMPP\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\RecycleBin\ModuleHeader.tpl" */ ?>
<?php /*%%SmartyHeaderCode:517828465ebff2e6b00822-83540350%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4e495a983caefcf6b2d46b5b04ae76d20798dd45' => 
    array (
      0 => 'E:\\Software\\XAMPP\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\RecycleBin\\ModuleHeader.tpl',
      1 => 1587079614,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '517828465ebff2e6b00822-83540350',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE' => 0,
    'VIEW' => 0,
    'SOURCE_MODULE' => 0,
    'FIELDS_INFO' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5ebff2e6b2f85',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ebff2e6b2f85')) {function content_5ebff2e6b2f85($_smarty_tpl) {?>

<div class="col-sm-12 col-xs-12 module-action-bar clearfix coloredBorderTop"><div class="module-action-content clearfix"><span class="col-lg-7 col-md-7 module-breadcrumb module-breadcrumb-<?php echo $_REQUEST['view'];?>
"><span><h4 title="<?php echo vtranslate($_smarty_tpl->tpl_vars['MODULE']->value,$_smarty_tpl->tpl_vars['MODULE']->value);?>
" class="module-title pull-left text-uppercase">&nbsp;<?php echo vtranslate($_smarty_tpl->tpl_vars['MODULE']->value,$_smarty_tpl->tpl_vars['MODULE']->value);?>
&nbsp;</h4></span><span><p class="current-filter-name pull-left"><span class="fa fa-angle-right" aria-hidden="true"></span>&nbsp;<?php echo $_smarty_tpl->tpl_vars['VIEW']->value;?>
&nbsp;</p></span><span><p class="current-filter-name pull-left textOverflowEllipsis" style="width:250px;"><span class="fa fa-angle-right" aria-hidden="true"></span>&nbsp;<?php echo vtranslate($_smarty_tpl->tpl_vars['SOURCE_MODULE']->value,$_smarty_tpl->tpl_vars['SOURCE_MODULE']->value);?>
&nbsp;</p></span></span></div><?php if ($_smarty_tpl->tpl_vars['FIELDS_INFO']->value!=null){?><script type="text/javascript">var uimeta = (function () {var fieldInfo = <?php echo $_smarty_tpl->tpl_vars['FIELDS_INFO']->value;?>
;return {field: {get: function (name, property) {if (name && property === undefined) {return fieldInfo[name];}if (name && property) {return fieldInfo[name][property]}},isMandatory: function (name) {if (fieldInfo[name]) {return fieldInfo[name].mandatory;}return false;},getType: function (name) {if (fieldInfo[name]) {return fieldInfo[name].type}return false;}}};})();</script><?php }?></div><?php }} ?>