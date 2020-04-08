{*
/* * *******************************************************************************
 * The content of this file is subject to the Reports 4 You license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 * ****************************************************************************** */
*}
{strip}
<table class="table table-bordered table-condensed themeTableColor">
    <thead>
        <tr class="blockHeader">
            <th class="mediumWidthType">
                <span class="alignMiddle">{vtranslate('LBL_COMPANY_LICENSE_INFO', $QUALIFIED_MODULE)}</span>
            </th>
            <th class="mediumWidthType" style="border-left: none; text-align: right;">
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('organizationname', 'Settings:Vtiger')}:</label></td>
            <td style="border-left: none;">
                <div class="pull-left" id="organizationname_label">{$COMPANY_DETAILS->get("organizationname")}</div>
            </td>
        </tr>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('address', 'Settings:Vtiger')}:</label></td>
            <td style="border-left: none;">
                <div class="pull-left" id="address_label">{$COMPANY_DETAILS->get("address")}</div>
            </td>
        </tr>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('city', 'Settings:Vtiger')}:</label></td>
            <td style="border-left: none;">
                <div class="pull-left" id="city_label">{$COMPANY_DETAILS->get("city")}</div>
            </td>
        </tr>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('state', 'Settings:Vtiger')}:</label></td>
            <td style="border-left: none;">
                <div class="pull-left" id="state_label">{$COMPANY_DETAILS->get("state")}</div>
            </td>
        </tr>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('country', 'Settings:Vtiger')}:</label></td>
            <td style="border-left: none;">
                <div class="pull-left" id="country_label">{$COMPANY_DETAILS->get("country")}</div>
            </td>
        </tr>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('code', 'Settings:Vtiger')}:</label></td>
            <td style="border-left: none;">
                <div class="pull-left" id="code_label">{$COMPANY_DETAILS->get("code")}</div>
            </td>
        </tr>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('vatid', 'Settings:Vtiger')}:</label></td>
            <td style="border-left: none;">
                <div class="pull-left" id="vatid_label">{$COMPANY_DETAILS->get("vatid")}</div>
            </td>
        </tr>
  </tbody>
</table><br>
<table class="table table-bordered table-condensed themeTableColor" style="border-bottom: none;">
    <thead>
        <tr class="blockHeader">
            <th colspan="2" class="mediumWidthType">
                <span class="alignMiddle">{vtranslate('LBL_LICENSE', $QUALIFIED_MODULE)}</span>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('LBL_URL', $QUALIFIED_MODULE)}:</label></td>
            <td style="border-left: none;">
                <div class="pull-left" id="vatid_label">{$COMPANY_SITE}</div>
            </td>
        </tr>
        <tr>
            <td width="25%"><label  class="muted pull-right marginRight10px">{vtranslate('LBL_LICENSE_KEY', $QUALIFIED_MODULE)}:</label></td>
            <td style="border-left: none;">
                {if count($LICENSE) gt 0}
                    <div class="pull-left" id="license_key_label">{$LICENSE_KEY}</div>
                    <input type="text" name="licensekey" id="licensekey" value="{$LICENSE_KEY}" data-validation-engine="validate[required]" style="display: none;width: 300px;">
                    </br>
                    <div id="divgroup2" class="pull-left paddingLeft10px" {if $VERSION_TYPE neq "free" && $VERSION_TYPE neq "pro"}style="display:none"{/if}>
                        <button id="hrm_reactivate_license_btn"  class="btn btn-success" title="{vtranslate('LBL_REACTIVATE_DESC',$QUALIFIED_MODULE)}" type="button">{vtranslate('LBL_REACTIVATE',$QUALIFIED_MODULE)}</button>
                        {if $VERSION_TYPE eq "pro"}
                        <button id="hrm_deactivate_license_btn" type="button" class="btn btn-danger marginLeftZero">{vtranslate('LBL_DEACTIVATE',$QUALIFIED_MODULE)}</button>
                        {/if}
                    </div>
                    {else}
                    <input type="text" class="input-large" id="licensekey" name="licensekey" data-validation-engine="validate[required]"/>&nbsp;
                    <button type="button" id="hrm_active_button" class="btn btn-success"/><strong>{vtranslate('LBL_VALIDATE',$QUALIFIED_MODULE)}</strong></button>&nbsp;&nbsp;
                    <button type="button" id="hrm_order_button" class="btn btn-info" onclick="window.location.href='https://cmsmart.net/vtiger-crm/human-resource-management-hrm-for-vtiger-crm'"/>{vtranslate('LBL_ORDER_NOW',$QUALIFIED_MODULE)}</button>
                {/if}
            </td>
        </tr>
    {if $VERSION_TYPE eq 'free'}
        <tr style="border-bottom: none;">
            <td width="25%" style="border: none;"></td>
            <td style="border: none;">
                <p style="color: red;">The license you are using is free <a target="_blank" style="text-decoration: underline !important;" href="https://cmsmart.net/your-profile/purchase_download?time=1569827603">, If you have purchased the PRO version click here</a></p>
                <p style="color: red;"><a target="_blank" style="text-decoration: underline !important;" href="https://cmsmart.net/vtiger-crm/human-resource-management-hrm-for-vtiger-crm">Or click here Purchased Pro Version</a></p>
            </td>
        </tr>
    {/if}
     </tbody>
</table>
{/strip}