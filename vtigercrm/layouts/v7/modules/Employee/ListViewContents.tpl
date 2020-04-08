{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Vtiger/views/List.php *}

{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
{include file="PicklistColorMap.tpl"|vtemplate_path:$MODULE}
{*style for empployee list feature*}
{literal}
	<style>
		.fixed-promotion {
			position: fixed;
			top:200px;
			right: -500px;
			background: #fff;
			width: 500px;
			-webkit-transition: all 0.4s;
			-moz-transition: all 0.4s;
			transition: all 0.4s;
			padding: 15px 0px 0px 30px;
			border-top-left-radius: 4px;
			z-index: 9999;
		}
		.fixed-promotion.show {
			max-height: 80%;
			right: 0;
			box-shadow: -2px 0 30px rgba(0,0,0,0.1);
		}
		.ft-promotion-wrapper {
			position: relative;
		}
		.ft-promotion-toggle {
			display: none;
			position: absolute;
			width: 50px;
			height: 50px;
			top: 60px;
			left: -80px;
			background: #fff;
			border-top-left-radius: 4px;
			border-bottom-left-radius: 4px;
			cursor: pointer;
			text-align: center;
			line-height: 50px;
			font-size: 0;
			overflow: hidden;
			box-shadow: -2px 0 30px rgba(0,0,0,0.1);
		}
		#back-to-top {
			box-shadow: -2px 0 30px rgba(0,0,0,0.1);
		}
		.fixed-promotion.show .ft-promotion-toggle {
			box-shadow: -5px 0 10px rgba(0,0,0,0.05);
		}
		.ft-promotion-toggle .ft-promotion-close {
			display: none;
		}
		.fixed-promotion.show .ft-promotion-toggle .ft-promotion-close {
			display: block;
		}
		.fixed-promotion.show .ft-promotion-toggle img {
			display: none;
		}
		.ft-promotion-header {
			height: 40px;
			margin-left: -31px;
			margin-top: -15px;
			color: #444444;
			font-size: 18px;
			font-weight: bold;
		}
		.ft-promotion-form-group input{
			height: 45px;
			border-radius: 4px;
			background-color: #f1f1f1;
			line-height: 45px;
			color: #999999;
			border: none;
			padding: 0 15px;
			margin-bottom: 15px;
		}
		.ft-promotion-paragraph {
			padding: 20px 0 25px;
			max-height: 500px;
			overflow-x: auto;
		}
		.promotion-info-wrap {
			display: flex;
		}
		@media (max-width: 767px){
			.fixed-promotion {
				width: calc(100vw - 50px);
				padding: 15px 0px 0px 15px;
				right: calc(-100vw + 50px);
			}
			.ft-promotion-toggle {
				left: -65px;
			}
			.promotion-info-wrap {
				display: block;
			}
			.ft-promotion-toggle .ft-promotion-close{
				line-height: 40px !important;
			}
			.promotion-info-wrap input {
				margin-right: 0 !important;
				width: 100%;
			}

			.fixed-promotion.show {
				max-height: 450px;
				right: 0;
			}
			.fixed-promotion {
				max-height: 400px;
			}
			.promotion-info-wrap {
				display: block;
				max-height: 400px;
				display: flex;
			}
			.ft-promotion-paragraph {
				padding: 10px 0 15px;
				max-height: 400px;
			}
			.employ_button{
				margin-top: 60px;
			}
		}
		@media (max-width: 950px){
			.employ_button{
				margin-top: 80px;
				margin-bottom: 10px;
			}
		}
		@media (max-height: 610px){
			.fixed-promotion.show {
				max-height: 250px;
				right: 0;
			}
			.fixed-promotion {
				max-height: 200px;
			}
			.promotion-info-wrap {
				display: block;
				max-height: 200px;
				display: flex;
			}
			.ft-promotion-paragraph {
				padding: 10px 0 15px;
				max-height: 200px;
			}
		}
	</style>

	<script type="text/javascript">
        jQuery(document).ready(function(){
            jQuery("#license_notice").html('')
            var license_type = jQuery("#license_type").val();
            var notice_content = jQuery("#license_noti").val();
            var $expire_notice = jQuery("#expire_notice").val();
            var noti_message = '<i style="color: red;">The license you are using is free, if you have a license key Pro<a style="position: fixed;text-decoration: underline !important;" href="index.php?module=Employee&view=Setting&app=HRM">, click here to upgrade</a></i>';
            if(license_type=='free' || license_type==''){
                jQuery("#license_notice").append(noti_message);
            }else {
                if(notice_content !=''){
                    noti_message = '<i style="color: red;">'+notice_content+'<a style="position: fixed;text-decoration: underline !important;" href="index.php?module=Employee&view=Setting&app=HRM">, click here to upgrade</a></i>';
                    jQuery("#license_notice").append(noti_message);
                }else if ($expire_notice != ''){
                    noti_message = '<i style="color: red;">'+$expire_notice+'<a style="position: fixed;text-decoration: underline !important;" href="index.php?module=Employee&view=Setting&app=HRM">, click here to upgrade</a></i>';
                    jQuery("#license_notice").append(noti_message);
                }
            }
            jQuery(document).on('scroll', function(){
                if(jQuery(document).scrollTop() > 1500){
                    jQuery('.ft-promotion-toggle').show();
                    var firstTime = localStorage.getItem('cmsmart_promotion');
                    if(!firstTime){
                        jQuery('.fixed-promotion').addClass('show');
                        localStorage.setItem('cmsmart_promotion', '1');
                    }
                }else{
                    jQuery('.fixed-promotion').removeClass('show');
                }
            });
            jQuery('.ft-promotion-toggle').on('click', function(){
                jQuery('.fixed-promotion').toggleClass('show');
                localStorage.setItem('cmsmart_promotion', '1');
            });
        });
	</script>
{/literal}
<div class="col-sm-12 col-xs-12 ">
	{if $MODULE neq 'EmailTemplates' && $SEARCH_MODE_RESULTS neq true}
		{assign var=LEFTPANELHIDE value=$CURRENT_USER_MODEL->get('leftpanelhide')}
		<div class="essentials-toggle" title="{vtranslate('LBL_LEFT_PANEL_SHOW_HIDE', 'Vtiger')}">
			<span class="essentials-toggle-marker fa {if $LEFTPANELHIDE eq '1'}fa-chevron-right{else}fa-chevron-left{/if} cursorPointer"></span>
		</div>
	{/if}
	<input type="hidden" name="license_noti" id="license_noti" value="{$VALIDATE_MSG}"/>
	<input type="hidden" name="expire_notice" id="expire_notice" value="{$EXPIRE_NOTICE}"/>
	<input type="hidden" name="license_type" id="license_type" value="{$LICENSE_TYPE}"/>
	<input type="hidden" name="view" id="view" value="{$VIEW}" />
	<input type="hidden" name="cvid" value="{$VIEWID}" />
	<input type="hidden" name="pageStartRange" id="pageStartRange" value="{$PAGING_MODEL->getRecordStartRange()}" />
	<input type="hidden" name="pageEndRange" id="pageEndRange" value="{$PAGING_MODEL->getRecordEndRange()}" />
	<input type="hidden" name="previousPageExist" id="previousPageExist" value="{$PAGING_MODEL->isPrevPageExists()}" />
	<input type="hidden" name="nextPageExist" id="nextPageExist" value="{$PAGING_MODEL->isNextPageExists()}" />
	<input type="hidden" name="alphabetSearchKey" id="alphabetSearchKey" value= "{$MODULE_MODEL->getAlphabetSearchField()}" />
	<input type="hidden" name="Operator" id="Operator" value="{$OPERATOR}" />
	<input type="hidden" name="totalCount" id="totalCount" value="{$LISTVIEW_COUNT}" />
	<input type='hidden' name="pageNumber" value="{$PAGE_NUMBER}" id='pageNumber'>
	<input type='hidden' name="pageLimit" value="{$PAGING_MODEL->getPageLimit()}" id='pageLimit'>
	<input type="hidden" name="noOfEntries" value="{$LISTVIEW_ENTRIES_COUNT}" id="noOfEntries">
	<input type="hidden" name="currentSearchParams" value="{Vtiger_Util_Helper::toSafeHTML(Zend_JSON::encode($SEARCH_DETAILS))}" id="currentSearchParams" />
	<input type="hidden" name="currentTagParams" value="{Vtiger_Util_Helper::toSafeHTML(Zend_JSON::encode($TAG_DETAILS))}" id="currentTagParams" />
	<input type="hidden" name="noFilterCache" value="{$NO_SEARCH_PARAMS_CACHE}" id="noFilterCache" >
	<input type="hidden" name="orderBy" value="{$ORDER_BY}" id="orderBy">
	<input type="hidden" name="sortOrder" value="{$SORT_ORDER}" id="sortOrder">
	<input type="hidden" name="list_headers" value='{$LIST_HEADER_FIELDS}'/>
	<input type="hidden" name="tag" value="{$CURRENT_TAG}" />
	<input type="hidden" name="folder_id" value="{$FOLDER_ID}" />
	<input type="hidden" name="folder_value" value="{$FOLDER_VALUE}" />
	<input type="hidden" name="viewType" value="{$VIEWTYPE}" />
	<input type="hidden" name="app" id="appName" value="{$SELECTED_MENU_CATEGORY}">
	<input type="hidden" id="isExcelEditSupported" value="{if $MODULE_MODEL->isExcelEditAllowed()}yes{else}no{/if}" />
	{if !empty($PICKIST_DEPENDENCY_DATASOURCE)}
		<input type="hidden" name="picklistDependency" value='{Vtiger_Util_Helper::toSafeHTML($PICKIST_DEPENDENCY_DATASOURCE)}' />
	{/if}
	{if !$SEARCH_MODE_RESULTS}
		{include file="ListViewActions.tpl"|vtemplate_path:$MODULE}
	{/if}

	<div id="table-content" class="table-container">
		<form name='list' id='listedit' action='' onsubmit="return false;">
			<table id="listview-table" class="table {if $LISTVIEW_ENTRIES_COUNT eq '0'}listview-table-norecords {/if} listview-table ">
				<thead>
					<tr class="listViewContentHeader">
						<th>
							{if !$SEARCH_MODE_RESULTS}
					<div class="table-actions">
						<div class="dropdown" style="float:left;">
							<span class="input dropdown-toggle" data-toggle="dropdown" title="{vtranslate('LBL_CLICK_HERE_TO_SELECT_ALL_RECORDS',$MODULE)}">
								<input class="listViewEntriesMainCheckBox" type="checkbox">
							</span>
						</div>
						{if $MODULE_MODEL->isFilterColumnEnabled()}
							<div id="listColumnFilterContainer">
								<div class="listColumnFilter {if $CURRENT_CV_MODEL and !($CURRENT_CV_MODEL->isCvEditable())}disabled{/if}"
									 {if $CURRENT_CV_MODEL->isCvEditable()}
										 title="{vtranslate('LBL_CLICK_HERE_TO_MANAGE_LIST_COLUMNS',$MODULE)}"
									 {else}
										 {if $CURRENT_CV_MODEL->get('viewname') eq 'All' and !$CURRENT_USER_MODEL->isAdminUser()}
											 title="{vtranslate('LBL_SHARED_LIST_NON_ADMIN_MESSAGE',$MODULE)}"
										 {elseif !$CURRENT_CV_MODEL->isMine()}
											 {assign var=CURRENT_CV_USER_ID value=$CURRENT_CV_MODEL->get('userid')}
											 {if !Vtiger_Functions::isUserExist($CURRENT_CV_USER_ID)}
												 {assign var=CURRENT_CV_USER_ID value=Users::getActiveAdminId()}
											 {/if}
											 title="{vtranslate('LBL_SHARED_LIST_OWNER_MESSAGE',$MODULE, getUserFullName($CURRENT_CV_USER_ID))}"
										 {/if}
									 {/if}
									 {if $MODULE eq 'Documents'}style="width: 10%;"{/if}
									 data-toggle="tooltip" data-placement="bottom" data-container="body">
									<i class="fa fa-th-large"></i>
								</div>
							</div>
						{/if}
					</div>
				{elseif $SEARCH_MODE_RESULTS}
					{vtranslate('LBL_ACTIONS',$MODULE)}
				{/if}
				</th>
				{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
					{if $SEARCH_MODE_RESULTS || ($LISTVIEW_HEADER->getFieldDataType() eq 'multipicklist')}
						{assign var=NO_SORTING value=1}
					{else}
						{assign var=NO_SORTING value=0}
					{/if}
					<th {if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')} nowrap="nowrap" {/if}>
						<a href="#" class="{if $NO_SORTING}noSorting{else}listViewContentHeaderValues{/if}" {if !$NO_SORTING}data-nextsortorderval="{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-columnname="{$LISTVIEW_HEADER->get('name')}"{/if} data-field-id='{$LISTVIEW_HEADER->getId()}'>
							{if !$NO_SORTING}
								{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}
									<i class="fa fa-sort {$FASORT_IMAGE}"></i>
								{else}
									<i class="fa fa-sort customsort"></i>
								{/if}
							{/if}
							&nbsp;{vtranslate($LISTVIEW_HEADER->get('label'), $LISTVIEW_HEADER->getModuleName())}&nbsp;
						</a>
						{if $COLUMN_NAME eq $LISTVIEW_HEADER->get('name')}
							<a href="#" class="removeSorting"><i class="fa fa-remove"></i></a>
							{/if}
					</th>
				{/foreach}
				</tr>

				{if $MODULE_MODEL->isQuickSearchEnabled() && !$SEARCH_MODE_RESULTS}
					<tr class="searchRow">
						<th class="inline-search-btn">
					<div class="table-actions">
						<button class="btn btn-success btn-sm" data-trigger="listSearch">{vtranslate("LBL_SEARCH",$MODULE)}</button>
					</div>
					</th>
					{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
						<th>
							{assign var=FIELD_UI_TYPE_MODEL value=$LISTVIEW_HEADER->getUITypeModel()}
							{include file=vtemplate_path($FIELD_UI_TYPE_MODEL->getListSearchTemplateName(),$MODULE) FIELD_MODEL= $LISTVIEW_HEADER SEARCH_INFO=$SEARCH_DETAILS[$LISTVIEW_HEADER->getName()] USER_MODEL=$CURRENT_USER_MODEL}
							<input type="hidden" class="operatorValue" value="{$SEARCH_DETAILS[$LISTVIEW_HEADER->getName()]['comparator']}">
						</th>
					{/foreach}
					</tr>
				{/if}
				</thead>
				<tbody class="overflow-y">
					{foreach item=LISTVIEW_ENTRY from=$LISTVIEW_ENTRIES name=listview}
						{assign var=DATA_ID value=$LISTVIEW_ENTRY->getId()}
						{assign var=DATA_URL value=$LISTVIEW_ENTRY->getDetailViewUrl()}
						{if $SEARCH_MODE_RESULTS && $LISTVIEW_ENTRY->getModuleName() == "ModComments"}
							{assign var=RELATED_TO value=$LISTVIEW_ENTRY->get('related_to_model')}
							{assign var=DATA_ID value=$RELATED_TO->getId()}
							{assign var=DATA_URL value=$RELATED_TO->getDetailViewUrl()}
						{/if}
						<tr class="listViewEntries" data-id='{$DATA_ID}' data-recordUrl='{$DATA_URL}&app={$SELECTED_MENU_CATEGORY}' id="{$MODULE}_listView_row_{$smarty.foreach.listview.index+1}" {if $MODULE eq 'Calendar'}data-recurring-enabled='{$LISTVIEW_ENTRY->isRecurringEnabled()}'{/if}>
							<td class = "listViewRecordActions">
								{include file="ListViewRecordActions.tpl"|vtemplate_path:$MODULE}
							</td>
							{if ($LISTVIEW_ENTRY->get('document_source') eq 'Google Drive' && $IS_GOOGLE_DRIVE_ENABLED) || ($LISTVIEW_ENTRY->get('document_source') eq 'Dropbox' && $IS_DROPBOX_ENABLED)}
						<input type="hidden" name="document_source_type" value="{$LISTVIEW_ENTRY->get('document_source')}">
					{/if}
					{foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
						{assign var=LISTVIEW_HEADERNAME value=$LISTVIEW_HEADER->get('name')}
						{assign var=LISTVIEW_ENTRY_RAWVALUE value=$LISTVIEW_ENTRY->getRaw($LISTVIEW_HEADER->get('column'))}
						{if $LISTVIEW_HEADER->getFieldDataType() eq 'currency' || $LISTVIEW_HEADER->getFieldDataType() eq 'text'}
							{assign var=LISTVIEW_ENTRY_RAWVALUE value=$LISTVIEW_ENTRY->getTitle($LISTVIEW_HEADER)}
						{/if}
						{assign var=LISTVIEW_ENTRY_VALUE value=$LISTVIEW_ENTRY->get($LISTVIEW_HEADERNAME)}
						<td class="listViewEntryValue" data-name="{$LISTVIEW_HEADER->get('name')}" title="{$LISTVIEW_ENTRY->getTitle($LISTVIEW_HEADER)}" data-rawvalue="{$LISTVIEW_ENTRY_RAWVALUE}" data-field-type="{$LISTVIEW_HEADER->getFieldDataType()}">
							<span class="fieldValue">
								<span class="value">
									{if ($LISTVIEW_HEADER->isNameField() eq true or $LISTVIEW_HEADER->get('uitype') eq '4') and $MODULE_MODEL->isListViewNameFieldNavigationEnabled() eq true }
										<a href="{$LISTVIEW_ENTRY->getDetailViewUrl()}&app={$SELECTED_MENU_CATEGORY}">{$LISTVIEW_ENTRY->get($LISTVIEW_HEADERNAME)}</a>
										{if $MODULE eq 'Products' &&$LISTVIEW_ENTRY->isBundle()}
											&nbsp;-&nbsp;<i class="mute">{vtranslate('LBL_PRODUCT_BUNDLE', $MODULE)}</i>
										{/if}
									{else if $MODULE_MODEL->getName() eq 'Documents' && $LISTVIEW_HEADERNAME eq 'document_source'}
										{$LISTVIEW_ENTRY->get($LISTVIEW_HEADERNAME)}
									{else}
										{if $LISTVIEW_HEADER->get('uitype') eq '72'}
											{assign var=CURRENCY_SYMBOL_PLACEMENT value={$CURRENT_USER_MODEL->get('currency_symbol_placement')}}
											{if $CURRENCY_SYMBOL_PLACEMENT eq '1.0$'}
												{$LISTVIEW_ENTRY_VALUE}{$LISTVIEW_ENTRY->get('currencySymbol')}
											{else}
												{$LISTVIEW_ENTRY->get('currencySymbol')}{$LISTVIEW_ENTRY_VALUE}
											{/if}
										{else if $LISTVIEW_HEADER->get('uitype') eq '71'}
											{assign var=CURRENCY_SYMBOL value=$LISTVIEW_ENTRY->get('userCurrencySymbol')}
											{if $LISTVIEW_ENTRY->get($LISTVIEW_HEADERNAME) neq NULL}
												{CurrencyField::appendCurrencySymbol($LISTVIEW_ENTRY->get($LISTVIEW_HEADERNAME), $CURRENCY_SYMBOL)}
											{/if}
										{else if $LISTVIEW_HEADER->getFieldDataType() eq 'picklist'}
											{if $LISTVIEW_ENTRY->get('activitytype') eq 'Task'}
												{assign var=PICKLIST_FIELD_ID value={$LISTVIEW_HEADER->getId()}}
											{else}
												{if $LISTVIEW_HEADER->getName() eq 'taskstatus'}
													{assign var="EVENT_STATUS_FIELD_MODEL" value=Vtiger_Field_Model::getInstance('eventstatus', Vtiger_Module_Model::getInstance('Events'))}
													{if $EVENT_STATUS_FIELD_MODEL}
														{assign var=PICKLIST_FIELD_ID value={$EVENT_STATUS_FIELD_MODEL->getId()}}
													{else}
														{assign var=PICKLIST_FIELD_ID value={$LISTVIEW_HEADER->getId()}}
													{/if}
												{else}
													{assign var=PICKLIST_FIELD_ID value={$LISTVIEW_HEADER->getId()}}
												{/if}
											{/if}
											<span {if !empty($LISTVIEW_ENTRY_VALUE)} class="picklist-color picklist-{$PICKLIST_FIELD_ID}-{Vtiger_Util_Helper::convertSpaceToHyphen($LISTVIEW_ENTRY_RAWVALUE)}" {/if}> {$LISTVIEW_ENTRY_VALUE} </span>
										{else if $LISTVIEW_HEADER->getFieldDataType() eq 'multipicklist'}
											{assign var=MULTI_RAW_PICKLIST_VALUES value=explode('|##|',$LISTVIEW_ENTRY->getRaw($LISTVIEW_HEADERNAME))}
											{assign var=MULTI_PICKLIST_VALUES value=explode(',',$LISTVIEW_ENTRY_VALUE)}
											{assign var=ALL_MULTI_PICKLIST_VALUES value=array_flip($LISTVIEW_HEADER->getPicklistValues())}
											{foreach item=MULTI_PICKLIST_VALUE key=MULTI_PICKLIST_INDEX from=$MULTI_PICKLIST_VALUES}
												<span {if !empty($LISTVIEW_ENTRY_VALUE)} class="picklist-color picklist-{$LISTVIEW_HEADER->getId()}-{Vtiger_Util_Helper::convertSpaceToHyphen(trim($ALL_MULTI_PICKLIST_VALUES[trim($MULTI_PICKLIST_VALUE)]))}"{/if} >
													{if trim($MULTI_PICKLIST_VALUES[$MULTI_PICKLIST_INDEX]) eq vtranslate('LBL_NOT_ACCESSIBLE', $MODULE)}
														<font color="red">
														{trim($MULTI_PICKLIST_VALUES[$MULTI_PICKLIST_INDEX])}
														</font>
													{else}
														{trim($MULTI_PICKLIST_VALUES[$MULTI_PICKLIST_INDEX])}
													{/if}
													{if !empty($MULTI_PICKLIST_VALUES[$MULTI_PICKLIST_INDEX + 1])},{/if}
												</span>
											{/foreach}
										{else}
											{$LISTVIEW_ENTRY_VALUE}
										{/if}
									{/if}
								</span>
							</span>
							{if $LISTVIEW_HEADER->isEditable() eq 'true' && $LISTVIEW_HEADER->isAjaxEditable() eq 'true'}
								<span class="hide edit">
								</span>
							{/if}
						</td>
					{/foreach}
					</tr>
				{/foreach}
				{if $LISTVIEW_ENTRIES_COUNT eq '0'}
					<tr class="emptyRecordsDiv">
						{assign var=COLSPAN_WIDTH value={count($LISTVIEW_HEADERS)}+1}
						<td colspan="{$COLSPAN_WIDTH}">
							<div class="emptyRecordsContent">
								{assign var=SINGLE_MODULE value="SINGLE_$MODULE"}
								{vtranslate('LBL_NO')} {vtranslate($MODULE, $MODULE)} {vtranslate('LBL_FOUND')}.
								{if $IS_CREATE_PERMITTED}
									<a style="color:blue" href="{$MODULE_MODEL->getCreateRecordUrl()}"> {vtranslate('LBL_CREATE')}</a>
									{if Users_Privileges_Model::isPermitted($MODULE, 'Import') && $LIST_VIEW_MODEL->isImportEnabled()}
										{vtranslate('LBL_OR', $MODULE)}
										<a style="color:blue" href="#" onclick="return Vtiger_Import_Js.triggerImportAction()">{vtranslate('LBL_IMPORT', $MODULE)}</a>
										{vtranslate($MODULE, $MODULE)}
									{else}
										{vtranslate($SINGLE_MODULE, $MODULE)}
									{/if}
								{/if}
							</div>
						</td>
					</tr>
				{/if}
				</tbody>
			</table>
		</form>
	</div>
	{if count($WILL_REVIEWS) gt 0 or count($PROBALY_EXPIREDS) gt 0 or count($EMPTY_SALARYS) gt 0}
		<div class="fixed-promotion"> {*Employee list feature*}
			<div class="ft-promotion-wrapper">
        <span class="ft-promotion-toggle" style="display: inline;">
            <span style="font-size: 40px; color: #f7931e; line-height: 50px;width: 100%; height: 100%;" class="ft-promotion-close">×</span>
            <img src="layouts/v7/modules/Employee/images/notify icon.png" style="max-height: 100%; max-width: 100%;">
        </span>
				<div class="ft-promotion-content">
					<div class="ft-promotion-header" style="text-align:center;text-transform: uppercase;background: #f8941e;">
						<label style="padding-top: 8px;">Employees list feature</label>
					</div>
					<div class="ft-promotion-paragraph">
                        {if count($WILL_REVIEWS) gt 0}
							<div>
								<h4 style="background: #a29c93;">→ Employees will be able review salary:</h4>
                                {foreach from=$WILL_REVIEWS key=Id item=will_sal}
									<p><b><a href="index.php?module=Employee&view=Detail&record={$will_sal.employid}&app=HRM">- {$will_sal.lastname} {$will_sal.firstname}</a></b> --> Date review: {$will_sal.date_review}</p>
                                {/foreach}
							</div>
                        {/if}
                        {if count($PROBALY_EXPIREDS) gt 0}
							<div>
								<h4 style="background: #a29c93;">→ Employees closed Probationary Period:</h4>
                                {foreach from=$PROBALY_EXPIREDS key=probalyId item=probalyValue}
									<p><b><a href="index.php?module=Employee&view=Detail&record={$probalyValue.employid}&app=HRM">- {$probalyValue.lastname} {$probalyValue.firstname}</a></b> --> Date close Probationary Period: {$probalyValue.probality_expired_date}</p>
                                {/foreach}
							</div>
                        {/if}
                        {if count($EMPTY_SALARYS) gt 0}
							<div>
								<h4 style="background: #a29c93;">→ The Employees has not entered the salary</h4>
                                {foreach from=$EMPTY_SALARYS key=emptyId item=emptyValue}
									<p><b><a href="index.php?module=Employee&view=Detail&record={$emptyValue.employid}&app=HRM">- {$emptyValue.lastname} {$emptyValue.firstname}</a></b></p>
                                {/foreach}
							</div>
                        {/if}
					</div>
				</div>
			</div> {*Employee list feature*}
		</div>
	{/if}
	<div id="scroller_wrapper" class="bottom-fixed-scroll">
		<div id="scroller" class="scroller-div"></div>
	</div>
</div>
