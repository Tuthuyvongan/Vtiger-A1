Vtiger_Edit_Js("Employee_Edit_Js",{},{

    changeEmployeeStatus: function () {
        var thisInstance = this;
        var moduleName = app.getModuleName();
        var recordId = jQuery("[name='record']").val();
        var mode = 'update_status';
        jQuery("#employStatus").on('change',function (e) {
            var employeeStatus = $(this).val();
            var params = {
                'module': 'Employee',
                'record': recordId,
                'action': 'Commons',
                'status':employeeStatus,
                'mode':'updateStatus'
            }
            app.request.post({data: params}).then(
                function(err, data) {

                });
        });
    },
    checkEmailforEmploy: function () {
        jQuery("#Employee_editView_fieldName_email").on('change',function () {
            jQuery("#checkEmail").text('');
            var mode = 'checkEmployEmail';
            var email_value = $(this).val();
            var params = {
                'module': 'Employee',
                'action':'Commons',
                'email':email_value,
                'mode':mode
            };
            app.request.post({data: params}).then(
                function(err, data) {
                    if(data.length != ''){
                        jQuery("#checkEmail").text(data);
                        jQuery("#Employee_editView_fieldName_email").focus();
                    }
                });
        });
    },

    registerBasicEvents: function (container) {

        var thisInstance = this;
        this._super(container);
        var moduleName = app.getModuleName();
        this.checkEmailforEmploy();
        jQuery(document).ready(function () {
            var employEmail = jQuery("#Employee_editView_fieldName_email");
            var tdContainEmail = employEmail.closest('td');
            var checkMailExist = '<i id="checkEmail" style="color: red;"></i>';
            tdContainEmail.append(checkMailExist);
            jQuery(".saveButton").on('click',function () {
                var checkEmail = jQuery("#checkEmail").text();
                if(checkEmail.length !=''){
                    return false;
                }
            });
        });
    }
});