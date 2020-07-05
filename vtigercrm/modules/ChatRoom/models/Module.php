<?php

class ChatRoom_Module_Model extends Vtiger_Module_Model  {
	
	public function fetch_user_last_activity($user_name){
		$adb = PearDatabase::getInstance();
		$query = "
				SELECT * FROM vtiger_loginhistory
				WHERE user_name = ?
				ORDER BY login_id DESC
				LIMIT 1";
		$result = $adb->pquery($query,array($user_name));
		
		return $adb->query_result($result,0,'status');
	}
	
	public function get_user_name($user_id)
	{
		$adb = PearDatabase::getInstance();
		$query = "SELECT first_name,last_name FROM vtiger_users WHERE id = ?";
		
		$result = $adb->pquery($query,array($user_id));
		$data = $adb->query_result_rowdata($result,0);
		$fullName = $data['first_name'].' '.$data['last_name'];
		return $fullName;
	}
	
	public function fetch_user_chat_history($from_user_id,$to_user_id) {
		$adb = PearDatabase::getInstance();
		$query="
			SELECT * FROM vtiger_chatmessage
			WHERE (from_user_id = ?
				AND to_user_id = ?)
			OR (from_user_id = ?
				AND to_user_id = ?)
			ORDER BY timestamp ASC";
			
		$result = $adb->pquery($query,array($from_user_id,$to_user_id,$to_user_id,$from_user_id));
		$output = '<ul class="list-unstyled">';
		for($i=0; $i < $adb->getRowCount($result); $i++) {
			$user_name = '';
			$row = $adb->query_result_rowdata($result,$i);
			if($row['from_user_id'] == $from_user_id)
			{
				$user_name = '<b class="text-success">You</b>';
			}
			else
			{
				$from = $row['from_user_id'];
				$temp = $this->get_user_name($from);
				$user_name = '<b class="text-danger">'.$temp.'</b>';
				
			}
			
			$output .= '
				<li style="border-bottom:1px dotted #ccc">
					<p>'.$user_name.' - '.$row['chat_message'].'
						<div align="right">
							- <small><em>'.$row['timestamp'].'</em></small>
						</div>
					</p>
				</li>';
		}
		$output .= '</ul>';
		$query = "
        UPDATE vtiger_chatmessage
        SET status = '0'
        WHERE from_user_id = ?
            AND to_user_id = ?
            AND status = '1'";
		
		$adb->pquery($query,array($to_user_id, $from_user_id));
		
		return $output;
	}


	public function count_unseen_message($from_user_id, $to_user_id)
	{
		$adb = PearDatabase::getInstance();
		$query="
			SELECT * FROM vtiger_chatmessage
			WHERE from_user_id = ?
			AND to_user_id = ?
			AND status = '1'";
		
		$result = $adb->pquery($query,array($from_user_id,$to_user_id));
		$count = $adb->getRowCount($result);
		$output ='';
		if($count > 0)
		{
			$output = '<span class="label label-success">'.$count.'</span>';
		}
		return $output;
	}

}
?>