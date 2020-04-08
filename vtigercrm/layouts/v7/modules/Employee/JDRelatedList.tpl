{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{strip}
    {assign var=RELATED_MODULE_NAME value=$RELATED_MODULE->get('name')}
    {include file="PicklistColorMap.tpl"|vtemplate_path:$MODULE LISTVIEW_HEADERS=$RELATED_HEADERS}
	<div class="relatedContainer">
        {assign var=IS_RELATION_FIELD_ACTIVE value="{if $RELATION_FIELD}{$RELATION_FIELD->isActiveField()}{else}false{/if}"}
		<input type="hidden" name="currentPageNum" value="{$PAGING->getCurrentPage()}" />
		<input type="hidden" name="relatedModuleName" class="relatedModuleName" value="{$RELATED_MODULE_NAME}" />
		<input type="hidden" value="{$ORDER_BY}" id="orderBy">
		<input type="hidden" value="{$SORT_ORDER}" id="sortOrder">
		<input type="hidden" value="{$RELATED_ENTIRES_COUNT}" id="noOfEntries">
		<input type='hidden' value="{$PAGING->getPageLimit()}" id='pageLimit'>
		<input type='hidden' value="{$PAGING->get('page')}" id='pageNumber'>
		<input type="hidden" value="{$PAGING->isNextPageExists()}" id="nextPageExist"/>
		<input type='hidden' value="{$TOTAL_ENTRIES}" id='totalCount'>
		<input type='hidden' value="{$TAB_LABEL}" id='tab_label' name='tab_label'>
		<input type='hidden' value="{$IS_RELATION_FIELD_ACTIVE}" id='isRelationFieldActive'>

        {include file="partials/RelatedListHeader.tpl"|vtemplate_path:$RELATED_MODULE_NAME}
        {if $MODULE eq 'Products' && $RELATED_MODULE_NAME eq 'Products' && $TAB_LABEL === 'Product Bundles' && $RELATED_LIST_LINKS}
			<div data-module="{$MODULE}" style = "margin-left:20px">
                {assign var=IS_VIEWABLE value=$PARENT_RECORD->isBundleViewable()}
				<input type="hidden" class="isShowBundles" value="{$IS_VIEWABLE}">
				<label class="showBundlesInInventory checkbox"><input type="checkbox" {if $IS_VIEWABLE}checked{/if} value="{$IS_VIEWABLE}">&nbsp;&nbsp;{vtranslate('LBL_SHOW_BUNDLE_IN_INVENTORY', $MODULE)}</label>
			</div>
        {/if}

		<div class="relatedContents col-lg-12 col-md-12 col-sm-12 table-container">
			<div class="bottomscroll-div">
				<table id="listview-table" class="table listview-table">
					<thead>
					<tr class="listViewHeaders">
                        {foreach item=HEADER_FIELD from=$RELATED_HEADERS}
                            {* hide time_start,time_end columns in the list as they are merged with with Start Date and End Date fields *}
                            {if $HEADER_FIELD->get('column') eq 'time_start' or $HEADER_FIELD->get('column') eq 'time_end'}
								<th class="nowrap" style="width:15px">
                                    {else}
								{if $HEADER_FIELD->get('column') neq 'name'}
									{continue}
								{/if}
								<th class="nowrap">
                                {if $HEADER_FIELD->get('column') eq "access_count" or $HEADER_FIELD->get('column') eq "idlists"}
									<a href="javascript:void(0);" class="noSorting">{vtranslate($HEADER_FIELD->get('label'), $RELATED_MODULE_NAME)}</a>
                                {else}
									<a href="javascript:void(0);" class="listViewContentHeaderValues" data-nextsortorderval="{if $COLUMN_NAME eq $HEADER_FIELD->get('column')}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-fieldname="{$HEADER_FIELD->get('column')}">
                                        {if $COLUMN_NAME eq $HEADER_FIELD->get('column')}
											<i class="fa fa-sort {$FASORT_IMAGE}"></i>
                                        {else}
											<i class="fa fa-sort customsort"></i>
                                        {/if}
										&nbsp;
                                        {vtranslate($HEADER_FIELD->get('label'), $RELATED_MODULE_NAME)}
										&nbsp;{if $COLUMN_NAME eq $HEADER_FIELD->get('column')}<img class="{$SORT_IMAGE}">{/if}&nbsp;
									</a>
                                    {if $COLUMN_NAME eq $HEADER_FIELD->get('column')}
										<a href="#" class="removeSorting"><i class="fa fa-remove"></i></a>
                                    {/if}
                                {/if}
                            {/if}
							</th>
                        {/foreach}
					</tr>
					<tr class="searchRow">
						<th>
							<button class="btn btn-success btn-sm" data-trigger="relatedListSearch">{vtranslate("LBL_SEARCH",$MODULE)}</button>
                        {foreach item=HEADER_FIELD from=$RELATED_HEADERS}

                                {if $HEADER_FIELD->get('column') eq 'time_start' or $HEADER_FIELD->get('column') eq 'time_end' or $HEADER_FIELD->getFieldDataType() eq 'reference'}
                                {else}
									{if $HEADER_FIELD->get('column') neq 'name'}
										{continue}
									{/if}
                                    {assign var=FIELD_UI_TYPE_MODEL value=$HEADER_FIELD->getUITypeModel()}
                                    {include file=vtemplate_path($FIELD_UI_TYPE_MODEL->getListSearchTemplateName(),$RELATED_MODULE_NAME) FIELD_MODEL= $HEADER_FIELD SEARCH_INFO=$SEARCH_DETAILS[$HEADER_FIELD->getName()] USER_MODEL=$USER_MODEL}
									<input type="hidden" class="operatorValue" value="{$SEARCH_DETAILS[$HEADER_FIELD->getName()]['comparator']}">
                                {/if}

                        {/foreach}
						</th>
							</td>
						{*</th>*}
					</tr>
					</thead>
                    {foreach item=RELATED_RECORD from=$RELATED_RECORDS}
						<tr class="listViewEntries" data-id='{$RELATED_RECORD->getId()}'
                                {if $RELATED_MODULE_NAME eq 'Calendar'}
							data-recurring-enabled='{$RELATED_RECORD->isRecurringEnabled()}'
                                {assign var=DETAILVIEWPERMITTED value=isPermitted($RELATED_MODULE_NAME, 'DetailView', $RELATED_RECORD->getId())}
                            {if $DETAILVIEWPERMITTED eq 'yes'}
								data-recordUrl='{$RELATED_RECORD->getDetailViewUrl()}'
                            {/if}
                                {else}
							data-recordUrl='{$RELATED_RECORD->getDetailViewUrl()}'
                                {/if}>
							<td style="width: 100%">
								<table class="table detailview-table jd_related" id="jd_related_{$RELATED_RECORD->getId()}">
                                    <div style="background: #ddd;font-size: 15px;">
										<span class="actionImages">&nbsp;&nbsp;&nbsp;
                                            {if $IS_EDITABLE && $RELATED_RECORD->isEditable()}
                                                {if $RELATED_MODULE_NAME eq 'PriceBooks' AND (!empty($RELATED_HEADERS['listprice']) || !empty($RELATED_HEADERS['unit_price']))}
                                                    {if !empty($RELATED_HEADERS['listprice'])}
                                                        {assign var="LISTPRICE" value=CurrencyField::convertToUserFormat($RELATED_RECORD->get('listprice'), null, true)}
                                                    {/if}
                                                {/if}
                                                {if $RELATED_MODULE_NAME eq 'PriceBooks'}
													<a data-url="index.php?module=PriceBooks&view=ListPriceUpdate&record={$PARENT_RECORD->getId()}&relid={$RELATED_RECORD->getId()}&currentPrice={$LISTPRICE}"
													   class="editListPrice cursorPointer" data-related-recordid='{$RELATED_RECORD->getId()}' data-list-price={$LISTPRICE}
                                                       {else if $MODULE eq 'Products' && $RELATED_MODULE_NAME eq 'Products' && $TAB_LABEL === 'Product Bundles' && $RELATED_LIST_LINKS && $PARENT_RECORD->isBundle()}
                                                       {assign var=quantity value=$RELATED_RECORD->get($RELATION_FIELD->getName())}
													   <a class="quantityEdit"
													   data-url="index.php?module=Products&view=SubProductQuantityUpdate&record={$PARENT_RECORD->getId()}&relid={$RELATED_RECORD->getId()}&currentQty={$quantity}"
													   onclick ="Products_Detail_Js.triggerEditQuantity('index.php?module=Products&view=SubProductQuantityUpdate&record={$PARENT_RECORD->getId()}&relid={$RELATED_RECORD->getId()}&currentQty={$quantity}');if(event.stopPropagation){ldelim}event.stopPropagation();{rdelim}else{ldelim}event.cancelBubble=true;{rdelim}"
                                                {else}
													<a name="relationEdit" data-url="{$RELATED_RECORD->getEditViewUrl()}"
                                                {/if}
												><i class="fa fa-pencil" title="{vtranslate('LBL_EDIT', $MODULE)}"></i></a> &nbsp;&nbsp;
                                            {/if}

                                            {if $IS_DELETABLE}
												<a class="relationDelete"><i title="{vtranslate('LBL_UNLINK', $MODULE)}" class="vicon-linkopen"></i></a>
                                            {/if}
                                    </span>
										<label style="width: 90%;margin-left: 10px;line-height: 40px;margin-bottom: 0;">{$RELATED_RECORD->get('name')} ({Vtiger_Record_Model::getInstanceById({$RELATED_RECORD->getId()},'JD')->get('jd_classify')})</label>
										<a onclick="show_hide_jd(this);" data-show-label="Show" style="float: right;margin-right: 20px;text-align: center;margin-top: 12px;">
											<i class="fa fa-chevron-circle-up"></i></a>
									</div>
									<tr class="listViewEntries">
										<td class="relatedListEntryValues" title="{strip_tags($RELATED_RECORD->getDisplayValue($RELATED_HEADERNAME))}" data-field-type="{$HEADER_FIELD->getFieldDataType()}" nowrap>Task ID</td>
										<td class="relatedListEntryValues" title="{strip_tags($RELATED_RECORD->getDisplayValue($RELATED_HEADERNAME))}" data-field-type="{$HEADER_FIELD->getFieldDataType()}" nowrap>Task Description</td>
									</tr>
                                    {assign var=TASK_LIST value=Vtiger_Record_Model::getInstanceById($RELATED_RECORD->getId(),'JD')->getTaskLists($RELATED_RECORD->getId())}
                                    {foreach from=$TASK_LIST key=TASK item=TASK_VALUE}
										<tr class="listViewEntries">
											<td class="relatedListEntryValues" title="{strip_tags($RELATED_RECORD->getDisplayValue($RELATED_HEADERNAME))}" data-field-type="{$HEADER_FIELD->getFieldDataType()}" nowrap>{$value_field.label}{$TASK}</td>
											<td class="relatedListEntryValues" title="{strip_tags($RELATED_RECORD->getDisplayValue($RELATED_HEADERNAME))}" data-field-type="{$HEADER_FIELD->getFieldDataType()}" nowrap>{$TASK_VALUE.task_description}</td>
										</tr>
                                    {/foreach}
								</table>
							</td>
						</tr>
                    {/foreach}
				</table>
			</div>
		</div>
		<script type="text/javascript">
            var related_uimeta = (function () {
                var fieldInfo = {$RELATED_FIELDS_INFO};
                return {
                    field: {
                        get: function (name, property) {
                            if (name && property === undefined) {
                                return fieldInfo[name];
                            }
                            if (name && property) {
                                return fieldInfo[name][property]
                            }
                        },
                        isMandatory: function (name) {
                            if (fieldInfo[name]) {
                                return fieldInfo[name].mandatory;
                            }
                            return false;
                        },
                        getType: function (name) {
                            if (fieldInfo[name]) {
                                return fieldInfo[name].type
                            }
                            return false;
                        }
                    }
                };
            })();
            
            function show_hide_jd(elem) {
				var element = jQuery(elem);
				var td = element.closest('td');
				var tr = element.closest('tr');
				var jd_table = td.find(".jd_related");
                tr.removeClass("listViewEntries");
                jd_table.toggle('fast');
                if (element.val() == element.data('show-label')) {
                    tr.find(".fa").removeClass("fa-chevron-circle-down");
                    tr.find(".fa").addClass("fa-chevron-circle-up");
                    tr.find(".fa-pencil").removeClass("fa-chevron-circle-down");
                    tr.find(".fa-pencil").removeClass("fa-chevron-circle-up");
                    element.val(element.data('hide-label'));
                } else {
                    tr.find(".fa").removeClass("fa-chevron-circle-up");
                    tr.find(".fa").addClass("fa-chevron-circle-down");
                    tr.find(".fa-pencil").removeClass("fa-chevron-circle-down");
                    tr.find(".fa-pencil").removeClass("fa-chevron-circle-up");
                    element.val(element.data('show-label'));
                }
            }
            jQuery(document).ready(function () {
                jQuery(".searchRow").find("div").css('float','right');
                jQuery(".searchRow").find("div").css('margin-right','85%');
            });
		</script>
	</div>
{/strip}