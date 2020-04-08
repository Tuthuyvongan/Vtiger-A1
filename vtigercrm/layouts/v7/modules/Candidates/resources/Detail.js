/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Vtiger_Detail_Js("Candidates_Detail_Js", {}, {

    hideDetailBlock: function () {
        jQuery("[data-block='LBL_SHORTLIST']").css("display", "none");
        jQuery("[data-block='LBL_REJECT']").css("display", "none");
        jQuery("[data-block='LBL_SCHEDULE_INTERVIEW']").css("display", "none");
        jQuery("[data-block='LBL_MARK_INTERVEW_PASSED']").css("display", "none");
        jQuery("[data-block='LBL_MARK_INTERVEW_FAILED']").css("display", "none");
        jQuery("[data-block='LBL_OFFER_JOB']").css("display", "none");
        jQuery("[data-block='LBL_HIRE']").css("display", "none");
        jQuery("#Candidates_detailView_fieldValue_candidate_status").hide();
        jQuery("#Candidates_detailView_fieldLabel_candidate_status").hide();
    },

	showHideBlockAndField: function () {
        var thisInstance = this;
        var recordId = jQuery("[name = 'record']").val();
        var flag = jQuery("[name = 'flag']").val();

        if(flag==''){
        	thisInstance.hideDetailBlock();
		}

        if(recordId !='' && flag==''){
            thisInstance.hideDetailBlock();
            var action_remove = ['Schedule Interview','Mark Interview Passed','Mark Interview Failed','No Action'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
        }

        if(flag =='Shortlist'){
        	thisInstance.hideDetailBlock();
            jQuery("[data-block='LBL_SHORTLIST']").css("display", "block");
		}
        if(flag =='Schedule Interview'){
            thisInstance.hideDetailBlock();
            jQuery("[data-block='LBL_SCHEDULE_INTERVIEW']").css("display", "block");
		}
        if(flag =='Reject'){
            thisInstance.hideDetailBlock();
            jQuery("[data-block='LBL_REJECT']").css("display", "block");
		}
        if(flag =='Mark Interview Passed'){
            thisInstance.hideDetailBlock();
		}
        if(flag =='Offer Job'){
            thisInstance.hideDetailBlock();
            jQuery("[data-block='LBL_OFFER_JOB']").css("display", "block");
        }
        if(flag =='Hire'){
            thisInstance.hideDetailBlock();
            jQuery("[data-block='LBL_MARK_INTERVEW_PASSED']").css("display", "block");
        }
    },

	registerEvents: function () {
		var form = this.getForm();
		this._super();
		this.showHideBlockAndField();
        jQuery(document).ready(function () {
            jQuery("#Candidates_detailView_fieldValue_candidate_status").hide();
            jQuery("#Candidates_detailView_fieldLabel_candidate_status").hide();
            var tdStatus =jQuery("#Candidates_detailView_fieldValue_status");
            tdStatus.find('.action').remove();
        });
	}
})