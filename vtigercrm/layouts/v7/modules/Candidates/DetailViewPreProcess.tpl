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
{include file="modules/Vtiger/partials/Topbar.tpl"}
{if $MODULE eq 'Candidates'}
    <literal>
        <style type="text/css">
            * {
                margin: 0;
                padding: 0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            #progress-bar {
                width:100%;
                margin:1rem auto;
                padding:1rem;
            }
            #line {
                text-align: center;
                font-size: 0;
            }
            #line li {
                font-size:1.5rem;
                list-style: none;
                display: inline-block;
                width:10%;
                position: relative;
            }
            #line li.hire {
                text-decoration: none;
                font-weight: bold;
                font-size:1.5rem;
                list-style: none;
                display: inline-block;
                width:1%;
                position: relative;
            }
            #line li.pro-stage {
                border-bottom:2px solid lightgrey;
            }
            .pro-stage a {
                text-decoration: none;
                color:black;
                font-weight: bold;
                line-height:1.5rem;
                position: relative;
                text-align: left;
            }
            .pro-stage a i{
                margin-left: -16px;
            }
            .text{
                max-width: 30px !important;
                margin-left: -12px;
                text-align: center !important;
            }
            .pro-stage a:before {
                position: absolute;
                content:"";
                height:10px;
                left:0;
                top:111%;
            }
            .pro-stage.complet a:before {
                width:100%;
                background-color: green;
            }
            .pro-stage.partials a:before {
                width:66%;
                background-color: orange;
            }
            .pro-stage a span {
                position: relative;
                display: inline-block;
                width:104%;
                height:100%;
                padding-bottom:11px;
            }
            .pro-stage a span:after {
                position: absolute;
                left:100%;
                top:100%;
                transform:translate(-50%,-50%);
                content:" ";
                width:20px;
                height: 20px;
                background-color: white;
                border-radius:50%;
                border:4px solid lightgrey;
                z-index:1;
            }
            li:first-child.pro-stage a span:before {
                position: absolute;
                left:0;
                top:100%;
                transform:translate(-50%,-50%);
                content:" ";
                width:20px;
                height: 20px;
                background-color: white;
                border-radius:50%;
                border:4px solid lightgrey;
            }
            li.pro-stage.complet a span:after,
            li.pro-stage.complet a span:before {
                background-color: lightgreen;
                border-color:green;
            }
            #candidate_row{
                height: 80px;
            }
            #candidate_tag{
                width: 10%;
            }
            #candidate_bar{
                width: 80%;
            }
            @media only screen and (max-width: 768px) {
                #candidate_tag{
                    position: absolute;
                    width: auto;
                }
                #candidate_bar{
                    position: absolute;
                }
                div.tooltip-inner{
                    width: 200px !important;
                }
            }
        </style>
    </literal>
{/if}

<div class="container-fluid app-nav">
    <div class="row">
        {include file="partials/SidebarHeader.tpl"|vtemplate_path:$MODULE}
        {include file="ModuleHeader.tpl"|vtemplate_path:$MODULE}
    </div>
</div>
</nav>    
     <div id='overlayPageContent' class='fade modal overlayPageContent content-area overlay-container-60' tabindex='-1' role='dialog' aria-hidden='true'>
        <div class="data">
        </div>
        <div class="modal-dialog">
        </div>
    </div>
<div class="container-fluid main-container">
    <div class="row">
        <div id="modnavigator" class="module-nav detailViewModNavigator clearfix">
            <div class="hidden-xs hidden-sm mod-switcher-container">
                {include file="partials/Menubar.tpl"|vtemplate_path:$MODULE}
            </div>
        </div>
        <div class="detailViewContainer viewContent clearfix">
            <div class="col-sm-12 col-xs-12 content-area">
                {include file="DetailViewHeader.tpl"|vtemplate_path:$MODULE}
                <div class="row" {if $MODULE eq 'Candidates'} id="candidate_row" {/if}>
                    <div class="col-lg-6 col-md-6 col-sm-6" id="candidate_tag">
                        {include file="DetailViewTagList.tpl"|vtemplate_path:$MODULE}
                    </div>
                    {if $MODULE eq 'Candidates' and $SHOW_PROGRESS}
                        <div class="detailview-header-block" style="padding-top: 0px;" id="candidate_bar">
                            <nav id="progress-bar">
                                <ul id="line">
                                    {foreach from=$CANDI_ACTIONS item=CANDI_ACTION}
                                        <li class="{if $CANDI_ACTION neq 'Hire'}pro-stage{else}hire{/if} {if in_array($CANDI_ACTION,$BEFORE_ACTIONS)}complet{/if} {if in_array($CANDI_ACTION,$AFTER_ACTIONS)}partials{/if}"><a><span id="{str_replace(' ','',strtolower($CANDI_ACTION))}" data-action="{str_replace(' ','',strtolower($CANDI_ACTION))}" data-toggle="tooltip" title="{array_search($CANDI_ACTION,$TIPS)}"><div class="text">{$CANDI_ACTION}</div></span></a></li>
                                    {/foreach}
                                </ul>
                            </nav>
                            <nav></nav>
                        </div>
                    {/if}
                </div>
            </div>{*closing div of detailviewHeader*}
                <div class="detailview-content container-fluid">
                    <input id="recordId" type="hidden" value="{$RECORD->getId()}" />
                    {include file="ModuleRelatedTabs.tpl"|vtemplate_path:$MODULE}
                    <div class="details row" style="margin-top:10px;">
