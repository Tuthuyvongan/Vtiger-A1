{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
   <div class="col-lg-6 col-md-6 col-sm-6">
	  <div class="record-header clearfix ">
		 <div class="hidden-sm hidden-xs recordImage bgcontacts app-{$SELECTED_MENU_CATEGORY}">
			{assign var=IMAGE_DETAILS value=$RECORD->getImageDetails()}
			{foreach key=ITER item=IMAGE_INFO from=$IMAGE_DETAILS}
			   {if !empty($IMAGE_INFO.path)}
				  <img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" alt="{$IMAGE_INFO.orgname}" title="{$IMAGE_INFO.orgname}" width="100%" height="100%" align="left"><br>
			   {else}
				  <img src="{vimage_path('summary_Contact.png')}" class="summaryImg"/>
			   {/if}
			{/foreach}
			{if empty($IMAGE_DETAILS)}
				<div class="name"><span><strong>{$MODULE_MODEL->getModuleIcon()}</strong></span></div>
			{/if}
		 </div>
		 <div class="recordBasicInfo">
			<div class="info-row">
			   <h4>
				  <span class="recordLabel  pushDown" title="{$RECORD->getDisplayValue('salutationtype')}&nbsp;{$RECORD->getName()}">
					 {assign var=COUNTER value=0}
					 {foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
						{assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
						{if $FIELD_MODEL->getPermissions()}
						   <span class="{$NAME_FIELD}">
							   {if $RECORD->getDisplayValue('salutationtype') && $FIELD_MODEL->getName() eq 'firstname'}
									{$RECORD->getDisplayValue('salutationtype')}&nbsp;
							   {/if}
							   {trim($RECORD->get($NAME_FIELD))}
						   </span>
						   {if $COUNTER eq 0 && ($RECORD->get($NAME_FIELD))}&nbsp;{assign var=COUNTER value=$COUNTER+1}{/if}
						{/if}
					 {/foreach}
				  </span>
			   </h4>
			</div>
			{include file="DetailViewHeaderFieldsView.tpl"|vtemplate_path:$MODULE}
			<div class="info-row">
				{if $IS_ADMIN eq 'on'}
					<span class="action"><a href="index.php?module=Users&parent=Settings&view=List" class="editAction fa fa-pencil"></a></span>
					{else}
					<span class="action"><a href="index.php?module=Users&view=PreferenceDetail&parent=Settings&record={$USER_ID}" class="editAction fa fa-pencil"></a></span>
				{/if}

			</div>
		 </div>
	  </div>
   </div>
{/strip}