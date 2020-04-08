<?php /* Smarty version Smarty-3.1.7, created on 2020-04-08 13:37:11
         compiled from "C:\xampp\htdocs\vtigercrm\includes\runtime/../../layouts/v7\modules\Employee\LicenseDetails.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1884852185e8dd387303802-79633167%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a05754228b246638184aa79708d3231b19b90b2e' => 
    array (
      0 => 'C:\\xampp\\htdocs\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Employee\\LicenseDetails.tpl',
      1 => 1586352613,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1884852185e8dd387303802-79633167',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'QUALIFIED_MODULE' => 0,
    'COMPANY_DETAILS' => 0,
    'COMPANY_SITE' => 0,
    'LICENSE' => 0,
    'LICENSE_KEY' => 0,
    'VERSION_TYPE' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5e8dd38731c38',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5e8dd38731c38')) {function content_5e8dd38731c38($_smarty_tpl) {?>
<table class="table table-bordered table-condensed themeTableColor"><thead><tr class="blockHeader"><th class="mediumWidthType"><span class="alignMiddle"><?php echo vtranslate('LBL_COMPANY_LICENSE_INFO',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</span></th><th class="mediumWidthType" style="border-left: none; text-align: right;"></th></tr></thead><tbody><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('organizationname','Settings:Vtiger');?>
:</label></td><td style="border-left: none;"><div class="pull-left" id="organizationname_label"><?php echo $_smarty_tpl->tpl_vars['COMPANY_DETAILS']->value->get("organizationname");?>
</div></td></tr><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('address','Settings:Vtiger');?>
:</label></td><td style="border-left: none;"><div class="pull-left" id="address_label"><?php echo $_smarty_tpl->tpl_vars['COMPANY_DETAILS']->value->get("address");?>
</div></td></tr><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('city','Settings:Vtiger');?>
:</label></td><td style="border-left: none;"><div class="pull-left" id="city_label"><?php echo $_smarty_tpl->tpl_vars['COMPANY_DETAILS']->value->get("city");?>
</div></td></tr><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('state','Settings:Vtiger');?>
:</label></td><td style="border-left: none;"><div class="pull-left" id="state_label"><?php echo $_smarty_tpl->tpl_vars['COMPANY_DETAILS']->value->get("state");?>
</div></td></tr><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('country','Settings:Vtiger');?>
:</label></td><td style="border-left: none;"><div class="pull-left" id="country_label"><?php echo $_smarty_tpl->tpl_vars['COMPANY_DETAILS']->value->get("country");?>
</div></td></tr><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('code','Settings:Vtiger');?>
:</label></td><td style="border-left: none;"><div class="pull-left" id="code_label"><?php echo $_smarty_tpl->tpl_vars['COMPANY_DETAILS']->value->get("code");?>
</div></td></tr><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('vatid','Settings:Vtiger');?>
:</label></td><td style="border-left: none;"><div class="pull-left" id="vatid_label"><?php echo $_smarty_tpl->tpl_vars['COMPANY_DETAILS']->value->get("vatid");?>
</div></td></tr></tbody></table><br><table class="table table-bordered table-condensed themeTableColor" style="border-bottom: none;"><thead><tr class="blockHeader"><th colspan="2" class="mediumWidthType"><span class="alignMiddle"><?php echo vtranslate('LBL_LICENSE',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</span></th></tr></thead><tbody><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('LBL_URL',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
:</label></td><td style="border-left: none;"><div class="pull-left" id="vatid_label"><?php echo $_smarty_tpl->tpl_vars['COMPANY_SITE']->value;?>
</div></td></tr><tr><td width="25%"><label  class="muted pull-right marginRight10px"><?php echo vtranslate('LBL_LICENSE_KEY',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
:</label></td><td style="border-left: none;"><?php if (count($_smarty_tpl->tpl_vars['LICENSE']->value)>0){?><div class="pull-left" id="license_key_label"><?php echo $_smarty_tpl->tpl_vars['LICENSE_KEY']->value;?>
</div><input type="text" name="licensekey" id="licensekey" value="<?php echo $_smarty_tpl->tpl_vars['LICENSE_KEY']->value;?>
" data-validation-engine="validate[required]" style="display: none;width: 300px;"></br><div id="divgroup2" class="pull-left paddingLeft10px" <?php if ($_smarty_tpl->tpl_vars['VERSION_TYPE']->value!="free"&&$_smarty_tpl->tpl_vars['VERSION_TYPE']->value!="pro"){?>style="display:none"<?php }?>><button id="hrm_reactivate_license_btn"  class="btn btn-success" title="<?php echo vtranslate('LBL_REACTIVATE_DESC',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
" type="button"><?php echo vtranslate('LBL_REACTIVATE',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</button><?php if ($_smarty_tpl->tpl_vars['VERSION_TYPE']->value=="pro"){?><button id="hrm_deactivate_license_btn" type="button" class="btn btn-danger marginLeftZero"><?php echo vtranslate('LBL_DEACTIVATE',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</button><?php }?></div><?php }else{ ?><input type="text" class="input-large" id="licensekey" name="licensekey" data-validation-engine="validate[required]"/>&nbsp;<button type="button" id="hrm_active_button" class="btn btn-success"/><strong><?php echo vtranslate('LBL_VALIDATE',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</strong></button>&nbsp;&nbsp;<button type="button" id="hrm_order_button" class="btn btn-info" onclick="window.location.href='https://cmsmart.net/vtiger-crm/human-resource-management-hrm-for-vtiger-crm'"/><?php echo vtranslate('LBL_ORDER_NOW',$_smarty_tpl->tpl_vars['QUALIFIED_MODULE']->value);?>
</button><?php }?></td></tr><?php if ($_smarty_tpl->tpl_vars['VERSION_TYPE']->value=='free'){?><tr style="border-bottom: none;"><td width="25%" style="border: none;"></td><td style="border: none;"><p style="color: red;">The license you are using is free <a target="_blank" style="text-decoration: underline !important;" href="https://cmsmart.net/your-profile/purchase_download?time=1569827603">, If you have purchased the PRO version click here</a></p><p style="color: red;"><a target="_blank" style="text-decoration: underline !important;" href="https://cmsmart.net/vtiger-crm/human-resource-management-hrm-for-vtiger-crm">Or click here Purchased Pro Version</a></p></td></tr><?php }?></tbody></table><?php }} ?>