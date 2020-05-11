<?php /* Smarty version Smarty-3.1.7, created on 2020-05-05 10:50:11
         compiled from "E:\Software\XAMPP\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\Employee\partials\CalendarActivitiesContents.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14564195615eb144e3bee308-12029513%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5378861050ef024843e119bce05fe4019a6e76d8' => 
    array (
      0 => 'E:\\Software\\XAMPP\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Employee\\partials\\CalendarActivitiesContents.tpl',
      1 => 1587079614,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14564195615eb144e3bee308-12029513',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'ACTS' => 0,
    'ACTIVITIE' => 0,
    'ACTIVITY' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5eb144e3c0642',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5eb144e3c0642')) {function content_5eb144e3c0642($_smarty_tpl) {?>

<table class="table listview-table">
	<thead class="overflow-y">
		<tr class="size-row">
			<th class="floatThead-col"></th>
			<th class="floatThead-col">
				<b><?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Employee'||$_smarty_tpl->tpl_vars['ACTS']->value=='Candidates'){?>First Name<?php }elseif($_smarty_tpl->tpl_vars['ACTS']->value=='KPI'){?>KPI Name<?php }else{ ?>Employee Name<?php }?></b>
			</th>
			<th class="floatThead-col">
				<b><?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Employee'||$_smarty_tpl->tpl_vars['ACTS']->value=='Candidates'){?>Last Name<?php }elseif($_smarty_tpl->tpl_vars['ACTS']->value=='KPI'){?>KPI Status<?php }else{ ?>Leave Type<?php }?></b>
			</th>
			<th class="floatThead-col">
				<b><?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Employee'||$_smarty_tpl->tpl_vars['ACTS']->value=='Candidates'){?>Email<?php }elseif($_smarty_tpl->tpl_vars['ACTS']->value=='KPI'){?>Department<?php }else{ ?>Partials day<?php }?></b>
			</th>
			<th class="floatThead-col">
				<p class='pull-right'>Updated</p>
			</th>
		</tr>
	</thead>
	<?php  $_smarty_tpl->tpl_vars['ACTIVITY'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ACTIVITY']->_loop = false;
 $_smarty_tpl->tpl_vars['INDEX'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['ACTIVITIE']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ACTIVITY']->key => $_smarty_tpl->tpl_vars['ACTIVITY']->value){
$_smarty_tpl->tpl_vars['ACTIVITY']->_loop = true;
 $_smarty_tpl->tpl_vars['INDEX']->value = $_smarty_tpl->tpl_vars['ACTIVITY']->key;
?>

	<tbody class="overflow-y">
		<tr class="listViewEntries">
			<td class="listViewEntryValue" style="width: 50px !important;">
				<?php if ($_smarty_tpl->tpl_vars['ACTIVITY']->value->get('activitytype')=='Task'){?>
					<span><i class="entryIcon vicon-task"></i></span>
				<?php }else{ ?>
					<span><i class="entryIcon vicon-meeting"></i></span>
				<?php }?>
			</td>

			<td class="listViewEntryValue">
				<a href="<?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->getDetailViewUrl();?>
"><?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Employee'||$_smarty_tpl->tpl_vars['ACTS']->value=='Candidates'){?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('firstname');?>
<?php }elseif($_smarty_tpl->tpl_vars['ACTS']->value=='KPI'){?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('kpi_name');?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('employ_name');?>
<?php }?></a>
			</td>
			<td class="listViewEntryValue">
				<a href="<?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->getDetailViewUrl();?>
"><?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Employee'||$_smarty_tpl->tpl_vars['ACTS']->value=='Candidates'){?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('lastname');?>
<?php }elseif($_smarty_tpl->tpl_vars['ACTS']->value=='KPI'){?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('kpi_status');?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('hrm_leave_type');?>
<?php }?></a>
			</td>
			<td class="listViewEntryValue">
				<a href="<?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->getDetailViewUrl();?>
"><?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Employee'||$_smarty_tpl->tpl_vars['ACTS']->value=='Candidates'){?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('email');?>
<?php }elseif($_smarty_tpl->tpl_vars['ACTS']->value=='KPI'){?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('kpi_department');?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('partial_day');?>
<?php }?></a>
			</td>
			<td class="listViewEntryValue">
				<?php $_smarty_tpl->tpl_vars['START_DATE'] = new Smarty_variable(date('Y-m-d',strtotime($_smarty_tpl->tpl_vars['ACTIVITY']->value->get('modifiedtime'))), null, 0);?>
				<?php $_smarty_tpl->tpl_vars['START_TIME'] = new Smarty_variable(date('H:i:s',strtotime($_smarty_tpl->tpl_vars['ACTIVITY']->value->get('modifiedtime'))), null, 0);?>

				<?php $_smarty_tpl->tpl_vars['DUE_DATE'] = new Smarty_variable($_smarty_tpl->tpl_vars['ACTIVITY']->value->get('due_date'), null, 0);?>
				<?php $_smarty_tpl->tpl_vars['DUE_TIME'] = new Smarty_variable($_smarty_tpl->tpl_vars['ACTIVITY']->value->get('time_end'), null, 0);?>
				<p class='pull-right'><small title="<?php echo Vtiger_Util_Helper::formatDateTimeIntoDayString(($_smarty_tpl->tpl_vars['START_DATE']->value)." ".($_smarty_tpl->tpl_vars['START_TIME']->value));?>
 <?php echo vtranslate('LBL_TO');?>
 <?php echo Vtiger_Util_Helper::formatDateTimeIntoDayString(($_smarty_tpl->tpl_vars['DUE_DATE']->value)." ".($_smarty_tpl->tpl_vars['DUE_TIME']->value));?>
"><?php echo Vtiger_Util_Helper::formatDateDiffInStrings(($_smarty_tpl->tpl_vars['START_DATE']->value)." ".($_smarty_tpl->tpl_vars['START_TIME']->value));?>
</small></p>
			</td>
		</tr>
	</tbody>
	<?php } ?>

</table><?php }} ?>