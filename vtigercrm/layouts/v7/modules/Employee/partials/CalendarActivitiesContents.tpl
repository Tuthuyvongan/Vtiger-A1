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

<table class="table listview-table">
	<thead class="overflow-y">
		<tr class="size-row">
			<th class="floatThead-col"></th>
			<th class="floatThead-col">
				<b>{if $ACTS eq 'Employee' or $ACTS eq 'Candidates'}First Name{elseif $ACTS eq 'KPI'}KPI Name{else}Employee Name{/if}</b>
			</th>
			<th class="floatThead-col">
				<b>{if $ACTS eq 'Employee' or $ACTS eq 'Candidates'}Last Name{elseif $ACTS eq 'KPI'}KPI Status{else}Leave Type{/if}</b>
			</th>
			<th class="floatThead-col">
				<b>{if $ACTS eq 'Employee' or $ACTS eq 'Candidates'}Email{elseif $ACTS eq 'KPI'}Department{else}Partials day{/if}</b>
			</th>
			<th class="floatThead-col">
				<p class='pull-right'>Updated</p>
			</th>
		</tr>
	</thead>
	{foreach from=$ACTIVITIE key=INDEX item=ACTIVITY}

	<tbody class="overflow-y">
		<tr class="listViewEntries">
			<td class="listViewEntryValue" style="width: 50px !important;">
				{if $ACTIVITY->get('activitytype') == 'Task'}
					<span><i class="entryIcon vicon-task"></i></span>
				{else}
					<span><i class="entryIcon vicon-meeting"></i></span>
				{/if}
			</td>

			<td class="listViewEntryValue">
				<a href="{$ACTIVITY->getDetailViewUrl()}">{if $ACTS eq 'Employee' or $ACTS eq 'Candidates'}{$ACTIVITY->get('firstname')}{elseif $ACTS eq 'KPI'}{$ACTIVITY->get('kpi_name')}{else}{$ACTIVITY->get('employ_name')}{/if}</a>
			</td>
			<td class="listViewEntryValue">
				<a href="{$ACTIVITY->getDetailViewUrl()}">{if $ACTS eq 'Employee' or $ACTS eq 'Candidates'}{$ACTIVITY->get('lastname')}{elseif $ACTS eq 'KPI'}{$ACTIVITY->get('kpi_status')}{else}{$ACTIVITY->get('hrm_leave_type')}{/if}</a>
			</td>
			<td class="listViewEntryValue">
				<a href="{$ACTIVITY->getDetailViewUrl()}">{if $ACTS eq 'Employee' or $ACTS eq 'Candidates'}{$ACTIVITY->get('email')}{elseif $ACTS eq 'KPI'}{$ACTIVITY->get('kpi_department')}{else}{$ACTIVITY->get('partial_day')}{/if}</a>
			</td>
			<td class="listViewEntryValue">
				{assign var=START_DATE value=date('Y-m-d',strtotime($ACTIVITY->get('modifiedtime')))}
				{assign var=START_TIME value=date('H:i:s',strtotime($ACTIVITY->get('modifiedtime')))}

				{assign var=DUE_DATE value=$ACTIVITY->get('due_date')}
				{assign var=DUE_TIME value=$ACTIVITY->get('time_end')}
				<p class='pull-right'><small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString("$START_DATE $START_TIME")} {vtranslate('LBL_TO')} {Vtiger_Util_Helper::formatDateTimeIntoDayString("$DUE_DATE $DUE_TIME")}">{Vtiger_Util_Helper::formatDateDiffInStrings("$START_DATE $START_TIME")}</small></p>
			</td>
		</tr>
	</tbody>
	{/foreach}

</table>