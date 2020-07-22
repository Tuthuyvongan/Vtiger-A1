$(document).ready(function(){
	fetch_user();
	
	setInterval(function(){
			fetch_user();
			update_chat_history_data();
		}, 5000);
		
	function fetch_user()
	{
		var dataUrl = 'module=ChatRoom&action=fetchUser';
		AppConnector.request(dataUrl).then(
			function(data) {
				if(data.success) {
					var result = data.result;
					$('#user_details').html(result);
				}
			},
			function(error, err){
				app.helper.showErrorNotification({'message': vtranslate('Failed to fetch user')});
			}
		);
	}
	
	function make_chat_dialog_box(to_user_id, to_user_name) {
		var model_content = '<div id="user_dialog_'+to_user_id+'" class="user_dialog" title="You have chat with '+to_user_name+'">';
			model_content += '<div style="height: 700px; solid #ccc; overflow-y: scroll; margin-bottom:24px; padding:16px;" class="chat_history" data-touserid="'+to_user_id+'" id="chat_history_'+to_user_id+'">';
			model_content += fetch_user_chat_history(to_user_id);
			model_content +='</div>';
			model_content += '<div class="form-group">';
			model_content += '<textarea name="chat_message_'+to_user_id+'" id="chat_message_'+to_user_id+'" class="form-control"></textarea>';
			model_content += '</div><div class="form-group" align="right">';
			model_content += '<button type="button" name="send_chat" id="'+to_user_id+'" class="btn btn-info send_chat">Send</button></div></div>';

			$('#user_model_details').html(model_content);
	}
	
	$(document).on('click','.start_chat',function(){
			var to_user_id = $(this).data('touserid');
			var to_user_name = $(this).data('tousername');
			make_chat_dialog_box(to_user_id, to_user_name);
		});
		
	$(document).on('click','.send_chat',function(){
			var to_user_id = $(this).attr('id');
			var chat_message = $('#chat_message_'+to_user_id).val();
			var dataUrl = "module=ChatRoom&action=insertChat&to_user_id="+to_user_id+"&chat_message="+chat_message;
			AppConnector.request(dataUrl).then (
				function(data) {
					if(data.success) {
						var result = data.result;
						$('#chat_message_'+to_user_id).val('');
						$('#chat_history_'+to_user_id).html(result);
					}
				},
				function(error, err){
					app.helper.showErrorNotification({'message': vtranslate('Failed to fetch user chat history')});
				}
			);
		});
		
	function fetch_user_chat_history(to_user_id) {
		var dataUrl = 'module=ChatRoom&action=fetchUserChatHistory&to_user_id='+to_user_id;
		AppConnector.request(dataUrl).then(
			function(data) {
				if(data.success) {
					var result = data.result;
					$('#chat_history_'+to_user_id).html(result);
					console.log(result);
				}
			},
			function(error, err){
				app.helper.showErrorNotification({'message': vtranslate('Failed to fetch user chat history')});
			}
		);
	}
			
	function update_chat_history_data(){
			$('chat_history').each(function(){
					var to_user_id = $(this).data('touserid');
					fetch_user_chat_history(to_user_id);
				});
	}
		
	$(document).on('click','.ui-button-icon',function(){
				$('.user_dialog').dialog('destroy').remove();
			});
});