/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Vtiger_Detail_Js("Leave_Detail_Js", {}, {

	hideActionPencil: function () {
		var tdLeaveAction = jQuery("#Leave_detailView_fieldValue_hrm_leave_action");
        tdLeaveAction.find(".pull-right").remove();
    },

	registerEvents: function () {
		var form = this.getForm();
		this._super();
		this.hideActionPencil();
        jQuery(document).ready(function () {
            var tdLeaveAction = jQuery("#Leave_detailView_fieldValue_hrm_leave_action");
            tdLeaveAction.find(".pull-right").remove();
        });
	}
})