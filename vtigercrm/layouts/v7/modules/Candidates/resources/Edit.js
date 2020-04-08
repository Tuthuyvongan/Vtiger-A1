/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
Vtiger_Edit_Js("Candidates_Edit_Js",{},{

	hideBlock: function () {
        jQuery("[data-block='LBL_SHORTLIST']").css("display", "none");
        jQuery("[data-block='LBL_REJECT']").css("display", "none");
        jQuery("[data-block='LBL_SCHEDULE_INTERVIEW']").css("display", "none");
        jQuery("[data-block='LBL_MARK_INTERVEW_PASSED']").css("display", "none");
        jQuery("[data-block='LBL_MARK_INTERVEW_FAILED']").css("display", "none");
        jQuery("[data-block='LBL_OFFER_JOB']").css("display", "none");
        jQuery("[data-block='LBL_HIRE']").css("display", "none");
        jQuery("#candidate_status").css('display','none');
        jQuery("#can_stt_lbl").css('display','none');
    },

	hideActionPicklist: function () {
        jQuery("#can_action_lbl").hide();
        jQuery("#candidate_action").hide();
    },

    showActionPicklist: function () {
        jQuery("#can_action_lbl").show();
        jQuery("#candidate_action").show();
    },
	
	//Will have the mapping of address fields based on the modules
	hideBlockAndField: function () {
        var thisInstance = this;
		var recordId = jQuery("[name = 'record']").val();
		var flag = jQuery("[name = 'flag']").val();

		if(recordId == null || recordId ==''){
            thisInstance.hideBlock();
            thisInstance.hideActionPicklist();
		}

		if(recordId !='' && flag==''){
		    var current_action = jQuery("[name='current_action']").val();
		    if(current_action =='Back to active'){
                thisInstance.hideBlock();
                thisInstance.showActionPicklist();
                var action_remove = ['Mark Interview Passed','Mark Interview Failed','No Action','Hire','Back to active','Reject','Reject after shortlist','Reject after SI','Reject after MIP','Reject after OJ'];
                action_remove.forEach(function(item) {
                    $("select[name ='candidate_action'] option[value='" + item + "']").remove();
                });
            }else {
                thisInstance.hideBlock();
                thisInstance.showActionPicklist();
                var action_remove = ['Schedule Interview','Mark Interview Passed','Mark Interview Failed','No Action','Offer Job','Hire','Back to active','Reject after shortlist','Reject after SI','Reject after MIP','Reject after OJ'];
                action_remove.forEach(function(item) {
                    $("select[name ='candidate_action'] option[value='" + item + "']").remove();
                });
            }
        }

        if(recordId !='' && flag =='Shortlist'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Mark Interview Passed','Mark Interview Failed','No Action','Offer Job','Hire','Back to active','Reject','Reject after SI','Reject after MIP','Reject after OJ'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
        }

        if(recordId !='' && flag =='Schedule Interview'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','No Action','Offer Job','Hire','Back to active','Reject','Reject after MIP','Reject after OJ','Reject after shortlist'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
        }

        if(recordId !='' && flag =='Mark Interview Passed'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','No Action','Mark Interview Passed','Mark Interview Failed','Hire','Back to active','Reject','Reject after shortlist','Reject after SI','Reject after OJ'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
        }

        if(recordId !='' && flag =='Reject'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','Mark Interview Passed','Mark Interview Failed','Offer Job','Hire','Back to active','Reject after shortlist','Reject after SI','Reject after MIP','Reject after OJ'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
            $("select[name ='candidate_action'] option[value='']").remove();
            $("select[name ='candidate_action'] option[value='Reject']").attr('selected','selected');
        }

        if(recordId !='' && flag =='Reject after shortlist'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','Mark Interview Passed','Mark Interview Failed','Offer Job','Hire','Back to active','Reject after SI','Reject after MIP','Reject after OJ','Reject'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
            $("select[name ='candidate_action'] option[value='']").remove();
            $("select[name ='candidate_action'] option[value='Reject after shortlist']").attr('selected','selected');
        }
        if(recordId !='' && flag =='Reject after SI'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','Mark Interview Passed','Mark Interview Failed','Offer Job','Hire','Back to active','Reject after shortlist','Reject after MIP','Reject after OJ','Reject'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
            $("select[name ='candidate_action'] option[value='']").remove();
            $("select[name ='candidate_action'] option[value='Reject after SI']").attr('selected','selected');
        }
        if(recordId !='' && flag =='Reject after MIP'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','Mark Interview Passed','Mark Interview Failed','Offer Job','Hire','Back to active','Reject after shortlist','Reject after SI','Reject after OJ','Reject'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
            $("select[name ='candidate_action'] option[value='']").remove();
            $("select[name ='candidate_action'] option[value='Reject after MIP']").attr('selected','selected');
        }
        if(recordId !='' && flag =='Reject after OJ'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','Mark Interview Passed','Mark Interview Failed','Offer Job','Hire','Back to active','Reject after shortlist','Reject after SI','Reject after MIP','Reject'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
            $("select[name ='candidate_action'] option[value='']").remove();
            $("select[name ='candidate_action'] option[value='Reject after OJ']").attr('selected','selected');
        }

        if(recordId !='' && flag =='Mark Interview Failed'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','Mark Interview Passed','Reject','Offer Job','Hire','Back to active'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
        }
        if(recordId !='' && flag =='Offer Job'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','Mark Interview Passed','Mark Interview Failed','No Action','Back to active','Reject','Reject after shortlist','Reject after SI','Reject after MIP'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
            $("select[name ='candidate_action'] option[value='Reject']").attr('selected','selected');
        }

        if(recordId !='' && flag =='Hire'){
            thisInstance.hideBlock();
            thisInstance.showActionPicklist();
            var action_remove = ['Shortlist','Schedule Interview','No Action','Mark Interview Passed','Mark Interview Failed','Reject','Offer Job','Hire','Back to active'];
            action_remove.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").remove();
            });
            $("select[name ='candidate_action'] option[value='']").text("No Action");
        }

        jQuery("select[name ='candidate_action']").change(function () {
        	var action_value = $(this).val();
        	if(action_value =='Shortlist'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_SHORTLIST']").css("display", "block");
			}
            if(action_value =='Reject'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_REJECT']").css("display", "block");
			}
            if(action_value =='Reject after shortlist'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_REJECT']").css("display", "block");
            }
            if(action_value =='Reject after SI'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_REJECT']").css("display", "block");
            }
            if(action_value =='Reject after MIP'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_REJECT']").css("display", "block");
            }
            if(action_value =='Reject after OJ'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_REJECT']").css("display", "block");
            }
            if(action_value =='Schedule Interview'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_SCHEDULE_INTERVIEW']").css("display", "block");
            }

            if(action_value =='Mark Interview Passed'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_MARK_INTERVEW_PASSED']").css("display", "block");
                var tr_mip_swork = jQuery("[name = 'mip_swork']").closest('tr');
                tr_mip_swork.hide();
                var tr_mip_probation = jQuery("[name='mip_probation']").closest('tr');
                tr_mip_probation.hide();
                var tr_official_salary = jQuery("[name='official_salary']").closest('tr');
                tr_official_salary.hide();
				var mip_note = jQuery("#Candidates_editView_fieldName_mip_note");
                var mip_note_td = mip_note.closest('td');
                mip_note_td.css('width','264%');
            }
            if(action_value =='Mark Interview Failed'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_MARK_INTERVEW_FAILED']").css("display", "block");
            }
            if(action_value =='Offer Job'){
                thisInstance.hideBlock();
                jQuery("[data-block='LBL_OFFER_JOB']").css("display", "block");
            }
            if(action_value =='Hire'){
                thisInstance.hideBlock();
                // jQuery("[data-block='LBL_HIRE']").css("display", "block");
                jQuery("[data-block='LBL_MARK_INTERVEW_PASSED']").css("display", "block");
            }
        });
    },

    checkUniqueEmail: function () {
	    var editForm = jQuery("#EditView");
	    var editButton = jQuery(".saveButton");
        jQuery("#Candidates_editView_fieldName_email").on('change',function (e) {
            jQuery("#testEmail").text('');
            var mode = 'checkExistEmail';
            var emailValue = $(this).val();
            var params = {
                'module' : 'Candidates',
                'action':'Commons',
                'email':emailValue,
                'mode':mode
            };
            app.request.post({data: params}).then(
                function(err, data) {
                    if(data.length != ''){
                        jQuery("#testEmail").text(data);
                        jQuery("#Candidates_editView_fieldName_email").focus();
                    }
            });
        });
    },

    activeCandidate: function () {
        jQuery("#active_candidate").on('click',function () {
            if($(this).is(':checked')){
                jQuery("#active_candidate").val(1);
            }else {
                jQuery("#active_candidate").val(0);
            }
            var activestatge = jQuery("#active_candidate").val();
            var mode = 'moveToActiveCandidate';
            var record = jQuery("[name = 'record']").val();
            var currentStatus = jQuery("[name='currentStt']").val();
            var currentFlag = jQuery("[name='flag']").val();
            var params = {
                'module' : 'Candidates',
                'action':'Commons',
                'active_stage':activestatge,
                'mode':mode,
                'record':record,
                'current_status':currentStatus,
                'current_flag':currentFlag
            };

            app.request.post({data: params}).then(
                function(err, data) {

                });
        });
    },

    checkBirhdayAndApplicationDate: function () {
	    jQuery('#Candidates_editView_fieldName_date_of_birth').on('change',function (e) {
            jQuery('#testBirthday').text('');
            var birthdayDateString = jQuery('#Candidates_editView_fieldName_date_of_birth').val();
            var birthdayDate = new Date( birthdayDateString.replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") );
            var today = new Date();
            var birthday_int = Date.parse(birthdayDate);
            var today_int = Date.parse(today);
            if (birthday_int > today_int) {
                jQuery('#testBirthday').text('You can not enter Birthday date in the future!.');
            }
        });
    },

	registerBasicEvents: function (container) {
		this._super(container);
		this.hideBlockAndField();
		this.checkUniqueEmail();
		// this.checkBirhdayAndApplicationDate();
		var thisInstance = this;
		jQuery(document).ready(function () {
            thisInstance.checkBirhdayAndApplicationDate();
		    var reject_change = ['Reject after shortlist','Reject after SI','Reject after MIP','Reject after OJ'];
            reject_change.forEach(function(item) {
                $("select[name ='candidate_action'] option[value='" + item + "']").text('Reject');
            });
            var emailField = jQuery("#Candidates_editView_fieldName_email");
            var tdEmail = emailField.closest('td');
            var testMailElem = '<i id="testEmail" style="color: red;"></i>';
            tdEmail.append(testMailElem);

            var birthdayDateField = jQuery('#Candidates_editView_fieldName_date_of_birth');
            var tdbirthdayDate = birthdayDateField.closest('td');
            var testbirtdayElement = '<i id="testBirthday" style="color: red;margin-left: 3px;"></i>';
            tdbirthdayDate.append(testbirtdayElement);

            jQuery(".saveButton").on('click',function () {
               var checkEmail = jQuery("#testEmail").text();
               var check_birth_day = jQuery('#testBirthday').text();
               // var check_application_date = jQuery('#testApplicationDate').text();
               // var check_startwork_date = jQuery('#testStartWorkDate').text();
               if(checkEmail.length !=''){
                   return false;
               }
               if(check_birth_day.length != ''){
                   jQuery('#Candidates_editView_fieldName_date_of_birth').focus();
                   return false;
               }
               var total_employee = jQuery('[name="total_employee"]').val();
               var candidate_action = jQuery('[name="candidate_action"]').val();
               var license_type = jQuery('[name="license_type"]').val();
               if(total_employee >= 5 && candidate_action=='Hire' && license_type=='free' || license_type==''){
                   var message = '<i style="color: red;">The license you are using is free<a style="position: fixed;" href="index.php?module=Employee&view=Setting&app=HRM">, click to upgrade to Pro version</a></i>';
                   app.helper.showErrorNotification({message: message});													  
                   return false;
               }
            });

            var recordId = jQuery("[name = 'record']").val();
            if(recordId==''){
                jQuery("#Candidates_editView_fieldName_status").val('Potential');

            }

            var tdStatus = jQuery("#Candidates_editView_fieldName_status").closest('td');
            tdStatus.hide();

            var current_status = jQuery("[name='current_status']").val();
            if(current_status != 'Potential'){
                thisInstance.hideActionPicklist();
            }
			
			jQuery("#active_candidate").on('click',function () {
                if (jQuery("#active_candidate").is(':checked')) {
                    thisInstance.showActionPicklist();
                    jQuery("[name='active_candidate']").val(1);
                } else {
                    thisInstance.hideActionPicklist();
                    jQuery("[name='active_candidate']").val(0);
                }
                var activestatge = jQuery("#active_candidate").val();

                if(activestatge == 1){
                    var tdAction = jQuery("#candidate_action");
                    var actionPickList = tdAction.find("[name='candidate_action']");
                    actionPickList.empty();
                    var $newOption = $("<option selected='selected'></option>").val("Back to active").text("Back to active");
                    actionPickList.append($newOption).trigger('change');
                }else {
                    $("select[name ='candidate_action'] option[value='Back to active']").remove();
                    $("select[name ='candidate_action'] option[value='']").val("").trigger('change');
                }
            });
			
        });
		
	}
})