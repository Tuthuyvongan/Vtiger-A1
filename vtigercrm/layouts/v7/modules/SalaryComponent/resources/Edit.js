/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
Vtiger_Edit_Js("SalaryComponent_Edit_Js",{},{
	
	//Will have the mapping of address fields based on the modules
	addressFieldsMapping : {'Accounts' :
									{'mailingstreet' : 'bill_street',  
									'otherstreet' : 'ship_street', 
									'mailingpobox' : 'bill_pobox',
									'otherpobox' : 'ship_pobox',
									'mailingcity' : 'bill_city',
									'othercity' : 'ship_city',
									'mailingstate' : 'bill_state',
									'otherstate' : 'ship_state',
									'mailingzip' : 'bill_code',
									'otherzip' : 'ship_code',
									'mailingcountry' : 'bill_country',
									'othercountry' : 'ship_country'
									}
							},
							
	//Address field mapping within module
	addressFieldsMappingInModule : {
										'otherstreet' : 'mailingstreet',
										'otherpobox' : 'mailingpobox',
										'othercity' : 'mailingcity',
										'otherstate' : 'mailingstate',
										'otherzip' : 'mailingzip',
										'othercountry' : 'mailingcountry'
								},
	
        /* Function which will register event for Reference Fields Selection
        */
	registerReferenceSelectionEvent : function(container) {
            var thisInstance = this;

           jQuery('input[name="account_id"]', container).on(Vtiger_Edit_Js.referenceSelectionEvent,function(e,data){
                thisInstance.referenceSelectionEventHandler(data, container);
            });
	},
		
	/**
	 * Reference Fields Selection Event Handler
	 * On Confirmation It will copy the address details
	 */
	referenceSelectionEventHandler :  function(data, container) {
		var thisInstance = this;
		var message = app.vtranslate('OVERWRITE_EXISTING_MSG1')+app.vtranslate('SINGLE_'+data['source_module'])+' ('+data['selectedName']+') '+app.vtranslate('OVERWRITE_EXISTING_MSG2');
		app.helper.showConfirmationBox({'message' : message}).then(function(e){
			thisInstance.copyAddressDetails(data, container);
		},
		function(error,err){});
	},
	
	/**
	 * Function which will copy the address details - without Confirmation
	 */
	copyAddressDetails : function(data, container) {
		var thisInstance = this;
		var sourceModule = data['source_module'];
		thisInstance.getRecordDetails(data).then(
			function(response){
				thisInstance.mapAddressDetails(thisInstance.addressFieldsMapping[sourceModule], response['data'], container);
			},
			function(error, err){

			});
	},
	
	/**
	 * Function which will map the address details of the selected record
	 */
	mapAddressDetails : function(addressDetails, result, container) {
		for(var key in addressDetails) {
            if(container.find('[name="'+key+'"]').length == 0) {
                var create = container.append("<input type='hidden' name='"+key+"'>");
            }
			container.find('[name="'+key+'"]').val(result[addressDetails[key]]);
			container.find('[name="'+key+'"]').trigger('change');
		}
	},
	
	/**
	 * Function to swap array
	 * @param Array that need to be swapped
	 */ 
	swapObject : function(objectToSwap){
		var swappedArray = {};
		var newKey,newValue;
		for(var key in objectToSwap){
			newKey = objectToSwap[key];
			newValue = key;
			swappedArray[newKey] = newValue;
		}
		return swappedArray;
	},
	
	/**
	 * Function to copy address between fields
	 * @param strings which accepts value as either odd or even
	 */
	copyAddress : function(swapMode, container){
		var thisInstance = this;
		var addressMapping = this.addressFieldsMappingInModule;
		if(swapMode == "false"){
			for(var key in addressMapping) {
				var fromElement = container.find('[name="'+key+'"]');
				var toElement = container.find('[name="'+addressMapping[key]+'"]');
				toElement.val(fromElement.val());
				if((jQuery("#massEditContainer").length) && (toElement.val()!= "") && (typeof(toElement.attr('data-validation-engine')) == "undefined")){
					toElement.attr('data-validation-engine', toElement.data('invalidValidationEngine'));
				}
			}
		} else if(swapMode){
			var swappedArray = thisInstance.swapObject(addressMapping);
			for(var key in swappedArray) {
				var fromElement = container.find('[name="'+key+'"]');
				var toElement = container.find('[name="'+swappedArray[key]+'"]');
				toElement.val(fromElement.val());
				if((jQuery("#massEditContainer").length) && (toElement.val()!= "")  && (typeof(toElement.attr('data-validation-engine')) == "undefined")){
					toElement.attr('data-validation-engine', toElement.data('invalidValidationEngine'));
				}
			}
		}
	},
	
	
	/**
	 * Function to register event for copying address between two fileds
	 */
	registerEventForCopyingAddress : function(container){
		var thisInstance = this;
		var swapMode;
		jQuery('[name="copyAddress"]').on('click',function(e){
			var element = jQuery(e.currentTarget);
			var target = element.data('target');
			if(target == "other"){
				swapMode = "false";
			} else if(target == "mailing"){
				swapMode = "true";
			}
			thisInstance.copyAddress(swapMode, container);
		})
	},

	/**
	 * Function to check for Portal User
	 */
	checkForPortalUser: function (form) {
		var element = jQuery('[name="portal"]', form);
		var response = element.is(':checked');
		var primaryEmailField = jQuery('[name="email"]');
		var primaryEmailValue = primaryEmailField.val();
		if (response) {
			if (primaryEmailField.length == 0) {
				app.helper.showErrorNotification({message: app.vtranslate('JS_PRIMARY_EMAIL_FIELD_DOES_NOT_EXISTS')});
				return false;
			}
			if (primaryEmailValue == "") {
				app.helper.showErrorNotification({message: app.vtranslate('JS_PLEASE_ENTER_PRIMARY_EMAIL_VALUE_TO_ENABLE_PORTAL_USER')});
				return false;
			}
		}
		return true;
	},
	/**
	 * Function to register recordpresave event
	 */
	registerRecordPreSaveEvent: function (form) {
		var thisInstance = this;
		if (typeof form == 'undefined') {
			form = this.getForm();
		}

		app.event.on(Vtiger_Edit_Js.recordPresaveEvent, function (e) {
			var result = thisInstance.checkForPortalUser(form);
			if (!result) {
				e.preventDefault();
			}
		});

	},

	CreateTaskToList: function () {
		$("#save_salary_ref").on('click',function () {
			var line_id = $("#line_id").val();
			var experience = $("#experience").val();
			var salary = $("#salary").val();
			var qualification = $("#qualification").val();
			var management_scale = $("#management_scale").val();
			var time_to_review = $("#time_to_review").val();
			var level1 = $("#level1").val();
			var level2 = $("#level2").val();
			var level3 = $("#level3").val();
            var record = $('[name = "record"]').val();
            if(experience=='' && salary =='' && qualification=='' && management_scale=='' && time_to_review=='' && level1=='' && level2=='' && level3==''){
            	var check_all_text = "All field is not empty";
            	jQuery("#check_all").text(check_all_text);
            	return false;
			}else {
                jQuery("#check_all").text('');
                if(!$.isNumeric(salary)) {
                    var is_number_text = "Salary is a number";
                    jQuery("#salary_text").text(is_number_text);
                    return false;
                }
			}
            app.helper.showProgress();
            var params = {
                'module': 'SalaryComponent',
                'record': record,
                'line_id': line_id,
				'experience':experience,
                'salary': salary,
                'qualification': qualification,
                'management_scale': management_scale,
                'time_to_review': time_to_review,
                'level1': level1,
                'level2': level2,
                'level3': level3,
                'action': 'Commons',
                'mode': 'saveSalaryList'
            };
            app.request.post({data: params}).then(
                function(err, data) {
                    app.helper.hideProgress();
                    $("#experience").val('');
                    $("#salary").val('');
                    $("#qualification").val('');
                    $("#management_scale").val('');
                    $("#time_to_review").val('');
                    $("#level1").val('');
                    $("#level2").val('');
                    $("#level3").val('');
                    $("#line_id").val('');
                    jQuery("#salary_text").text('');
                    if(data.length != ''){
                        var taskListTable = $(".salarylisttbl");
                        taskListTable.show();
                        taskListTable.html(data);
					}
                });
        });
    },

	registerBasicEvents: function (container) {
		this._super(container);
		this.registerEventForCopyingAddress(container);
		this.registerRecordPreSaveEvent(container);
		this.registerReferenceSelectionEvent(container);
		this.CreateTaskToList();
		jQuery(document).ready(function () {
            jQuery('#salary').val('');
            jQuery("#check_all").text('');
            jQuery('#salary').on('change',function () {
                jQuery("#check_all").text('');
                var salary_value = jQuery(this).val();
                if(!$.isNumeric(salary_value)){
                    var is_number_text = "Salary is a number";
                    jQuery("#salary_text").text(is_number_text);
				}else {
                    salary_value = salary_value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                    jQuery("#salary_text").text(salary_value);
				}
            });
        });
	}
});