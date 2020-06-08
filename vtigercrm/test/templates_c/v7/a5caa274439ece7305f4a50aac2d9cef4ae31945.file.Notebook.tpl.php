<?php /* Smarty version Smarty-3.1.7, created on 2020-06-08 03:28:23
         compiled from "D:\Software Official\xampp\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\Vtiger\dashboards\Notebook.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19099149655eddb057445fe0-22781517%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a5caa274439ece7305f4a50aac2d9cef4ae31945' => 
    array (
      0 => 'D:\\Software Official\\xampp\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Vtiger\\dashboards\\Notebook.tpl',
      1 => 1587079614,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19099149655eddb057445fe0-22781517',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE_NAME' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5eddb05748096',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5eddb05748096')) {function content_5eddb05748096($_smarty_tpl) {?>
<div class="dashboardWidgetHeader">
	<?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("dashboards/WidgetHeader.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</div>

<div class="dashboardWidgetContent" style='padding:5px'>
	<?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("dashboards/NotebookContents.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</div>

<div class="widgeticons dashBoardWidgetFooter">
    <div class="footerIcons pull-right">
        <?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("dashboards/DashboardFooterIcons.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

    </div>
</div><?php }} ?>