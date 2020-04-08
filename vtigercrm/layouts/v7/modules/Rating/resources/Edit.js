/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
Vtiger_Edit_Js("Rating_Edit_Js",{},{

	fillFormularRanking: function () {
		var ranking1_form = "((cf_2/cf_1)*100)-100<-10";
		var ranking2_form = "((cf_2/cf_1)*100)-100>=-5";
		var ranking3_form = "((cf_2/cf_1)*100)-100>=0";
		var ranking4_form = "((cf_2/cf_1)*100)-100>=15";

		if(jQuery("#Rating_editView_fieldName_ranking_1").val()==''){
            jQuery("#Rating_editView_fieldName_ranking_1").val(ranking1_form);
		}
        if(jQuery("#Rating_editView_fieldName_ranking_2").val()==''){
            jQuery("#Rating_editView_fieldName_ranking_2").val(ranking2_form);
		}
        if(jQuery("#Rating_editView_fieldName_ranking_3").val()==''){
            jQuery("#Rating_editView_fieldName_ranking_3").val(ranking3_form);
        }
        if(jQuery("#Rating_editView_fieldName_ranking_4").val()==''){
            jQuery("#Rating_editView_fieldName_ranking_4").val(ranking4_form);
        }

    },

	registerBasicEvents: function (container) {
		this._super(container);
		this.fillFormularRanking();
		jQuery(document).ready(function () {
			var ratinWeight = jQuery("[name='rating_weight']");
			var tdWeight = ratinWeight.closest('td');
            tdWeight.find('.createReferenceRecord').remove();

        });
	}
})