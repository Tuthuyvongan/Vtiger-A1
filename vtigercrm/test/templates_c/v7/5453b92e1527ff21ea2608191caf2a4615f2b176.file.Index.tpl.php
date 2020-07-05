<?php /* Smarty version Smarty-3.1.7, created on 2020-07-05 16:19:48
         compiled from "E:\Software\XAMPP\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\ChatRoom\Index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7415271285f006e1ae0f0a9-62736537%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5453b92e1527ff21ea2608191caf2a4615f2b176' => 
    array (
      0 => 'E:\\Software\\XAMPP\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\ChatRoom\\Index.tpl',
      1 => 1593965985,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7415271285f006e1ae0f0a9-62736537',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5f006e1ae27ea',
  'variables' => 
  array (
    'MODULE' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5f006e1ae27ea')) {function content_5f006e1ae27ea($_smarty_tpl) {?>


	
<div class="main-container main-container-ChatRoom" id="main-container-ChatRoom"><div id="modnavigator" class="module-nav"><div class="hidden-xs hidden-sm mod-switcher-container"><?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("partials/Menubar.tpl",$_smarty_tpl->tpl_vars['MODULE']->value), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
</div></div><div class="listViewPageDiv content-area full-width " id="listViewContent"><div class="table-responsive"><h4 align="center">Online User</h4><div id="user_details"></div><div id="user_model_details"></div></div></div></div>
<?php }} ?>