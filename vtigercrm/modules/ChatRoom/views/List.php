<?php
class ChatRoom_List_View extends Vtiger_Index_View {
	
	public function process (Vtiger_Request $request) {
		$viewer = $this->getViewer($request);
		$viewer->view('Index.tpl',$request->getModule());
	}
	
	public function getHeaderScripts(Vtiger_Request $request) {
		$headerScriptInstances = parent::getHeaderScripts($request);
		
		$jsFileNames = array(
			"layouts.v7.modules.ChatRoom.resources.coreScripts",
		);
		
		$jsScriptInstances = $this->checkAndConvertJsScripts($jsFileNames);
		$headerScriptInstances = array_merge($headerScriptInstances,$jsScriptInstances);
		return $headerScriptInstances;
	}
}
?>