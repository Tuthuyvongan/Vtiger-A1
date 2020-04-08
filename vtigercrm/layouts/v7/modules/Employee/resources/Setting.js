/*********************************************************************************
 * The content of this file is subject to the Reports 4 You license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
Vtiger.Class("Employee_Setting_Js", {

}, {
    editLicense : function() {
        jQuery('#hrm_reactivate_license_btn').on('click',function() {
            jQuery("#license_key_label").hide();
            jQuery("#licensekey").css('display','block');
            var current_key = jQuery("#license_key_val").val();
            var module = 'Employee';
            var action = 'Setting';
            var mode = 'editLicense';
            var type = 'reactivate';
            var license_key = jQuery('#licensekey').val();
            if(license_key==current_key){
                return false;
            }
            var params = {
                'module' : module,
                'action':action,
                'mode':mode,
                'type':type,
                'license_key':license_key
            };
            app.request.post({data: params}).then(
            function(err, res) {
                if(res.length !== ''){
                    if(res.code == 5 || res.code == 6){
                        app.helper.showSuccessNotification({'message': res.message});
                        jQuery("#license_key_val").val(res.license_key);
                        jQuery("#licensekey").val(res.license_key);
                        jQuery("#licensekey").css('display','none');
                        jQuery("#license_key_label").text(res.license_key);
                        jQuery("#license_key_label").css('display','block');
                        location.reload();
                    }else {
                        app.helper.showErrorNotification({message: res.message});
                    }
                }
            });
        });
        jQuery("#hrm_deactivate_license_btn").on('click',function () {
            var license_key = jQuery('#licensekey').val();
            var module = 'Employee';
            var action = 'Setting';
            var mode = 'editLicense';
            var type = 'deactivate';
            var params = {
                'module' : module,
                'action':action,
                'mode':mode,
                'type':type,
                'license_key':license_key
            };

            var message = "Do you want remove license key";
            app.helper.showConfirmationBox({'message': message}).then(function(data) {
                app.helper.showProgress();
                app.request.post({data: params}).then(
                    function(err, res) {
                    app.helper.hideProgress();
                    location.reload();
                });
            });
        });

        jQuery("#hrm_active_button").on('click',function () {
            var license_key = jQuery('#licensekey').val();
            if(license_key==''){
                alert("License Key is not empty");
                return false;
            }
            var module = 'Employee';
            var action = 'Setting';
            var mode = 'editLicense';
            var type = 'activate';
            var params = {
                'module' : module,
                'action':action,
                'mode':mode,
                'type':type,
                'license_key':license_key
            };
            app.request.post({data: params}).then(
            function(err, res) {
                if(res.length !== ''){
                    if(res.code == 5 || res.code == 6){
                        app.helper.showSuccessNotification({'message': res.message});
                        jQuery("#license_key_val").val(res.license_key);
                        jQuery("#licensekey").val(res.license_key);
                        jQuery("#licensekey").css('display','none');
                        jQuery("#license_key_label").text(res.license_key);
                        jQuery("#license_key_label").css('display','block');
                        location.reload();
                    }else {
                        app.helper.showErrorNotification({message: res.message});
                        return false;
                    }
                }
            });
        });
    },
    registerActions : function() {
        var thisInstance = this;
        thisInstance.editLicense();
    },
    registerEvents: function() {
        this.registerActions();
    },
});