<?php
//TODO: This is just a mess
// need to clean up ASAP
class ChatRoom_fetchUser_Action extends Vtiger_Action_Controller {
	function __construct() {}
	
	public function checkPermission(Vtiger_Request $request) {
		return true;
	}
	public function process(Vtiger_Request $request) {
		$adb = PearDatabase::getInstance();
		$Output = '
		<table class="table table-bodered table-striped">
        <tr>
            <td>Username</td>
            <td>Status</td>
            <td>Action</td>
        </tr>
		';
		$query = "SELECT * FROM vtiger_users";
		$result = $adb->pquery($query,array());
		$userid = Users_Record_Model::getCurrentUserModel()->get('id');
		$ChatRoomModel = Vtiger_Module_Model::getInstance('ChatRoom');
		for($i=0; $i < $adb->getRowCount($result); $i++) {
			$row = $adb->query_result_rowdata($result,$i);
			$last_activity = $ChatRoomModel->fetch_user_last_activity($row['user_name']);
			if($last_activity == 'Signed in') {
				$status = '<span class="label label-success">Online</span>';
			}
			else {
				$status = '<span class="label label-danger">Offline</span>';
			}
			$Output.= '
			<tr>
				<td>'.$row['first_name'].' '.$row['last_name'].' '.$ChatRoomModel->count_unseen_message($row['id'], $userid).'</td>
				<td>'.$status.'</td>
				<td><button type="button" class="btn btn-info btn-xs start_chat" 
								data-touserid="'.$row['id'].'" data-tousername="'.$row['first_name'].' '.$row['last_name'].'">Start Chat</button></td>
			</tr>';
		}
		$Output .= '</table>';
		$response = new Vtiger_Response();
		$response->setResult($Output);
		$response->emit();
	}
}
?>