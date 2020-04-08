Vtiger_Detail_Js("Employee_Detail_Js",{},{

    registerAjaxPreSaveEvents: function (container) {
        var thisInstance = this;
        app.event.on(Vtiger_Detail_Js.PreAjaxSaveEvent, function (e) {
            if (!thisInstance.checkForPortalUser(container)) {
                e.preventDefault();
            }
        });
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
     * Function which will register all the events
     */

    registerEvents: function () {
        var form = this.getForm();
        this._super();
        this.registerAjaxPreSaveEvents(form);
        var moduleName = app.getModuleName();
        jQuery(document).ready(function () {
            if(moduleName == 'Employee'){
                var firstnameTd = jQuery("#Employee_detailView_fieldValue_firstname");
                firstnameTd.find('.action').remove();
                var firstnameTd = jQuery("#Employee_detailView_fieldValue_lastname");
                firstnameTd.find('.action').remove();
                var emailTd = jQuery("#Employee_detailView_fieldValue_email");
                emailTd.find('.action').remove();
                jQuery("#Employee_detailView_fieldValue_candidate_id").hide();
                jQuery("#Employee_detailView_fieldLabel_candidate_id").hide();
            }
        });
    }
});
