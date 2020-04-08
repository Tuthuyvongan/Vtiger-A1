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

    {if $MODULE eq 'SalaryComponent' and $RECORD neq ''}
		<div class="fieldBlockContainer">
			<h4 class="fieldBlockHeader">Salary Change</h4><hr>
				<table class="table table-borderless">
					<tbody>
					<td class="fieldLabel alignMiddle"></td>
					<td class="fieldValue" style="width: 100% !important;">
						<table class="listview-table" style="width: 81% !important;">
							<thead>
							<tr>
							<td></td>
								<td>Experience</td>
								<td>Salary</td>
								<td>Qualification</td>
								<td>Management Scale</td>
								<td>Time To Review</td>
								<td>Level 1 (2.6 -3)</td>
								<td>Level 2 (3.1 -3.6)</td>
								<td>Level 3 (> 3.6)</td>
								<td style="width: 110px !important;"></td>

							</tr>
							<tr>
							<td></td>
								<input type="hidden" id="line_id" name="line_id" value="">
								<td><input type="text" id="experience" name="experience" value=""></td>
								<td><input type="text" id="salary" name="salary" value=""></td>
								<td><input type="text" id="qualification" name="qualification" value=""></td>
								<td><input type="text" id="management_scale" name="management_scale" value=""></td>
								<td><input type="text" id="time_to_review" name="time_to_review" value=""></td>
								<td><input type="text" id="level1" name="level1" value=""></td>
								<td><input type="text" id="level2" name="level2" value=""></td>
								<td><input type="text" id="level3" name="level3" value=""></td>
								<td style="width: 110px !important;"><input type="button" name="save_salary_ref" id="save_salary_ref" value="Save"/></td>

							</tr>
							<tr>
								<td></td>
								<td><span id="check_all" style="color: red;"></td>
								<td><span id="salary_text" style="color: red;"></span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</thead>
							<tbody class="listview-table salarylisttbl">
							<tr>
								<td colspan="10"></td>
							</tr>

							<tr style="font-weight: bold;border: 1px solid black !important;">
								<td align="center" style="border: 1px solid black !important;">Id</td>
								<td align="center" style="border: 1px solid black !important;">Experience</td>
								<td align="center" style="border: 1px solid black !important;width: 110px;">Salary</td >
								<td align="center" style="border: 1px solid black !important;width: 110px;">Qualification</td >
								<td align="center" style="border: 1px solid black !important;width: 110px;">Management Scale</td >
								<td align="center" style="border: 1px solid black !important;width: 110px;">Time To Review </br>(Months)</td>
								<td align="center" align="center" style="border: 1px solid black !important;;width: 110px;">Level 1</br> (2.6 -3)</td>
								<td align="center" align="center" style="border: 1px solid black !important;width: 110px;">Level 2</br> (3.1 -3.6)</td>
								<td align="center" align="center" style="border: 1px solid black !important;width: 110px;">Level 3</br> (> 3.6)</td>
								<td align="center" style="border: 1px solid black;width: 110px !important;">Action</td >
							</tr>
							{foreach from=$SALARY_REF key=TASK item=SALARY_VALUE}
								<tr data-id="{$SALARY_VALUE.id}" data-experience="{$SALARY_VALUE.experience}" data-salary="{$SALARY_VALUE.salary}" data-qualification="{$SALARY_VALUE.qualification}" data-management_scale="{$SALARY_VALUE.management_scale}" data-time_to_review="{$SALARY_VALUE.time_to_review}" data-level1="{$SALARY_VALUE.level1}" data-level2="{$SALARY_VALUE.level2}" data-level3="{$SALARY_VALUE.level3}" style="border: 1px solid black;">
									<td align="center" style="border: 1px solid black !important;">{$TASK}</td>
									<td align="center" style="border: 1px solid black !important;">{html_entity_decode($SALARY_VALUE.experience)}</td>
									<td align="center" style="border: 1px solid black !important;">{number_format($SALARY_VALUE.salary,0,'.',',')}</td>
									<td align="center" style="border: 1px solid black !important;">{$SALARY_VALUE.qualification}</td>
									<td align="center" style="border: 1px solid black !important;">{$SALARY_VALUE.management_scale}</td>
									<td align="center" style="border: 1px solid black !important;">{$SALARY_VALUE.time_to_review}</td>
									<td align="center" style="border: 1px solid black !important;">{$SALARY_VALUE.level1}</td>
									<td align="center" style="border: 1px solid black !important;">{$SALARY_VALUE.level2}</td>
									<td align="center" style="border: 1px solid black !important;">{$SALARY_VALUE.level3}</td>
									<td align="center" style="border: 1px solid black !important;white-space: nowrap;">
										<input data-id="{$SALARY_VALUE.id}" type="button" onclick="editTask(this);" value="Edit">
										<input style="margin-left: 4px;" data-id="{$SALARY_VALUE.id}" type="button" onclick="deleteTask(this);" value="Delete">
									</td>
								</tr>
							{/foreach}

							</tbody>
						</table>
					</td>
					</tbody>
				</table>
    {/if}
{/strip}
{literal}
<script type="text/javascript">
   function editTask(elem) {
       var element = jQuery(elem);
       var tr = element.closest('tr');
	   var line_id = tr.data('id');
	   var experience = tr.data('experience');
	   var qualification = tr.data('qualification');
	   var management_scale = tr.data('management_scale');
	   var time_to_review = tr.data('time_to_review');
	   var salary = tr.data('salary');
       var level1 = tr.data('level1');
       var level2 = tr.data('level2');
       var level3 = tr.data('level3');
	   $("#line_id").val(line_id);
	   $("#experience").val(experience);
	   $("#qualification").val(qualification);
	   $("#management_scale").val(management_scale);
	   $("#time_to_review").val(time_to_review);
	   $("#salary").val(salary);
	   $("#level1").val(level1);
	   $("#level2").val(level2);
	   $("#level3").val(level3);
   }

   function deleteTask(elem) {
       var element = jQuery(elem);
       var tr = element.closest('tr');
       var line_id = tr.data('id');
       var record = $("[name ='record']").val();
       app.helper.showProgress();
       var params = {
           'module': 'SalaryComponent',
           'record': record,
           'line_id':line_id,
           'action': 'Commons',
           'mode': 'deleteSalaryList'
       }
       app.request.post({data: params}).then(
           function(err, data) {
               app.helper.hideProgress();
               if(data.length != ''){
                   var taskListTable = $(".salarylisttbl");
                   taskListTable.show();
                   taskListTable.html(data);
               }
           });
   }
</script>
{/literal}