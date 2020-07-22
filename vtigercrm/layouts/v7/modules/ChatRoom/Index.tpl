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
		{assign var=LEFTPANELHIDE value=$CURRENT_USER_MODEL->get('leftpanelhide')}
		<div id="modnavigator" class="module-nav">
			<div class="hidden-xs hidden-sm mod-switcher-container">
				{include file="partials/Menubar.tpl"|vtemplate_path:$MODULE}
			</div>
		</div>
		<div id="sidebar-essentials" class="sidebar-essentials {if $LEFTPANELHIDE eq '1'} hide {/if}">
			{include file="partials/SidebarEssentials.tpl"|vtemplate_path:$MODULE}
		</div>
		<div class="listViewPageDiv content-area {if $LEFTPANELHIDE eq '1'} full-width {/if} " id="listViewContent">
			<div class="table-responsive">
				<!-- <h4 align="center">Online User</h4> -->
				<!-- <div id="user_details"></div> -->
				<div id="user_model_details"></div>
			</div>
		</div>
</div>
{/strip}
