<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

class Employee_List_View extends Vtiger_List_View {

    function preProcess(Vtiger_Request $request, $display=true) {
        parent::preProcess($request, false);

        $moduleName = $request->getModule();
        $customView = new CustomView();
        if($customView->isPermittedCustomView($request->get('viewname'), 'List', $moduleName) != 'yes') {
            $viewName = $customView->getViewIdByName('All', $moduleName);
            $request->set('viewname', $viewName);
            $_REQUEST['viewname'] = $viewName;
        }

        $viewer = $this->getViewer($request);
        $cvId = $this->viewName;

        if(!$cvId) {
            $customView = new CustomView();
            $cvId = $customView->getViewId($moduleName);
        }
        $listHeaders = $request->get('list_headers', array());
        $tag = $request->get('tag');

        $listViewSessionKey = $moduleName.'_'.$cvId;
        if(!empty($tag)) {
            $listViewSessionKey .='_'.$tag;
        }

        $orderParams = Vtiger_ListView_Model::getSortParamsSession($listViewSessionKey);

        if(empty($listHeaders)) {
            $listHeaders = $orderParams['list_headers'];
        }

        $this->listViewModel = Vtiger_ListView_Model::getInstance($moduleName, $cvId, $listHeaders);
        $linkParams = array('MODULE'=>$moduleName, 'ACTION'=>$request->get('view'));
        $viewer->assign('CUSTOM_VIEWS', CustomView_Record_Model::getAllByGroup($moduleName));
        $this->viewName = $request->get('viewname');
        if(empty($this->viewName)){
            //If not view name exits then get it from custom view
            //This can return default view id or view id present in session
            $customView = new CustomView();
            $this->viewName = $customView->getViewId($moduleName);
        }

        $quickLinkModels = $this->listViewModel->getSideBarLinks($linkParams);
        $viewer->assign('QUICK_LINKS', $quickLinkModels);
        $this->initializeListViewContents($request, $viewer);
        $viewer->assign('VIEWID', $this->viewName);
        $moduleModel = Vtiger_Module_Model::getInstance($moduleName);
        $viewer->assign('MODULE_MODEL', $moduleModel);

        if($display) {
            $this->preProcessDisplay($request);
        }
    }

    function preProcessTplName(Vtiger_Request $request) {
        return 'ListViewPreProcess.tpl';
    }

    //Note : To get the right hook for immediate parent in PHP,
    // specially in case of deep hierarchy
    /*function preProcessParentTplName(Vtiger_Request $request) {
        return parent::preProcessTplName($request);
    }*/

    protected function preProcessDisplay(Vtiger_Request $request) {
        parent::preProcessDisplay($request);
    }

    function process (Vtiger_Request $request) {
        global $site_URL,$HELPDESK_SUPPORT_EMAIL_ID;
        $companyDetails = new Settings_Vtiger_CompanyDetails_Model();
        $companyDetailInstance = $companyDetails->getInstance();
        $viewer = $this->getViewer ($request);
        $moduleName = $request->getModule();
        $moduleModel = Vtiger_Module_Model::getInstance($moduleName);
        $viewName = $request->get('viewname');
        if(!empty($viewName)) {
            $this->viewName = $viewName;
        }
        $link_file_license_first = 'modules/Employee/first.json';
        if (file_exists($link_file_license_first))
        {
            $_api_url = "https://cmsmart.net/subcrible";
            $_sku = 'MGX1327'; /* SKU is code for each product */
            $_email = base64_encode($HELPDESK_SUPPORT_EMAIL_ID); /* The email get from form request, This is also the email that receives the content including the free key */
            $_domain_name = base64_encode($site_URL); /* This domain must be obtained from the website url active license */
            $_title = $companyDetailInstance->get("organizationname"); /* The name get from form request */
            $server_ip = $this->get_client_ip();
            $_ip = base64_encode($server_ip);
            $_link_license_key_free = $_api_url . '/' . $_sku . '/' . $_email . '/' . $_domain_name . '/' . $_title . '/' . $_ip;
            $test = json_decode(file_get_contents($_link_license_key_free),true);
            if(count($test)){
                unlink('modules/Employee/first.json');
            }
        }
        $link_file_license = 'modules/Employee/license.json';
        if (file_exists($link_file_license))
        {
            $licenses = json_decode(file_get_contents($link_file_license),true);

            if($licenses['type'] =='pro'){
                $modify_license = date("Y-m-d",filemtime($link_file_license));
                $now = time(); // or your date as well
                $modify_diff = $now - strtotime($modify_license);
                $number_day = round($modify_diff / (60 * 60 * 24));
                if($number_day >= 2){
                    $_api_url = "https://cmsmart.net/checkactive";
                    $_license_key = $licenses['license']; /* License Key is the license in the product order */
                    $_domain_name = base64_encode($site_URL); /*This domain must be obtained from the website url active license*/
                    $_link_check_status = $_api_url . '/' . $_license_key . '/' . $_domain_name;
                    $return	= json_decode(file_get_contents($_link_check_status),true);
                    $validate_massage = '';
                    if($return['code'] != 1){
                        $validate_massage = $return['data'];
                    }
                }
                $expire_date = $licenses['expiry-date'];
                $expire_diff = $expire_date - $now;
                $number_expire = round($expire_diff / 86400);
                $notice_message = '';
                if($number_expire <= 10){
                    $notice_message = "Your license will expire on: ".date('Y-m-d',$expire_date);
                }
            }
        }

        $this->initializeListViewContents($request, $viewer);
        $this->assignCustomViews($request,$viewer);
        $allEmployeeData = $this->getAllEmployeeData();
        $notifyData = $this->getNotifyData($allEmployeeData);
        $empty_salary = $notifyData['salary_empty'];
        $will_review = $notifyData['will_review'];
        $probality_expired = $notifyData['probality_expired'];
        $viewer->assign('VIEW', $request->get('view'));
        $viewer->assign('MODULE_MODEL', $moduleModel);
        $viewer->assign('RECORD_ACTIONS', $this->getRecordActionsFromModule($moduleModel));
        $viewer->assign('CURRENT_USER_MODEL', Users_Record_Model::getCurrentUserModel());
        $viewer->assign('EMPTY_SALARYS', $empty_salary);
        $viewer->assign('WILL_REVIEWS', $will_review);
        $viewer->assign('PROBALY_EXPIREDS', $probality_expired);
        $viewer->assign('COMPANY_DETAILS',$companyDetailInstance);
        $viewer->assign('LICENSE_TYPE',$licenses['type']);
        $viewer->assign('VALIDATE_MSG',$validate_massage);
        $viewer->assign('EXPIRE_NOTICE',$notice_message);
        $viewer->view('ListViewContents.tpl', $moduleName);
    }

    function postProcess(Vtiger_Request $request) {
        $viewer = $this->getViewer ($request);
        $moduleName = $request->getModule();

        $viewer->view('ListViewPostProcess.tpl', $moduleName);
        parent::postProcess($request);
    }

    /**
     * Function to get the list of Script models to be included
     * @param Vtiger_Request $request
     * @return <Array> - List of Vtiger_JsScript_Model instances
     */
    function getHeaderScripts(Vtiger_Request $request) {
        $headerScriptInstances = parent::getHeaderScripts($request);
        $moduleName = $request->getModule();

        $jsFileNames = array(
            'modules.Vtiger.resources.List',
            "modules.$moduleName.resources.List",
            'modules.Vtiger.resources.ListSidebar',
            "modules.$moduleName.resources.ListSidebar",
            'modules.CustomView.resources.CustomView',
            "modules.$moduleName.resources.CustomView",
            "libraries.jquery.ckeditor.ckeditor",
            "libraries.jquery.ckeditor.adapters.jquery",
            "modules.Vtiger.resources.CkEditor",
            //for vtiger7
            "modules.Vtiger.resources.MergeRecords",
            "~layouts/v7/lib/jquery/Lightweight-jQuery-In-page-Filtering-Plugin-instaFilta/instafilta.min.js",
            'modules.Vtiger.resources.Tag',
            "~layouts/".Vtiger_Viewer::getDefaultLayoutName()."/lib/jquery/floatThead/jquery.floatThead.js",
            "~layouts/".Vtiger_Viewer::getDefaultLayoutName()."/lib/jquery/perfect-scrollbar/js/perfect-scrollbar.jquery.js"
        );

        $jsScriptInstances = $this->checkAndConvertJsScripts($jsFileNames);
        $headerScriptInstances = array_merge($headerScriptInstances, $jsScriptInstances);
        return $headerScriptInstances;
    }

    /*
     * Function to initialize the required data in smarty to display the List View Contents
     */
    public function initializeListViewContents(Vtiger_Request $request, Vtiger_Viewer $viewer) {
        $moduleName = $request->getModule();
        $cvId = $this->viewName;
        $pageNumber = $request->get('page');
        $orderBy = $request->get('orderby');
        $sortOrder = $request->get('sortorder');
        $searchKey = $request->get('search_key');
        $searchValue = $request->get('search_value');
        $operator = $request->get('operator');
        $searchParams = $request->get('search_params');
        $tagParams = $request->get('tag_params');
        $starFilterMode = $request->get('starFilterMode');
        $listHeaders = $request->get('list_headers', array());
        $tag = $request->get('tag');
        $requestViewName = $request->get('viewname');
        $tagSessionKey = $moduleName.'_TAG';
        $status = $request->get('status');

        if(empty($status))
            $status = 'Active';

        if(!empty($requestViewName) && empty($tag)) {
            unset($_SESSION[$tagSessionKey]);
        }

        if(empty($tag)) {
            $tagSessionVal = Vtiger_ListView_Model::getSortParamsSession($tagSessionKey);
            if(!empty($tagSessionVal)) {
                $tag = $tagSessionVal;
            }
        }else{
            Vtiger_ListView_Model::setSortParamsSession($tagSessionKey, $tag);
        }

        $listViewSessionKey = $moduleName.'_'.$cvId;
        if(!empty($tag)) {
            $listViewSessionKey .='_'.$tag;
        }

        if(empty($cvId)) {
            $customView = new CustomView();
            $cvId = $customView->getViewId($moduleName);
        }

        $orderParams = Vtiger_ListView_Model::getSortParamsSession($listViewSessionKey);
        if($request->get('mode') == 'removeAlphabetSearch') {
            Vtiger_ListView_Model::deleteParamsSession($listViewSessionKey, array('search_key', 'search_value', 'operator'));
            $searchKey = '';
            $searchValue = '';
            $operator = '';
        }
        if($request->get('mode') == 'removeSorting') {
            Vtiger_ListView_Model::deleteParamsSession($listViewSessionKey, array('orderby', 'sortorder'));
            $orderBy = '';
            $sortOrder = '';
        }
        if(empty($listHeaders)) {
            $listHeaders = $orderParams['list_headers'];
        }

        if(!empty($tag) && empty($tagParams)){
            $tagParams = $orderParams['tag_params'];
        }

        if(empty($orderBy) && empty($searchValue) && empty($pageNumber)) {
            if($orderParams) {
                $pageNumber = $orderParams['page'];
                $orderBy = $orderParams['orderby'];
                $sortOrder = $orderParams['sortorder'];
                $searchKey = $orderParams['search_key'];
                $searchValue = $orderParams['search_value'];
                $operator = $orderParams['operator'];
                if(empty($searchParams)) {
                    $searchParams = $orderParams['search_params'];
                }

                if(empty($starFilterMode)) {
                    $starFilterMode = $orderParams['star_filter_mode'];
                }
            }
        } else if($request->get('nolistcache') != 1) {
            $params = array('page' => $pageNumber, 'orderby' => $orderBy, 'sortorder' => $sortOrder, 'search_key' => $searchKey,
                'search_value' => $searchValue, 'operator' => $operator, 'tag_params' => $tagParams,'star_filter_mode'=> $starFilterMode,'search_params' =>$searchParams);

            if(!empty($listHeaders)) {
                $params['list_headers'] = $listHeaders;
            }
            Vtiger_ListView_Model::setSortParamsSession($listViewSessionKey, $params);
        }
        if($sortOrder == "ASC"){
            $nextSortOrder = "DESC";
            $sortImage = "icon-chevron-down";
            $faSortImage = "fa-sort-desc";
        }else{
            $nextSortOrder = "ASC";
            $sortImage = "icon-chevron-up";
            $faSortImage = "fa-sort-asc";
        }

        if(empty ($pageNumber)){
            $pageNumber = '1';
        }

        if(!$this->listViewModel) {
            $listViewModel = Vtiger_ListView_Model::getInstance($moduleName, $cvId, $listHeaders);
        } else {
            $listViewModel = $this->listViewModel;
        }
        $currentUser = Users_Record_Model::getCurrentUserModel();

        $linkParams = array('MODULE'=>$moduleName, 'ACTION'=>$request->get('view'), 'CVID'=>$cvId);
        $linkModels = $listViewModel->getListViewMassActions($linkParams);
        $listViewModel->set('status', $status);

        // preProcess is already loading this, we can reuse
        if(!$this->pagingModel){
            $pagingModel = new Vtiger_Paging_Model();
            $pagingModel->set('page', $pageNumber);
            $pagingModel->set('viewid', $request->get('viewname'));
        } else{
            $pagingModel = $this->pagingModel;
        }

        if(!empty($orderBy)) {
            $listViewModel->set('orderby', $orderBy);
            $listViewModel->set('sortorder',$sortOrder);
        }

        if(!empty($operator)) {
            $listViewModel->set('operator', $operator);
            $viewer->assign('OPERATOR',$operator);
            $viewer->assign('ALPHABET_VALUE',$searchValue);
        }
        if(!empty($searchKey) && !empty($searchValue)) {
            $listViewModel->set('search_key', $searchKey);
            $listViewModel->set('search_value', $searchValue);
        }

        if(empty($searchParams)) {
            $searchParams = array();
        }
        if(count($searchParams) == 2 && empty($searchParams[1])) {
            unset($searchParams[1]);
        }

        if(empty($tagParams)){
            $tagParams = array();
        }

        $searchAndTagParams = array_merge($searchParams, $tagParams);

        $transformedSearchParams = $this->transferListSearchParamsToFilterCondition($searchAndTagParams, $listViewModel->getModule());
        $listViewModel->set('search_params',$transformedSearchParams);

        //To make smarty to get the details easily accesible
        foreach($searchParams as $fieldListGroup){
            foreach($fieldListGroup as $fieldSearchInfo){
                $fieldSearchInfo['searchValue'] = $fieldSearchInfo[2];
                $fieldSearchInfo['fieldName'] = $fieldName = $fieldSearchInfo[0];
                $fieldSearchInfo['comparator'] = $fieldSearchInfo[1];
                $searchParams[$fieldName] = $fieldSearchInfo;
            }
        }

        foreach($tagParams as $fieldListGroup){
            foreach($fieldListGroup as $fieldSearchInfo){
                $fieldSearchInfo['searchValue'] = $fieldSearchInfo[2];
                $fieldSearchInfo['fieldName'] = $fieldName = $fieldSearchInfo[0];
                $fieldSearchInfo['comparator'] = $fieldSearchInfo[1];
                $tagParams[$fieldName] = $fieldSearchInfo;
            }
        }

        if(!$this->listViewHeaders){
            $this->listViewHeaders = $listViewModel->getListViewHeaders();
        }

        if(!$this->listViewEntries){
            $this->listViewEntries = $listViewModel->getListViewEntries($pagingModel);
        }

        //if list view entries restricted to show, paging should not fail
        if(!$this->noOfEntries) {
            $this->noOfEntries = $pagingModel->get('_listcount');
        }
        if(!$this->noOfEntries) {
            $noOfEntries = count($this->listViewEntries);
        } else {
            $noOfEntries = $this->noOfEntries;
        }
        $viewer->assign('MODULE', $moduleName);

        if(!$this->listViewLinks){
            $this->listViewLinks = $listViewModel->getListViewLinks($linkParams);
        }
        $viewer->assign('LISTVIEW_LINKS', $this->listViewLinks);

        $viewer->assign('LISTVIEW_MASSACTIONS', $linkModels['LISTVIEWMASSACTION']);

        $viewer->assign('PAGING_MODEL', $pagingModel);
        if(!$this->pagingModel){
            $this->pagingModel = $pagingModel;
        }
        $viewer->assign('PAGE_NUMBER',$pageNumber);

        if(!$this->moduleFieldStructure) {
            $recordStructure = Vtiger_RecordStructure_Model::getInstanceForModule($listViewModel->getModule(), Vtiger_RecordStructure_Model::RECORD_STRUCTURE_MODE_FILTER);
            $this->moduleFieldStructure = $recordStructure->getStructure();
        }

        if(!$this->tags) {
            $this->tags = Vtiger_Tag_Model::getAllAccessible($currentUser->id, $moduleName);
        }
        if(!$this->allUserTags) {
            $this->allUserTags = Vtiger_Tag_Model::getAllUserTags($currentUser->getId());
        }

        $listViewController = $listViewModel->get('listview_controller');
        $selectedHeaderFields = $listViewController->getListViewHeaderFields();

        $viewer->assign('LISTVIEW_COUNT', $noOfEntries); //Fix Employee Total Count

        $viewer->assign('ORDER_BY',$orderBy);
        $viewer->assign('SORT_ORDER',$sortOrder);
        $viewer->assign('NEXT_SORT_ORDER',$nextSortOrder);
        $viewer->assign('SORT_IMAGE',$sortImage);
        $viewer->assign('FASORT_IMAGE',$faSortImage);
        $viewer->assign('COLUMN_NAME',$orderBy);
        $viewer->assign('VIEWNAME',$this->viewName);

        $viewer->assign('LISTVIEW_ENTRIES_COUNT',$noOfEntries);
        $viewer->assign('LISTVIEW_HEADERS', $this->listViewHeaders);
        $viewer->assign('LIST_HEADER_FIELDS', json_encode(array_keys($this->listViewHeaders)));
        $viewer->assign('LISTVIEW_ENTRIES', $this->listViewEntries);
        $viewer->assign('MODULE_FIELD_STRUCTURE', $this->moduleFieldStructure);
        $viewer->assign('SELECTED_HEADER_FIELDS', $selectedHeaderFields);
        $viewer->assign('TAGS', $this->tags);
        $viewer->assign('ALL_USER_TAGS', $this->allUserTags);
        $viewer->assign('ALL_CUSTOMVIEW_MODEL', CustomView_Record_Model::getAllFilterByModule($moduleName));
        $viewer->assign('CURRENT_TAG',$tag);
        $appName = $request->get('app');
        if(!empty($appName)){
            $viewer->assign('SELECTED_MENU_CATEGORY',$appName);
        }
        if (PerformancePrefs::getBoolean('LISTVIEW_COMPUTE_PAGE_COUNT', false)) {
            if(!$this->listViewCount){
                $this->listViewCount = $listViewModel->getListViewCount();
            }
            $totalCount = $this->listViewCount;
            $pageLimit = $pagingModel->getPageLimit();
            $pageCount = ceil((int) $totalCount / (int) $pageLimit);

            if($pageCount == 0){
                $pageCount = 1;
            }
            $viewer->assign('PAGE_COUNT', $pageCount);
            $viewer->assign('LISTVIEW_COUNT', $totalCount);
        }
        $viewer->assign('LIST_VIEW_MODEL', $listViewModel);
        $viewer->assign('GROUPS_IDS', Vtiger_Util_Helper::getGroupsIdsForUsers($currentUser->getId()));
        $viewer->assign('IS_CREATE_PERMITTED', $listViewModel->getModule()->isPermitted('CreateView'));
        $viewer->assign('IS_MODULE_EDITABLE', $listViewModel->getModule()->isPermitted('EditView'));
        $viewer->assign('IS_MODULE_DELETABLE', $listViewModel->getModule()->isPermitted('Delete'));
        $viewer->assign('SEARCH_DETAILS', $searchParams);
        $viewer->assign('TAG_DETAILS', $tagParams);
        $viewer->assign('NO_SEARCH_PARAMS_CACHE', $request->get('nolistcache'));
        $viewer->assign('STAR_FILTER_MODE',$starFilterMode);
        $viewer->assign('VIEWID', $cvId);
        $viewer->assign('REQUEST_INSTANCE',$request);
        $moduleModel = Vtiger_Module_Model::getInstance($moduleName);
        if($moduleModel->isQuickPreviewEnabled()){
            $viewer->assign('QUICK_PREVIEW_ENABLED', 'true');
        }

        $picklistDependencyDatasource = Vtiger_DependencyPicklist::getPicklistDependencyDatasource($moduleName);
        $viewer->assign('PICKIST_DEPENDENCY_DATASOURCE',Zend_Json::encode($picklistDependencyDatasource));
    }
    protected function assignCustomViews(Vtiger_Request $request, Vtiger_Viewer $viewer) {
        $allCustomViews = CustomView_Record_Model::getAllByGroup($request->getModule());
        $customViewModel = CustomView_Record_Model::getCleanInstance();
        $viewer->assign('CURRENT_CV_MODEL',$customViewModel);
        if (!empty($allCustomViews)) {
            $viewer->assign('CUSTOM_VIEWS', $allCustomViews);
            $currentCVSelectedFields = array();
            foreach ($allCustomViews as $cat => $views) {
                foreach ($views as $viewModel) {
                    if ($viewModel->getId() === $viewer->get_template_vars('VIEWID')) {
                        $currentCVSelectedFields = $viewModel->getSelectedFields();
                        $viewer->assign('CURRENT_CV_MODEL', $viewModel);
                        break;
                    }
                }
            }
        }
    }
    protected function assignCustomViews_ori(Vtiger_Request $request, Vtiger_Viewer $viewer) {
        $allCustomViews = CustomView_Record_Model::getAllByGroup($request->getModule());
        if (!empty($allCustomViews)) {
            $viewer->assign('CUSTOM_VIEWS', $allCustomViews);
            $currentCVSelectedFields = array();
            foreach ($allCustomViews as $cat => $views) {
                foreach ($views as $viewModel) {
                    if ($viewModel->getId() === $viewer->get_template_vars('VIEWID')) {
                        $currentCVSelectedFields = $viewModel->getSelectedFields();
                        $viewer->assign('CURRENT_CV_MODEL', $viewModel);
                        break;
                    }
                }
            }
        }
    }

    /**
     * Function returns the number of records for the current filter
     * @param Vtiger_Request $request
     */
    function getRecordsCount(Vtiger_Request $request) {
        $moduleName = $request->getModule();
        $cvId = $request->get('viewname');
        $count = $this->getListViewCount($request);

        $result = array();
        $result['module'] = $moduleName;
        $result['viewname'] = $cvId;
        $result['count'] = $count;

        $response = new Vtiger_Response();
        $response->setEmitType(Vtiger_Response::$EMIT_JSON);
        $response->setResult($result);
        $response->emit();
    }

    /**
     * Function to get listView count
     * @param Vtiger_Request $request
     */
    function getListViewCount(Vtiger_Request $request){
        $moduleName = $request->getModule();
        $cvId = $request->get('viewname');
        if(empty($cvId)) {
            $cvId = '0';
        }

        $searchKey = $request->get('search_key');
        $searchValue = $request->get('search_value');
        $tagParams = $request->get('tag_params');
        $status = $request->get('status');

        $listViewModel = Vtiger_ListView_Model::getInstance($moduleName, $cvId);

        if(empty($tagParams)){
            $tagParams = array();
        }

        if(empty($status))
            $status = 'Active';

        $searchParams = $request->get('search_params');
        if(empty($searchParams) && !is_array($searchParams)){
            $searchParams = array();
        }
        $searchAndTagParams = array_merge($searchParams, $tagParams);

        $listViewModel->set('search_params',$this->transferListSearchParamsToFilterCondition($searchAndTagParams, $listViewModel->getModule()));

        $listViewModel->set('search_key', $searchKey);
        $listViewModel->set('search_value', $searchValue);
        $listViewModel->set('operator', $request->get('operator'));
        $listViewModel->set('status', $status);

        // for Documents folders we should filter with folder id as well
        $folder_value = $request->get('folder_value');
        if(!empty($folder_value)){
            $listViewModel->set('folder_id',$request->get('folder_id'));
            $listViewModel->set('folder_value',$folder_value);
        }

        $count = $listViewModel->getListViewCount();

        return $count;
    }

    /**
     * Function to get the page count for list
     * @return total number of pages
     */
    function getPageCount(Vtiger_Request $request){
        $listViewCount = $this->getListViewCount($request);
        $pagingModel = new Vtiger_Paging_Model();
        $pageLimit = $pagingModel->getPageLimit();
        $pageCount = ceil((int) $listViewCount / (int) $pageLimit);

        if($pageCount == 0){
            $pageCount = 1;
        }
        $result = array();
        $result['page'] = $pageCount;
        $result['numberOfRecords'] = $listViewCount;
        $response = new Vtiger_Response();
        $response->setResult($result);
        $response->emit();
    }

    public function transferListSearchParamsToFilterCondition($listSearchParams, $moduleModel) {
        return Vtiger_Util_Helper::transferListSearchParamsToFilterCondition($listSearchParams, $moduleModel);
    }

    public function getHeaderCss(Vtiger_Request $request) {
        $headerCssInstances = parent::getHeaderCss($request);
        $cssFileNames = array(
            "~layouts/".Vtiger_Viewer::getDefaultLayoutName()."/lib/jquery/perfect-scrollbar/css/perfect-scrollbar.css",
        );
        $cssInstances = $this->checkAndConvertCssStyles($cssFileNames);
        $headerCssInstances = array_merge($headerCssInstances, $cssInstances);
        return $headerCssInstances;
    }

    public function getRecordActionsFromModule($moduleModel) {
        $editPermission = $deletePermission = 0;
        if ($moduleModel) {
            $editPermission	= $moduleModel->isPermitted('EditView');
            $deletePermission = $moduleModel->isPermitted('Delete');
        }

        $recordActions = array();
        $recordActions['edit'] = $editPermission;
        $recordActions['delete'] = $deletePermission;

        return $recordActions;
    }

    public function getMonthsWillIncreaseSalary($salary,$salary_department_id){
        global $adb;
        if($salary_department_id !=''){
            $sql = "SELECT
                    salary
                FROM
                    `vtiger_hrm_settingdepartmentcust`
                ORDER BY
                    abs(salary - $salary)
                LIMIT 1";
            $rs = $adb->pquery($sql,array());
            $salary_num = $adb->query_result($rs,0,'salary');

            $query_real_salary = "SELECT
                                salary
                            FROM
                                `vtiger_hrm_settingdepartmentcust`
                            WHERE
                                salary > $salary_num
                            AND department_id = ?
                            LIMIT 1";
            $rs_real_salary = $adb->pquery($query_real_salary,array($salary_department_id));
            $real_salary = $adb->query_result($rs_real_salary,0,'salary');

            $slq_month = "SELECT time_to_review FROM vtiger_hrm_settingdepartmentcust WHERE salary = $real_salary AND department_id = $salary_department_id";
            $rs_month = $adb->pquery($slq_month,array());
            $time_to_review = $adb->query_result($rs_month,0,'time_to_review');
        }
        return $time_to_review;
    }

    public function getAllEmployeeData(){
        $adb = PearDatabase::getInstance();
        $sql = 'SELECT
                    *
                FROM
                    vtiger_hrm_employee AS e
                LEFT JOIN vtiger_crmentity AS c ON c.crmid = e.employid
                LEFT JOIN vtiger_users AS u ON u.id = e.user_id
                WHERE
                    c.deleted = 0
                AND u.`status` = "Active"';
        $result = $adb->pquery($sql,array());
        $employee_data = array();
        while ($row = $adb->fetchByAssoc($result)){
            $employee_data[] = $row;
        }
        return $employee_data;
    }

    public function getNotifyData($employOjb = array()){
        $data = array();
        foreach ($employOjb as $key => $value){
            $todaydate = date('Y-m-d H:i:s');
            $employId = $value['employid'];
            $official_salary = $value['official_salary'];
            $salary_department_id = $value['salary_department'];
            $official_date = $value['official_date'];
            $start_work_date = $value['start_work_date'];
            $recentSalaryIncreaseDate = $this->getRecentSalaryIncrease($employId);

            if($official_salary == ''){
                $data['salary_empty'][] = $employOjb[$key];
            }else{
                if($recentSalaryIncreaseDate != ''){
                    $recentSalaryIncreaseDate = date('Y-m-d',strtotime($recentSalaryIncreaseDate));
                    $increase_date_before = $recentSalaryIncreaseDate;
                }else{
                    $increase_date_before = $official_date;
                }
                if($salary_department_id != ''){
                    if($official_salary != ''){
                        $nex_month_review = $this->getMonthsWillIncreaseSalary($official_salary,$salary_department_id);
                    }
                    if($nex_month_review != ''){
                        $next_date_review = $this->getDateAfterMonths($increase_date_before,$nex_month_review);
                    }
                    if($next_date_review && date("n",strtotime($next_date_review)) <= date("n",strtotime($todaydate))){
                        $employOjb[$key]['date_review'] = $next_date_review;
                        $data['will_review'][] = $employOjb[$key];
                    }
                }
            }
            if($value['probality_period'] != ''){
                $probality_period = explode(' ',$value['probality_period']);
                $probality_period_month = $probality_period[0];
                if(is_numeric($probality_period_month) != ''){
                    $date_will_expire = $this->getDateAfterMonths($start_work_date,$probality_period_month);
                }
                if(date("n",strtotime($date_will_expire)) <= date("n",strtotime($todaydate))){
                    $employOjb[$key]['probality_expired_date'] = $date_will_expire;
                    $data['probality_expired'][] = $employOjb[$key];
                }
            }
        }
        return $data;
    }

    public function getRecentSalaryIncrease($employId){
        global $adb;
        $result = $adb->pquery("SELECT
                                        MAX(r.relcrmid) AS max_salary_id
                                    FROM
                                        vtiger_crmentityrel AS r
                                    INNER JOIN vtiger_crmentity AS c ON r.relcrmid = c.crmid
                                    INNER JOIN vtiger_hrm_salaryreference AS s ON c.crmid = s.id
                                    WHERE
                                        c.deleted = 0
                                    AND (
                                        module = 'Employee'
                                        AND relmodule = 'Salary'
                                    )
                                    AND s.hr_salary_action ='Accept'
                                    AND r.crmid = ?",array($employId));
        $max_salary_id = $adb->query_result($result,0,'max_salary_id');
        if($max_salary_id){
            $rs_before_increase_date = $adb->pquery("SELECT
                                                            s.review_date
                                                        FROM
                                                            `vtiger_hrm_salaryreference` AS s
                                                        INNER JOIN vtiger_crmentity AS c ON c.crmid = s.id
                                                        WHERE
                                                            id = ?
                                                        LIMIT 1",array($max_salary_id));
            $date_before = $adb->query_result($rs_before_increase_date,0,'review_date');
        }
        return $date_before;
    }

    public function getDateAfterMonths($date,$months){
        $next_date = date("Y-m-d", strtotime("$date +$months month"));
        return $next_date;
    }

    function get_client_ip() {
        $ipaddress = '';
        if (isset($_SERVER['HTTP_CLIENT_IP']))
            $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
        else if (isset($_SERVER['HTTP_X_FORWARDED_FOR']))
            $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
        else if (isset($_SERVER['HTTP_X_FORWARDED']))
            $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
        else if (isset($_SERVER['HTTP_FORWARDED_FOR']))
            $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
        else if (isset($_SERVER['HTTP_FORWARDED']))
            $ipaddress = $_SERVER['HTTP_FORWARDED'];
        else if (isset($_SERVER['REMOTE_ADDR']))
            $ipaddress = $_SERVER['REMOTE_ADDR'];
        else
            $ipaddress = 'UNKNOWN';
        return $ipaddress;
    }

}