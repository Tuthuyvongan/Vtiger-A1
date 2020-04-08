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
	{include file="DetailViewFullContents.tpl"|vtemplate_path:$MODULE}
    {if $MODULE eq 'JD'}
		<div class="fieldBlockContainer">
			<h4 class="fieldBlockHeader" style="padding-left: 20px;">Tasks List</h4><hr>
			{if count($TASK_LIST) gt 0}
			<table style="margin-left: 20px;" class="tasklisttbl">
				<tr style=" font-weight: bold;height:30px;border-bottom: 1px solid black;border-top: solid 1px black;">
					<td style="width: 3%;">Task ID</td>
					<td>Task Description</td>
				</tr>
                {foreach from=$TASK_LIST key=TASK item=TASK_VALUE}
					<tr style="border-bottom: 1px solid black;border-top: solid 1px black;">
						<td>{$TASK_VALUE.task_id}</td>
						<td>{$TASK_VALUE.task_description}</td>
					</tr>
                {/foreach}
			</table>
            {/if}
		</div>
    {/if}
{/strip}