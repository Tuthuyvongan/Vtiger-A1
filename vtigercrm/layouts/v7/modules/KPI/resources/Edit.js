/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
Vtiger_Edit_Js("KPI_Edit_Js",{},{

    getResultKpi: function (e) {
        var target = jQuery("#KPI_editView_fieldName_cf_01").val();
        var actual = jQuery("#KPI_editView_fieldName_cf_02").val();
        var thisInstance = this;
        var ranking_number = 0;
        var kpi_percent = (actual/target)*100-100;
        if(kpi_percent >= 10){
            ranking_number = 4;
        }else if(kpi_percent >= 0){
            ranking_number = 3;
        }else if(kpi_percent >=-10){
            ranking_number = 2;
        }else {
            ranking_number = 1;
        }
        jQuery("#ranking_text").text('The Ranking refer with this Target and Actual is: '+ranking_number);
        thisInstance.updatBonusFined();
    },

    showKpiResult: function () {
        var thisInstance = this;
        jQuery("#KPI_editView_fieldName_cf_01").live('change',function () {
            thisInstance.getResultKpi();
        });
        jQuery("#KPI_editView_fieldName_cf_02").live('change',function () {
            thisInstance.getResultKpi();
        });
    },

    showAllSelector: function () {
        jQuery(".fieldLabel").css('opacity', 1);
        jQuery("#KPI_editView_fieldName_cf_01").css('opacity', 1);
        jQuery("#KPI_editView_fieldName_cf_02").css('opacity', 1);
        jQuery("#KPI_editView_fieldName_cf_03").css('opacity', 1);
        jQuery("#KPI_editView_fieldName_cf_04").css('opacity', 1);
    },

    showHideFields: function () {
        var thisInstance = this;
        var kpiType = jQuery("select[name = 'kpi_type']").val();
        switch (kpiType){
            case 'Reviews':
                thisInstance.showAllSelector();
                jQuery("#KPI_editView_fieldName_cf_03").css('opacity',0);
                var tr = jQuery("#KPI_editView_fieldName_cf_03").closest('tr');
                tr.children('.fieldLabel:first').css('opacity',0);
                break;

            case 'Ticket Progress':
                thisInstance.showAllSelector();
                jQuery("#KPI_editView_fieldName_cf_04").css('opacity',0);
                var tr = jQuery("#KPI_editView_fieldName_cf_04").closest('tr');
                tr.find('.fieldLabel:eq(1)').css('opacity',0);
                break;

            default:
                thisInstance.showAllSelector();
                console.log("No fields hidden");
        }
    },

    updatBonusFined: function () {
        jQuery('#bonus_fined').text();
        //Todo something here
        var target = jQuery("[name='cf_01']").val();
        target = parseInt(target);
        var actual = jQuery("[name='cf_02']").val();
        actual = parseInt(actual);
        var kpi_type = jQuery("[name='kpi_type']").val();
        var bonus = 0;
        var fined = 0;
        var department = jQuery("[name='kpi_department']").val();
        if(department !='Service'){
            return;
        }
        switch (kpi_type) {
            case 'Ticket Support Opp':
                if (actual > target) {
                    bonus = actual * 60000;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                } else {
                    fined = -100000;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + fined.toLocaleString());
                }
                break;
            case 'Ticket Progress':
                if (actual > target || actual == target) {
                    bonus = (actual - target) * 30000;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                } else {
                    fined = (actual - target) * 30000;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + fined.toLocaleString());
                }
                break;
            case 'Renewal Client':
                if (actual > target || actual == target) {
                    bonus = actual * 5 * 22000 / 100;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                } else {
                    bonus = 0;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                }
                break;
            case 'Recurring Client':
                if (actual > target || actual == target) {
                    bonus = (actual - target) * 5 * 22000 / 100;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                } else {
                    fined = (actual - target) * 2 * 22000 / 100;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + fined.toLocaleString());
                }
                break;
            case 'Renewal Client':
                if (actual > target || actual == target) {
                    bonus = (actual - target) * 5 * 22000 / 100;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                } else {
                    fined = (actual - target) * 2 * 22000 / 100;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + fined.toLocaleString());
                }
                break;
            case 'Custom Progress':
                if (actual > target || actual == target) {
                    bonus = (actual * 8 * 22000) / 100;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                } else {
                    fined = (actual * (-3) * 22000) / 100;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + fined.toLocaleString());
                }
                break;
            case 'Sale Volume':
                if (actual > target || actual == target) {
                    bonus = (actual - target) * 10 * 22000 / 100;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                } else {
                    fined = 0;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + fined.toLocaleString());
                }
                break;
            case 'Reviews':
                var review_percent = (actual/target) * 100;
                if(review_percent >= 15){
                    bonus = actual * 50000;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                }else if (10 <= review_percent && review_percent < 15){
                    bonus = actual * 50000;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                }else if (0 < review_percent && review_percent < 10){
                    bonus = 100000;
                    jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                }
                break;
            default:
                if (kpi_type.indexOf('Opp') != -1) {
                    if ((actual > target) || (actual == target)) {
                        bonus = (actual - target) * 150000;
                        jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                    } else {
                        fined = (actual - target) * 100000;
                        jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + fined.toLocaleString());
                    }
                } else {
                    if (kpi_type.indexOf('Service') != -1) {
                        bonus = (actual * 8 * 22000 / 100);
                        jQuery('#bonus_fined').text('The Bonus-Fined refer with this Target and Actual is: ' + bonus.toLocaleString());
                    } else {
                        if (target > 0) {
                            var kpi_percent_value = (actual / target) * 100 - 100;
                            var bonus_fined_value = 0;
                            if (kpi_percent_value > 10) {
                                bonus_fined_value = (kpi_percent_value - 10) * 5000;
                            } else if (kpi_percent_value < 0) {
                                bonus_fined_value = kpi_percent_value * 10000;
                            } else {
                                bonus_fined_value = 0;
                            }
                            bonus_fined_value = bonus_fined_value.toLocaleString();
                            jQuery("#bonus_fined").text('The Bonus-Fined refer with this Target and Actual is: ' + bonus_fined_value);
                        }
                    }
                }
        }
    },

    registerBasicEvents: function (container) {
        var thisInstance = this;
        this._super(container);
        thisInstance.getResultKpi();
        thisInstance.updatBonusFined();
        jQuery(document).ready(function () {
			//Hide create Weight
            var moduleName = app.getModuleName();
            var kpi_weight_display = jQuery("#kpi_weight_display");
            var kpi_weight_td = kpi_weight_display.closest('td');
            kpi_weight_td.find('.createReferenceRecord').hide();

            var kpi_ranking_display = jQuery("#kpi_ranking_display");
            var kpi_ranking_td = kpi_ranking_display.closest('td');
            kpi_ranking_td.find('.createReferenceRecord').hide();
			
            jQuery("#KPI_editView_fieldName_cf_06").prop("readonly", true);
            jQuery("#KPI_editView_fieldName_cf_03").css('display','none');
            jQuery("#KPI_editView_fieldName_cf_04").css('display','none');
            var tr = jQuery("#KPI_editView_fieldName_cf_03").closest('tr');
            tr.children('.fieldLabel:first').css('display','none');
            tr.find('.fieldLabel:eq(1)').css('display','none');
            tr.css('display','none');

            var tr_ranking = '<tr><td></td><td id="ranking_text" style="color: red;"></td><td></td><td id="bonus_fined" style="color: red;"></td></tr>';
            var resultBlock = $('[data-block="LBL_KPI_RESULT"]');
            var table_result = resultBlock.find('table');
            table_result.append(tr_ranking);

            var target_value = jQuery("#KPI_editView_fieldName_cf_01").val();
            var actual_value = jQuery("#KPI_editView_fieldName_cf_02").val();
            var ranking_value = (actual_value/target_value)*100-100;
            if(target_value != '' && actual_value != ''){
                var default_ranking = '';
                if(ranking_value >= 10){
                    default_ranking = 4;
                    jQuery("#ranking_text").text('The Ranking refer with this Target and Actual is: '+default_ranking);
                }else if(ranking_value >= 0){
                    default_ranking = 3;
                    jQuery("#ranking_text").text('The Ranking refer with this Target and Actual is: '+default_ranking);
                }else if(ranking_value >=-10){
                    default_ranking = 2;
                    jQuery("#ranking_text").text('The Ranking refer with this Target and Actual is: '+default_ranking);
                }else {
                    default_ranking = 1;
                    jQuery("#ranking_text").text('The Ranking refer with this Target and Actual is: '+default_ranking);
                }
                thisInstance.updatBonusFined();
            }

            var tr_weight = '<tr><td></td><td id="weight_text" style="color: red;"></td></tr>';
            var expectationBlock = $('[data-block="LBL_EXPECT_ACTUAL"]');
            var table_expectation = expectationBlock.find('table');
            table_expectation.append(tr_weight);

            jQuery("[name='kpi_type']").on('change', function () {
                thisInstance.updatBonusFined();
                var kpi_id = jQuery("[name = record]").val();
                var type_name = jQuery("[name='kpi_type']").val();
                var mode = 'get_weight';
                var params = {
                    'module': 'KPI',
                    'record': kpi_id,
                    'type_name': type_name,
                    'mode': mode,
                    'action': 'Commons',
                    'mode': 'getRatingWeight'
                };
                app.request.post({data: params}).then(
                    function (err, data) {
                        var ojb = JSON.parse(data);
                        jQuery("#weight_text").text('');
                        if (data.length != '') {
                            jQuery("#weight_text").text(ojb.text);
                        }
                });
            });
            jQuery('[name="kpi_department"]').on('change',function () {
                jQuery('#bonus_fined').empty();
                var department = jQuery(this).val();
                if(department=='Service'){
                    thisInstance.updatBonusFined();
                }
            });
            jQuery('[name="cf_01"]').on('change',function () {
                thisInstance.updatBonusFined();
            });
            jQuery('[name="cf_02"]').on('change',function () {
                thisInstance.updatBonusFined();
            });
        });
    }
});