<?php
include_once 'vtlib/Vtiger/Module.php';
include_once 'vtlib/Vtiger/Utils.php';
$Vtiger_Utils_Log = true;

$MODULENAME = 'ChatRoom';
$moduleInstance = Vtiger_Module::getInstance($MODULENAME);
if ($moduleInstance || file_exists('modules/'.$MODULENAME)) {
   echo "Module already present - choose a different name.";
} else {
   $moduleInstance = new Vtiger_Module();
   $moduleInstance->name = $MODULENAME;
   $moduleInstance->parent= 'Tools';
   $moduleInstance->save();

   mkdir('modules/'.$MODULENAME);
   echo "OK\n";
}

Vtiger_Utils::CreateTable('vtiger_chatmessage','(
	`chat_message_id` int(11) NOT NULL,
	`to_user_id` int(11) NOT NULL,
	`from_user_id` int(11) NOT NULL,
	`chat_message` text NOT NULL,
	`timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`status` int(1) NOT NULL)');
	
Vtiger_Utils::AlterTable('vtiger_chatmessage','ADD PRIMARY KEY (`chat_message_id`)');
Vtiger_Utils::AlterTable('vtiger_chatmessage','MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT');


?>