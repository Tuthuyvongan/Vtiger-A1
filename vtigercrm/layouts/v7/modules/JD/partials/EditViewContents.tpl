{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
********************************************************************************/
-->*}
{strip}
	{if !empty($PICKIST_DEPENDENCY_DATASOURCE)}
		<input type="hidden" name="picklistDependency" value='{Vtiger_Util_Helper::toSafeHTML($PICKIST_DEPENDENCY_DATASOURCE)}' />
	{/if}

	<div name='editContent'>
		{if $DUPLICATE_RECORDS}
			<div class="fieldBlockContainer duplicationMessageContainer">
				<div class="duplicationMessageHeader"><b>{vtranslate('LBL_DUPLICATES_DETECTED', $MODULE)}</b></div>
				<div>{getDuplicatesPreventionMessage($MODULE, $DUPLICATE_RECORDS)}</div>
			</div>
		{/if}
		{foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$RECORD_STRUCTURE name=blockIterator}
			{if $BLOCK_FIELDS|@count gt 0}
				<div class='fieldBlockContainer' data-block="{$BLOCK_LABEL}">
					<h4 class='fieldBlockHeader'>{vtranslate($BLOCK_LABEL, $MODULE)}</h4>
					<hr>
					<table class="table table-borderless">
						<tr>
							{assign var=COUNTER value=0}
							{foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS name=blockfields}
								{assign var="isReferenceField" value=$FIELD_MODEL->getFieldDataType()}
								{assign var="refrenceList" value=$FIELD_MODEL->getReferenceList()}
								{assign var="refrenceListCount" value=count($refrenceList)}
								{if $FIELD_MODEL->isEditable() eq true}
									{if $FIELD_MODEL->get('uitype') eq "19"}
										{if $COUNTER eq '1'}
											<td></td><td></td></tr><tr>
											{assign var=COUNTER value=0}
										{/if}
									{/if}
									{if $COUNTER eq 2}
									</tr><tr>
										{assign var=COUNTER value=1}
									{else}
										{assign var=COUNTER value=$COUNTER+1}
									{/if}
									<td class="fieldLabel alignMiddle">
										{if $isReferenceField eq "reference"}
											{if $refrenceListCount > 1}
												{assign var="DISPLAYID" value=$FIELD_MODEL->get('fieldvalue')}
												{assign var="REFERENCED_MODULE_STRUCTURE" value=$FIELD_MODEL->getUITypeModel()->getReferenceModule($DISPLAYID)}
												{if !empty($REFERENCED_MODULE_STRUCTURE)}
													{assign var="REFERENCED_MODULE_NAME" value=$REFERENCED_MODULE_STRUCTURE->get('name')}
												{/if}
												<select style="width: 140px;" class="select2 referenceModulesList">
													{foreach key=index item=value from=$refrenceList}
														<option value="{$value}" {if $value eq $REFERENCED_MODULE_NAME} selected {/if}>{vtranslate($value, $value)}</option>
													{/foreach}
												</select>
											{else}
												{vtranslate($FIELD_MODEL->get('label'), $MODULE)}
											{/if}
										{else if $FIELD_MODEL->get('uitype') eq "83"}
											{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE) COUNTER=$COUNTER MODULE=$MODULE}
											{if $TAXCLASS_DETAILS}
												{assign 'taxCount' count($TAXCLASS_DETAILS)%2}
												{if $taxCount eq 0}
													{if $COUNTER eq 2}
														{assign var=COUNTER value=1}
													{else}
														{assign var=COUNTER value=2}
													{/if}
												{/if}
											{/if}
										{else}
											{if $MODULE eq 'Documents' && $FIELD_MODEL->get('label') eq 'File Name'}
												{assign var=FILE_LOCATION_TYPE_FIELD value=$RECORD_STRUCTURE['LBL_FILE_INFORMATION']['filelocationtype']}
												{if $FILE_LOCATION_TYPE_FIELD}
													{if $FILE_LOCATION_TYPE_FIELD->get('fieldvalue') eq 'E'}
														{vtranslate("LBL_FILE_URL", $MODULE)}&nbsp;<span class="redColor">*</span>
													{else}
														{vtranslate($FIELD_MODEL->get('label'), $MODULE)}
													{/if}
												{else}
													{vtranslate($FIELD_MODEL->get('label'), $MODULE)}
												{/if}
											{else}
												{vtranslate($FIELD_MODEL->get('label'), $MODULE)}
											{/if}
										{/if}
										&nbsp;{if $FIELD_MODEL->isMandatory() eq true} <span class="redColor">*</span> {/if}
									</td>
									{if $FIELD_MODEL->get('uitype') neq '83'}
										<td class="fieldValue" {if $FIELD_MODEL->getFieldDataType() eq 'boolean'} style="width:25%" {/if} {if $FIELD_MODEL->get('uitype') eq '19'} colspan="3" {assign var=COUNTER value=$COUNTER+1} {/if}>
											{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE)}
										</td>
									{/if}
								{/if}
							{/foreach}
							{*If their are odd number of fields in edit then border top is missing so adding the check*}
							{if $COUNTER is odd}
								<td></td>
								<td></td>
							{/if}
						</tr>
					</table>
				</div>
			{/if}
		{/foreach}
	</div>

    {if $MODULE eq 'JD' and $RECORD neq ''}
		<div class="fieldBlockContainer">
			<h4 class="fieldBlockHeader">Tasks List</h4><hr>
				<table class="table table-borderless addtasktbl">
					<tr>
						<input type="hidden" id="task_id" name="task_id" value="">
						<td width="10%">Description</td>
						<td><textarea rows="3" id="task_desc" class="inputElement textAreaElement col-lg-12 " name="task_desc" value=""></textarea></td>
						<td><input style="margin-top: 35px;" type="button" name="savetask" id="savetask" value="Save"/></td>
					</tr>
				</table>
					<table  style="margin-left: 5px; width: 100%;{if count($TASK_LIST) eq 0}display: none;{/if}" class="listview-table tasklisttbl">
						<tr style=" font-weight: bold;height:30px;border: 1px solid black;width: 100%;">
							<td style="width: 3%;border: 1px solid black;">Task ID</td>
							<td style="border: 1px solid black;">Task Description</td>
							<td style="border: 1px solid black;width: 110px;">Action</td >
						</tr>
						{foreach from=$TASK_LIST key=TASK item=TASK_VALUE}
							<tr data-id="{$TASK_VALUE.task_id}" data-desc="{$TASK_VALUE.task_description}" data-name="{$TASK_VALUE.task_name}" style="height:30px;border: 1px solid black;width: 100%;">
								<td style="border: 1px solid black;">{$TASK}</td>
								<td style="border: 1px solid black;">{$TASK_VALUE.task_description}</td>
								<td>
									<input data-id="{$TASK_VALUE.task_id}" type="button" onclick="editTask(this);" value="Edit">
									<input style="margin-left: 4px;" data-id="{$TASK_VALUE.task_id}" type="button" onclick="deleteTask(this);" value="Delete">
								</td>
							</tr>
						{/foreach}
					</table>
		</div>
    {/if}
{/strip}
{literal}
<script type="text/javascript">
	//Edit function
   function editTask(elem) {
       var element = jQuery(elem);
       var tr = element.closest('tr');
	   var task_id = tr.data('id');
	   var task_description = tr.data('desc');
	   $("#task_id").val(task_id);
	   $("#task_desc").val(task_description);
   }
//Delete function
   function deleteTask(elem) {
       var element = jQuery(elem);
       var tr = element.closest('tr');
       var task_id = tr.data('id');
       var record = $("[name ='record']").val();
       app.helper.showProgress();
       var params = {
           'module': 'JD',
           'record': record,
           'task_id':task_id,
           'action': 'Commons',
           'mode': 'deleteTaskList'
       }
       app.request.post({data: params}).then(
           function(err, data) {
               app.helper.hideProgress();
               $("#task_desc").val('');
               if(data.length != ''){
                   var taskListTable = $(".tasklisttbl");
                   taskListTable.show();
                   taskListTable.html(data);
               }
           });
   }
</script>
{/literal}