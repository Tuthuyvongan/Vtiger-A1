<?php /* Smarty version Smarty-3.1.7, created on 2020-05-03 16:41:35
         compiled from "E:\Software\XAMPP\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\Employee\Install.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19043156795eaef43f104784-99665188%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '307c60136a5064308b0d9a72936e34ceab7c4b61' => 
    array (
      0 => 'E:\\Software\\XAMPP\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Employee\\Install.tpl',
      1 => 1588499800,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19043156795eaef43f104784-99665188',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'MODULE' => 0,
    'LICENSE_KEY' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5eaef43f109ea',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5eaef43f109ea')) {function content_5eaef43f109ea($_smarty_tpl) {?>
&nbsp;<hr><div><form name="install" id="editLicense"  method="POST" action="index.php" class="form-horizontal"><input type="hidden" name="module" value="<?php echo $_smarty_tpl->tpl_vars['MODULE']->value;?>
"/><input type="hidden" name="view" value="Setting"/><input type="hidden" name="license_key_val" id="license_key_val" value="<?php echo $_smarty_tpl->tpl_vars['LICENSE_KEY']->value;?>
" /><div class="controls paddingTop20"><?php echo $_smarty_tpl->getSubTemplate (vtemplate_path('LicenseDetails.tpl','Employee'), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
</div></form></div><script language="javascript" type="text/javascript">jQuery(document).ready(function() {var action_bar = jQuery(".module-action-bar");action_bar.find('.pull-right').remove();jQuery("#appnav").css('display','none');jQuery(".employFilter").css('display','none');});</script><?php }} ?>