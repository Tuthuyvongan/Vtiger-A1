<?php /* Smarty version Smarty-3.1.7, created on 2020-05-05 10:50:11
         compiled from "E:\Software\XAMPP\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\Employee\Index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14498822115eb144e3bbafb2-78528633%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '71c41fa05a2f1f58b655adefee06d6e90004c4b7' => 
    array (
      0 => 'E:\\Software\\XAMPP\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Employee\\Index.tpl',
      1 => 1587079614,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14498822115eb144e3bbafb2-78528633',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'HRM_MENUS' => 0,
    'HRM_MENU' => 0,
    'SHOW_MODULES' => 0,
    'ACTIVITIES' => 0,
    'ACTS' => 0,
    'MODULE_NAME' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5eb144e3be2a3',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5eb144e3be2a3')) {function content_5eb144e3be2a3($_smarty_tpl) {?>




<div id="hrm_ql">
    <span id="ql_label"><b><h5>Quick Launch</h5></b></span><br/>
    <div class="quick_menu">
    <?php  $_smarty_tpl->tpl_vars['HRM_MENU'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['HRM_MENU']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['HRM_MENUS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['HRM_MENU']->key => $_smarty_tpl->tpl_vars['HRM_MENU']->value){
$_smarty_tpl->tpl_vars['HRM_MENU']->_loop = true;
?>
        <?php if (!in_array($_smarty_tpl->tpl_vars['HRM_MENU']->value,$_smarty_tpl->tpl_vars['SHOW_MODULES']->value)){?><?php continue 1?><?php }?>
    <a href="index.php?module=<?php echo $_smarty_tpl->tpl_vars['HRM_MENU']->value;?>
&view=List&app=TOOLS"><div id="employ_btn" class="btn addButton btn-default module-buttons"><?php echo $_smarty_tpl->tpl_vars['HRM_MENU']->value;?>
</div></a>
    <?php } ?>
    
    </div>
</div>
<div id="hrm_widget" class="dashBoardTabContainer">
    <div class="dashBoardTabContents clearfix">
        <div class="gridster_75 ready">
            <ul>
                <?php  $_smarty_tpl->tpl_vars['ACTIVITIE'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ACTIVITIE']->_loop = false;
 $_smarty_tpl->tpl_vars['ACTS'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['ACTIVITIES']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ACTIVITIE']->key => $_smarty_tpl->tpl_vars['ACTIVITIE']->value){
$_smarty_tpl->tpl_vars['ACTIVITIE']->_loop = true;
 $_smarty_tpl->tpl_vars['ACTS']->value = $_smarty_tpl->tpl_vars['ACTIVITIE']->key;
?>
                    <li class="dashboardWidget"
                        <?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Employee'){?><?php }?>
                        <?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='KPI'){?><?php }?>
                        <?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Candidates'){?><?php }?>
                        <?php if ($_smarty_tpl->tpl_vars['ACTS']->value=='Leave'){?><?php }?>>
                        <div class="dashboardWidgetHeader clearfix">
                            <div class="title">
                                <div class="dashboardTitle" title="Overdue Activities"><b><?php echo $_smarty_tpl->tpl_vars['ACTS']->value;?>
</b></div>
                            </div>
                        </div>
                        <?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("partials/CalendarActivitiesContents.tpl",$_smarty_tpl->tpl_vars['MODULE_NAME']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>



<style>

.module-action-content{
	display: none;
}
       
#hrm_ql{
  border: 1px solid #ccc;
  margin: 30px 15px 0 40px;
}
#hrm_ql .quick_menu{
  padding: 0 15px 15px;
}

#ql_label{
        margin-left: 20px;
        text-align: center;
        display: block;
        width: 125px;
        height: 30px;
        margin-top: -20px;
        position: absolute;
        background: white;
}

#hrm_widget{
  width:100%;
  margin-top: 30px
}
#hrm_widget ul{
  display: block;
  overflow: hidden;
  padding-right: 15px;
}
#hrm_widget .dashboardWidget{
	border: 1px solid #ccc;
  width: 49%;
  position: unset;
  float: left;
  margin-left: 1%;
  margin-bottom: 30px;
}

#hrm_widget .dashboardWidgetHeader
{
	background: #eee;
	padding: 10px;
	border-bottom:1px solid #ddd;
	margin-bottom:5px;
}

#hrm_widget .dashBoardWidgetFooter{
  position: unset;
}
#hrm_widget li:nth-child(2n+1) {
  margin-left: 0;
  margin-right: 1%;
}
@media only screen and (max-width: 1023px) {
  #hrm_widget .dashboardWidget{
    width: 100%;
    margin-bottom:30px;
    margin-left: 0;
    overflow-x: scroll;
    overflow-y: scroll;
  }
  #hrm_widget li:nth-child(2n+1) {
    margin-bottom: 30px;
  }
}

</style>

<?php }} ?>