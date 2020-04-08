/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Vtiger_List_Js("Candidates_List_Js",{},{

    registerCandidateStatusToggle: function () {
        var thisInstance = this;
        jQuery('#potentialCandidates, #inactiveCandidates, #failedCandidates').on('click', function(e) {
            var currentEle = jQuery(e.currentTarget);
            if(currentEle.hasClass('btn-primary')) {
                return;
            }

            if(currentEle.attr('id') === 'potentialCandidates') {
                jQuery('#inactiveCandidates').removeClass('btn-primary');
                jQuery('#failedCandidates').removeClass('btn-primary');
            }else if (currentEle.attr('id') === 'inactiveCandidates'){
                jQuery('#potentialCandidates').removeClass('btn-primary');
                jQuery('#failedCandidates').removeClass('btn-primary');
            }else {
                jQuery('#inactiveCandidates').removeClass('btn-primary');
                jQuery('#potentialCandidates').removeClass('btn-primary');
            }
            currentEle.addClass('btn-primary');
            var listParams = thisInstance.getListViewParams();
            thisInstance.loadListViewRecords(listParams);
        });
    },
    getListViewParams : function() {
        var thisInstance = this;
        var listViewContainer = jQuery('div.main-container');
        var listParams = {
            'module' : 'Candidates',
            'view' : 'List',
            'status' : listViewContainer.find('.candidateFilter').find('button.btn-primary').data('searchvalue')
        };
        return listParams;
    },
    getListViewContainer : function() {
        if(this.listViewContainer == false){
            this.listViewContainer = jQuery('div.listViewPageDiv');
        }
        return this.listViewContainer;
    },
    loadListViewRecords : function(urlParams) {
        var thisInstance = this;
        var aDeferred = jQuery.Deferred();
        var defParams = thisInstance.getDefaultParams();
        if(typeof urlParams == "undefined") {
            urlParams = {};
        }

        if(typeof urlParams.search_params == "undefined") {
            urlParams.search_params = JSON.stringify(thisInstance.getListSearchParams(false));
        }

        urlParams = jQuery.extend(defParams, urlParams);
        var employListParams = thisInstance.getListViewParams();
        jQuery.extend(employListParams, urlParams);
        app.helper.showProgress();

        app.request.get({data:employListParams}).then(function(err, res){
            aDeferred.resolve(res);
            var container = thisInstance.getListViewContainer();
            // container.find('.listViewPageDiv #listViewContent').html(res);
            jQuery('.listViewPageDiv').html(res);
            thisInstance.updatePagination();
            app.event.trigger('post.listViewFilter.click', container.find('.searchRow'));
            thisInstance.registerDynamicDropdownPosition('table-actions', 'listview-table');
            app.helper.hideProgress();
        });
        return aDeferred.promise();
    },
    getListSearchParams: function (includeStarFilters) {
        if (typeof includeStarFilters == "undefined") {
            includeStarFilters = true;
        }
        var listViewPageDiv = this.getListViewContainer();
        var listViewTable = listViewPageDiv.find('.searchRow');
        var searchParams = new Array();
        var currentSearchParams = new Array();
        if (listViewPageDiv.find('#currentSearchParams').val()) {
            currentSearchParams = JSON.parse(listViewPageDiv.find('#currentSearchParams').val());
        }

        if (this.filterClick) {
            return;
        }
        listViewTable.find('.listSearchContributor').each(function (index, domElement) {
            var searchInfo = new Array();
            var searchContributorElement = jQuery(domElement);
            var fieldName = searchContributorElement.attr('name');
            var fieldInfo = uimeta.field.get(fieldName);

            /**
             *  If we have any related record fields in the list, then list search will not work.
             *  Because, uimeta will only hold field info of current module not all related modules
             */
            if (typeof fieldInfo == 'undefined') {
                fieldInfo = searchContributorElement.data("fieldinfo");
            }

            if (currentSearchParams != null) {
                if (typeof fieldName != 'undefined') {
                    if (fieldName in currentSearchParams) {
                        delete currentSearchParams[fieldName];
                    }
                }

                if ('starred' in currentSearchParams) {
                    delete currentSearchParams['starred'];
                }
            }

            var searchValue = searchContributorElement.val();

            if (typeof searchValue == "object") {
                if (searchValue == null) {
                    searchValue = "";
                } else {
                    searchValue = searchValue.join(',');
                }
            }
            searchValue = searchValue.trim();
            if (searchValue.length <= 0) {
                //continue
                return true;
            }
            var searchOperator = 'c';
            if (fieldInfo.type == "date" || fieldInfo.type == "datetime") {
                searchOperator = 'bw';
            } else if (fieldInfo.type == 'percentage' || fieldInfo.type == "double" || fieldInfo.type == "integer"
                || fieldInfo.type == 'currency' || fieldInfo.type == "number" || fieldInfo.type == "boolean" ||
                fieldInfo.type == "picklist") {
                searchOperator = 'e';
            }
            var storedOperator = searchContributorElement.parent().parent().find('.operatorValue').val();
            if (storedOperator) {
                searchOperator = storedOperator;
                storedOperator = false;
            }
            searchInfo.push(fieldName);
            searchInfo.push(searchOperator);
            searchInfo.push(searchValue);

            searchParams.push(searchInfo);
        });
        for (var i in currentSearchParams) {
//			Number.isInteger(parseInt(i)) (Previously Used which is not supported by IE.)
//			http://codereview.stackexchange.com/questions/101484/simple-function-to-verify-if-a-number-is-integer
//			http://stackoverflow.com/questions/26482645/number-isintegerx-which-is-created-can-not-work-in-ie
            if (!this.isInteger(parseInt(i))) {
                continue;
            }
            var fieldName = currentSearchParams[i]['fieldName'];
            var searchValue = currentSearchParams[i]['searchValue'];
            var searchOperator = currentSearchParams[i]['comparator'];
            if (fieldName == null || fieldName.length <= 0) {
                continue;
            }
            var searchInfo = new Array();
            searchInfo.push(fieldName);
            searchInfo.push(searchOperator);
            searchInfo.push(searchValue);
            searchParams.push(searchInfo);
        }
        if (searchParams.length > 0) {
            var listSearchParams = new Array(searchParams);
        } else {
            var listSearchParams = new Array();
        }
        if (includeStarFilters) {
            listSearchParams = this.addStarSearchParams(listSearchParams);
        }
        return listSearchParams;
    },

    showSelectAll: function () {
        var self = this;
        app.helper.showProgress();
        self.getRecordsCount().then(function (res) {
            self.showSelectAllMsgDiv();
            jQuery('#totalRecordsCount').text(res['count']);
            app.helper.hideProgress();
        })
    },
    showSelectAllMsgDiv: function () {
        jQuery("#deSelectAllMsgDiv").closest('div.messageContainer').removeClass('show');
        jQuery("#deSelectAllMsgDiv").closest('div.messageContainer').addClass('hide');
        jQuery("#selectAllMsgDiv").closest('div.messageContainer').addClass("show");
    },
    getRecordsCount: function () {
        var listViewContainer = jQuery('div.main-container');
        var aDeferred = jQuery.Deferred();
        var self = this;
        var cvId = self.getCurrentCvId();
        var module = this.getModuleName();
        var parent = app.getParentModuleName();
        var defaultParams = this.getDefaultParams();
        var status = listViewContainer.find('.candidateFilter').find('button.btn-primary').data('searchvalue');

        var postData = {
            "module": module,
            "parent": parent,
            "view": "ListAjax",
            "viewname": cvId,
            "mode": "getRecordsCount",
            'status':status
        };
        postData = jQuery.extend(defaultParams, postData);
        var params = {};
        params.data = postData;
        app.request.get(params).then(
            function (err, response) {
                aDeferred.resolve(response);
            }
        );
        return aDeferred.promise();
    },
    getDefaultParams: function () {
        var container = this.getListViewContainer();
        var pageNumber = container.find('#pageNumber').val();
        var module = this.getModuleName();
        var parent = app.getParentModuleName();
        var cvId = this.getCurrentCvId();
        var orderBy = container.find('[name="orderBy"]').val();
        var sortOrder = container.find('[name="sortOrder"]').val();
        var appName = container.find('#appName').val();
        var params = {
            'module': module,
            'parent': parent,
            'page': pageNumber,
            'view': "List",
            'viewname': cvId,
            'orderby': orderBy,
            'sortorder': sortOrder,
            'app': appName
        }
        params.search_params = JSON.stringify(this.getListSearchParams());
        params.tag_params = JSON.stringify(this.getListTagParams());
        params.nolistcache = (container.find('#noFilterCache').val() == 1) ? 1 : 0;
        params.starFilterMode = container.find('.starFilter li.active a').data('type');
        params.list_headers = container.find('[name="list_headers"]').val();
        params.tag = container.find('[name="tag"]').val();
        return params;
    },
    registerListViewMainCheckBoxClickEvent: function () {
        var self = this;
        var listViewPageDiv = this.getListViewContainer();
        listViewPageDiv.on('click', '.listViewEntriesMainCheckBox', function (e) {
            e.stopPropagation();
            var element = jQuery(e.currentTarget);
            if (element.is(':checked')) {
                var rows = listViewPageDiv.find('tr.listViewEntries');
                if (self.isStarFilterMode()) {
                    rows = self.getStarRecordRows();
                } else if (self.isUnStarFilterMode()) {
                    rows = self.getUnStarRecordRows();
                }
                rows.find('.listViewEntriesCheckBox').each(function (e) {
                    jQuery(this).prop('checked', true);
                    var row = jQuery(this).closest('.listViewEntries');
                    row.trigger('Post.ListRow.Checked', {"id": row.data('id')});
                    self.registerPostLoadListViewActions();
                });
                if (self.getSelectAllMode() == true) {
                    self.markSelectedIdsCheckboxes();
                } else {
                    // If it is not select all mode then only do this
                    self.showSelectAll();
                }
            }
            else {
                if (self.getSelectAllMode() == true) {
                    self.showDeSelectAllMsgDiv();
                }
                else {
                    self.deSelectAllWithNoMessage();
                }
                jQuery('.listViewEntriesCheckBox').each(function (e) {
                    jQuery(this).prop('checked', false);
                    var row = jQuery(this).closest('.listViewEntries');
                    row.trigger('Post.ListRow.UnChecked', {"id": row.data('id')});
                    self.registerPostLoadListViewActions();
                });
            }
        });
    },

    registerEvents: function () {
        var thisInstance = this;
        this._super();
        var moduleName = app.getModuleName();
       
        this.registerCandidateStatusToggle();
		this.registerListViewMainCheckBoxClickEvent(); // Add code to fix Check Count Record
       
    }
});