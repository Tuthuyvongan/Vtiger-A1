<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class Employee_RelatedList_View extends Vtiger_RelatedList_View {

    function process(Vtiger_Request $request) {
        $moduleName = $request->getModule();
        $relatedModuleName = $request->get('relatedModule');

        $parentId = $request->get('record');
        $label = $request->get('tab_label');

        $relatedModuleModel = Vtiger_Module_Model::getInstance($relatedModuleName);
        $moduleFields = $relatedModuleModel->getFields();
        $searchParams = $request->get('search_params');

        if(empty($searchParams)) {
            $searchParams = array();
        }

        $whereCondition = array();
        foreach($searchParams as $fieldListGroup){
            foreach($fieldListGroup as $fieldSearchInfo){
                $fieldModel = $moduleFields[$fieldSearchInfo[0]];
                $tableName = $fieldModel->get('table');
                $column = $fieldModel->get('column');
                $whereCondition[$fieldSearchInfo[0]] = array($tableName.'.'.$column, $fieldSearchInfo[1],  $fieldSearchInfo[2], $fieldSearchInfo[3]);

                $fieldSearchInfoTemp= array();
                $fieldSearchInfoTemp['searchValue'] = $fieldSearchInfo[2];
                $fieldSearchInfoTemp['fieldName'] = $fieldName = $fieldSearchInfo[0];
                $fieldSearchInfoTemp['comparator'] = $fieldSearchInfo[1];
                $searchParams[$fieldName] = $fieldSearchInfoTemp;
            }
        }

        $requestedPage = $request->get('page');
        if(empty($requestedPage)) {
            $requestedPage = 1;
        }

        $pagingModel = new Vtiger_Paging_Model();
        $pagingModel->set('page',$requestedPage);

        $parentRecordModel = Vtiger_Record_Model::getInstanceById($parentId, $moduleName);
        $relationListView = Vtiger_RelationListView_Model::getInstance($parentRecordModel, $relatedModuleName, $label);

        if(!empty($whereCondition))
            $relationListView->set('whereCondition', $whereCondition);
        $orderBy = $request->get('orderby');
        $sortOrder = $request->get('sortorder');
        if($sortOrder == 'ASC') {
            $nextSortOrder = 'DESC';
            $sortImage = 'icon-chevron-down';
            $faSortImage = "fa-sort-desc";
        } else {
            $nextSortOrder = 'ASC';
            $sortImage = 'icon-chevron-up';
            $faSortImage = "fa-sort-asc";
        }
        if(!empty($orderBy)) {
            $relationListView->set('orderby', $orderBy);
            $relationListView->set('sortorder',$sortOrder);
        }
        $relationListView->tab_label = $request->get('tab_label');
        $models = $relationListView->getEntries($pagingModel);
        $links = $relationListView->getLinks();
        $header = $relationListView->getHeaders();
        $noOfEntries = $pagingModel->get('_relatedlistcount');
        if(!$noOfEntries) {
            $noOfEntries = count($models);
        }
        $relationModel = $relationListView->getRelationModel();
        $relatedModuleModel = $relationModel->getRelationModuleModel();
        $relationField = $relationModel->getRelationField();

        $fieldsInfo = array();
        foreach($moduleFields as $fieldName => $fieldModel){
            $fieldsInfo[$fieldName] = $fieldModel->getFieldInfo();
        }

        $viewer = $this->getViewer($request);
        $viewer->assign('RELATED_FIELDS_INFO', json_encode($fieldsInfo));
        $viewer->assign('IS_CREATE_PERMITTED', isPermitted($relatedModuleName, 'CreateView'));
        $viewer->assign('RELATED_RECORDS' , $models);
        $viewer->assign('PARENT_RECORD', $parentRecordModel);
        $viewer->assign('RELATED_LIST_LINKS', $links);
        $viewer->assign('RELATED_HEADERS', $header);
        $viewer->assign('RELATED_MODULE', $relatedModuleModel);
        $viewer->assign('RELATED_ENTIRES_COUNT', $noOfEntries);
        $viewer->assign('RELATION_FIELD', $relationField);
        $selectedMenuCategory = $request->get('app');
        if(!empty($selectedMenuCategory)) {
            $viewer->assign('SELECTED_MENU_CATEGORY', $selectedMenuCategory);
        }

        if (PerformancePrefs::getBoolean('LISTVIEW_COMPUTE_PAGE_COUNT', false)) {
            $totalCount = $relationListView->getRelatedEntriesCount();
            $pageLimit = $pagingModel->getPageLimit();
            $pageCount = ceil((int) $totalCount / (int) $pageLimit);

            if($pageCount == 0){
                $pageCount = 1;
            }
            $viewer->assign('PAGE_COUNT', $pageCount);
            $viewer->assign('TOTAL_ENTRIES', $totalCount);
            $viewer->assign('PERFORMANCE', true);
        }

        $viewer->assign('MODULE', $moduleName);
        $viewer->assign('PAGING', $pagingModel);

        $viewer->assign('ORDER_BY',$orderBy);
        $viewer->assign('SORT_ORDER',$sortOrder);
        $viewer->assign('NEXT_SORT_ORDER',$nextSortOrder);
        $viewer->assign('SORT_IMAGE',$sortImage);
        $viewer->assign('FASORT_IMAGE',$faSortImage);
        $viewer->assign('COLUMN_NAME',$orderBy);

        $viewer->assign('IS_EDITABLE', $relationModel->isEditable());
        $viewer->assign('IS_DELETABLE', $relationModel->isDeletable());
        $viewer->assign('USER_MODEL', Users_Record_Model::getCurrentUserModel());
        $viewer->assign('VIEW', $request->get('view'));
        $viewer->assign('PARENT_ID', $parentId);
        $viewer->assign('SEARCH_DETAILS', $searchParams);
        $viewer->assign('TAB_LABEL', $request->get('tab_label'));

        if($relatedModuleName == 'JD'){
            $viewer->assign('FIELDS_INFO', $fieldsInfo);
            return $viewer->view('JDRelatedList.tpl', $moduleName, 'true');
        }
        elseif ($relatedModuleName == 'QCM'){
            return $viewer->view('QCMRelatedList.tpl', $moduleName, 'true');
        }

        elseif ($relatedModuleName == 'Salary'){
            $employId = $request->get('record');
            $employModel = Vtiger_Record_Model::getInstanceById($employId,'Employee');
            $official_salary = $employModel->get('official_salary');
            $salary_department_id = $employModel->get('salary_department');
            $recentSalaryIncreaseDate = $this->getRecentSalaryIncrease($employId);
            if($recentSalaryIncreaseDate != ''){
                $recentSalaryIncreaseDate = date('Y-m-d',strtotime($recentSalaryIncreaseDate));
                $increase_date_before = $recentSalaryIncreaseDate;
            }else{
                $increase_date_before = $employModel->get('official_date');
            }
			if($official_salary != ''){
                $nex_month_review = $this->getMonthsWillIncreaseSalary($official_salary,$salary_department_id);
            }
            if($nex_month_review != ''){
                $next_date_review = $this->getDateAfterMonths($increase_date_before,$nex_month_review);
            }
            $viewer->assign('REVIEW_DATE',$next_date_review);
            return $viewer->view('SalaryRelatedList.tpl', $moduleName, 'true');
        }
        else{
            return $viewer->view('RelatedList.tpl', $moduleName, 'true');
        }
    }

    //Custom for SalaryReference
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
        $rs_before_increase_date = $adb->pquery("SELECT
                                                            s.review_date
                                                        FROM
                                                            `vtiger_hrm_salaryreference` AS s
                                                        INNER JOIN vtiger_crmentity AS c ON c.crmid = s.id
                                                        WHERE
                                                            id = ?
                                                        LIMIT 1",array($max_salary_id));
        $date_before = $adb->query_result($rs_before_increase_date,0,'review_date');
        return $date_before;
    }

    public function getDateAfterMonths($date,$months){
        $next_date = date("Y-m-d", strtotime("$date +$months month"));
        return $next_date;
    }

    public function getMonthsWillIncreaseSalary($salary,$salary_department_id){
        global $adb;
        if($salary_department_id==''){
            return;
        }
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
        return $time_to_review;
    }
}
