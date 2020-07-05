{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}

{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
	
{strip}
<div class="main-container main-container-ChatRoom" id="main-container-ChatRoom">
		<div id="modnavigator" class="module-nav">
			<div class="hidden-xs hidden-sm mod-switcher-container">
				{include file="partials/Menubar.tpl"|vtemplate_path:$MODULE}
			</div>
		</div>
		<div class="listViewPageDiv content-area full-width " id="listViewContent">
			<div class="table-responsive">
				<h4 align="center">Online User</h4>
				<div id="user_details"></div>
				<div id="user_model_details"></div>
			</div>
		</div>
</div>
{/strip}
