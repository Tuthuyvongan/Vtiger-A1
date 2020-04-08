/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
Vtiger_Edit_Js("Leave_Edit_Js",{},{

    hideActionPickList: function () {
        var recordId = jQuery("[name = 'record']").val();
        if(recordId==''){
            jQuery("#leave_action_lbl").hide();
            jQuery("#leave_action").hide();
        }
        var roleName = jQuery("[name='roleName']").val();
		var hr_shows = new Array('Vice President','HR','hr','hR','Hr');
        if(!jQuery.inArray(roleName, hr_shows)){
            var leaveAction = jQuery("[name='hrm_leave_action']").val();
            if(leaveAction == '' || leaveAction == 'Reject'){
                jQuery("#leave_hr_lbl").hide();
                jQuery("#leave_hr").hide();
            }
        }
    },
    leaveActionChange: function () {
        jQuery("[name='hrm_leave_action']").on('change',function () {
            var leave_action_value = $(this).val();
            var leaveNote = jQuery("#Leave_editView_fieldName_note");
            var trNote = leaveNote.closest('tr');
            if(leave_action_value != ''){
                trNote.show();
            }else {
                trNote.hide();
            }
        });
    },
    leaveEmployeeChange: function () {

        var employInput = jQuery("[name = 'employ_id']");
        jQuery("#Leave_editView_fieldName_employ_id_select").on('click',function () {
            jQuery("[name='employ_id']").trigger('click');
        });

        jQuery("#Leave_editView_fieldName_partial_day").on('change',function () {
            var leaveChange = $(this).val();
            var leaveBlanExist = jQuery("[name='leaveBalance']").val();
            var currentAction = jQuery("[name='currentAction']").val();
            var newBlance = 0;
            if(currentAction != 'Reject'){
                newBlance = leaveBlanExist-leaveChange;
            }else {
                newBlance = leaveBlanExist;
            }
            var Blance = newBlance.toFixed(2);
            jQuery("#leave_text").text('');
            jQuery("#leave_text").text('Leave balance: '+Blance);
        });
    },
    registerReferenceSelectionEvent : function(container) {
        var thisInstance = this;
        jQuery('input[name="employ_id"]', container).on(Vtiger_Edit_Js.referenceSelectionEvent,function(e,data){
            thisInstance.referenceSelectionEventHandler(data, container);
        });
    },
    referenceSelectionEventHandler :  function(data, container) {
        var thisInstance = this;
        thisInstance.enterLeaveBalance();
    },
    enterLeaveBalance: function () {
        var employValue =  jQuery('input[name="employ_id"]').val();
        var mode = 'changeEmployValue';
        var params = {
            'module':'Leave',
            'action':'Commons',
            'mode':mode,
            'employ_value':employValue
        };
        app.request.post({data: params}).then(
            function(err, result) {
                jQuery("[name='leaveBalance']").val(result);
                var partial = jQuery("#Leave_editView_fieldName_partial_day").val();
                var res = result - partial;
                res = res.toFixed(2);
                app.helper.hideProgress();
                jQuery("#leave_text").text('');
                jQuery("#leave_text").text('Leave balance: '+res);
            });
    },

	registerBasicEvents: function (container) {
		this._super(container);
		this.hideActionPickList();
		this.leaveActionChange();
		this.leaveEmployeeChange();
		this.registerReferenceSelectionEvent();

		jQuery(document).ready(function () {
            var leaveAction = jQuery("[name='currentAction']").val();
            var module = jQuery("[name = 'module']").val();
            var record = jQuery("[name = 'record']").val();
            var popupReferenceModuleElem = jQuery("[name='popupReferenceModule']");
            var popupReferenceModule = jQuery("[name='popupReferenceModule']").val();
            var tdReference = popupReferenceModuleElem.closest('td');
            if(module=='Leave' && popupReferenceModule=='Employee' && leaveAction == ''){
                var employ_id = jQuery("[name='employId']").val();
                var employ_name = jQuery("[name='employName']").val();
                if(record ==''){
                    tdReference.find(".sourceField").val(employ_id);
                    tdReference.find("[name='employ_id_display']").val(employ_name);
                }
                tdReference.find(".createReferenceRecord").remove();
            }else {
                tdReference.find('.clearReferenceSelection').remove();
                tdReference.find("[name='employ_id_display']").attr('readonly','readonly');
                tdReference.find(".input-group-addon").removeClass('relatedPopup');
                tdReference.find(".createReferenceRecord").remove();
            }

            if(leaveAction != ''){
                jQuery("[name='hrm_leave_type']").attr('readonly','readonly');
                jQuery("[name='assigned_user_id']").attr('readonly','readonly');
                jQuery("[name='hrm_leave_action']").attr('readonly','readonly');
                jQuery("#Leave_editView_fieldName_partial_day").attr('readonly','readonly');

                if(jQuery("#Leave_editView_fieldName_note").val() == ''){
                    jQuery("#Leave_editView_fieldName_note").hide();
                    var trNote = jQuery("#Leave_editView_fieldName_note").closest('tr');
                    trNote.hide();
                }else {
                    jQuery("#Leave_editView_fieldName_note").attr('readonly','readonly');
                }
                var leaveTodate = jQuery("#Leave_editView_fieldName_to_date");
                leaveTodate.attr('readonly', true);
                var tdTodate = leaveTodate.closest('.fieldValue');
                tdTodate.find('.input-group-addon').remove();
                var leaveFromdate = jQuery("#Leave_editView_fieldName_from_date");
                leaveFromdate.attr('readonly', true);
                var tdFromdate = leaveFromdate.closest('.fieldValue');
                tdFromdate.find('.input-group-addon').remove();
                var hrValue = jQuery('[name="hr"]').val();
                if(hrValue != ''){
                    jQuery('[name="hr"]').attr('readonly','readonly');
                }
            }

            if(leaveAction == ''){
                var leaveNote = jQuery("#Leave_editView_fieldName_note");
                var trNote = leaveNote.closest('tr');
                trNote.hide();
                jQuery("#leave_hr_lbl").hide();
                jQuery("#leave_hr").hide();
            }

            var leaveBlanExist = jQuery("[name='leaveBalance']").val();
            var partialday = jQuery("#Leave_editView_fieldName_partial_day").val();
            var newBlance = 0;
            if(leaveAction != 'Reject'){
                newBlance = leaveBlanExist-partialday;
            }else {
                newBlance = leaveBlanExist;
                jQuery("#leave_hr_lbl").hide();
                jQuery("#leave_hr").hide();
            }
            var Blance = newBlance.toFixed(2);
            jQuery("#leave_text").text('');
            jQuery("#leave_text").text('Leave balance: '+Blance);

            var showAction = jQuery('[name="showAction"]').val();
            if(showAction == ''){
                jQuery("#leave_action_lbl").hide();
                jQuery("#leave_action").hide();
            }
        });
	}
})