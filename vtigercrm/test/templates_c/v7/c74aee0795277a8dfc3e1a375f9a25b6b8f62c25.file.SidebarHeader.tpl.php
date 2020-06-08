<?php /* Smarty version Smarty-3.1.7, created on 2020-06-08 03:25:30
         compiled from "D:\Software Official\xampp\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\Reports\partials\SidebarHeader.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3904822995eddafaa68f428-09231929%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c74aee0795277a8dfc3e1a375f9a25b6b8f62c25' => 
    array (
      0 => 'D:\\Software Official\\xampp\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Reports\\partials\\SidebarHeader.tpl',
      1 => 1587079614,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3904822995eddafaa68f428-09231929',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'SELECTED_MENU_CATEGORY' => 0,
    'MODULE' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5eddafaa69906',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5eddafaa69906')) {function content_5eddafaa69906($_smarty_tpl) {?>

<?php $_smarty_tpl->tpl_vars['APP_IMAGE_MAP'] = new Smarty_variable(Vtiger_MenuStructure_Model::getAppIcons(), null, 0);?>

<div class="col-sm-12 col-xs-12 app-indicator-icon-container app-<?php echo $_smarty_tpl->tpl_vars['SELECTED_MENU_CATEGORY']->value;?>
">
    <div class="row" title="<?php echo strtoupper(vtranslate($_smarty_tpl->tpl_vars['MODULE']->value,$_smarty_tpl->tpl_vars['MODULE']->value));?>
">
        <span class="app-indicator-icon fa fa-bar-chart"></span>
    </div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ("modules/Vtiger/partials/SidebarAppMenu.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
<?php }} ?>