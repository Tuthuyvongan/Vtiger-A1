<?php /* Smarty version Smarty-3.1.7, created on 2020-06-09 12:21:51
         compiled from "E:\Software\XAMPP\htdocs\Project\Vtiger-A1\vtigercrm\includes\runtime/../../layouts/v7\modules\Inventory\EditView.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11717116065ec29a40f225e8-83979810%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '83aed1d37c1c919b83e8e33bd27b6d2e1e275e0c' => 
    array (
      0 => 'E:\\Software\\XAMPP\\htdocs\\Project\\Vtiger-A1\\vtigercrm\\includes\\runtime/../../layouts/v7\\modules\\Inventory\\EditView.tpl',
      1 => 1591705308,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11717116065ec29a40f225e8-83979810',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_5ec29a410c382',
  'variables' => 
  array (
    'LEFTPANELHIDE' => 0,
    'MODULE' => 0,
    'RECORD_ID' => 0,
    'SINGLE_MODULE_NAME' => 0,
    'RECORD_STRUCTURE_MODEL' => 0,
    'USER_MODEL' => 0,
    'IS_PARENT_EXISTS' => 0,
    'SPLITTED_MODULE' => 0,
    'SELECTED_MENU_CATEGORY' => 0,
    'IS_RELATION_OPERATION' => 0,
    'SOURCE_MODULE' => 0,
    'SOURCE_RECORD' => 0,
    'RETURN_VIEW' => 0,
    'RETURN_MODULE' => 0,
    'RETURN_RECORD' => 0,
    'RETURN_RELATED_TAB' => 0,
    'RETURN_RELATED_MODULE' => 0,
    'RETURN_PAGE' => 0,
    'RETURN_VIEW_NAME' => 0,
    'RETURN_SEARCH_PARAMS' => 0,
    'RETURN_SEARCH_KEY' => 0,
    'RETURN_SEARCH_VALUE' => 0,
    'RETURN_SEARCH_OPERATOR' => 0,
    'RETURN_SORTBY' => 0,
    'RETURN_ORDERBY' => 0,
    'RETURN_MODE' => 0,
    'RETURN_RELATION_ID' => 0,
    'DUPLICATE_RECORDS' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5ec29a410c382')) {function content_5ec29a410c382($_smarty_tpl) {?>
<style>
div.button.group.for.data.block
{
	display: flex;
  	align-items: center;
  	justify-content: center;
}
</style>
<div class="main-container clearfix">
        <div id="modnavigator" class="module-nav editViewModNavigator">
            <div class="hidden-xs hidden-sm mod-switcher-container">
                <?php echo $_smarty_tpl->getSubTemplate ("modules/Vtiger/partials/Menubar.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

            </div>
        </div>
        <!--This is hardcode - Need to fix with Smarty-->
		<div class="button group for data block" style="background: #fbfbfb">
			<button class="quoteInformation" onclick="showQuoteInformation()">Quote Information</button>
			<button class="addressInformation" onclick="showAddressInformation()">Address Information</button>
			<button class="termInformation" onclick="showTermInformation()">Term Information</button>
			<button class="description" onclick="showDescription()">Description</button>
			<button class="item" onclick="showItem()">Item</button>
		</div>
        <div class="editViewPageDiv viewContent">
            <div class="col-sm-12 col-xs-12 content-area <?php if ($_smarty_tpl->tpl_vars['LEFTPANELHIDE']->value=='1'){?> full-width <?php }?>">
                <form class="form-horizontal recordEditView" id="EditView" name="edit" method="post" action="index.php" enctype="multipart/form-data">
                    <div class="editViewHeader">
                        <div class='row'>
                        <div class="col-lg-12 col-md-12 col-lg-pull-0">
                                <?php $_smarty_tpl->tpl_vars['SINGLE_MODULE_NAME'] = new Smarty_variable(('SINGLE_').($_smarty_tpl->tpl_vars['MODULE']->value), null, 0);?>
                                <?php if ($_smarty_tpl->tpl_vars['RECORD_ID']->value!=''){?>
                                    <h4 class="editHeader" style="margin-top:5px;" title="<?php echo vtranslate('LBL_EDITING',$_smarty_tpl->tpl_vars['MODULE']->value);?>
 <?php echo vtranslate($_smarty_tpl->tpl_vars['SINGLE_MODULE_NAME']->value,$_smarty_tpl->tpl_vars['MODULE']->value);?>
 <?php echo $_smarty_tpl->tpl_vars['RECORD_STRUCTURE_MODEL']->value->getRecordName();?>
"><?php echo vtranslate('LBL_EDITING',$_smarty_tpl->tpl_vars['MODULE']->value);?>
 <?php echo vtranslate($_smarty_tpl->tpl_vars['SINGLE_MODULE_NAME']->value,$_smarty_tpl->tpl_vars['MODULE']->value);?>
 - <?php echo $_smarty_tpl->tpl_vars['RECORD_STRUCTURE_MODEL']->value->getRecordName();?>
</h4>
                                <?php }else{ ?>
                                    <h4 class="editHeader" style="margin-top:5px;"><?php echo vtranslate('LBL_CREATING_NEW',$_smarty_tpl->tpl_vars['MODULE']->value);?>
 <?php echo vtranslate($_smarty_tpl->tpl_vars['SINGLE_MODULE_NAME']->value,$_smarty_tpl->tpl_vars['MODULE']->value);?>
</h4>
                                <?php }?>
                            </div>
                        </div>
                    </div>
                    <div class="editViewBody">
                        <div class="editViewContents">
                            <?php $_smarty_tpl->tpl_vars['WIDTHTYPE'] = new Smarty_variable($_smarty_tpl->tpl_vars['USER_MODEL']->value->get('rowheight'), null, 0);?>
                            <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['MODULE']->value;?>
<?php $_tmp1=ob_get_clean();?><?php $_smarty_tpl->tpl_vars['QUALIFIED_MODULE_NAME'] = new Smarty_variable($_tmp1, null, 0);?>
                            <?php $_smarty_tpl->tpl_vars['IS_PARENT_EXISTS'] = new Smarty_variable(strpos($_smarty_tpl->tpl_vars['MODULE']->value,":"), null, 0);?>
                            <?php if ($_smarty_tpl->tpl_vars['IS_PARENT_EXISTS']->value){?>
                                <?php $_smarty_tpl->tpl_vars['SPLITTED_MODULE'] = new Smarty_variable(explode(":",$_smarty_tpl->tpl_vars['MODULE']->value), null, 0);?>
                                <input type="hidden" name="module" value="<?php echo $_smarty_tpl->tpl_vars['SPLITTED_MODULE']->value[1];?>
" />
                                <input type="hidden" name="parent" value="<?php echo $_smarty_tpl->tpl_vars['SPLITTED_MODULE']->value[0];?>
" />
                            <?php }else{ ?>
                                <input type="hidden" name="module" value="<?php echo $_smarty_tpl->tpl_vars['MODULE']->value;?>
" />
                            <?php }?>
                            <input type="hidden" name="action" value="Save" />
                            <input type="hidden" name="record" id="recordId" value="<?php echo $_smarty_tpl->tpl_vars['RECORD_ID']->value;?>
" />
                            <input type="hidden" name="defaultCallDuration" value="<?php echo $_smarty_tpl->tpl_vars['USER_MODEL']->value->get('callduration');?>
" />
                            <input type="hidden" name="defaultOtherEventDuration" value="<?php echo $_smarty_tpl->tpl_vars['USER_MODEL']->value->get('othereventduration');?>
" />
                            <input type="hidden" name="appName" value="&app=<?php echo $_smarty_tpl->tpl_vars['SELECTED_MENU_CATEGORY']->value;?>
" />
                            <?php if ($_smarty_tpl->tpl_vars['IS_RELATION_OPERATION']->value){?>
                                <input type="hidden" name="sourceModule" value="<?php echo $_smarty_tpl->tpl_vars['SOURCE_MODULE']->value;?>
" />
                                <input type="hidden" name="sourceRecord" value="<?php echo $_smarty_tpl->tpl_vars['SOURCE_RECORD']->value;?>
" />
                                <input type="hidden" name="relationOperation" value="<?php echo $_smarty_tpl->tpl_vars['IS_RELATION_OPERATION']->value;?>
" />
                            <?php }?>
                            <?php if ($_smarty_tpl->tpl_vars['RETURN_VIEW']->value){?>
                                <input type="hidden" name="returnmodule" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_MODULE']->value;?>
" />
                                <input type="hidden" name="returnview" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_VIEW']->value;?>
" />
                                <input type="hidden" name="returnrecord" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_RECORD']->value;?>
" />
                                <input type="hidden" name="returntab_label" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_RELATED_TAB']->value;?>
" />
                                <input type="hidden" name="returnrelatedModule" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_RELATED_MODULE']->value;?>
" />
                                <input type="hidden" name="returnpage" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_PAGE']->value;?>
" />
                                <input type="hidden" name="returnviewname" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_VIEW_NAME']->value;?>
" />
                                <input type="hidden" name="returnsearch_params" value='<?php echo Vtiger_Functions::jsonEncode($_smarty_tpl->tpl_vars['RETURN_SEARCH_PARAMS']->value);?>
' />
                                <input type="hidden" name="returnsearch_key" value=<?php echo $_smarty_tpl->tpl_vars['RETURN_SEARCH_KEY']->value;?>
 />
                                <input type="hidden" name="returnsearch_value" value=<?php echo $_smarty_tpl->tpl_vars['RETURN_SEARCH_VALUE']->value;?>
 />
                                <input type="hidden" name="returnoperator" value=<?php echo $_smarty_tpl->tpl_vars['RETURN_SEARCH_OPERATOR']->value;?>
 />
                                <input type="hidden" name="returnsortorder" value=<?php echo $_smarty_tpl->tpl_vars['RETURN_SORTBY']->value;?>
 />
                                <input type="hidden" name="returnorderby" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_ORDERBY']->value;?>
" />
                                <input type="hidden" name="returnmode" value=<?php echo $_smarty_tpl->tpl_vars['RETURN_MODE']->value;?>
 />
                                <input type="hidden" name="returnrelationId" value="<?php echo $_smarty_tpl->tpl_vars['RETURN_RELATION_ID']->value;?>
" />
                            <?php }?>
                            <?php echo $_smarty_tpl->getSubTemplate (vtemplate_path("partials/EditViewContents.tpl",'Inventory'), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

                        </div>
                    </div>
                    <div class="modal-overlay-footer">
                        <div class="row clearfix">
                            <div class='textAlignCenter col-lg-12 col-md-12 col-sm-12 '>
                                <button class="btn btn-success saveButton" type="submit">Save</button>
                                <a class="cancelLink" href="javascript:history.<?php if ($_smarty_tpl->tpl_vars['DUPLICATE_RECORDS']->value){?>go(-2)<?php }else{ ?>back()<?php }?>" type="reset"><?php echo vtranslate('LBL_CANCEL',$_smarty_tpl->tpl_vars['MODULE']->value);?>
</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
</div>

<script>
//This is very bad code - Rely heavily on hardcode
	//TODO: Clean up this mess
	
	var global =[];
	var item = document.getElementById("editContentItem");
	// Save block data to global variabl
	window.onload = function() 
	{
		var temp = document.getElementsByClassName("fieldBlockContainer");	
		for(var i = 0; i < temp.length;i++)
		{ 
			var t = temp[i];
			global.push(t);
		}
		for(var i = temp.length - 1; i > 0; i--)
		{
			temp[i].remove();
		}	
		item.remove();
		console.log(global);
		console.log(item);	
	};
	function showQuoteInformation()
	{
		if(document.getElementById("editContentItem") != null)
		{
			document.getElementById("editContentItem").remove();
		}
		if(document.getElementById("editContent").firstChild === global[0]) return;
		var element = document.createElement("div");
		element = global[0];
		var parent = document.getElementById("editContent");
		parent.insertBefore(element,parent.firstChild);
		var temp = document.getElementsByClassName("fieldBlockContainer");
		temp[1].remove();
	}
	function showAddressInformation()
	{
		if(document.getElementById("editContentItem") != null)
		{
			document.getElementById("editContentItem").remove();
		}
		if(document.getElementById("editContent").firstChild === global[1]) return;
		var element = document.createElement("div");
		element = global[1];
		var parent = document.getElementById("editContent");
		parent.insertBefore(element,parent.firstChild);
		var temp = document.getElementsByClassName("fieldBlockContainer");
		temp[1].remove();
	}
	function showTermInformation()
	{
		if(document.getElementById("editContentItem") != null)
		{
			document.getElementById("editContentItem").remove();
		}
		if(document.getElementById("editContent").firstChild === global[2]) return;
		var element = document.createElement("div");
		element = global[2];
		var parent = document.getElementById("editContent");
		parent.insertBefore(element,parent.firstChild);
		var temp = document.getElementsByClassName("fieldBlockContainer");
		temp[1].remove();
	}
	function showDescription()
	{
		if(document.getElementById("editContentItem") != null)
		{
			document.getElementById("editContentItem").remove();
		}
		if(document.getElementById("editContent").firstChild === global[3]) return;
		var element = document.createElement("div");
		element = global[3];
		var parent = document.getElementById("editContent");
		parent.insertBefore(element,parent.firstChild);
		var temp = document.getElementsByClassName("fieldBlockContainer");
		temp[1].remove();
	}
	function showItem()
	{
		if(document.getElementById("editContent").firstChild != null)
		{
			document.getElementById("editContent").firstChild.remove();
		}
		var parent = document.getElementsByClassName("editViewBody");
		parent[0].appendChild(item);
	}
</script><?php }} ?>