{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
{* modules/Vtiger/views/Detail.php *}

{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
{strip}
	<form id="detailView" class="clearfix" method="POST" style="position: relative">
		<div class="col-lg-12 resizable-summary-view">
            {include file="DetailViewFullContents.tpl"|vtemplate_path:$MODULE}
		</div>
	</form>
{/strip}