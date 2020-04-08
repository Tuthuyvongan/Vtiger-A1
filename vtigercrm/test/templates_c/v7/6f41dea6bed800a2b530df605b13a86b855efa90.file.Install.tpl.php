<?php /* Smarty version Smarty-3.1.7, created on 2020-04-08 13:37:11
         compiled from "C:\xampp\htdocs\vtigercrm\includes\runtime/../../layouts/v7\modules\Employee\Install.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16584251875e8dd3872b9258-30310791%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6f41dea6bed800a2b530df605b13a86b855efa90' => 
    array (
      0 => 'C:\\xampp\\htdocs\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Employee\\Install.tpl',
      1 => 1586352613,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16584251875e8dd3872b9258-30310791',
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
  'unifunc' => 'content_5e8dd3872eacc',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5e8dd3872eacc')) {function content_5e8dd3872eacc($_smarty_tpl) {?>
&nbsp;<hr><div><form name="install" id="editLicense"  method="POST" action="index.php" class="form-horizontal"><input type="hidden" name="module" value="<?php echo $_smarty_tpl->tpl_vars['MODULE']->value;?>
"/><input type="hidden" name="view" value="Setting"/><input type="hidden" name="license_key_val" id="license_key_val" value="<?php echo $_smarty_tpl->tpl_vars['LICENSE_KEY']->value;?>
" /><div class="controls paddingTop20"><?php echo $_smarty_tpl->getSubTemplate (vtemplate_path('LicenseDetails.tpl','Employee'), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
</div></form></div><script language="javascript" type="text/javascript">jQuery(document).ready(function() {var action_bar = jQuery(".module-action-bar");action_bar.find('.pull-right').remove();jQuery("#appnav").css('display','none');jQuery(".employFilter").css('display','none');});</script><?php }} ?>