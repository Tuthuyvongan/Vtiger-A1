{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
{* modules/Vtiger/views/Index.php *}

{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}

<div id="hrm_ql">
    <span id="ql_label"><b><h5>Quick Launch</h5></b></span><br/>
    <div class="quick_menu">
    {foreach from=$HRM_MENUS item=HRM_MENU}
        {if !in_array($HRM_MENU,$SHOW_MODULES)}{continue}{/if}
    <a href="index.php?module={$HRM_MENU}&view=List&app=TOOLS"><div id="employ_btn" class="btn addButton btn-default module-buttons">{$HRM_MENU}</div></a>
    {/foreach}
    {*<a href="index.php?module=Reports&view=CustomReport"><div id="employ_btn" class="btn addButton btn-default module-buttons">KPI Report</div></a>*}
    </div>
</div>
<div id="hrm_widget" class="dashBoardTabContainer">
    <div class="dashBoardTabContents clearfix">
        <div class="gridster_75 ready">
            <ul>
                {foreach key=ACTS item=ACTIVITIE from=$ACTIVITIES}
                    <li class="dashboardWidget"
                        {if $ACTS eq 'Employee'}{/if}
                        {if $ACTS eq 'KPI'}{/if}
                        {if $ACTS eq 'Candidates'}{/if}
                        {if $ACTS eq 'Leave'}{/if}>
                        <div class="dashboardWidgetHeader clearfix">
                            <div class="title">
                                <div class="dashboardTitle" title="Overdue Activities"><b>{$ACTS}</b></div>
                            </div>
                        </div>
                        {include file="partials/CalendarActivitiesContents.tpl"|@vtemplate_path:$MODULE_NAME}
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>

{literal}

<style>

.module-action-content{
	display: none;
}
       
#hrm_ql{
  border: 1px solid #ccc;
  margin: 30px 15px 0 40px;
}
#hrm_ql .quick_menu{
  padding: 0 15px 15px;
}

#ql_label{
        margin-left: 20px;
        text-align: center;
        display: block;
        width: 125px;
        height: 30px;
        margin-top: -20px;
        position: absolute;
        background: white;
}

#hrm_widget{
  width:100%;
  margin-top: 30px
}
#hrm_widget ul{
  display: block;
  overflow: hidden;
  padding-right: 15px;
}
#hrm_widget .dashboardWidget{
	border: 1px solid #ccc;
  width: 49%;
  position: unset;
  float: left;
  margin-left: 1%;
  margin-bottom: 30px;
}

#hrm_widget .dashboardWidgetHeader
{
	background: #eee;
	padding: 10px;
	border-bottom:1px solid #ddd;
	margin-bottom:5px;
}

#hrm_widget .dashBoardWidgetFooter{
  position: unset;
}
#hrm_widget li:nth-child(2n+1) {
  margin-left: 0;
  margin-right: 1%;
}
@media only screen and (max-width: 1023px) {
  #hrm_widget .dashboardWidget{
    width: 100%;
    margin-bottom:30px;
    margin-left: 0;
    overflow-x: scroll;
    overflow-y: scroll;
  }
  #hrm_widget li:nth-child(2n+1) {
    margin-bottom: 30px;
  }
}

</style>
{/literal}
