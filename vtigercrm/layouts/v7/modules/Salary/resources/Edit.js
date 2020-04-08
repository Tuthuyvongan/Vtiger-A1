/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
Vtiger_Edit_Js("Salary_Edit_Js",{},{

	registerBasicEvents: function (container) {
		this._super(container);
		jQuery(document).ready(function () {
            var currentSalary = jQuery("#Salary_editView_fieldName_current_salary");
            var afterSalary = jQuery("#Salary_editView_fieldName_salary_after");
            var tdcurrentSalary = currentSalary.closest('td');
            var tdafterSalary = afterSalary.closest('td');
            var showDecimalSalary = '<span id="showCurrentSalary" style="color: red;"></span>';
            var showDecimalSalaryafter = '<span id="showAfterSalary" style="color: red;"></span>';
            tdcurrentSalary.append(showDecimalSalary);
            tdafterSalary.append(showDecimalSalaryafter);

            var salary_valuebf1 = jQuery('[name="current_salary"]').val();
            if(salary_valuebf1 != ''){
                salary_valuebf1 = salary_valuebf1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                jQuery("#showCurrentSalary").text(salary_valuebf1);
            }

            var salary_valueat1 = jQuery('[name="salary_after"]').val();
            if(salary_valueat1 != ''){
                salary_valueat1 = salary_valueat1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                jQuery("#showAfterSalary").text(salary_valueat1);
            }

           jQuery('[name="current_salary"]').on('change',function () {
               var salary_valuebf = jQuery('[name="current_salary"]').val();
               salary_valuebf = salary_valuebf.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
               jQuery("#showCurrentSalary").text(salary_valuebf);
           });
            jQuery('[name="salary_after"]').on('change',function () {
                var salary_valueat = jQuery('[name="salary_after"]').val();
                console.log(salary_valueat);
                salary_valueat = salary_valueat.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                jQuery("#showAfterSalary").text(salary_valueat);
            });
        });
	}
})