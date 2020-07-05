<?php

class ChatRoom_fetchUserChatHistory_Action extends Vtiger_Action_Controller {
	public function process(Vtiger_Request $request) {
		$ChatRoomModel = Vtiger_Module_Model::getInstance('ChatRoom');
		$userid = Users_Record_Model::getCurrentUserModel()->get('id');
		$to_user_id = $request->get('to_user_id');
		$output = $ChatRoomModel->fetch_user_chat_history($userid, $to_user_id);
		
		$response = new Vtiger_Response();
		$response->setResult($output);
		$response->emit();
	}
}
?>