<?php /* Smarty version Smarty-3.1.7, created on 2020-06-23 14:23:05
         compiled from "E:\Software\XAMPP\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\Potentials\dashboards\TotalRevenuePerSalesPerson.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8279227635ef21049025ef0-26241469%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fe806cce6b2ee74631b05b0495a9c79a2a958d93' => 
    array (
      0 => 'E:\\Software\\XAMPP\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Potentials\\dashboards\\TotalRevenuePerSalesPerson.tpl',
      1 => 1587079614,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8279227635ef21049025ef0-26241469',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE_NAME' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5ef2104906b5e',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ef2104906b5e')) {function content_5ef2104906b5e($_smarty_tpl) {?>
<script type="text/javascript">
	Vtiger_Pie_Widget_Js('Vtiger_TotalRevenuePerSalesPerson_Widget_Js',{},{});
</script>
<div class="dashboardWidgetHeader">
	<?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("dashboards/WidgetHeader.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('SETTING_EXIST'=>true), 0);?>

</div>
<div class="dashboardWidgetContent">
	<?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("dashboards/DashBoardWidgetContents.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

</div>
<div class="widgeticons dashBoardWidgetFooter">
    <div class="filterContainer">
        <div class="row">
            <div class="col-sm-12">
                <span class="col-lg-4">
                    <span>
                        <strong><?php echo vtranslate('Created Time',$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>
 &nbsp; <?php echo vtranslate('LBL_BETWEEN',$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>
</strong>
                    </span>
                </span>
                <div class="col-lg-7">
                    <div class="input-daterange input-group dateRange widgetFilter" id="datepicker" name="createdtime">
                        <input type="text" class="input-sm form-control" name="start" style="height:30px;"/>
                        <span class="input-group-addon">to</span>
                        <input type="text" class="input-sm form-control" name="end" style="height:30px;"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footerIcons pull-right">
        <?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("dashboards/DashboardFooterIcons.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('SETTING_EXIST'=>true), 0);?>

    </div>
</div><?php }} ?>