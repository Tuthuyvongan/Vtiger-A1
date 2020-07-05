<?php
class ChatRoom_insertChat_Action extends Vtiger_Action_Controller {
	public function process(Vtiger_Request $request) {
		$adb = PearDatabase::getInstance();
		$query ="
		INSERT INTO vtiger_chatmessage
		(to_user_id, from_user_id, chat_message, status)
		VALUES
		(?,?,?,?)";
		$userid = Users_Record_Model::getCurrentUserModel()->get('id');
		$adb->pquery($query,array($request->get('to_user_id'),$userid,$request->get('chat_message'),'1'));
		$ChatRoomModel = Vtiger_Module_Model::getInstance('ChatRoom');
		$output = $ChatRoomModel->fetch_user_chat_history($userid, $request->get('to_user_id'));
		
		$response = new Vtiger_Response();
		$response->setResult($output);
		$response->emit();
	}
}
?>