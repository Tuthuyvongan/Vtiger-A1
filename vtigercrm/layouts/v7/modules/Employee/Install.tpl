{*<!--
/*********************************************************************************
 * The content of this file is subject to the Reports license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
{strip}&nbsp;
<hr>
<div>
<form name="install" id="editLicense"  method="POST" action="index.php" class="form-horizontal">
<input type="hidden" name="module" value="{$MODULE}"/>
<input type="hidden" name="view" value="Setting"/>
<input type="hidden" name="license_key_val" id="license_key_val" value="{$LICENSE_KEY}" />
<div class="controls paddingTop20">
    {include file='LicenseDetails.tpl'|@vtemplate_path:'Employee'}
</div>

</form>
</div>
    <script language="javascript" type="text/javascript">
        jQuery(document).ready(function() {
            var action_bar = jQuery(".module-action-bar");
            action_bar.find('.pull-right').remove();
            jQuery("#appnav").css('display','none');
            jQuery(".employFilter").css('display','none');
        });
    </script>
{/strip}