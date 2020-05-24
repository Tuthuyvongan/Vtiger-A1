-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2020 at 06:23 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vtiger`
--
CREATE DATABASE IF NOT EXISTS `vtiger` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vtiger`;

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflows`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflows` (
  `workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) DEFAULT NULL,
  `summary` varchar(400) NOT NULL,
  `test` text DEFAULT NULL,
  `execution_condition` int(11) NOT NULL,
  `defaultworkflow` int(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `filtersavedinnew` int(1) DEFAULT NULL,
  `schtypeid` int(10) DEFAULT NULL,
  `schdayofmonth` varchar(100) DEFAULT NULL,
  `schdayofweek` varchar(100) DEFAULT NULL,
  `schannualdates` varchar(100) DEFAULT NULL,
  `schtime` varchar(50) DEFAULT NULL,
  `nexttrigger_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `workflowname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workflow_id`),
  UNIQUE KEY `com_vtiger_workflows_idx` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflows`
--

INSERT INTO `com_vtiger_workflows` (`workflow_id`, `module_name`, `summary`, `test`, `execution_condition`, `defaultworkflow`, `type`, `filtersavedinnew`, `schtypeid`, `schdayofmonth`, `schdayofweek`, `schannualdates`, `schtime`, `nexttrigger_time`, `status`, `workflowname`) VALUES
(1, 'Invoice', 'UpdateInventoryProducts On Every Save', '[{\"fieldname\":\"subject\",\"operation\":\"does not contain\",\"value\":\"`!`\"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'UpdateInventoryProducts On Every Save'),
(2, 'Accounts', 'Send Email to user when Notifyowner is True', '[{\"fieldname\":\"notify_owner\",\"operation\":\"is\",\"value\":\"true:boolean\"}]', 2, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Send Email to user when Notifyowner is True'),
(3, 'Contacts', 'Send Email to user when Notifyowner is True', '[{\"fieldname\":\"notify_owner\",\"operation\":\"is\",\"value\":\"true:boolean\"}]', 2, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Send Email to user when Notifyowner is True'),
(4, 'Contacts', 'Send Email to user when Portal User is True', '[{\"fieldname\":\"portal\",\"operation\":\"is\",\"value\":\"1\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"email\",\"operation\":\"is not empty\",\"value\":\"\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Send Email to user when Portal User is True'),
(5, 'Potentials', 'Send Email to users on Potential creation', NULL, 1, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Send Email to users on Potential creation'),
(6, 'Contacts', 'Workflow for Contact Creation or Modification', '', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Workflow for Contact Creation or Modification'),
(7, 'HelpDesk', 'Ticket Creation From Portal : Send Email to Record Owner and Contact', '[{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":1,\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":0}]', 1, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Ticket Creation From Portal : Send Email to Record Owner and Contact'),
(9, 'HelpDesk', 'Send Email to Contact on Ticket Update', '[{\"fieldname\":\"(contact_id : (Contacts) emailoptout)\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":0,\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":0},{\"fieldname\":\"ticketstatus\",\"operation\":\"has changed to\",\"value\":\"Closed\",\"valuetype\":\"rawtext\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"},{\"fieldname\":\"solution\",\"operation\":\"has changed\",\"value\":\"\",\"valuetype\":\"\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"},{\"fieldname\":\"description\",\"operation\":\"has changed\",\"value\":\"\",\"valuetype\":\"\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Send Email to Contact on Ticket Update'),
(10, 'Events', 'Workflow for Events when Send Notification is True', '[{\"fieldname\":\"sendnotification\",\"operation\":\"is\",\"value\":\"true:boolean\"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Workflow for Events when Send Notification is True'),
(11, 'Calendar', 'Workflow for Calendar Todos when Send Notification is True', '[{\"fieldname\":\"sendnotification\",\"operation\":\"is\",\"value\":\"true:boolean\"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Workflow for Calendar Todos when Send Notification is True'),
(12, 'Potentials', 'Calculate or Update forecast amount', '', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Calculate or Update forecast amount'),
(13, 'Events', 'Workflow for Events when Send Notification is True', '[{\"fieldname\":\"sendnotification\",\"operation\":\"is\",\"value\":\"true:boolean\"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Workflow for Events when Send Notification is True'),
(14, 'Calendar', 'Workflow for Calendar Todos when Send Notification is True', '[{\"fieldname\":\"sendnotification\",\"operation\":\"is\",\"value\":\"true:boolean\"}]', 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Workflow for Calendar Todos when Send Notification is True'),
(15, 'HelpDesk', 'Comment Added From CRM : Send Email to Organization', '[{\"fieldname\":\"_VT_add_comment\",\"operation\":\"is added\",\"value\":\"\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"(parent_id : (Accounts) emailoptout)\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Comment Added From CRM : Send Email to Organization'),
(16, 'PurchaseOrder', 'Update Inventory Products On Every Save', NULL, 3, 1, 'basic', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Update Inventory Products On Every Save'),
(17, 'HelpDesk', 'Comment Added From Portal : Send Email to Record Owner', '[{\"fieldname\":\"_VT_add_comment\",\"operation\":\"is added\",\"value\":\"\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":\"1\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Comment Added From Portal : Send Email to Record Owner'),
(18, 'HelpDesk', 'Comment Added From CRM : Send Email to Contact, where Contact is not a Portal User', '[{\"fieldname\":\"(contact_id : (Contacts) portal)\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"_VT_add_comment\",\"operation\":\"is added\",\"value\":\"\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"(contact_id : (Contacts) emailoptout)\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Comment Added From CRM : Send Email to Contact, where Contact is not a Portal User'),
(19, 'HelpDesk', 'Comment Added From CRM : Send Email to Contact, where Contact is Portal User', '[{\"fieldname\":\"(contact_id : (Contacts) portal)\",\"operation\":\"is\",\"value\":\"1\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"_VT_add_comment\",\"operation\":\"is added\",\"value\":\"\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"(contact_id : (Contacts) emailoptout)\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Comment Added From CRM : Send Email to Contact, where Contact is Portal User'),
(20, 'HelpDesk', 'Send Email to Record Owner on Ticket Update', '[{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":0,\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":0},{\"fieldname\":\"ticketstatus\",\"operation\":\"has changed to\",\"value\":\"Closed\",\"valuetype\":\"rawtext\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"},{\"fieldname\":\"solution\",\"operation\":\"has changed\",\"value\":\"\",\"valuetype\":\"\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"},{\"fieldname\":\"assigned_user_id\",\"operation\":\"has changed\",\"value\":\"\",\"valuetype\":\"\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"},{\"fieldname\":\"description\",\"operation\":\"has changed\",\"value\":\"\",\"valuetype\":\"\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Send Email to Record Owner on Ticket Update'),
(21, 'HelpDesk', 'Ticket Creation From CRM : Send Email to Record Owner', '[{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"}]', 1, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Ticket Creation From CRM : Send Email to Record Owner'),
(22, 'HelpDesk', 'Send Email to Organization on Ticket Update', '[{\"fieldname\":\"(parent_id : (Accounts) emailoptout)\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":0,\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":0},{\"fieldname\":\"ticketstatus\",\"operation\":\"has changed to\",\"value\":\"Closed\",\"valuetype\":\"rawtext\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"},{\"fieldname\":\"solution\",\"operation\":\"has changed\",\"value\":\"\",\"valuetype\":\"\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"},{\"fieldname\":\"description\",\"operation\":\"has changed\",\"value\":\"\",\"valuetype\":\"\",\"joincondition\":\"or\",\"groupjoin\":\"and\",\"groupid\":\"1\"}]', 3, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Send Email to Organization on Ticket Update'),
(23, 'HelpDesk', 'Ticket Creation From CRM : Send Email to Organization', '[{\"fieldname\":\"(parent_id : (Accounts) emailoptout)\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"}]', 1, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Ticket Creation From CRM : Send Email to Organization'),
(24, 'HelpDesk', 'Ticket Creation From CRM : Send Email to Contact', '[{\"fieldname\":\"(contact_id : (Contacts) emailoptout)\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"and\",\"groupjoin\":\"and\",\"groupid\":\"0\"},{\"fieldname\":\"from_portal\",\"operation\":\"is\",\"value\":\"0\",\"valuetype\":\"rawtext\",\"joincondition\":\"\",\"groupjoin\":\"and\",\"groupid\":\"0\"}]', 1, 1, 'basic', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Ticket Creation From CRM : Send Email to Contact');

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflows_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflows_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflows_seq`
--

INSERT INTO `com_vtiger_workflows_seq` (`id`) VALUES
(24);

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtasks`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) DEFAULT NULL,
  `summary` varchar(400) NOT NULL,
  `task` text DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `com_vtiger_workflowtasks_idx` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflowtasks`
--

INSERT INTO `com_vtiger_workflowtasks` (`task_id`, `workflow_id`, `summary`, `task`) VALUES
(1, 1, '', 'O:18:\"VTEntityMethodTask\":6:{s:18:\"executeImmediately\";b:1;s:10:\"workflowId\";i:1;s:7:\"summary\";s:0:\"\";s:6:\"active\";b:1;s:10:\"methodName\";s:15:\"UpdateInventory\";s:2:\"id\";i:1;}'),
(2, 2, 'An account has been created ', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:0:\"\";s:10:\"workflowId\";s:1:\"2\";s:7:\"summary\";s:28:\"An account has been created \";s:6:\"active\";s:1:\"1\";s:10:\"methodName\";s:11:\"NotifyOwner\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:26:\"Regarding Account Creation\";s:7:\"content\";s:301:\"An Account has been assigned to you on vtigerCRM<br>Details of account are :<br><br>AccountId:<b>$account_no</b><br>AccountName:<b>$accountname</b><br>Rating:<b>$rating</b><br>Industry:<b>$industry</b><br>AccountType:<b>$accounttype</b><br>Description:<b>$description</b><br><br><br>Thank You<br>Admin\";s:2:\"id\";s:1:\"2\";}'),
(3, 3, 'An contact has been created ', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:0:\"\";s:10:\"workflowId\";s:1:\"3\";s:7:\"summary\";s:28:\"An contact has been created \";s:6:\"active\";s:1:\"1\";s:10:\"methodName\";s:11:\"NotifyOwner\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:26:\"Regarding Contact Creation\";s:7:\"content\";s:305:\"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>$contact_no</b><br>LastName:<b>$lastname</b><br>FirstName:<b>$firstname</b><br>Lead Source:<b>$leadsource</b><br>Department:<b>$department</b><br>Description:<b>$description</b><br><br><br>Thank You<br>Admin\";s:2:\"id\";s:1:\"3\";}'),
(4, 4, 'Email Customer Portal Login Details', 'O:18:\"VTEntityMethodTask\":6:{s:18:\"executeImmediately\";b:1;s:10:\"workflowId\";i:4;s:7:\"summary\";s:35:\"Email Customer Portal Login Details\";s:6:\"active\";b:1;s:10:\"methodName\";s:22:\"SendPortalLoginDetails\";s:2:\"id\";i:4;}'),
(5, 5, 'An Potential has been created ', 'O:11:\"VTEmailTask\":8:{s:18:\"executeImmediately\";s:0:\"\";s:10:\"workflowId\";s:1:\"5\";s:7:\"summary\";s:30:\"An Potential has been created \";s:6:\"active\";s:1:\"1\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:30:\"Regarding Potential Assignment\";s:7:\"content\";s:342:\"An Potential has been assigned to you on vtigerCRM<br>Details of Potential are :<br><br>Potential No:<b>$potential_no</b><br>Potential Name:<b>$potentialname</b><br>Amount:<b>$amount</b><br>Expected Close Date:<b>$closingdate ($_DATE_FORMAT_)</b><br>Type:<b>$opportunity_type</b><br><br><br>Description :$description<br><br>Thank You<br>Admin\";s:2:\"id\";s:1:\"5\";}'),
(6, 6, 'An contact has been created ', 'O:11:\"VTEmailTask\":8:{s:18:\"executeImmediately\";s:0:\"\";s:10:\"workflowId\";s:1:\"6\";s:7:\"summary\";s:28:\"An contact has been created \";s:6:\"active\";s:1:\"1\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:28:\"Regarding Contact Assignment\";s:7:\"content\";s:384:\"An Contact has been assigned to you on vtigerCRM<br>Details of Contact are :<br><br>Contact Id:<b>$contact_no</b><br>LastName:<b>$lastname</b><br>FirstName:<b>$firstname</b><br>Lead Source:<b>$leadsource</b><br>Department:<b>$department</b><br>Description:<b>$description</b><br><br><br>And <b>CustomerPortal Login Details</b> is sent to the EmailID :-$email<br><br>Thank You<br>Admin\";s:2:\"id\";s:1:\"6\";}'),
(7, 7, 'Notify Related Contact when Ticket is created from Portal', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:57:\"Notify Related Contact when Ticket is created from Portal\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:1:\"7\";s:10:\"workflowId\";s:1:\"7\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:33:\",$(contact_id : (Contacts) email)\";s:7:\"subject\";s:93:\"[From Portal] $ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:158:\"Ticket No : $ticket_no<br>\n							  Ticket ID : $(general : (__VtigerMeta__) recordId)<br>\n							  Ticket Title : $ticket_title<br><br>\n							  $description\";}'),
(10, 9, 'Send Email to Contact on Ticket Update', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:38:\"Send Email to Contact on Ticket Update\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"10\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:33:\",$(contact_id : (Contacts) email)\";s:7:\"subject\";s:79:\"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:624:\"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\n								Dear $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname),<br><br>\n								The Ticket is replied the details are :<br><br>\n								Ticket No : $ticket_no<br>\n								Status : $ticketstatus<br>\n								Category : $ticketcategories<br>\n								Severity : $ticketseverities<br>\n								Priority : $ticketpriorities<br><br>\n								Description : <br>$description<br><br>\n								Solution : <br>$solution<br>\n								The comments are : <br>\n								$allComments<br><br>\n								Regards<br>Support Administrator\";s:10:\"workflowId\";s:1:\"9\";}'),
(13, 12, 'update forecast amount', 'O:18:\"VTUpdateFieldsTask\":7:{s:18:\"executeImmediately\";b:1;s:43:\"\0VTUpdateFieldsTask\0referenceFieldFocusList\";a:0:{}s:10:\"workflowId\";i:12;s:7:\"summary\";s:22:\"update forecast amount\";s:6:\"active\";b:1;s:19:\"field_value_mapping\";s:95:\"[{\"fieldname\":\"forecast_amount\",\"valuetype\":\"expression\",\"value\":\"amount * probability / 100\"}]\";s:2:\"id\";i:13;}'),
(14, 13, 'Send Notification Email to Record Owner', 'O:11:\"VTEmailTask\":8:{s:18:\"executeImmediately\";s:0:\"\";s:10:\"workflowId\";s:2:\"13\";s:7:\"summary\";s:39:\"Send Notification Email to Record Owner\";s:6:\"active\";s:1:\"1\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:17:\"Event :  $subject\";s:7:\"content\";s:771:\"$(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name) ,<br/><b>Activity Notification Details:</b><br/>Subject             : $subject<br/>Start date and time : $date_start ($(general : (__VtigerMeta__) usertimezone))<br/>End date and time   : $due_date ($(general : (__VtigerMeta__) usertimezone)) <br/>Status              : $eventstatus <br/>Priority            : $taskpriority <br/>Related To          : $(parent_id : (Leads) lastname) $(parent_id : (Leads) firstname) $(parent_id : (Accounts) accountname) $(parent_id : (Potentials) potentialname) $(parent_id : (HelpDesk) ticket_title) $(parent_id : (Campaigns) campaignname) <br/>Contacts List       : $contact_id <br/>Location            : $location <br/>Description         : $description\";s:2:\"id\";s:2:\"14\";}'),
(15, 14, 'Send Notification Email to Record Owner', 'O:11:\"VTEmailTask\":8:{s:18:\"executeImmediately\";s:0:\"\";s:10:\"workflowId\";s:2:\"14\";s:7:\"summary\";s:39:\"Send Notification Email to Record Owner\";s:6:\"active\";s:1:\"1\";s:9:\"recepient\";s:36:\"$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:16:\"Task :  $subject\";s:7:\"content\";s:689:\"$(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name) ,<br/><b>Task Notification Details:</b><br/>Subject : $subject<br/>Start date and time : $date_start ($(general : (__VtigerMeta__) usertimezone))<br/>End date and time   : $due_date ($_DATE_FORMAT_) <br/>Status              : $taskstatus <br/>Priority            : $taskpriority <br/>Related To          : $(parent_id : (Leads) lastname) $(parent_id : (Leads) firstname) $(parent_id : (Accounts) accountname) $(parent_id : (Potentials) potentialname) $(parent_id : (HelpDesk) ticket_title) $(parent_id : (Campaigns) campaignname) <br/>Contacts List       : $contact_id <br/>Description         : $description\";s:2:\"id\";s:2:\"15\";}'),
(18, 16, 'Update Inventory Products', 'O:18:\"VTEntityMethodTask\":6:{s:18:\"executeImmediately\";b:1;s:10:\"workflowId\";i:16;s:7:\"summary\";s:25:\"Update Inventory Products\";s:6:\"active\";b:1;s:10:\"methodName\";s:15:\"UpdateInventory\";s:2:\"id\";i:18;}'),
(19, 17, 'Comment Added From Portal : Send Email to Record Owner', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:54:\"Comment Added From Portal : Send Email to Record Owner\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"19\";s:10:\"workflowId\";s:2:\"17\";s:9:\"fromEmail\";s:112:\"$(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname)&lt;$(contact_id : (Contacts) email)&gt;\";s:9:\"recepient\";s:37:\",$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:92:\"Respond to Ticket ID## $(general : (__VtigerMeta__) recordId) ## in Customer Portal - URGENT\";s:7:\"content\";s:325:\"Dear $(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name),<br><br>\n								Customer has provided the following additional information to your reply:<br><br>\n								<b>$lastComment</b><br><br>\n								Kindly respond to above ticket at the earliest.<br><br>\n								Regards<br>Support Administrator\";}'),
(20, 18, 'Comment Added From CRM : Send Email to Contact, where Contact is not a Portal User', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:82:\"Comment Added From CRM : Send Email to Contact, where Contact is not a Portal User\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"20\";s:10:\"workflowId\";s:2:\"18\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:33:\",$(contact_id : (Contacts) email)\";s:7:\"subject\";s:79:\"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:514:\"Dear $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname),<br><br>\n							The Ticket is replied the details are :<br><br>\n							Ticket No : $ticket_no<br>\n							Status : $ticketstatus<br>\n							Category : $ticketcategories<br>\n							Severity : $ticketseverities<br>\n							Priority : $ticketpriorities<br><br>\n							Description : <br>$description<br><br>\n							Solution : <br>$solution<br>\n							The comments are : <br>\n							$allComments<br><br>\n							Regards<br>Support Administrator\";}'),
(21, 19, 'Comment Added From CRM : Send Email to Contact, where Contact is Portal User', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:76:\"Comment Added From CRM : Send Email to Contact, where Contact is Portal User\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"21\";s:10:\"workflowId\";s:2:\"19\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:33:\",$(contact_id : (Contacts) email)\";s:7:\"subject\";s:79:\"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:547:\"Ticket No : $ticket_no<br>\n										Ticket Id : $(general : (__VtigerMeta__) recordId)<br>\n										Subject : $ticket_title<br><br>\n										Dear $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname),<br><br>\n										There is a reply to <b>$ticket_title</b> in the \"Customer Portal\" at VTiger.\n										You can use the following link to view the replies made:<br>\n										<a href=\"$(general : (__VtigerMeta__) portaldetailviewurl)\">Ticket Details</a><br><br>\n										Thanks<br>$(general : (__VtigerMeta__) supportName)\";}'),
(22, 15, 'Comment Added From CRM : Send Email to Organization', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:51:\"Comment Added From CRM : Send Email to Organization\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"22\";s:10:\"workflowId\";s:2:\"15\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:34:\",$(parent_id : (Accounts) email1),\";s:7:\"subject\";s:79:\"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:589:\"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\n								Dear $(parent_id : (Accounts) accountname),<br><br>\n								The Ticket is replied the details are :<br><br>\n								Ticket No : $ticket_no<br>\n								Status : $ticketstatus<br>\n								Category : $ticketcategories<br>\n								Severity : $ticketseverities<br>\n								Priority : $ticketpriorities<br><br>\n								Description : <br>$description<br><br>\n								Solution : <br>$solution<br>\n								The comments are : <br>\n								$allComments<br><br>\n								Regards<br>Support Administrator\";}'),
(23, 7, 'Notify Record Owner when Ticket is created from Portal', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:54:\"Notify Record Owner when Ticket is created from Portal\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"23\";s:10:\"workflowId\";s:1:\"7\";s:9:\"fromEmail\";s:124:\"$(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:37:\",$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:93:\"[From Portal] $ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:158:\"Ticket No : $ticket_no<br>\n							  Ticket ID : $(general : (__VtigerMeta__) recordId)<br>\n							  Ticket Title : $ticket_title<br><br>\n							  $description\";}'),
(24, 20, 'Send Email to Record Owner on Ticket Update', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:43:\"Send Email to Record Owner on Ticket Update\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"24\";s:10:\"workflowId\";s:2:\"20\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:37:\",$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:40:\"Ticket Number : $ticket_no $ticket_title\";s:7:\"content\";s:596:\"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\n								Dear $(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name),<br><br>\n								The Ticket is replied the details are :<br><br>\n								Ticket No : $ticket_no<br>\n								Status : $ticketstatus<br>\n								Category : $ticketcategories<br>\n								Severity : $ticketseverities<br>\n								Priority : $ticketpriorities<br><br>\n								Description : <br>$description<br><br>\n								Solution : <br>$solution\n								$allComments<br><br>\n								Regards<br>Support Administrator\";}'),
(25, 21, 'Ticket Creation From CRM : Send Email to Record Owner', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:53:\"Ticket Creation From CRM : Send Email to Record Owner\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"25\";s:10:\"workflowId\";s:2:\"21\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:37:\",$(assigned_user_id : (Users) email1)\";s:7:\"subject\";s:40:\"Ticket Number : $ticket_no $ticket_title\";s:7:\"content\";s:596:\"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\n								Dear $(assigned_user_id : (Users) last_name) $(assigned_user_id : (Users) first_name),<br><br>\n								The Ticket is replied the details are :<br><br>\n								Ticket No : $ticket_no<br>\n								Status : $ticketstatus<br>\n								Category : $ticketcategories<br>\n								Severity : $ticketseverities<br>\n								Priority : $ticketpriorities<br><br>\n								Description : <br>$description<br><br>\n								Solution : <br>$solution\n								$allComments<br><br>\n								Regards<br>Support Administrator\";}'),
(26, 22, 'Send Email to Organization on Ticket Update', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:43:\"Send Email to Organization on Ticket Update\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"26\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:33:\",$(parent_id : (Accounts) email1)\";s:7:\"subject\";s:79:\"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:589:\"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\n								Dear $(parent_id : (Accounts) accountname),<br><br>\n								The Ticket is replied the details are :<br><br>\n								Ticket No : $ticket_no<br>\n								Status : $ticketstatus<br>\n								Category : $ticketcategories<br>\n								Severity : $ticketseverities<br>\n								Priority : $ticketpriorities<br><br>\n								Description : <br>$description<br><br>\n								Solution : <br>$solution<br>\n								The comments are : <br>\n								$allComments<br><br>\n								Regards<br>Support Administrator\";s:10:\"workflowId\";s:2:\"22\";}'),
(27, 23, 'Ticket Creation From CRM : Send Email to Organization', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:53:\"Ticket Creation From CRM : Send Email to Organization\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"27\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:33:\",$(parent_id : (Accounts) email1)\";s:7:\"subject\";s:79:\"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:589:\"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\n								Dear $(parent_id : (Accounts) accountname),<br><br>\n								The Ticket is replied the details are :<br><br>\n								Ticket No : $ticket_no<br>\n								Status : $ticketstatus<br>\n								Category : $ticketcategories<br>\n								Severity : $ticketseverities<br>\n								Priority : $ticketpriorities<br><br>\n								Description : <br>$description<br><br>\n								Solution : <br>$solution<br>\n								The comments are : <br>\n								$allComments<br><br>\n								Regards<br>Support Administrator\";s:10:\"workflowId\";s:2:\"23\";}'),
(28, 24, 'Ticket Creation From CRM : Send Email to Contact', 'O:11:\"VTEmailTask\":9:{s:18:\"executeImmediately\";s:1:\"0\";s:7:\"summary\";s:48:\"Ticket Creation From CRM : Send Email to Contact\";s:6:\"active\";s:1:\"1\";s:2:\"id\";s:2:\"28\";s:9:\"fromEmail\";s:93:\"$(general : (__VtigerMeta__) supportName)&lt;$(general : (__VtigerMeta__) supportEmailId)&gt;\";s:9:\"recepient\";s:33:\",$(contact_id : (Contacts) email)\";s:7:\"subject\";s:79:\"$ticket_no [ Ticket Id : $(general : (__VtigerMeta__) recordId) ] $ticket_title\";s:7:\"content\";s:624:\"Ticket ID : $(general : (__VtigerMeta__) recordId)<br>Ticket Title : $ticket_title<br><br>\n								Dear $(contact_id : (Contacts) lastname) $(contact_id : (Contacts) firstname),<br><br>\n								The Ticket is replied the details are :<br><br>\n								Ticket No : $ticket_no<br>\n								Status : $ticketstatus<br>\n								Category : $ticketcategories<br>\n								Severity : $ticketseverities<br>\n								Priority : $ticketpriorities<br><br>\n								Description : <br>$description<br><br>\n								Solution : <br>$solution<br>\n								The comments are : <br>\n								$allComments<br><br>\n								Regards<br>Support Administrator\";s:10:\"workflowId\";s:2:\"24\";}');

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtasks_entitymethod`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_entitymethod` (
  `workflowtasks_entitymethod_id` int(11) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `function_path` varchar(400) DEFAULT NULL,
  `function_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workflowtasks_entitymethod_id`),
  UNIQUE KEY `com_vtiger_workflowtasks_entitymethod_idx` (`workflowtasks_entitymethod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflowtasks_entitymethod`
--

INSERT INTO `com_vtiger_workflowtasks_entitymethod` (`workflowtasks_entitymethod_id`, `module_name`, `method_name`, `function_path`, `function_name`) VALUES
(1, 'SalesOrder', 'UpdateInventory', 'include/InventoryHandler.php', 'handleInventoryProductRel'),
(2, 'Invoice', 'UpdateInventory', 'include/InventoryHandler.php', 'handleInventoryProductRel'),
(3, 'Contacts', 'SendPortalLoginDetails', 'modules/Contacts/ContactsHandler.php', 'Contacts_sendCustomerPortalLoginDetails'),
(4, 'HelpDesk', 'NotifyOnPortalTicketCreation', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_nofifyOnPortalTicketCreation'),
(5, 'HelpDesk', 'NotifyOnPortalTicketComment', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyOnPortalTicketComment'),
(6, 'HelpDesk', 'NotifyOwnerOnTicketChange', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyOwnerOnTicketChange'),
(7, 'HelpDesk', 'NotifyParentOnTicketChange', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDesk_notifyParentOnTicketChange'),
(8, 'ModComments', 'CustomerCommentFromPortal', 'modules/ModComments/ModCommentsHandler.php', 'CustomerCommentFromPortal'),
(9, 'ModComments', 'TicketOwnerComments', 'modules/ModComments/ModCommentsHandler.php', 'TicketOwnerComments'),
(10, 'PurchaseOrder', 'UpdateInventory', 'include/InventoryHandler.php', 'handleInventoryProductRel');

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtasks_entitymethod_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_entitymethod_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflowtasks_entitymethod_seq`
--

INSERT INTO `com_vtiger_workflowtasks_entitymethod_seq` (`id`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtasks_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtasks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflowtasks_seq`
--

INSERT INTO `com_vtiger_workflowtasks_seq` (`id`) VALUES
(28);

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtask_queue`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtask_queue` (
  `task_id` int(11) DEFAULT NULL,
  `entity_id` varchar(100) DEFAULT NULL,
  `do_after` int(11) DEFAULT NULL,
  `relatedinfo` varchar(255) DEFAULT NULL,
  `task_contents` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflowtemplates`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflowtemplates` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) DEFAULT NULL,
  `title` varchar(400) DEFAULT NULL,
  `template` text DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflow_activatedonce`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflow_activatedonce` (
  `workflow_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`workflow_id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflow_tasktypes`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflow_tasktypes` (
  `id` int(11) NOT NULL,
  `tasktypename` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `classpath` varchar(255) DEFAULT NULL,
  `templatepath` varchar(255) DEFAULT NULL,
  `modules` varchar(500) DEFAULT NULL,
  `sourcemodule` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflow_tasktypes`
--

INSERT INTO `com_vtiger_workflow_tasktypes` (`id`, `tasktypename`, `label`, `classname`, `classpath`, `templatepath`, `modules`, `sourcemodule`) VALUES
(1, 'VTEmailTask', 'Send Mail', 'VTEmailTask', 'modules/com_vtiger_workflow/tasks/VTEmailTask.inc', 'modules/Settings/Workflows/Tasks/VTEmailTask.tpl', '{\"include\":[],\"exclude\":[]}', ''),
(2, 'VTEntityMethodTask', 'Invoke Custom Function', 'VTEntityMethodTask', 'modules/com_vtiger_workflow/tasks/VTEntityMethodTask.inc', 'modules/Settings/Workflows/Tasks/VTEntityMethodTask.tpl', '{\"include\":[],\"exclude\":[]}', ''),
(3, 'VTCreateTodoTask', 'Create Todo', 'VTCreateTodoTask', 'modules/com_vtiger_workflow/tasks/VTCreateTodoTask.inc', 'modules/Settings/Workflows/Tasks/VTCreateTodoTask.tpl', '{\"include\":[\"Leads\",\"Accounts\",\"Potentials\",\"Contacts\",\"HelpDesk\",\"Campaigns\",\"Quotes\",\"PurchaseOrder\",\"SalesOrder\",\"Invoice\",\"Project\"],\"exclude\":[\"Calendar\",\"FAQ\",\"Events\"]}', ''),
(4, 'VTCreateEventTask', 'Create Event', 'VTCreateEventTask', 'modules/com_vtiger_workflow/tasks/VTCreateEventTask.inc', 'modules/Settings/Workflows/Tasks/VTCreateEventTask.tpl', '{\"include\":[\"Leads\",\"Accounts\",\"Potentials\",\"Contacts\",\"HelpDesk\",\"Campaigns\",\"Project\"],\"exclude\":[\"Calendar\",\"FAQ\",\"Events\"]}', ''),
(5, 'VTUpdateFieldsTask', 'Update Fields', 'VTUpdateFieldsTask', 'modules/com_vtiger_workflow/tasks/VTUpdateFieldsTask.inc', 'modules/Settings/Workflows/Tasks/VTUpdateFieldsTask.tpl', '{\"include\":[],\"exclude\":[]}', ''),
(6, 'VTCreateEntityTask', 'Create Entity', 'VTCreateEntityTask', 'modules/com_vtiger_workflow/tasks/VTCreateEntityTask.inc', 'modules/Settings/Workflows/Tasks/VTCreateEntityTask.tpl', '{\"include\":[],\"exclude\":[]}', ''),
(7, 'VTSMSTask', 'SMS Task', 'VTSMSTask', 'modules/com_vtiger_workflow/tasks/VTSMSTask.inc', 'modules/Settings/Workflows/Tasks/VTSMSTask.tpl', '{\"include\":[],\"exclude\":[]}', 'SMSNotifier');

-- --------------------------------------------------------

--
-- Table structure for table `com_vtiger_workflow_tasktypes_seq`
--

CREATE TABLE IF NOT EXISTS `com_vtiger_workflow_tasktypes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_vtiger_workflow_tasktypes_seq`
--

INSERT INTO `com_vtiger_workflow_tasktypes_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `hrm_employee_history`
--

CREATE TABLE IF NOT EXISTS `hrm_employee_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employ_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `si_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_account`
--

CREATE TABLE IF NOT EXISTS `vtiger_account` (
  `accountid` int(19) NOT NULL DEFAULT 0,
  `account_no` varchar(100) NOT NULL,
  `accountname` varchar(100) NOT NULL,
  `parentid` int(19) DEFAULT 0,
  `account_type` varchar(200) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `annualrevenue` decimal(25,8) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `ownership` varchar(50) DEFAULT NULL,
  `siccode` varchar(50) DEFAULT NULL,
  `tickersymbol` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `otherphone` varchar(30) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `employees` int(10) DEFAULT 0,
  `emailoptout` varchar(3) DEFAULT '0',
  `notify_owner` varchar(3) DEFAULT '0',
  `isconvertedfromlead` varchar(3) DEFAULT '0',
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`accountid`),
  KEY `account_account_type_idx` (`account_type`),
  KEY `email_idx` (`email1`,`email2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountbillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountbillads` (
  `accountaddressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`accountaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountrating`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountrating` (
  `accountratingid` int(19) NOT NULL AUTO_INCREMENT,
  `rating` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`accountratingid`),
  UNIQUE KEY `accountrating_rating_idx` (`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountscf` (
  `accountid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accountshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_accountshipads` (
  `accountaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`accountaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accounttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_accounttype` (
  `accounttypeid` int(19) NOT NULL,
  `accounttype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`accounttypeid`),
  UNIQUE KEY `accounttype_accounttype_idx` (`accounttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_accounttype`
--

INSERT INTO `vtiger_accounttype` (`accounttypeid`, `accounttype`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Analyst', 1, 2, 1, NULL),
(3, 'Competitor', 1, 3, 2, NULL),
(4, 'Customer', 1, 4, 3, NULL),
(5, 'Integrator', 1, 5, 4, NULL),
(6, 'Investor', 1, 6, 5, NULL),
(7, 'Partner', 1, 7, 6, NULL),
(8, 'Press', 1, 8, 7, NULL),
(9, 'Prospect', 1, 9, 8, NULL),
(10, 'Reseller', 1, 10, 9, NULL),
(11, 'Other', 1, 11, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_accounttype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_accounttype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_accounttype_seq`
--

INSERT INTO `vtiger_accounttype_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_actionmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_actionmapping` (
  `actionid` int(19) NOT NULL,
  `actionname` varchar(200) NOT NULL,
  `securitycheck` int(19) DEFAULT NULL,
  PRIMARY KEY (`actionid`,`actionname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_actionmapping`
--

INSERT INTO `vtiger_actionmapping` (`actionid`, `actionname`, `securitycheck`) VALUES
(0, 'Save', 0),
(0, 'SavePriceBook', 1),
(0, 'SaveVendor', 1),
(1, 'DetailViewAjax', 1),
(1, 'EditView', 0),
(1, 'PriceBookEditView', 1),
(1, 'QuickCreate', 1),
(1, 'VendorEditView', 1),
(2, 'Delete', 0),
(2, 'DeletePriceBook', 1),
(2, 'DeleteVendor', 1),
(3, 'index', 0),
(3, 'Popup', 1),
(4, 'DetailView', 0),
(4, 'PriceBookDetailView', 1),
(4, 'TagCloud', 1),
(4, 'VendorDetailView', 1),
(5, 'Import', 0),
(6, 'Export', 0),
(7, 'CreateView', 0),
(8, 'Merge', 0),
(9, 'ConvertLead', 0),
(10, 'DuplicatesHandling', 0),
(13, 'Print', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity` (
  `activityid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(255) DEFAULT NULL,
  `semodule` varchar(20) DEFAULT NULL,
  `activitytype` varchar(200) NOT NULL,
  `date_start` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `time_start` varchar(50) DEFAULT NULL,
  `time_end` varchar(50) DEFAULT NULL,
  `sendnotification` varchar(3) NOT NULL DEFAULT '0',
  `duration_hours` varchar(200) DEFAULT NULL,
  `duration_minutes` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `eventstatus` varchar(200) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `notime` varchar(3) NOT NULL DEFAULT '0',
  `visibility` varchar(50) NOT NULL DEFAULT 'all',
  `recurringtype` varchar(200) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`activityid`),
  KEY `activity_activityid_subject_idx` (`activityid`,`subject`),
  KEY `activity_activitytype_date_start_idx` (`activitytype`,`date_start`),
  KEY `activity_date_start_due_date_idx` (`date_start`,`due_date`),
  KEY `activity_date_start_time_start_idx` (`date_start`,`time_start`),
  KEY `activity_eventstatus_idx` (`eventstatus`),
  KEY `activity_status_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activitycf`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitycf` (
  `activityid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activityproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_activityproductrel` (
  `activityid` int(19) NOT NULL DEFAULT 0,
  `productid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activityid`,`productid`),
  KEY `activityproductrel_activityid_idx` (`activityid`),
  KEY `activityproductrel_productid_idx` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activitytype`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitytype` (
  `activitytypeid` int(19) NOT NULL,
  `activitytype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`activitytypeid`),
  UNIQUE KEY `activitytype_activitytype_idx` (`activitytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_activitytype`
--

INSERT INTO `vtiger_activitytype` (`activitytypeid`, `activitytype`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Call', 0, 12, 0, NULL),
(2, 'Meeting', 0, 13, 1, NULL),
(3, 'Mobile Call', 0, 295, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activitytype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_activitytype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_activitytype_seq`
--

INSERT INTO `vtiger_activitytype_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_recurring_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_recurring_info` (
  `activityid` int(19) NOT NULL,
  `recurrenceid` int(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_reminder`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_reminder` (
  `activity_id` int(11) NOT NULL,
  `reminder_time` int(11) NOT NULL,
  `reminder_sent` int(2) NOT NULL,
  `recurringid` int(19) NOT NULL,
  PRIMARY KEY (`activity_id`,`recurringid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_reminder_popup`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_reminder_popup` (
  `reminderid` int(19) NOT NULL,
  `semodule` varchar(100) NOT NULL,
  `recordid` int(19) NOT NULL,
  `date_start` date NOT NULL,
  `time_start` varchar(100) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`reminderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_view`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_view` (
  `activity_viewid` int(19) NOT NULL,
  `activity_view` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`activity_viewid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_activity_view`
--

INSERT INTO `vtiger_activity_view` (`activity_viewid`, `activity_view`, `sortorderid`, `presence`) VALUES
(1, 'Today', 0, 1),
(2, 'This Week', 1, 1),
(3, 'This Month', 2, 1),
(4, 'This Year', 3, 1),
(5, 'Agenda', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_activity_view_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_activity_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_activity_view_seq`
--

INSERT INTO `vtiger_activity_view_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_announcement`
--

CREATE TABLE IF NOT EXISTS `vtiger_announcement` (
  `creatorid` int(19) NOT NULL,
  `announcement` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`creatorid`),
  KEY `announcement_creatorid_idx` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_app2tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_app2tab` (
  `tabid` int(11) DEFAULT NULL,
  `appname` varchar(20) DEFAULT NULL,
  `sequence` int(19) DEFAULT NULL,
  `visible` int(3) DEFAULT 1,
  KEY `vtiger_app2tab_fk_tab` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_app2tab`
--

INSERT INTO `vtiger_app2tab` (`tabid`, `appname`, `sequence`, `visible`) VALUES
(34, 'TOOLS', 5, 1),
(35, 'SUPPORT', 3, 1),
(36, 'INVENTORY', 2, 1),
(40, 'TOOLS', 1, 1),
(46, 'TOOLS', 4, 1),
(49, 'SETTINGS', 1, 1),
(2, 'SALES', 1, 1),
(20, 'SALES', 2, 1),
(4, 'SALES', 6, 1),
(6, 'SALES', 7, 1),
(14, 'SALES', 1, 1),
(36, 'SALES', 4, 1),
(4, 'MARKETING', 3, 1),
(6, 'MARKETING', 4, 1),
(7, 'MARKETING', 2, 1),
(26, 'MARKETING', 1, 1),
(4, 'INVENTORY', 8, 1),
(6, 'INVENTORY', 9, 1),
(22, 'INVENTORY', 3, 1),
(23, 'INVENTORY', 2, 1),
(14, 'INVENTORY', 1, 1),
(18, 'INVENTORY', 7, 1),
(19, 'INVENTORY', 3, 1),
(21, 'INVENTORY', 6, 1),
(4, 'SUPPORT', 6, 1),
(6, 'SUPPORT', 7, 1),
(13, 'SUPPORT', 1, 1),
(15, 'SUPPORT', 2, 1),
(38, 'SUPPORT', 4, 1),
(45, 'PROJECT', 1, 1),
(44, 'PROJECT', 2, 1),
(43, 'PROJECT', 3, 1),
(4, 'PROJECT', 4, 1),
(6, 'PROJECT', 5, 1),
(47, 'SALES', 5, 1),
(47, 'SUPPORT', 5, 1),
(24, 'TOOLS', 2, 1),
(27, 'TOOLS', 3, 1),
(50, 'TOOLS', 6, 1),
(51, 'HRM', 1, 1),
(52, 'HRM', 2, 1),
(53, 'HRM', 3, 1),
(54, 'HRM', 4, 0),
(55, 'HRM', 5, 1),
(56, 'HRM', 6, 1),
(57, 'HRM', 7, 1),
(58, 'HRM', 8, 1),
(59, 'HRM', 9, 1),
(60, 'HRM', 10, 1),
(61, 'HRM', 11, 1),
(63, 'CONTACTS', 1, 1),
(64, 'CONTACTS', 2, 1),
(65, 'SUPPORT', 1, 1),
(66, 'SUPPORT', 2, 1),
(70, 'MARKETING', NULL, 1),
(71, 'MARKETING', NULL, 1),
(72, 'SALES', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_assets`
--

CREATE TABLE IF NOT EXISTS `vtiger_assets` (
  `assetsid` int(11) NOT NULL,
  `asset_no` varchar(30) NOT NULL,
  `account` int(19) DEFAULT NULL,
  `product` int(19) NOT NULL,
  `serialnumber` varchar(200) DEFAULT NULL,
  `datesold` date DEFAULT NULL,
  `dateinservice` date DEFAULT NULL,
  `assetstatus` varchar(200) DEFAULT 'In Service',
  `tagnumber` varchar(300) DEFAULT NULL,
  `invoiceid` int(19) DEFAULT NULL,
  `shippingmethod` varchar(200) DEFAULT NULL,
  `shippingtrackingnumber` varchar(200) DEFAULT NULL,
  `assetname` varchar(100) DEFAULT NULL,
  `contact` int(19) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`assetsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_assetscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetscf` (
  `assetsid` int(19) NOT NULL,
  PRIMARY KEY (`assetsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_assetstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetstatus` (
  `assetstatusid` int(11) NOT NULL,
  `assetstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`assetstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_assetstatus`
--

INSERT INTO `vtiger_assetstatus` (`assetstatusid`, `assetstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'In Service', 1, 235, 1, NULL),
(2, 'Out-of-service', 1, 236, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_assetstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_assetstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_assetstatus_seq`
--

INSERT INTO `vtiger_assetstatus_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_asterisk`
--

CREATE TABLE IF NOT EXISTS `vtiger_asterisk` (
  `server` varchar(30) DEFAULT NULL,
  `port` varchar(30) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_asteriskextensions`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskextensions` (
  `userid` int(11) DEFAULT NULL,
  `asterisk_extension` varchar(50) DEFAULT NULL,
  `use_asterisk` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_asteriskextensions`
--

INSERT INTO `vtiger_asteriskextensions` (`userid`, `asterisk_extension`, `use_asterisk`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_asteriskincomingcalls`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskincomingcalls` (
  `from_number` varchar(50) DEFAULT NULL,
  `from_name` varchar(50) DEFAULT NULL,
  `to_number` varchar(50) DEFAULT NULL,
  `callertype` varchar(30) DEFAULT NULL,
  `flag` int(19) DEFAULT NULL,
  `timer` int(19) DEFAULT NULL,
  `refuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_asteriskincomingevents`
--

CREATE TABLE IF NOT EXISTS `vtiger_asteriskincomingevents` (
  `uid` varchar(255) NOT NULL,
  `channel` varchar(100) DEFAULT NULL,
  `from_number` bigint(20) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `to_number` bigint(20) DEFAULT NULL,
  `callertype` varchar(100) DEFAULT NULL,
  `timer` int(20) DEFAULT NULL,
  `flag` varchar(3) DEFAULT NULL,
  `pbxrecordid` int(19) DEFAULT NULL,
  `relcrmid` int(19) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_attachments`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachments` (
  `attachmentsid` int(19) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `storedname` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attachmentsid`),
  KEY `attachments_attachmentsid_idx` (`attachmentsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_attachmentsfolder`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachmentsfolder` (
  `folderid` int(19) NOT NULL,
  `foldername` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdby` int(19) NOT NULL,
  `sequence` int(19) DEFAULT NULL,
  PRIMARY KEY (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_attachmentsfolder`
--

INSERT INTO `vtiger_attachmentsfolder` (`folderid`, `foldername`, `description`, `createdby`, `sequence`) VALUES
(1, 'Default', 'This is a Default Folder', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_attachmentsfolder_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_attachmentsfolder_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_attachmentsfolder_seq`
--

INSERT INTO `vtiger_attachmentsfolder_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_audit_trial`
--

CREATE TABLE IF NOT EXISTS `vtiger_audit_trial` (
  `auditid` int(19) NOT NULL,
  `userid` int(19) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `recordid` varchar(20) DEFAULT NULL,
  `actiondate` datetime DEFAULT NULL,
  PRIMARY KEY (`auditid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_blocks`
--

CREATE TABLE IF NOT EXISTS `vtiger_blocks` (
  `blockid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `blocklabel` varchar(100) NOT NULL,
  `sequence` int(10) DEFAULT NULL,
  `show_title` int(2) DEFAULT NULL,
  `visible` int(2) NOT NULL DEFAULT 0,
  `create_view` int(2) NOT NULL DEFAULT 0,
  `edit_view` int(2) NOT NULL DEFAULT 0,
  `detail_view` int(2) NOT NULL DEFAULT 0,
  `display_status` int(1) NOT NULL DEFAULT 1,
  `iscustom` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`blockid`),
  KEY `block_tabid_idx` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_blocks`
--

INSERT INTO `vtiger_blocks` (`blockid`, `tabid`, `blocklabel`, `sequence`, `show_title`, `visible`, `create_view`, `edit_view`, `detail_view`, `display_status`, `iscustom`) VALUES
(1, 2, 'LBL_OPPORTUNITY_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(2, 2, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(3, 2, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(4, 4, 'LBL_CONTACT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(5, 4, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(6, 4, 'LBL_CUSTOMER_PORTAL_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(7, 4, 'LBL_ADDRESS_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(8, 4, 'LBL_DESCRIPTION_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(9, 6, 'LBL_ACCOUNT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(10, 6, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(11, 6, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(12, 6, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(13, 7, 'LBL_LEAD_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(14, 7, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(15, 7, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(16, 7, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(17, 8, 'LBL_NOTE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(18, 8, 'LBL_FILE_INFORMATION', 3, 1, 0, 0, 0, 0, 1, 0),
(19, 9, 'LBL_TASK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(20, 9, 'LBL_DESCRIPTION_INFORMATION', 3, 1, 0, 0, 0, 0, 1, 0),
(21, 10, 'LBL_EMAIL_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(22, 10, 'Emails_Block1', 2, 1, 0, 0, 0, 0, 1, 0),
(23, 10, 'Emails_Block2', 3, 1, 0, 0, 0, 0, 1, 0),
(24, 10, 'Emails_Block3', 4, 1, 0, 0, 0, 0, 1, 0),
(25, 13, 'LBL_TICKET_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(26, 13, '', 2, 1, 0, 0, 0, 0, 1, 0),
(27, 13, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(28, 13, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(29, 13, 'LBL_TICKET_RESOLUTION', 5, 0, 0, 1, 0, 0, 1, 0),
(30, 13, 'LBL_COMMENTS', 6, 0, 0, 1, 0, 0, 1, 0),
(31, 14, 'LBL_PRODUCT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(32, 14, 'LBL_PRICING_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(33, 14, 'LBL_STOCK_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(34, 14, 'LBL_CUSTOM_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(35, 14, 'LBL_IMAGE_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(36, 14, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(37, 15, 'LBL_FAQ_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(38, 15, 'LBL_COMMENT_INFORMATION', 4, 0, 0, 1, 0, 0, 1, 0),
(39, 16, 'LBL_EVENT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(40, 16, 'LBL_REMINDER_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(41, 16, 'LBL_DESCRIPTION_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(42, 18, 'LBL_VENDOR_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(43, 18, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(44, 18, 'LBL_VENDOR_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(45, 18, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(46, 19, 'LBL_PRICEBOOK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(47, 19, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(48, 19, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(49, 20, 'LBL_QUOTE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(50, 20, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(51, 20, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(52, 20, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(53, 20, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(54, 20, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(55, 21, 'LBL_PO_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(56, 21, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(57, 21, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(58, 21, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(59, 21, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(60, 21, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(61, 22, 'LBL_SO_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(62, 22, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(63, 22, 'LBL_ADDRESS_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(64, 22, 'LBL_RELATED_PRODUCTS', 5, 0, 0, 0, 0, 0, 1, 0),
(65, 22, 'LBL_TERMS_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(66, 22, 'LBL_DESCRIPTION_INFORMATION', 7, 0, 0, 0, 0, 0, 1, 0),
(67, 23, 'LBL_INVOICE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(68, 23, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(69, 23, 'LBL_ADDRESS_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(70, 23, 'LBL_RELATED_PRODUCTS', 4, 0, 0, 0, 0, 0, 1, 0),
(71, 23, 'LBL_TERMS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(72, 23, 'LBL_DESCRIPTION_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(73, 4, 'LBL_IMAGE_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(74, 26, 'LBL_CAMPAIGN_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(75, 26, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(76, 26, 'LBL_EXPECTATIONS_AND_ACTUALS', 3, 0, 0, 0, 0, 0, 1, 0),
(77, 29, 'LBL_USERLOGIN_ROLE', 1, 0, 0, 0, 0, 0, 1, 0),
(78, 29, 'LBL_CURRENCY_CONFIGURATION', 3, 0, 0, 0, 0, 0, 1, 0),
(79, 29, 'LBL_MORE_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(80, 29, 'LBL_ADDRESS_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(81, 26, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(82, 29, 'LBL_USER_IMAGE_INFORMATION', 5, 0, 0, 0, 0, 0, 1, 0),
(83, 29, 'LBL_USER_ADV_OPTIONS', 6, 0, 0, 0, 0, 0, 1, 0),
(84, 8, 'LBL_DESCRIPTION', 2, 0, 0, 0, 0, 0, 1, 0),
(85, 22, 'Recurring Invoice Information', 2, 0, 0, 0, 0, 0, 1, 0),
(86, 9, 'LBL_CUSTOM_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(87, 16, 'LBL_CUSTOM_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(88, 34, 'LBL_PBXMANAGER_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(89, 35, 'LBL_SERVICE_CONTRACT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(90, 35, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(91, 36, 'LBL_SERVICE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(92, 36, 'LBL_PRICING_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(93, 36, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(94, 36, 'LBL_DESCRIPTION_INFORMATION', 4, 0, 0, 0, 0, 0, 1, 0),
(95, 38, 'LBL_ASSET_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(96, 38, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(97, 38, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(98, 42, 'LBL_MODCOMMENTS_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(99, 42, 'LBL_OTHER_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(100, 42, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(101, 43, 'LBL_PROJECT_MILESTONE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(102, 43, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(103, 43, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(104, 44, 'LBL_PROJECT_TASK_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(105, 44, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(106, 44, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(107, 45, 'LBL_PROJECT_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(108, 45, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(109, 45, 'LBL_DESCRIPTION_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(110, 47, 'LBL_SMSNOTIFIER_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(111, 47, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(112, 47, 'StatusInformation', 3, 0, 0, 0, 0, 0, 1, 0),
(113, 23, 'LBL_ITEM_DETAILS', 5, 0, 0, 0, 0, 0, 1, 0),
(114, 22, 'LBL_ITEM_DETAILS', 5, 0, 0, 0, 0, 0, 1, 0),
(115, 21, 'LBL_ITEM_DETAILS', 5, 0, 0, 0, 0, 0, 1, 0),
(116, 20, 'LBL_ITEM_DETAILS', 5, 0, 0, 0, 0, 0, 1, 0),
(117, 16, 'LBL_RECURRENCE_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(118, 29, 'LBL_CALENDAR_SETTINGS', 2, 0, 0, 0, 0, 0, 1, 0),
(119, 16, 'LBL_RELATED_TO', 4, 0, 0, 0, 0, 0, 1, 0),
(120, 9, 'LBL_REMINDER_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(121, 50, 'LBL_SH_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(122, 51, 'LBL_SP_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(123, 52, 'LBL_STW_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(124, 53, 'LBL_SalaryComponent_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(125, 54, 'LBL_Salary_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(126, 55, 'LBL_RATING_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(127, 55, 'LBL_RANKING_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(128, 56, 'LBL_JD_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(129, 57, 'LBL_QCM_SUMMARY', 1, 0, 0, 0, 0, 0, 1, 0),
(130, 58, 'LBL_KPI_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(131, 58, 'LBL_EXPECT_ACTUAL', 2, 0, 0, 0, 0, 0, 1, 0),
(132, 58, 'LBL_KPI_RESULT', 3, 0, 0, 0, 0, 0, 1, 0),
(133, 59, 'LBL_CANDIDATE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(134, 59, 'LBL_SHORTLIST', 2, 0, 0, 0, 0, 0, 1, 0),
(135, 59, 'LBL_REJECT', 3, 0, 0, 0, 0, 0, 1, 0),
(136, 59, 'LBL_SCHEDULE_INTERVIEW', 4, 0, 0, 0, 0, 0, 1, 0),
(137, 59, 'LBL_MARK_INTERVEW_PASSED', 5, 0, 0, 0, 0, 0, 1, 0),
(138, 59, 'LBL_MARK_INTERVEW_FAILED', 6, 0, 0, 0, 0, 0, 1, 0),
(139, 59, 'LBL_OFFER_JOB', 7, 0, 0, 0, 0, 0, 1, 0),
(140, 60, 'LBL_LEAVE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(141, 61, 'LBL_PERSONAL_DETAIL', 1, 0, 0, 0, 0, 0, 1, 0),
(159, 63, 'LBL_CUSTOMERENTERPRISE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(160, 63, 'LBL_CUSTOM_INFORMATION', 6, 0, 0, 0, 0, 0, 1, 0),
(161, 63, 'Liên hệ chính', 2, 0, 0, 0, 0, 0, 1, 1),
(162, 63, 'Thông tin khác', 3, 0, 0, 0, 0, 0, 1, 1),
(169, 64, 'LBL_CUSTOMERSTANDALONE_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(170, 64, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(171, 65, 'LBL_PROBLEMCATEGORY_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(172, 65, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(173, 66, 'LBL_SUPPORTPROTOCOL_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(174, 66, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(175, 63, 'Địa chỉ', 4, 0, 0, 0, 0, 0, 1, 1),
(185, 70, 'LBL_PHUONGTIENTRUYENTHONG_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(186, 70, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(187, 71, 'LBL_HINHTHUCTRUYENTHONG_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(188, 71, 'LBL_CUSTOM_INFORMATION', 2, 0, 0, 0, 0, 0, 1, 0),
(189, 72, 'LBL_QUYTRINHBANHANG_INFORMATION', 1, 0, 0, 0, 0, 0, 1, 0),
(190, 72, 'LBL_CUSTOM_INFORMATION', 3, 0, 0, 0, 0, 0, 1, 0),
(191, 72, 'Giai doan ban hang', 2, 0, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_blocks_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_blocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_blocks_seq`
--

INSERT INTO `vtiger_blocks_seq` (`id`) VALUES
(191);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_calendarsharedtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendarsharedtype` (
  `calendarsharedtypeid` int(11) NOT NULL,
  `calendarsharedtype` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`calendarsharedtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_calendarsharedtype`
--

INSERT INTO `vtiger_calendarsharedtype` (`calendarsharedtypeid`, `calendarsharedtype`, `sortorderid`, `presence`) VALUES
(1, 'public', 0, 1),
(2, 'private', 1, 1),
(3, 'seletedusers', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_calendarsharedtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendarsharedtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_calendarsharedtype_seq`
--

INSERT INTO `vtiger_calendarsharedtype_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_calendar_default_activitytypes`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendar_default_activitytypes` (
  `id` int(19) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `defaultcolor` varchar(50) DEFAULT NULL,
  `isdefault` int(11) DEFAULT 1,
  `conditions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_calendar_default_activitytypes`
--

INSERT INTO `vtiger_calendar_default_activitytypes` (`id`, `module`, `fieldname`, `defaultcolor`, `isdefault`, `conditions`) VALUES
(1, 'Events', '[\"date_start\",\"due_date\"]', '#17309A', 1, NULL),
(2, 'Calendar', '[\"date_start\",\"due_date\"]', '#3A87AD', 1, NULL),
(3, 'Potentials', '[\"closingdate\"]', '#AA6705', 1, NULL),
(4, 'Contacts', '[\"support_end_date\"]', '#953B39', 1, NULL),
(5, 'Contacts', '[\"birthday\"]', '#545252', 1, NULL),
(6, 'Invoice', '[\"duedate\"]', '#87865D', 1, NULL),
(7, 'Project', '[\"startdate\",\"targetenddate\"]', '#C71585', 1, NULL),
(8, 'ProjectTask', '[\"startdate\",\"enddate\"]', '#006400', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_calendar_default_activitytypes_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendar_default_activitytypes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_calendar_default_activitytypes_seq`
--

INSERT INTO `vtiger_calendar_default_activitytypes_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_calendar_user_activitytypes`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendar_user_activitytypes` (
  `id` int(19) NOT NULL,
  `defaultid` int(19) DEFAULT NULL,
  `userid` int(19) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `visible` int(19) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_calendar_user_activitytypes`
--

INSERT INTO `vtiger_calendar_user_activitytypes` (`id`, `defaultid`, `userid`, `color`, `visible`) VALUES
(1, 1, 1, '#17309A', 1),
(2, 2, 1, '#3A87AD', 1),
(3, 3, 1, '#AA6705', 1),
(4, 4, 1, '#953B39', 1),
(5, 5, 1, '#545252', 1),
(6, 6, 1, '#87865D', 1),
(7, 7, 1, '#C71585', 1),
(8, 8, 1, '#006400', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_calendar_user_activitytypes_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_calendar_user_activitytypes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_calendar_user_activitytypes_seq`
--

INSERT INTO `vtiger_calendar_user_activitytypes_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_callduration`
--

CREATE TABLE IF NOT EXISTS `vtiger_callduration` (
  `calldurationid` int(11) NOT NULL,
  `callduration` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`calldurationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_callduration`
--

INSERT INTO `vtiger_callduration` (`calldurationid`, `callduration`, `sortorderid`, `presence`) VALUES
(1, '5', 0, 1),
(2, '10', 1, 1),
(3, '30', 2, 1),
(4, '60', 3, 1),
(5, '120', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_callduration_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_callduration_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_callduration_seq`
--

INSERT INTO `vtiger_callduration_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaign`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaign` (
  `campaign_no` varchar(100) NOT NULL,
  `campaignname` varchar(255) DEFAULT NULL,
  `campaigntype` varchar(200) DEFAULT NULL,
  `campaignstatus` varchar(200) DEFAULT NULL,
  `expectedrevenue` decimal(25,8) DEFAULT NULL,
  `budgetcost` decimal(25,8) DEFAULT NULL,
  `actualcost` decimal(25,8) DEFAULT NULL,
  `expectedresponse` varchar(200) DEFAULT NULL,
  `numsent` decimal(11,0) DEFAULT NULL,
  `product_id` int(19) DEFAULT NULL,
  `sponsor` varchar(255) DEFAULT NULL,
  `targetaudience` varchar(255) DEFAULT NULL,
  `targetsize` int(19) DEFAULT NULL,
  `expectedresponsecount` int(19) DEFAULT NULL,
  `expectedsalescount` int(19) DEFAULT NULL,
  `expectedroi` decimal(25,8) DEFAULT NULL,
  `actualresponsecount` int(19) DEFAULT NULL,
  `actualsalescount` int(19) DEFAULT NULL,
  `actualroi` decimal(25,8) DEFAULT NULL,
  `campaignid` int(19) NOT NULL,
  `closingdate` date DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `cf_1251` int(10) DEFAULT NULL,
  `cf_1262` int(10) DEFAULT NULL,
  `cf_1270` int(10) DEFAULT NULL,
  PRIMARY KEY (`campaignid`),
  KEY `campaign_campaignstatus_idx` (`campaignstatus`),
  KEY `campaign_campaignname_idx` (`campaignname`),
  KEY `campaign_campaignid_idx` (`campaignid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignaccountrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignaccountrel` (
  `campaignid` int(19) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `campaignrelstatusid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaigncontrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigncontrel` (
  `campaignid` int(19) NOT NULL DEFAULT 0,
  `contactid` int(19) NOT NULL DEFAULT 0,
  `campaignrelstatusid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`campaignid`,`contactid`,`campaignrelstatusid`),
  KEY `campaigncontrel_contractid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignleadrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignleadrel` (
  `campaignid` int(19) NOT NULL DEFAULT 0,
  `leadid` int(19) NOT NULL DEFAULT 0,
  `campaignrelstatusid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`campaignid`,`leadid`,`campaignrelstatusid`),
  KEY `campaignleadrel_leadid_campaignid_idx` (`leadid`,`campaignid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignrelstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignrelstatus` (
  `campaignrelstatusid` int(19) DEFAULT NULL,
  `campaignrelstatus` varchar(256) DEFAULT NULL,
  `sortorderid` int(19) DEFAULT NULL,
  `presence` int(19) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaignrelstatus`
--

INSERT INTO `vtiger_campaignrelstatus` (`campaignrelstatusid`, `campaignrelstatus`, `sortorderid`, `presence`, `color`) VALUES
(2, 'Contacted - Successful', 1, 1, NULL),
(3, 'Contacted - Unsuccessful', 2, 1, NULL),
(4, 'Contacted - Never Contact Again', 3, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignrelstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignrelstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaignrelstatus_seq`
--

INSERT INTO `vtiger_campaignrelstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignscf` (
  `campaignid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`campaignid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignstatus` (
  `campaignstatusid` int(19) NOT NULL,
  `campaignstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`campaignstatusid`),
  KEY `campaignstatus_campaignstatus_idx` (`campaignstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaignstatus`
--

INSERT INTO `vtiger_campaignstatus` (`campaignstatusid`, `campaignstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Planning', 1, 15, 1, NULL),
(3, 'Active', 1, 16, 2, NULL),
(4, 'Inactive', 1, 17, 3, NULL),
(5, 'Completed', 1, 18, 4, NULL),
(6, 'Cancelled', 1, 19, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaignstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaignstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaignstatus_seq`
--

INSERT INTO `vtiger_campaignstatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaigntype`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigntype` (
  `campaigntypeid` int(19) NOT NULL,
  `campaigntype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`campaigntypeid`),
  UNIQUE KEY `campaigntype_campaigntype_idx` (`campaigntype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaigntype`
--

INSERT INTO `vtiger_campaigntype` (`campaigntypeid`, `campaigntype`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Conference', 1, 21, 1, NULL),
(3, 'Webinar', 1, 22, 2, NULL),
(4, 'Trade Show', 1, 23, 3, NULL),
(5, 'Public Relations', 1, 24, 4, NULL),
(6, 'Partners', 1, 25, 5, NULL),
(7, 'Referral Program', 1, 26, 6, NULL),
(8, 'Advertisement', 1, 27, 7, NULL),
(9, 'Banner Ads', 1, 28, 8, NULL),
(10, 'Direct Mail', 1, 29, 9, NULL),
(11, 'Email', 1, 30, 10, NULL),
(12, 'Telemarketing', 1, 31, 11, NULL),
(13, 'Others', 1, 32, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_campaigntype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_campaigntype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_campaigntype_seq`
--

INSERT INTO `vtiger_campaigntype_seq` (`id`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_candidate_action`
--

CREATE TABLE IF NOT EXISTS `vtiger_candidate_action` (
  `candidate_actionid` int(11) NOT NULL,
  `candidate_action` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`candidate_actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_candidate_action`
--

INSERT INTO `vtiger_candidate_action` (`candidate_actionid`, `candidate_action`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Shortlist', 1, 348, 1, NULL),
(2, 'Reject', 1, 349, 2, NULL),
(3, 'Schedule Interview', 1, 350, 3, NULL),
(4, 'Mark Interview Passed', 1, 351, 4, NULL),
(5, 'Mark Interview Failed', 1, 352, 5, NULL),
(6, 'Offer Job', 1, 353, 6, NULL),
(7, 'Hire', 1, 354, 7, NULL),
(8, 'No Action', 1, 355, 8, NULL),
(9, 'Back to active', 1, 356, 9, NULL),
(10, 'Reject after shortlist', 1, 357, 10, NULL),
(11, 'Reject after SI', 1, 358, 11, NULL),
(12, 'Reject after MIP', 1, 359, 12, NULL),
(13, 'Reject after OJ', 1, 360, 13, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_candidate_action_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_candidate_action_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_candidate_action_seq`
--

INSERT INTO `vtiger_candidate_action_seq` (`id`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_candidate_resource_cv`
--

CREATE TABLE IF NOT EXISTS `vtiger_candidate_resource_cv` (
  `candidate_resource_cvid` int(11) NOT NULL,
  `candidate_resource_cv` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`candidate_resource_cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_candidate_resource_cv`
--

INSERT INTO `vtiger_candidate_resource_cv` (`candidate_resource_cvid`, `candidate_resource_cv`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Facebook', 1, 343, 1, NULL),
(2, 'Vietnamwork.com', 1, 344, 2, NULL),
(3, 'itviec.com', 1, 345, 3, NULL),
(4, 'zalo', 1, 346, 4, NULL),
(5, 'google.com', 1, 347, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_candidate_resource_cv_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_candidate_resource_cv_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_candidate_resource_cv_seq`
--

INSERT INTO `vtiger_candidate_resource_cv_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_carrier`
--

CREATE TABLE IF NOT EXISTS `vtiger_carrier` (
  `carrierid` int(19) NOT NULL,
  `carrier` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`carrierid`),
  UNIQUE KEY `carrier_carrier_idx` (`carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_carrier`
--

INSERT INTO `vtiger_carrier` (`carrierid`, `carrier`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'FedEx', 1, 33, 0, NULL),
(2, 'UPS', 1, 34, 1, NULL),
(3, 'USPS', 1, 35, 2, NULL),
(4, 'DHL', 1, 36, 3, NULL),
(5, 'BlueDart', 1, 37, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_carrier_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_carrier_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_carrier_seq`
--

INSERT INTO `vtiger_carrier_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1121`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1121` (
  `cf_1121id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1121` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1121id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1121`
--

INSERT INTO `vtiger_cf_1121` (`cf_1121id`, `cf_1121`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Anh', 0, 1, NULL),
(2, 'Chị', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1121_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1121_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1121_seq`
--

INSERT INTO `vtiger_cf_1121_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1137`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1137` (
  `cf_1137id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1137` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1137id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1137`
--

INSERT INTO `vtiger_cf_1137` (`cf_1137id`, `cf_1137`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Thân thiết', 0, 1, NULL),
(2, 'Tiềm năng', 1, 1, NULL),
(3, 'Mới', 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1137_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1137_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1137_seq`
--

INSERT INTO `vtiger_cf_1137_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1141`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1141` (
  `cf_1141id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1141` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1141id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1141`
--

INSERT INTO `vtiger_cf_1141` (`cf_1141id`, `cf_1141`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Kế toán', 0, 1, NULL),
(2, 'Kinh doanh', 1, 1, NULL),
(3, 'IT', 2, 1, NULL),
(4, 'Nhân sự', 3, 1, NULL),
(5, 'Sales', 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1141_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1141_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1141_seq`
--

INSERT INTO `vtiger_cf_1141_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1143`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1143` (
  `cf_1143id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1143` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1143id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1143`
--

INSERT INTO `vtiger_cf_1143` (`cf_1143id`, `cf_1143`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Nhân viên', 0, 1, NULL),
(2, 'Trưởng phòng', 1, 1, NULL),
(3, 'Giám đốc', 2, 1, NULL),
(4, 'Chủ tịch', 3, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1143_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1143_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1143_seq`
--

INSERT INTO `vtiger_cf_1143_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1145`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1145` (
  `cf_1145id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1145` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1145id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1145`
--

INSERT INTO `vtiger_cf_1145` (`cf_1145id`, `cf_1145`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Doanh nghiệp tư nhân', 0, 1, NULL),
(2, 'Doanh nghiệp nhà nước', 1, 1, NULL),
(3, 'Doanh nghiệp có vốn nước ngoài', 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1145_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1145_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1145_seq`
--

INSERT INTO `vtiger_cf_1145_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1147`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1147` (
  `cf_1147id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1147` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1147id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1147`
--

INSERT INTO `vtiger_cf_1147` (`cf_1147id`, `cf_1147`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Công ty cổ phần', 0, 1, NULL),
(2, 'Công ty trách nhiệm hữu hạn một thành viên', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1147_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1147_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1147_seq`
--

INSERT INTO `vtiger_cf_1147_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1161`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1161` (
  `cf_1161id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1161` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1161id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1161`
--

INSERT INTO `vtiger_cf_1161` (`cf_1161id`, `cf_1161`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Tài chính', 0, 1, NULL),
(2, 'Chứng khoáng', 1, 1, NULL),
(3, 'Công nghệ thông tin', 2, 1, NULL),
(4, 'May mặc', 3, 1, NULL),
(5, 'Cơ khí', 4, 1, NULL),
(6, 'Điện lạnh', 5, 1, NULL),
(7, 'Vận chuyển', 6, 1, NULL),
(8, 'Nông nghiệp', 7, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1161_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1161_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1161_seq`
--

INSERT INTO `vtiger_cf_1161_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1221`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1221` (
  `cf_1221id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1221` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1221id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1221`
--

INSERT INTO `vtiger_cf_1221` (`cf_1221id`, `cf_1221`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Việt nam', 0, 1, NULL),
(2, 'Mỹ', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1221_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1221_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1221_seq`
--

INSERT INTO `vtiger_cf_1221_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1286`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1286` (
  `cf_1286id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_1286` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cf_1286id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cf_1286`
--

INSERT INTO `vtiger_cf_1286` (`cf_1286id`, `cf_1286`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Tiềm năng', 0, 1, NULL),
(2, 'Phân tích nhu cầu và khó khăn của khách hàng', 1, 1, NULL),
(3, 'Tìm sản phẩm hoặc dịch vụ giải quyết khó khăn và định giá', 2, 1, NULL),
(4, 'Phân tích đánh giá của khách hàng về sản phẩm và dịch vụ', 3, 1, NULL),
(5, 'Đề xuất giải pháp và báo giá', 4, 1, NULL),
(6, 'Thương thảo', 5, 1, NULL),
(7, 'Kết thúc thành công', 6, 1, NULL),
(8, 'Kết thúc thất bại', 7, 1, NULL),
(9, 'Xác định tiềm năng này có phải là cơ hội bán hàng hay không', 8, 1, NULL),
(10, 'Xác định người ra quyết định', 9, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cf_1286_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_cf_1286_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_cf_1286_seq`
--

INSERT INTO `vtiger_cf_1286_seq` (`id`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cntactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_cntactivityrel` (
  `contactid` int(19) NOT NULL DEFAULT 0,
  `activityid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contactid`,`activityid`),
  KEY `cntactivityrel_contactid_idx` (`contactid`),
  KEY `cntactivityrel_activityid_idx` (`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contactaddress`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactaddress` (
  `contactaddressid` int(19) NOT NULL DEFAULT 0,
  `mailingcity` varchar(40) DEFAULT NULL,
  `mailingstreet` varchar(250) DEFAULT NULL,
  `mailingcountry` varchar(40) DEFAULT NULL,
  `othercountry` varchar(30) DEFAULT NULL,
  `mailingstate` varchar(30) DEFAULT NULL,
  `mailingpobox` varchar(30) DEFAULT NULL,
  `othercity` varchar(40) DEFAULT NULL,
  `otherstate` varchar(50) DEFAULT NULL,
  `mailingzip` varchar(30) DEFAULT NULL,
  `otherzip` varchar(30) DEFAULT NULL,
  `otherstreet` varchar(250) DEFAULT NULL,
  `otherpobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`contactaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contactdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactdetails` (
  `contactid` int(19) NOT NULL DEFAULT 0,
  `contact_no` varchar(100) NOT NULL,
  `accountid` int(19) DEFAULT NULL,
  `salutation` varchar(200) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(80) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `reportsto` varchar(30) DEFAULT NULL,
  `training` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `contacttype` varchar(50) DEFAULT NULL,
  `otheremail` varchar(100) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `donotcall` varchar(3) DEFAULT NULL,
  `emailoptout` varchar(3) DEFAULT '0',
  `imagename` varchar(150) DEFAULT NULL,
  `reference` varchar(3) DEFAULT NULL,
  `notify_owner` varchar(3) DEFAULT '0',
  `isconvertedfromlead` varchar(3) DEFAULT '0',
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`contactid`),
  KEY `contactdetails_accountid_idx` (`accountid`),
  KEY `email_idx` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contactscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactscf` (
  `contactid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contactsubdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_contactsubdetails` (
  `contactsubscriptionid` int(19) NOT NULL DEFAULT 0,
  `homephone` varchar(50) DEFAULT NULL,
  `otherphone` varchar(50) DEFAULT NULL,
  `assistant` varchar(30) DEFAULT NULL,
  `assistantphone` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `laststayintouchrequest` int(30) DEFAULT 0,
  `laststayintouchsavedate` int(19) DEFAULT 0,
  `leadsource` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`contactsubscriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contpotentialrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_contpotentialrel` (
  `contactid` int(19) NOT NULL DEFAULT 0,
  `potentialid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contactid`,`potentialid`),
  KEY `contpotentialrel_potentialid_idx` (`potentialid`),
  KEY `contpotentialrel_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_priority`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_priority` (
  `contract_priorityid` int(11) NOT NULL,
  `contract_priority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`contract_priorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_priority`
--

INSERT INTO `vtiger_contract_priority` (`contract_priorityid`, `contract_priority`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Low', 1, 220, 1, NULL),
(2, 'Normal', 1, 221, 2, NULL),
(3, 'High', 1, 222, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_priority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_priority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_priority_seq`
--

INSERT INTO `vtiger_contract_priority_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_status` (
  `contract_statusid` int(11) NOT NULL,
  `contract_status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`contract_statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_status`
--

INSERT INTO `vtiger_contract_status` (`contract_statusid`, `contract_status`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Undefined', 1, 214, 1, NULL),
(2, 'In Planning', 1, 215, 2, NULL),
(3, 'In Progress', 1, 216, 3, NULL),
(4, 'On Hold', 1, 217, 4, NULL),
(5, 'Complete', 0, 218, 5, NULL),
(6, 'Archived', 1, 219, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_status_seq`
--

INSERT INTO `vtiger_contract_status_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_type`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_type` (
  `contract_typeid` int(11) NOT NULL,
  `contract_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`contract_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_type`
--

INSERT INTO `vtiger_contract_type` (`contract_typeid`, `contract_type`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Support', 1, 223, 1, NULL),
(2, 'Services', 1, 224, 2, NULL),
(3, 'Administrative', 1, 225, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_contract_type_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_contract_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_contract_type_seq`
--

INSERT INTO `vtiger_contract_type_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_convertleadmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_convertleadmapping` (
  `cfmid` int(19) NOT NULL,
  `leadfid` int(19) NOT NULL,
  `accountfid` int(19) DEFAULT NULL,
  `contactfid` int(19) DEFAULT NULL,
  `potentialfid` int(19) DEFAULT NULL,
  `editable` int(19) DEFAULT 1,
  PRIMARY KEY (`cfmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_convertleadmapping`
--

INSERT INTO `vtiger_convertleadmapping` (`cfmid`, `leadfid`, `accountfid`, `contactfid`, `potentialfid`, `editable`) VALUES
(1, 43, 1, 0, 110, 0),
(2, 49, 14, 0, 0, 1),
(3, 40, 3, 69, 0, 1),
(4, 44, 5, 77, 0, 1),
(5, 52, 13, 0, 0, 1),
(6, 46, 9, 80, 0, 0),
(7, 48, 4, 0, 0, 1),
(8, 61, 26, 98, 0, 1),
(9, 60, 30, 0, 0, 1),
(10, 62, 32, 104, 0, 1),
(11, 63, 28, 100, 0, 1),
(12, 59, 24, 96, 0, 1),
(13, 64, 34, 106, 0, 1),
(14, 61, 27, 0, 0, 1),
(15, 60, 31, 0, 0, 1),
(16, 62, 33, 0, 0, 1),
(17, 63, 29, 0, 0, 1),
(18, 59, 25, 0, 0, 1),
(19, 64, 35, 0, 0, 1),
(20, 65, 36, 109, 125, 1),
(21, 37, 0, 66, 0, 1),
(22, 38, 0, 67, 0, 0),
(23, 41, 0, 70, 0, 0),
(24, 42, 0, 71, 0, 1),
(25, 45, 0, 76, 0, 1),
(26, 55, 0, 83, 0, 1),
(27, 47, 0, 74, 117, 1),
(28, 50, 0, 0, 0, 1),
(29, 53, 10, 0, 0, 1),
(30, 51, 17, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_convertpotentialmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_convertpotentialmapping` (
  `cfmid` int(19) NOT NULL,
  `potentialfid` int(19) NOT NULL,
  `projectfid` int(19) DEFAULT NULL,
  `editable` int(11) DEFAULT 1,
  PRIMARY KEY (`cfmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_convertpotentialmapping`
--

INSERT INTO `vtiger_convertpotentialmapping` (`cfmid`, `potentialfid`, `projectfid`, `editable`) VALUES
(1, 110, 648, NULL),
(2, 125, 664, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmentity`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentity` (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(100) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `smgroupid` int(19) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`crmid`),
  KEY `crmentity_smcreatorid_idx` (`smcreatorid`),
  KEY `crmentity_modifiedby_idx` (`modifiedby`),
  KEY `crmentity_deleted_idx` (`deleted`),
  KEY `crm_ownerid_del_setype_idx` (`smownerid`,`deleted`,`setype`),
  KEY `vtiger_crmentity_labelidx` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_crmentity`
--

INSERT INTO `vtiger_crmentity` (`crmid`, `smcreatorid`, `smownerid`, `modifiedby`, `setype`, `description`, `createdtime`, `modifiedtime`, `viewedtime`, `status`, `version`, `presence`, `deleted`, `smgroupid`, `source`, `label`) VALUES
(29, 1, 1, 1, 'Employee', NULL, '2020-05-18 15:18:04', '2020-05-18 15:18:04', NULL, NULL, 0, 1, 0, 0, 'CRM', 'Wang'),
(30, 1, 1, 1, 'PhuongTienTruyenThong', NULL, '2020-05-20 17:19:54', '2020-05-21 17:47:01', NULL, NULL, 0, 1, 0, 0, 'CRM', '[\"\"]'),
(31, 1, 1, 1, 'Products', '', '2020-05-21 16:58:20', '2020-05-21 16:58:20', NULL, NULL, 0, 1, 0, 0, 'CRM', 'Máy tính'),
(32, 1, 1, 1, 'PhuongTienTruyenThong', NULL, '2020-05-22 15:27:08', '2020-05-22 15:27:08', NULL, NULL, 0, 1, 0, 0, 'CRM', NULL),
(33, 1, 1, 1, 'PhuongTienTruyenThong', NULL, '2020-05-22 15:35:35', '2020-05-22 15:35:35', NULL, NULL, 0, 1, 0, 0, 'CRM', '[\"Facebook\"]'),
(34, 1, 1, 1, 'HinhThucTruyenThong', NULL, '2020-05-22 16:23:05', '2020-05-22 16:23:05', NULL, NULL, 0, 1, 0, 0, 'CRM', '[\"Ch\\u1ea1y qu\\u1ea3ng c\\u00e1o\"]');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmentityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentityrel` (
  `crmid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `relcrmid` int(11) NOT NULL,
  `relmodule` varchar(100) NOT NULL,
  KEY `crmid_idx` (`crmid`),
  KEY `relcrmid_idx` (`relcrmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmentity_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentity_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_crmentity_seq`
--

INSERT INTO `vtiger_crmentity_seq` (`id`) VALUES
(34);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmentity_user_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmentity_user_field` (
  `recordid` int(19) NOT NULL,
  `userid` int(19) NOT NULL,
  `starred` varchar(100) DEFAULT NULL,
  KEY `record_user_idx` (`recordid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_crmentity_user_field`
--

INSERT INTO `vtiger_crmentity_user_field` (`recordid`, `userid`, `starred`) VALUES
(2, 1, '0'),
(3, 1, '0'),
(4, 1, '0'),
(5, 1, '0'),
(20, 1, '0'),
(22, 1, '0'),
(23, 1, '0'),
(24, 1, '0'),
(25, 1, '0'),
(26, 1, '0'),
(28, 1, '0'),
(29, 1, '0'),
(30, 1, '0'),
(31, 1, '0'),
(32, 1, '0'),
(33, 1, '0'),
(34, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_crmsetup`
--

CREATE TABLE IF NOT EXISTS `vtiger_crmsetup` (
  `userid` int(11) DEFAULT NULL,
  `setup_status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_crmsetup`
--

INSERT INTO `vtiger_crmsetup` (`userid`, `setup_status`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cron_task`
--

CREATE TABLE IF NOT EXISTS `vtiger_cron_task` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `handler_file` varchar(100) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `laststart` int(11) UNSIGNED DEFAULT NULL,
  `lastend` int(11) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `handler_file` (`handler_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cron_task`
--

INSERT INTO `vtiger_cron_task` (`id`, `name`, `handler_file`, `frequency`, `laststart`, `lastend`, `status`, `module`, `sequence`, `description`) VALUES
(1, 'Workflow', 'cron/modules/com_vtiger_workflow/com_vtiger_workflow.service', 900, NULL, NULL, 1, 'com_vtiger_workflow', 1, 'Recommended frequency for Workflow is 15 mins'),
(2, 'RecurringInvoice', 'cron/modules/SalesOrder/RecurringInvoice.service', 43200, NULL, NULL, 1, 'SalesOrder', 2, 'Recommended frequency for RecurringInvoice is 12 hours'),
(3, 'SendReminder', 'cron/SendReminder.service', 900, NULL, NULL, 1, 'Calendar', 3, 'Recommended frequency for SendReminder is 15 mins'),
(5, 'MailScanner', 'cron/MailScanner.service', 900, NULL, NULL, 1, 'Settings', 5, 'Recommended frequency for MailScanner is 15 mins'),
(6, 'Scheduled Import', 'cron/modules/Import/ScheduledImport.service', 900, NULL, NULL, 0, 'Import', 6, 'Recommended frequency for MailScanner is 15 mins'),
(7, 'ScheduleReports', 'cron/modules/Reports/ScheduleReports.service', 900, NULL, NULL, 1, 'Reports', 7, 'Recommended frequency for ScheduleReports is 15 mins');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currencies`
--

CREATE TABLE IF NOT EXISTS `vtiger_currencies` (
  `currencyid` int(19) NOT NULL,
  `currency_name` varchar(200) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `currency_symbol` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currencies`
--

INSERT INTO `vtiger_currencies` (`currencyid`, `currency_name`, `currency_code`, `currency_symbol`) VALUES
(1, 'Albania, Leke', 'ALL', 'Lek'),
(2, 'Argentina, Pesos', 'ARS', '$'),
(3, 'Aruba, Guilders', 'AWG', 'ƒ'),
(4, 'Australia, Dollars', 'AUD', '$'),
(5, 'Azerbaijan, New Manats', 'AZN', 'ман'),
(6, 'Bahamas, Dollars', 'BSD', '$'),
(7, 'Bahrain, Dinar', 'BHD', 'BD'),
(8, 'Barbados, Dollars', 'BBD', '$'),
(9, 'Belarus, Rubles', 'BYR', 'p.'),
(10, 'Belize, Dollars', 'BZD', 'BZ$'),
(11, 'Bermuda, Dollars', 'BMD', '$'),
(12, 'Bolivia, Bolivianos', 'BOB', '$b'),
(13, 'China, Yuan Renminbi', 'CNY', '¥'),
(14, 'Convertible Marka', 'BAM', 'KM'),
(15, 'Botswana, Pulas', 'BWP', 'P'),
(16, 'Bulgaria, Leva', 'BGN', 'лв'),
(17, 'Brazil, Reais', 'BRL', 'R$'),
(18, 'Great Britain Pounds', 'GBP', '£'),
(19, 'Brunei Darussalam, Dollars', 'BND', '$'),
(20, 'Canada, Dollars', 'CAD', '$'),
(21, 'Cayman Islands, Dollars', 'KYD', '$'),
(22, 'Chile, Pesos', 'CLP', '$'),
(23, 'Colombia, Pesos', 'COP', '$'),
(24, 'Costa Rica, Colón', 'CRC', '₡'),
(25, 'Croatia, Kuna', 'HRK', 'kn'),
(26, 'Cuba, Pesos', 'CUP', '₱'),
(27, 'Czech Republic, Koruny', 'CZK', 'Kč'),
(28, 'Cyprus, Pounds', 'CYP', '£'),
(29, 'Denmark, Kroner', 'DKK', 'kr'),
(30, 'Dominican Republic, Pesos', 'DOP', 'RD$'),
(31, 'East Caribbean, Dollars', 'XCD', '$'),
(32, 'Egypt, Pounds', 'EGP', 'E£'),
(33, 'El Salvador, Colón', 'SVC', '₡'),
(34, 'England, Pounds', 'GBP', '£'),
(35, 'Estonia, Krooni', 'EEK', 'kr'),
(36, 'Euro', 'EUR', '€'),
(37, 'Falkland Islands, Pounds', 'FKP', '£'),
(38, 'Fiji, Dollars', 'FJD', '$'),
(39, 'Ghana, Cedis', 'GHC', '¢'),
(40, 'Gibraltar, Pounds', 'GIP', '£'),
(41, 'Guatemala, Quetzales', 'GTQ', 'Q'),
(42, 'Guernsey, Pounds', 'GGP', '£'),
(43, 'Guyana, Dollars', 'GYD', '$'),
(44, 'Honduras, Lempiras', 'HNL', 'L'),
(45, 'Hong Kong, Dollars', 'HKD', 'HK$'),
(46, 'Hungary, Forint', 'HUF', 'Ft'),
(47, 'Iceland, Krona', 'ISK', 'kr'),
(48, 'India, Rupees', 'INR', '₹'),
(49, 'Indonesia, Rupiahs', 'IDR', 'Rp'),
(50, 'Iran, Rials', 'IRR', '﷼'),
(51, 'Isle of Man, Pounds', 'IMP', '£'),
(52, 'Israel, New Shekels', 'ILS', '₪'),
(53, 'Jamaica, Dollars', 'JMD', 'J$'),
(54, 'Japan, Yen', 'JPY', '¥'),
(55, 'Jersey, Pounds', 'JEP', '£'),
(56, 'Jordan, Dinar', 'JOD', 'JOD'),
(57, 'Kazakhstan, Tenge', 'KZT', '〒'),
(58, 'Kenya, Shilling', 'KES', 'KES'),
(59, 'Korea (North), Won', 'KPW', '₩'),
(60, 'Korea (South), Won', 'KRW', '₩'),
(61, 'Kuwait, Dinar', 'KWD', 'KWD'),
(62, 'Kyrgyzstan, Soms', 'KGS', 'лв'),
(63, 'Laos, Kips', 'LAK', '₭'),
(64, 'Latvia, Lati', 'LVL', 'Ls'),
(65, 'Lebanon, Pounds', 'LBP', '£'),
(66, 'Liberia, Dollars', 'LRD', '$'),
(67, 'Switzerland Francs', 'CHF', 'CHF'),
(68, 'Lithuania, Litai', 'LTL', 'Lt'),
(69, 'MADAGASCAR, Malagasy Ariary', 'MGA', 'MGA'),
(70, 'Macedonia, Denars', 'MKD', 'ден'),
(71, 'Malaysia, Ringgits', 'MYR', 'RM'),
(72, 'Malta, Liri', 'MTL', '₤'),
(73, 'Mauritius, Rupees', 'MUR', '₨'),
(74, 'Mexico, Pesos', 'MXN', '$'),
(75, 'Mongolia, Tugriks', 'MNT', '₮'),
(76, 'Mozambique, Meticais', 'MZN', 'MT'),
(77, 'Namibia, Dollars', 'NAD', '$'),
(78, 'Nepal, Rupees', 'NPR', '₨'),
(79, 'Netherlands Antilles, Guilders', 'ANG', 'ƒ'),
(80, 'New Zealand, Dollars', 'NZD', '$'),
(81, 'Nicaragua, Cordobas', 'NIO', 'C$'),
(82, 'Nigeria, Nairas', 'NGN', '₦'),
(83, 'North Korea, Won', 'KPW', '₩'),
(84, 'Norway, Krone', 'NOK', 'kr'),
(85, 'Oman, Rials', 'OMR', '﷼'),
(86, 'Pakistan, Rupees', 'PKR', '₨'),
(87, 'Panama, Balboa', 'PAB', 'B/.'),
(88, 'Paraguay, Guarani', 'PYG', 'Gs'),
(89, 'Peru, Nuevos Soles', 'PEN', 'S/.'),
(90, 'Philippines, Pesos', 'PHP', 'Php'),
(91, 'Poland, Zlotych', 'PLN', 'zł'),
(92, 'Qatar, Rials', 'QAR', '﷼'),
(93, 'Romania, New Lei', 'RON', 'lei'),
(94, 'Russia, Rubles', 'RUB', 'руб'),
(95, 'Saint Helena, Pounds', 'SHP', '£'),
(96, 'Saudi Arabia, Riyals', 'SAR', '﷼'),
(97, 'Serbia, Dinars', 'RSD', 'Дин.'),
(98, 'Seychelles, Rupees', 'SCR', '₨'),
(99, 'Singapore, Dollars', 'SGD', '$'),
(100, 'Solomon Islands, Dollars', 'SBD', '$'),
(101, 'Somalia, Shillings', 'SOS', 'S'),
(102, 'South Africa, Rand', 'ZAR', 'R'),
(103, 'South Korea, Won', 'KRW', '₩'),
(104, 'Sri Lanka, Rupees', 'LKR', '₨'),
(105, 'Sweden, Kronor', 'SEK', 'kr'),
(106, 'Switzerland, Francs', 'CHF', 'CHF'),
(107, 'Suriname, Dollars', 'SRD', '$'),
(108, 'Syria, Pounds', 'SYP', '£'),
(109, 'Taiwan, New Dollars', 'TWD', 'NT$'),
(110, 'Thailand, Baht', 'THB', '฿'),
(111, 'Trinidad and Tobago, Dollars', 'TTD', 'TT$'),
(112, 'Turkey, New Lira', 'TRY', 'YTL'),
(113, 'Turkey, Liras', 'TRL', '₤'),
(114, 'Tuvalu, Dollars', 'TVD', '$'),
(115, 'Ukraine, Hryvnia', 'UAH', '₴'),
(116, 'United Arab Emirates, Dirham', 'AED', 'AED'),
(117, 'United Kingdom, Pounds', 'GBP', '£'),
(118, 'United Republic of Tanzania, Shilling', 'TZS', 'TZS'),
(119, 'USA, Dollars', 'USD', '$'),
(120, 'Uruguay, Pesos', 'UYU', '$U'),
(121, 'Uzbekistan, Sums', 'UZS', 'лв'),
(122, 'Venezuela, Bolivares Fuertes', 'VEF', 'Bs'),
(123, 'Vietnam, Dong', 'VND', '₫'),
(124, 'Zambia, Kwacha', 'ZMK', 'ZMK'),
(125, 'Yemen, Rials', 'YER', '﷼'),
(126, 'Zimbabwe Dollars', 'ZWD', 'Z$'),
(127, 'Malawi, Kwacha', 'MWK', 'MK'),
(128, 'Tunisian, Dinar', 'TD', 'TD'),
(129, 'Moroccan, Dirham', 'MAD', 'DH'),
(130, 'Iraqi Dinar', 'IQD', 'ID'),
(131, 'Maldivian Ruffiya', 'MVR', 'MVR'),
(132, 'Ugandan Shilling', 'UGX', 'Sh'),
(133, 'Sudanese Pound', 'SDG', '£'),
(134, 'CFA Franc BCEAO', 'XOF', 'CFA'),
(135, 'CFA Franc BEAC', 'XAF', 'CFA'),
(136, 'Haiti, Gourde', 'HTG', 'G'),
(137, 'Libya, Dinar', 'LYD', 'LYD'),
(138, 'CFP Franc', 'XPF', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currencies_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currencies_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currencies_seq`
--

INSERT INTO `vtiger_currencies_seq` (`id`) VALUES
(138);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency` (
  `currencyid` int(19) NOT NULL,
  `currency` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currencyid`),
  UNIQUE KEY `currency_currency_idx` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_decimal_separator`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_decimal_separator` (
  `currency_decimal_separatorid` int(19) NOT NULL,
  `currency_decimal_separator` varchar(2) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currency_decimal_separatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_decimal_separator`
--

INSERT INTO `vtiger_currency_decimal_separator` (`currency_decimal_separatorid`, `currency_decimal_separator`, `sortorderid`, `presence`) VALUES
(1, '.', 0, 1),
(2, ',', 1, 1),
(3, '\'', 2, 1),
(4, ' ', 3, 1),
(5, '$', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_decimal_separator_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_decimal_separator_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_decimal_separator_seq`
--

INSERT INTO `vtiger_currency_decimal_separator_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_grouping_pattern`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_pattern` (
  `currency_grouping_patternid` int(19) NOT NULL,
  `currency_grouping_pattern` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currency_grouping_patternid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_grouping_pattern`
--

INSERT INTO `vtiger_currency_grouping_pattern` (`currency_grouping_patternid`, `currency_grouping_pattern`, `sortorderid`, `presence`) VALUES
(1, '123,456,789', 0, 1),
(2, '123456789', 1, 1),
(3, '123456,789', 2, 1),
(4, '12,34,56,789', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_grouping_pattern_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_pattern_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_grouping_pattern_seq`
--

INSERT INTO `vtiger_currency_grouping_pattern_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_grouping_separator`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_separator` (
  `currency_grouping_separatorid` int(19) NOT NULL,
  `currency_grouping_separator` varchar(2) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currency_grouping_separatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_grouping_separator`
--

INSERT INTO `vtiger_currency_grouping_separator` (`currency_grouping_separatorid`, `currency_grouping_separator`, `sortorderid`, `presence`) VALUES
(1, ',', 0, 1),
(2, '.', 1, 1),
(3, '\'', 2, 1),
(4, ' ', 3, 1),
(5, '$', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_grouping_separator_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_grouping_separator_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_grouping_separator_seq`
--

INSERT INTO `vtiger_currency_grouping_separator_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_info` (
  `id` int(11) NOT NULL,
  `currency_name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(30) DEFAULT NULL,
  `conversion_rate` decimal(12,5) DEFAULT NULL,
  `currency_status` varchar(25) DEFAULT NULL,
  `defaultid` varchar(10) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_info`
--

INSERT INTO `vtiger_currency_info` (`id`, `currency_name`, `currency_code`, `currency_symbol`, `conversion_rate`, `currency_status`, `defaultid`, `deleted`) VALUES
(1, 'Vietnam, Dong', 'VND', '₫', '1.00000', 'Active', '-11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_info_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_info_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_info_seq`
--

INSERT INTO `vtiger_currency_info_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_symbol_placement`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_symbol_placement` (
  `currency_symbol_placementid` int(19) NOT NULL,
  `currency_symbol_placement` varchar(30) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currency_symbol_placementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_symbol_placement`
--

INSERT INTO `vtiger_currency_symbol_placement` (`currency_symbol_placementid`, `currency_symbol_placement`, `sortorderid`, `presence`) VALUES
(1, '$1.0', 0, 1),
(2, '1.0$', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_currency_symbol_placement_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_currency_symbol_placement_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_currency_symbol_placement_seq`
--

INSERT INTO `vtiger_currency_symbol_placement_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customaction`
--

CREATE TABLE IF NOT EXISTS `vtiger_customaction` (
  `cvid` int(19) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` text DEFAULT NULL,
  KEY `customaction_cvid_idx` (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerdetails` (
  `customerid` int(19) NOT NULL,
  `portal` varchar(3) DEFAULT NULL,
  `support_start_date` date DEFAULT NULL,
  `support_end_date` date DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerenterprise`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerenterprise` (
  `customerenterpriseid` int(19) NOT NULL,
  `makhachhang` varchar(255) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`customerenterpriseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerenterprise`
--

INSERT INTO `vtiger_customerenterprise` (`customerenterpriseid`, `makhachhang`, `tags`) VALUES
(20, '[\"DN-0\"]', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerenterprisecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerenterprisecf` (
  `customerenterpriseid` int(19) NOT NULL,
  `cf_1103` varchar(255) DEFAULT '',
  `cf_1105` varchar(255) DEFAULT '',
  `cf_1107` varchar(10) DEFAULT '',
  `cf_1109` varchar(10) DEFAULT '',
  `cf_1111` varchar(10) DEFAULT '',
  `cf_1113` varchar(13) DEFAULT '',
  `cf_1115` varchar(50) DEFAULT '',
  `cf_1119` varchar(255) DEFAULT '',
  `cf_1121` varchar(255) DEFAULT '',
  `cf_1123` varchar(255) DEFAULT '',
  `cf_1135` text DEFAULT NULL,
  `cf_1137` varchar(255) DEFAULT '',
  `cf_1141` varchar(255) DEFAULT '',
  `cf_1143` varchar(255) DEFAULT '',
  `cf_1145` varchar(255) DEFAULT '',
  `cf_1147` varchar(255) DEFAULT '',
  `cf_1149` varchar(30) DEFAULT '',
  `cf_1151` varchar(30) DEFAULT '',
  `cf_1153` varchar(30) DEFAULT '',
  `cf_1155` varchar(50) DEFAULT '',
  `cf_1157` varchar(50) DEFAULT '',
  `cf_1159` varchar(255) DEFAULT '',
  `cf_1161` varchar(255) DEFAULT '',
  `cf_1217` date DEFAULT NULL,
  `cf_1219` text DEFAULT NULL,
  `cf_1221` varchar(255) DEFAULT '',
  `cf_1225` varchar(255) DEFAULT '',
  PRIMARY KEY (`customerenterpriseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerenterprisecf`
--

INSERT INTO `vtiger_customerenterprisecf` (`customerenterpriseid`, `cf_1103`, `cf_1105`, `cf_1107`, `cf_1109`, `cf_1111`, `cf_1113`, `cf_1115`, `cf_1119`, `cf_1121`, `cf_1123`, `cf_1135`, `cf_1137`, `cf_1141`, `cf_1143`, `cf_1145`, `cf_1147`, `cf_1149`, `cf_1151`, `cf_1153`, `cf_1155`, `cf_1157`, `cf_1159`, `cf_1161`, `cf_1217`, `cf_1219`, `cf_1221`, `cf_1225`) VALUES
(20, '', 'tung', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerportal_fields`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_fields` (
  `tabid` int(19) NOT NULL,
  `fieldinfo` text DEFAULT NULL,
  `records_visible` int(1) DEFAULT NULL,
  PRIMARY KEY (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerportal_fields`
--

INSERT INTO `vtiger_customerportal_fields` (`tabid`, `fieldinfo`, `records_visible`) VALUES
(4, '{\"lastname\":1,\"assigned_user_id\":1}', 1),
(6, '{\"accountname\":1,\"assigned_user_id\":1}', 1),
(8, '{\"notes_title\":1,\"assigned_user_id\":1,\"filename\":0}', 1),
(13, '{\"ticket_title\":1,\"assigned_user_id\":1,\"ticketpriorities\":1,\"ticketstatus\":1,\"description\":1,\"product_id\":1,\"ticketseverities\":1,\"ticketcategories\":1}', 1),
(14, '{\"productname\":1,\"assigned_user_id\":1}', 1),
(15, '{\"faqstatus\":1,\"question\":1,\"faq_answer\":1}', 1),
(20, '{\"subject\":1,\"quotestage\":1,\"account_id\":1,\"assigned_user_id\":1,\"bill_street\":1,\"ship_street\":1}', 1),
(23, '{\"subject\":1,\"account_id\":1,\"assigned_user_id\":1,\"bill_street\":1,\"ship_street\":1}', 1),
(35, '{\"subject\":1,\"assigned_user_id\":1}', NULL),
(36, '{\"servicename\":1}', 1),
(38, '{\"product\":1,\"serialnumber\":1,\"assigned_user_id\":1,\"datesold\":1,\"dateinservice\":1,\"assetstatus\":1,\"assetname\":1,\"account\":1}', 1),
(43, '{\"projectmilestonename\":1,\"projectid\":1,\"assigned_user_id\":1}', 1),
(44, '{\"projecttaskname\":1,\"projectid\":1,\"assigned_user_id\":1}', 1),
(45, '{\"projectname\":1,\"assigned_user_id\":1}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerportal_prefs`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_prefs` (
  `tabid` int(19) NOT NULL,
  `prefkey` varchar(100) NOT NULL,
  `prefvalue` int(20) DEFAULT NULL,
  PRIMARY KEY (`tabid`,`prefkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerportal_prefs`
--

INSERT INTO `vtiger_customerportal_prefs` (`tabid`, `prefkey`, `prefvalue`) VALUES
(0, 'defaultassignee', 1),
(0, 'userid', 1),
(4, 'showrelatedinfo', 1),
(6, 'showrelatedinfo', 1),
(8, 'showrelatedinfo', 1),
(13, 'showrelatedinfo', 1),
(14, 'showrelatedinfo', 1),
(15, 'showrelatedinfo', 1),
(20, 'showrelatedinfo', 1),
(23, 'showrelatedinfo', 1),
(36, 'showrelatedinfo', 1),
(38, 'showrelatedinfo', 1),
(43, 'showrelatedinfo', 1),
(44, 'showrelatedinfo', 1),
(45, 'showrelatedinfo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerportal_relatedmoduleinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_relatedmoduleinfo` (
  `tabid` int(19) NOT NULL,
  `relatedmodules` text DEFAULT NULL,
  PRIMARY KEY (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerportal_relatedmoduleinfo`
--

INSERT INTO `vtiger_customerportal_relatedmoduleinfo` (`tabid`, `relatedmodules`) VALUES
(8, '[{\"name\":\"History\",\"value\":1}]'),
(13, '[{\"name\":\"History\",\"value\":1},{\"name\":\"ModComments\",\"value\":1},{\"name\":\"Documents\",\"value\":1}]'),
(14, '[{\"name\":\"History\",\"value\":1}]'),
(20, '[{\"name\":\"History\",\"value\":1}]'),
(23, '[{\"name\":\"History\",\"value\":1}]'),
(35, '[{\"name\":\"History\",\"value\":1}]'),
(36, '[{\"name\":\"History\",\"value\":1}]'),
(38, '[{\"name\":\"History\",\"value\":1}]'),
(43, '[{\"name\":\"History\",\"value\":1}]'),
(44, '[{\"name\":\"History\",\"value\":1},{\"name\":\"ModComments\",\"value\":1}]'),
(45, '[{\"name\":\"History\",\"value\":1},{\"name\":\"ModComments\",\"value\":1},{\"name\":\"ProjectTask\",\"value\":1},{\"name\":\"ProjectMilestone\",\"value\":1},{\"name\":\"Documents\",\"value\":1}]');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerportal_settings`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_settings` (
  `id` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `default_assignee` int(11) DEFAULT NULL,
  `support_notification` int(11) DEFAULT NULL,
  `announcement` text DEFAULT NULL,
  `shortcuts` text DEFAULT NULL,
  `widgets` text DEFAULT NULL,
  `charts` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerportal_settings`
--

INSERT INTO `vtiger_customerportal_settings` (`id`, `url`, `default_assignee`, `support_notification`, `announcement`, `shortcuts`, `widgets`, `charts`) VALUES
(1, NULL, 1, NULL, NULL, '{\"Documents\":{\"LBL_ADD_DOCUMENT\":1},\"HelpDesk\":{\"LBL_CREATE_TICKET\":1,\"LBL_OPEN_TICKETS\":1}}', '{\"widgets\":{\"HelpDesk\":1,\"Documents\":1,\"Faq\":1}}', '{\"charts\":{\"OpenTicketsByPriority\":1,\"TicketsClosureTimeByPriority\":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerportal_tabs`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerportal_tabs` (
  `tabid` int(19) NOT NULL,
  `visible` int(1) DEFAULT 1,
  `sequence` int(1) DEFAULT NULL,
  `createrecord` tinyint(1) NOT NULL DEFAULT 0,
  `editrecord` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerportal_tabs`
--

INSERT INTO `vtiger_customerportal_tabs` (`tabid`, `visible`, `sequence`, `createrecord`, `editrecord`) VALUES
(4, 0, 9, 0, 1),
(6, 0, 10, 0, 1),
(8, 1, 8, 1, 0),
(13, 1, 2, 1, 1),
(14, 1, 6, 0, 0),
(15, 1, 3, 0, 0),
(20, 1, 5, 0, 0),
(23, 1, 4, 0, 0),
(35, 1, 25, 0, 0),
(36, 1, 7, 0, 0),
(38, 1, 11, 0, 1),
(43, 1, 12, 0, 0),
(44, 1, 13, 0, 0),
(45, 1, 14, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerstandalone`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerstandalone` (
  `customerstandaloneid` int(19) NOT NULL,
  `makhachhang` varchar(255) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`customerstandaloneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerstandalone`
--

INSERT INTO `vtiger_customerstandalone` (`customerstandaloneid`, `makhachhang`, `tags`) VALUES
(27, '[\"VL-0\"]', ''),
(28, '[\"VL-0\"]', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customerstandalonecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_customerstandalonecf` (
  `customerstandaloneid` int(19) NOT NULL,
  `cf_1193` varchar(50) DEFAULT '',
  `cf_1195` text DEFAULT NULL,
  `cf_1197` varchar(30) DEFAULT '',
  `cf_1199` varchar(255) DEFAULT '',
  PRIMARY KEY (`customerstandaloneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customerstandalonecf`
--

INSERT INTO `vtiger_customerstandalonecf` (`customerstandaloneid`, `cf_1193`, `cf_1195`, `cf_1197`, `cf_1199`) VALUES
(27, '', '', '093821111', 'Đồng Việt Tùng'),
(28, '', '', '3', '4');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customview`
--

CREATE TABLE IF NOT EXISTS `vtiger_customview` (
  `cvid` int(19) NOT NULL,
  `viewname` varchar(100) NOT NULL,
  `setdefault` int(1) DEFAULT 0,
  `setmetrics` int(1) DEFAULT 0,
  `entitytype` varchar(25) NOT NULL,
  `status` int(1) DEFAULT 1,
  `userid` int(19) DEFAULT 1,
  PRIMARY KEY (`cvid`),
  KEY `customview_entitytype_idx` (`entitytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customview`
--

INSERT INTO `vtiger_customview` (`cvid`, `viewname`, `setdefault`, `setmetrics`, `entitytype`, `status`, `userid`) VALUES
(1, 'All', 1, 0, 'Leads', 0, 1),
(2, 'Hot Leads', 0, 1, 'Leads', 3, 1),
(3, 'This Month Leads', 0, 0, 'Leads', 3, 1),
(4, 'All', 1, 0, 'Accounts', 0, 1),
(5, 'Prospect Accounts', 0, 1, 'Accounts', 3, 1),
(6, 'New This Week', 0, 0, 'Accounts', 3, 1),
(7, 'All', 1, 0, 'Contacts', 0, 1),
(8, 'Contacts Address', 0, 0, 'Contacts', 3, 1),
(9, 'Todays Birthday', 0, 0, 'Contacts', 3, 1),
(10, 'All', 1, 0, 'Potentials', 0, 1),
(11, 'Potentials Won', 0, 1, 'Potentials', 3, 1),
(12, 'Prospecting', 0, 0, 'Potentials', 3, 1),
(13, 'All', 1, 0, 'HelpDesk', 0, 1),
(14, 'Open Tickets', 0, 1, 'HelpDesk', 3, 1),
(15, 'High Prioriy Tickets', 0, 0, 'HelpDesk', 3, 1),
(16, 'All', 1, 0, 'Quotes', 0, 1),
(17, 'Open Quotes', 0, 1, 'Quotes', 3, 1),
(18, 'Rejected Quotes', 0, 0, 'Quotes', 3, 1),
(19, 'All', 1, 0, 'Calendar', 0, 1),
(20, 'All', 1, 0, 'Emails', 0, 1),
(21, 'All', 1, 0, 'Invoice', 0, 1),
(22, 'All', 1, 0, 'Documents', 0, 1),
(23, 'All', 1, 0, 'PriceBooks', 0, 1),
(24, 'All', 1, 0, 'Products', 0, 1),
(25, 'All', 1, 0, 'PurchaseOrder', 0, 1),
(26, 'All', 1, 0, 'SalesOrder', 0, 1),
(27, 'All', 1, 0, 'Vendors', 0, 1),
(28, 'All', 1, 0, 'Faq', 0, 1),
(29, 'All', 1, 0, 'Campaigns', 0, 1),
(30, 'All', 1, 0, 'Webmails', 0, 1),
(31, 'Drafted FAQ', 0, 0, 'Faq', 3, 1),
(32, 'Published FAQ', 0, 0, 'Faq', 3, 1),
(33, 'Open Purchase Orders', 0, 0, 'PurchaseOrder', 3, 1),
(34, 'Received Purchase Orders', 0, 0, 'PurchaseOrder', 3, 1),
(35, 'Open Invoices', 0, 0, 'Invoice', 3, 1),
(36, 'Paid Invoices', 0, 0, 'Invoice', 3, 1),
(37, 'Pending Sales Orders', 0, 0, 'SalesOrder', 3, 1),
(38, 'All', 1, 0, 'PBXManager', 0, 1),
(39, 'All', 1, 0, 'ServiceContracts', 0, 1),
(40, 'All', 1, 0, 'Services', 0, 1),
(41, 'All', 1, 0, 'Assets', 0, 1),
(42, 'All', 0, 0, 'ModComments', 0, 1),
(46, 'All', 0, 0, 'SMSNotifier', 0, 1),
(47, 'All', 1, 0, 'ProjectMilestone', 0, 1),
(48, 'All', 1, 0, 'ProjectTask', 0, 1),
(49, 'All', 1, 0, 'Project', 0, 1),
(50, 'Thông tin sản phẩm', 0, 0, 'Products', 1, 1),
(51, 'All', 1, 0, 'SettingHrm', 0, 1),
(52, 'All', 1, 0, 'SettingPosition', 0, 1),
(53, 'All', 1, 0, 'SettingWeight', 0, 1),
(54, 'All', 1, 0, 'SalaryComponent', 0, 1),
(55, 'All', 1, 0, 'Salary', 0, 1),
(56, 'All', 1, 0, 'Rating', 0, 1),
(57, 'All', 1, 0, 'JD', 0, 1),
(58, 'All', 1, 0, 'QCM', 0, 1),
(59, 'All', 1, 0, 'KPI', 0, 1),
(60, 'All', 1, 0, 'Candidates', 0, 1),
(61, 'All', 1, 0, 'Leave', 0, 1),
(62, 'All', 1, 0, 'Employee', 0, 1),
(63, 'Thông tin nhân viên', 0, 0, 'Employee', 1, 1),
(64, 'Marketing Group', 1, 0, 'JD', 1, 1),
(65, 'Support Group', 0, 0, 'JD', 1, 1),
(66, 'Team Selling', 0, 0, 'JD', 1, 1),
(75, 'All', 1, 0, 'CustomerEnterprise', 0, 1),
(79, 'All', 1, 0, 'CustomerStandalone', 0, 1),
(80, 'All', 1, 0, 'ProblemCategory', 0, 1),
(81, 'All', 1, 0, 'SupportProtocol', 0, 1),
(86, 'All', 1, 0, 'PhuongTienTruyenThong', 0, 1),
(87, 'All', 1, 0, 'HinhThucTruyenThong', 0, 1),
(88, 'All', 1, 0, 'QuyTrinhBanHang', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_customview_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_customview_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_customview_seq`
--

INSERT INTO `vtiger_customview_seq` (`id`) VALUES
(88);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cv2group`
--

CREATE TABLE IF NOT EXISTS `vtiger_cv2group` (
  `cvid` int(25) NOT NULL,
  `groupid` int(25) NOT NULL,
  KEY `vtiger_cv2group_ibfk_1` (`cvid`),
  KEY `vtiger_groups_ibfk_1` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cv2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_cv2role` (
  `cvid` int(25) NOT NULL,
  `roleid` varchar(255) NOT NULL,
  KEY `vtiger_cv2role_ibfk_1` (`cvid`),
  KEY `vtiger_role_ibfk_1` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cv2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_cv2rs` (
  `cvid` int(25) NOT NULL,
  `rsid` varchar(255) NOT NULL,
  KEY `vtiger_cv2role_ibfk_1` (`cvid`),
  KEY `vtiger_rolesd_ibfk_1` (`rsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cv2users`
--

CREATE TABLE IF NOT EXISTS `vtiger_cv2users` (
  `cvid` int(25) NOT NULL,
  `userid` int(25) NOT NULL,
  KEY `vtiger_cv2users_ibfk_1` (`cvid`),
  KEY `vtiger_users_ibfk_1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cvadvfilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvadvfilter` (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `comparator` varchar(20) DEFAULT NULL,
  `value` varchar(512) DEFAULT NULL,
  `groupid` int(11) DEFAULT 1,
  `column_condition` varchar(255) DEFAULT 'and',
  PRIMARY KEY (`cvid`,`columnindex`),
  KEY `cvadvfilter_cvid_idx` (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cvadvfilter`
--

INSERT INTO `vtiger_cvadvfilter` (`cvid`, `columnindex`, `columnname`, `comparator`, `value`, `groupid`, `column_condition`) VALUES
(2, 0, 'vtiger_leaddetails:leadstatus:leadstatus:Leads_Lead_Status:V', 'e', 'Hot', 1, 'and'),
(5, 0, 'vtiger_account:account_type:accounttype:Accounts_Type:V', 'e', 'Prospect', 1, 'and'),
(11, 0, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V', 'e', 'Closed Won', 1, 'and'),
(12, 0, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V', 'e', 'Prospecting', 1, 'and'),
(14, 0, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V', 'n', 'Closed', 1, 'and'),
(15, 0, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V', 'e', 'High', 1, 'and'),
(17, 0, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'n', 'Accepted', 1, 'and'),
(17, 1, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'n', 'Rejected', 1, 'and'),
(18, 0, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V', 'e', 'Rejected', 1, 'and'),
(31, 0, 'vtiger_faq:status:faqstatus:Faq_Status:V', 'e', 'Draft', 1, 'and'),
(32, 0, 'vtiger_faq:status:faqstatus:Faq_Status:V', 'e', 'Published', 1, 'and'),
(33, 0, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V', 'e', 'Created, Approved, Delivered', 1, 'and'),
(34, 0, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V', 'e', 'Received Shipment', 1, 'and'),
(35, 0, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V', 'e', 'Created, Approved, Sent', 1, 'and'),
(36, 0, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V', 'e', 'Paid', 1, 'and'),
(37, 0, 'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V', 'e', 'Created, Approved', 1, 'and');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cvadvfilter_grouping`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvadvfilter_grouping` (
  `groupid` int(11) NOT NULL,
  `cvid` int(19) NOT NULL,
  `group_condition` varchar(255) DEFAULT NULL,
  `condition_expression` text DEFAULT NULL,
  PRIMARY KEY (`groupid`,`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cvadvfilter_grouping`
--

INSERT INTO `vtiger_cvadvfilter_grouping` (`groupid`, `cvid`, `group_condition`, `condition_expression`) VALUES
(1, 2, '', ''),
(1, 5, '', ''),
(1, 11, '', ''),
(1, 12, '', ''),
(1, 14, '', ''),
(1, 15, '', ''),
(1, 17, '', ''),
(1, 18, '', ''),
(1, 31, '', ''),
(1, 32, '', ''),
(1, 33, '', ''),
(1, 34, '', ''),
(1, 35, '', ''),
(1, 36, '', ''),
(1, 37, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cvcolumnlist`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvcolumnlist` (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  PRIMARY KEY (`cvid`,`columnindex`),
  KEY `cvcolumnlist_columnindex_idx` (`columnindex`),
  KEY `cvcolumnlist_cvid_idx` (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cvcolumnlist`
--

INSERT INTO `vtiger_cvcolumnlist` (`cvid`, `columnindex`, `columnname`) VALUES
(1, 1, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(1, 2, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(1, 3, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(1, 4, 'vtiger_leadaddress:phone:phone:Leads_Phone:V'),
(1, 5, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(1, 6, 'vtiger_leaddetails:email:email:Leads_Email:V'),
(1, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Leads_Assigned_To:V'),
(2, 0, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(2, 1, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(2, 2, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(2, 3, 'vtiger_leaddetails:leadsource:leadsource:Leads_Lead_Source:V'),
(2, 4, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(2, 5, 'vtiger_leaddetails:email:email:Leads_Email:E'),
(3, 0, 'vtiger_leaddetails:firstname:firstname:Leads_First_Name:V'),
(3, 1, 'vtiger_leaddetails:lastname:lastname:Leads_Last_Name:V'),
(3, 2, 'vtiger_leaddetails:company:company:Leads_Company:V'),
(3, 3, 'vtiger_leaddetails:leadsource:leadsource:Leads_Lead_Source:V'),
(3, 4, 'vtiger_leadsubdetails:website:website:Leads_Website:V'),
(3, 5, 'vtiger_leaddetails:email:email:Leads_Email:E'),
(4, 0, 'vtiger_account:account_no:account_no:Accounts_Account_No:V'),
(4, 1, 'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),
(4, 2, 'vtiger_accountshipads:ship_street:ship_street:Accounts_Shipping_Address:V'),
(4, 3, 'vtiger_account:phone:phone:Accounts_Phone:V'),
(4, 4, 'vtiger_accountbillads:bill_code:bill_code:Accounts_Billing_Code:V'),
(4, 5, 'vtiger_accountbillads:bill_city:bill_city:Accounts_Billing_City:V'),
(4, 6, 'vtiger_accountbillads:bill_country:bill_country:Accounts_Billing_Country:V'),
(5, 0, 'vtiger_account:account_no:account_no:Accounts_Account_No:V'),
(5, 1, 'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),
(5, 2, 'vtiger_account:phone:phone:Accounts_Phone:V'),
(5, 3, 'vtiger_accountshipads:ship_street:ship_street:Accounts_Shipping_Address:V'),
(5, 4, 'vtiger_accountbillads:bill_code:bill_code:Accounts_Billing_Code:V'),
(5, 5, 'vtiger_accountbillads:bill_city:bill_city:Accounts_Billing_City:V'),
(5, 6, 'vtiger_accountbillads:bill_country:bill_country:Accounts_Billing_Country:V'),
(6, 0, 'vtiger_account:account_no:account_no:Accounts_Account_No:V'),
(6, 1, 'vtiger_account:accountname:accountname:Accounts_Account_Name:V'),
(6, 2, 'vtiger_accountshipads:ship_street:ship_street:Accounts_Shipping_Address:V'),
(6, 3, 'vtiger_account:phone:phone:Accounts_Phone:V'),
(6, 4, 'vtiger_accountbillads:bill_code:bill_code:Accounts_Billing_Code:V'),
(6, 5, 'vtiger_accountbillads:bill_city:bill_city:Accounts_Billing_City:V'),
(6, 6, 'vtiger_accountbillads:bill_country:bill_country:Accounts_Billing_Country:V'),
(7, 1, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(7, 2, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(7, 3, 'vtiger_contactdetails:title:title:Contacts_Title:V'),
(7, 4, 'vtiger_contactdetails:accountid:account_id:Contacts_Account_Name:V'),
(7, 5, 'vtiger_contactdetails:email:email:Contacts_Email:V'),
(7, 6, 'vtiger_contactdetails:phone:phone:Contacts_Office_Phone:V'),
(7, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Contacts_Assigned_To:V'),
(8, 0, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(8, 1, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(8, 2, 'vtiger_contactaddress:mailingstreet:mailingstreet:Contacts_Mailing_Street:V'),
(8, 3, 'vtiger_contactaddress:mailingcity:mailingcity:Contacts_Mailing_City:V'),
(8, 4, 'vtiger_contactaddress:mailingstate:mailingstate:Contacts_Mailing_State:V'),
(8, 5, 'vtiger_contactaddress:mailingzip:mailingzip:Contacts_Mailing_Zip:V'),
(8, 6, 'vtiger_contactaddress:mailingcountry:mailingcountry:Contacts_Mailing_Country:V'),
(9, 0, 'vtiger_contactdetails:firstname:firstname:Contacts_First_Name:V'),
(9, 1, 'vtiger_contactdetails:lastname:lastname:Contacts_Last_Name:V'),
(9, 2, 'vtiger_contactdetails:title:title:Contacts_Title:V'),
(9, 3, 'vtiger_contactdetails:accountid:account_id:Contacts_Account_Name:I'),
(9, 4, 'vtiger_contactdetails:email:email:Contacts_Email:E'),
(9, 5, 'vtiger_contactsubdetails:otherphone:otherphone:Contacts_Phone:V'),
(9, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Contacts_Assigned_To:V'),
(10, 1, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(10, 2, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(10, 3, 'vtiger_potential:sales_stage:sales_stage:Potentials_Sales_Stage:V'),
(10, 4, 'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),
(10, 5, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(10, 6, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(10, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(10, 8, 'vtiger_potential:contact_id:contact_id:Potentials_Contact_Name:V'),
(11, 0, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(11, 1, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(11, 2, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(11, 3, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(11, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(11, 5, 'vtiger_potential:contact_id:contact_id:Potentials_Contact_Name:V'),
(12, 0, 'vtiger_potential:potentialname:potentialname:Potentials_Potential_Name:V'),
(12, 1, 'vtiger_potential:related_to:related_to:Potentials_Related_To:V'),
(12, 2, 'vtiger_potential:amount:amount:Potentials_Amount:N'),
(12, 3, 'vtiger_potential:leadsource:leadsource:Potentials_Lead_Source:V'),
(12, 4, 'vtiger_potential:closingdate:closingdate:Potentials_Expected_Close_Date:D'),
(12, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Potentials_Assigned_To:V'),
(12, 6, 'vtiger_potential:contact_id:contact_id:Potentials_Contact_Name:V'),
(13, 1, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(13, 2, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:V'),
(13, 3, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V'),
(13, 4, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V'),
(13, 5, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(13, 6, 'vtiger_troubletickets:contact_id:contact_id:HelpDesk_Contact_Name:V'),
(14, 0, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(14, 1, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),
(14, 2, 'vtiger_troubletickets:priority:ticketpriorities:HelpDesk_Priority:V'),
(14, 3, 'vtiger_troubletickets:product_id:product_id:HelpDesk_Product_Name:I'),
(14, 4, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(14, 5, 'vtiger_troubletickets:contact_id:contact_id:HelpDesk_Contact_Name:V'),
(15, 0, 'vtiger_troubletickets:title:ticket_title:HelpDesk_Title:V'),
(15, 1, 'vtiger_troubletickets:parent_id:parent_id:HelpDesk_Related_To:I'),
(15, 2, 'vtiger_troubletickets:status:ticketstatus:HelpDesk_Status:V'),
(15, 3, 'vtiger_troubletickets:product_id:product_id:HelpDesk_Product_Name:I'),
(15, 4, 'vtiger_crmentity:smownerid:assigned_user_id:HelpDesk_Assigned_To:V'),
(15, 5, 'vtiger_troubletickets:contact_id:contact_id:HelpDesk_Contact_Name:V'),
(16, 1, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(16, 2, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V'),
(16, 3, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:V'),
(16, 4, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:V'),
(16, 5, 'vtiger_quotes:total:hdnGrandTotal:Quotes_Total:N'),
(16, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(17, 0, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(17, 1, 'vtiger_quotes:quotestage:quotestage:Quotes_Quote_Stage:V'),
(17, 2, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),
(17, 3, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),
(17, 4, 'vtiger_quotes:validtill:validtill:Quotes_Valid_Till:D'),
(17, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(18, 0, 'vtiger_quotes:subject:subject:Quotes_Subject:V'),
(18, 1, 'vtiger_quotes:potentialid:potential_id:Quotes_Potential_Name:I'),
(18, 2, 'vtiger_quotes:accountid:account_id:Quotes_Account_Name:I'),
(18, 3, 'vtiger_quotes:validtill:validtill:Quotes_Valid_Till:D'),
(18, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Quotes_Assigned_To:V'),
(19, 0, 'vtiger_activity:status:taskstatus:Calendar_Status:V'),
(19, 1, 'vtiger_activity:activitytype:activitytype:Calendar_Activity_Type:V'),
(19, 2, 'vtiger_activity:subject:subject:Calendar_Subject:V'),
(19, 3, 'vtiger_seactivityrel:crmid:parent_id:Calendar_Related_To:V'),
(19, 4, 'vtiger_activity:date_start:date_start:Calendar_Start_Date_&_Time:DT'),
(19, 5, 'vtiger_activity:due_date:due_date:Calendar_Due_Date:D'),
(19, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Calendar_Assigned_To:V'),
(20, 0, 'vtiger_activity:subject:subject:Emails_Subject:V'),
(20, 1, 'vtiger_emaildetails:to_email:saved_toid:Emails_To:V'),
(20, 2, 'vtiger_activity:date_start:date_start:Emails_Date_&_Time_Sent:DT'),
(21, 0, 'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),
(21, 1, 'vtiger_invoice:customerno:customerno:Invoice_Customer_No:V'),
(21, 2, 'vtiger_invoice:invoicedate:invoicedate:Invoice_Invoice_Date:D'),
(21, 3, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(21, 4, 'vtiger_invoice:total:hdnGrandTotal:Invoice_Total:N'),
(22, 1, 'vtiger_notes:title:notes_title:Documents_Title:V'),
(22, 2, 'vtiger_notes:filename:filename:Documents_File_Name:V'),
(22, 3, 'vtiger_crmentity:modifiedtime:modifiedtime:Documents_Modified_Time:DT'),
(22, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Documents_Assigned_To:V'),
(23, 1, 'vtiger_pricebook:bookname:bookname:PriceBooks_Price_Book_Name:V'),
(23, 2, 'vtiger_pricebook:active:active:PriceBooks_Active:C'),
(23, 3, 'vtiger_pricebook:currency_id:currency_id:PriceBooks_Currency:V'),
(24, 0, 'vtiger_products:productcode:productcode:Products_Part_Number:V'),
(24, 1, 'vtiger_products:productname:productname:Products_Product_Name:V'),
(24, 2, 'vtiger_products:qty_per_unit:qty_per_unit:Products_Qty/Unit:N'),
(24, 3, 'vtiger_products:productcategory:productcategory:Products_Product_Category:V'),
(24, 4, 'vtiger_products:unit_price:unit_price:Products_Unit_Price:N'),
(24, 5, 'vtiger_crmentity:description:description:Products_Description:V'),
(25, 0, 'vtiger_purchaseorder:purchaseorder_no:purchaseorder_no:PurchaseOrder_PurchaseOrder_No:V'),
(25, 1, 'vtiger_purchaseorder:duedate:duedate:PurchaseOrder_Due_Date:D'),
(25, 2, 'vtiger_poshipads:ship_street:ship_street:PurchaseOrder_Shipping_Address:V'),
(25, 3, 'vtiger_pobillads:bill_code:bill_code:PurchaseOrder_Billing_Code:V'),
(25, 4, 'vtiger_pobillads:bill_country:bill_country:PurchaseOrder_Billing_Country:V'),
(25, 5, 'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),
(26, 0, 'vtiger_salesorder:salesorder_no:salesorder_no:SalesOrder_SalesOrder_No:V'),
(26, 1, 'vtiger_salesorder:customerno:customerno:SalesOrder_Customer_No:V'),
(26, 2, 'vtiger_salesorder:subject:subject:SalesOrder_Subject:V'),
(26, 3, 'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V'),
(26, 4, 'vtiger_salesorder:duedate:duedate:SalesOrder_Due_Date:D'),
(26, 5, 'vtiger_salesorder:total:hdnGrandTotal:SalesOrder_Total:N'),
(26, 6, 'vtiger_crmentity:smownerid:assigned_user_id:SalesOrder_Assigned_To:V'),
(27, 1, 'vtiger_vendor:vendorname:vendorname:Vendors_Vendor_Name:V'),
(27, 2, 'vtiger_vendor:phone:phone:Vendors_Phone:V'),
(27, 3, 'vtiger_vendor:email:email:Vendors_Email:V'),
(27, 4, 'vtiger_vendor:category:category:Vendors_Category:V'),
(27, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Vendors_Assigned_To:V'),
(28, 1, 'vtiger_faq:question:question:Faq_Question:V'),
(28, 2, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(28, 3, 'vtiger_faq:product_id:product_id:Faq_Product_Name:V'),
(28, 4, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(28, 5, 'vtiger_crmentity:modifiedtime:modifiedtime:Faq_Modified_Time:DT'),
(29, 1, 'vtiger_campaign:campaignname:campaignname:Campaigns_Campaign_Name:V'),
(29, 2, 'vtiger_campaign:campaigntype:campaigntype:Campaigns_Campaign_Type:V'),
(29, 3, 'vtiger_campaign:campaignstatus:campaignstatus:Campaigns_Campaign_Status:V'),
(29, 4, 'vtiger_campaign:expectedrevenue:expectedrevenue:Campaigns_Expected_Revenue:N'),
(29, 5, 'vtiger_campaign:closingdate:closingdate:Campaigns_Expected_Close_Date:D'),
(29, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Campaigns_Assigned_To:V'),
(30, 0, 'subject:subject:subject:Subject:V'),
(30, 1, 'from:fromname:fromname:From:N'),
(30, 2, 'to:tpname:toname:To:N'),
(30, 3, 'body:body:body:Body:V'),
(31, 0, 'vtiger_faq:question:question:Faq_Question:V'),
(31, 1, 'vtiger_faq:status:faqstatus:Faq_Status:V'),
(31, 2, 'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),
(31, 3, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(31, 4, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(32, 0, 'vtiger_faq:question:question:Faq_Question:V'),
(32, 1, 'vtiger_faq:answer:faq_answer:Faq_Answer:V'),
(32, 2, 'vtiger_faq:status:faqstatus:Faq_Status:V'),
(32, 3, 'vtiger_faq:product_id:product_id:Faq_Product_Name:I'),
(32, 4, 'vtiger_faq:category:faqcategories:Faq_Category:V'),
(32, 5, 'vtiger_crmentity:createdtime:createdtime:Faq_Created_Time:DT'),
(33, 0, 'vtiger_purchaseorder:purchaseorder_no:purchaseorder_no:PurchaseOrder_PurchaseOrder_No:V'),
(33, 1, 'vtiger_purchaseorder:contactid:contact_id:PurchaseOrder_Contact_Name:V'),
(33, 2, 'vtiger_pobillads:bill_code:bill_code:PurchaseOrder_Billing_Code:V'),
(34, 0, 'vtiger_purchaseorder:subject:subject:PurchaseOrder_Subject:V'),
(34, 1, 'vtiger_purchaseorder:vendorid:vendor_id:PurchaseOrder_Vendor_Name:I'),
(34, 2, 'vtiger_crmentity:smownerid:assigned_user_id:PurchaseOrder_Assigned_To:V'),
(34, 3, 'vtiger_purchaseorder:postatus:postatus:PurchaseOrder_Status:V'),
(34, 4, 'vtiger_purchaseorder:carrier:carrier:PurchaseOrder_Carrier:V'),
(34, 5, 'vtiger_poshipads:ship_street:ship_street:PurchaseOrder_Shipping_Address:V'),
(35, 0, 'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),
(35, 1, 'vtiger_invoice:accountid:account_id:Invoice_Account_Name:V'),
(35, 2, 'vtiger_crmentity:createdtime:createdtime:Invoice_Created_Time:DT'),
(35, 3, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(35, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),
(36, 0, 'vtiger_invoice:invoice_no:invoice_no:Invoice_Invoice_No:V'),
(36, 1, 'vtiger_invoice:accountid:account_id:Invoice_Account_Name:V'),
(36, 2, 'vtiger_invoice:invoicedate:invoicedate:Invoice_Invoice_Date:D'),
(36, 3, 'vtiger_invoice:invoicestatus:invoicestatus:Invoice_Status:V'),
(36, 4, 'vtiger_crmentity:smownerid:assigned_user_id:Invoice_Assigned_To:V'),
(37, 0, 'vtiger_salesorder:subject:subject:SalesOrder_Subject:V'),
(37, 1, 'vtiger_salesorder:accountid:account_id:SalesOrder_Account_Name:I'),
(37, 2, 'vtiger_salesorder:sostatus:sostatus:SalesOrder_Status:V'),
(37, 3, 'vtiger_crmentity:smownerid:assigned_user_id:SalesOrder_Assigned_To:V'),
(37, 4, 'vtiger_soshipads:ship_street:ship_street:SalesOrder_Shipping_Address:V'),
(37, 5, 'vtiger_salesorder:carrier:carrier:SalesOrder_Carrier:V'),
(38, 0, 'vtiger_pbxmanager:callstatus:callstatus:PBXManager_Call_Status:V'),
(38, 1, 'vtiger_pbxmanager:customernumber:customernumber:PBXManager_Customer_Number:V'),
(38, 2, 'vtiger_pbxmanager:customer:customer:PBXManager_Customer:V'),
(38, 3, 'vtiger_pbxmanager:user:user:PBXManager_User:V'),
(38, 4, 'vtiger_pbxmanager:recordingurl:recordingurl:PBXManager_Recording_URL:V'),
(38, 5, 'vtiger_pbxmanager:totalduration:totalduration:PBXManager_Total_Duration:I'),
(38, 6, 'vtiger_pbxmanager:starttime:starttime:PBXManager_Start_Time:DT'),
(39, 1, 'vtiger_servicecontracts:subject:subject:ServiceContracts_Subject:V'),
(39, 2, 'vtiger_servicecontracts:sc_related_to:sc_related_to:ServiceContracts_Related_to:V'),
(39, 3, 'vtiger_crmentity:smownerid:assigned_user_id:ServiceContracts_Assigned_To:V'),
(39, 4, 'vtiger_servicecontracts:start_date:start_date:ServiceContracts_Start_Date:D'),
(39, 5, 'vtiger_servicecontracts:due_date:due_date:ServiceContracts_Due_date:D'),
(39, 7, 'vtiger_servicecontracts:progress:progress:ServiceContracts_Progress:N'),
(39, 8, 'vtiger_servicecontracts:contract_status:contract_status:ServiceContracts_Status:V'),
(40, 1, 'vtiger_service:servicename:servicename:Services_Service_Name:V'),
(40, 2, 'vtiger_service:service_usageunit:service_usageunit:Services_Usage_Unit:V'),
(40, 3, 'vtiger_service:unit_price:unit_price:Services_Price:N'),
(40, 4, 'vtiger_service:qty_per_unit:qty_per_unit:Services_No_of_Units:N'),
(40, 5, 'vtiger_service:servicecategory:servicecategory:Services_Service_Category:V'),
(40, 6, 'vtiger_crmentity:smownerid:assigned_user_id:Services_Owner:I'),
(41, 1, 'vtiger_assets:assetname:assetname:Assets_Asset_Name:V'),
(41, 2, 'vtiger_assets:account:account:Assets_Customer_Name:V'),
(41, 3, 'vtiger_assets:product:product:Assets_Product_Name:V'),
(42, 0, 'vtiger_modcomments:commentcontent:commentcontent:ModComments_Comment:V'),
(42, 1, 'vtiger_modcomments:related_to:related_to:ModComments_Related_To:V'),
(42, 2, 'vtiger_crmentity:modifiedtime:modifiedtime:ModComments_Modified_Time:DT'),
(42, 3, 'vtiger_crmentity:smownerid:assigned_user_id:ModComments_Assigned_To:V'),
(46, 0, 'vtiger_smsnotifier:message:message:SMSNotifier_message:V'),
(46, 2, 'vtiger_crmentity:smownerid:assigned_user_id:SMSNotifier_Assigned_To:V'),
(46, 3, 'vtiger_crmentity:createdtime:createdtime:SMSNotifier_Created_Time:DT'),
(46, 4, 'vtiger_crmentity:modifiedtime:modifiedtime:SMSNotifier_Modified_Time:DT'),
(47, 0, 'vtiger_projectmilestone:projectmilestonename:projectmilestonename:ProjectMilestone_Project_Milestone_Name:V'),
(47, 1, 'vtiger_projectmilestone:projectmilestonedate:projectmilestonedate:ProjectMilestone_Milestone_Date:D'),
(47, 3, 'vtiger_crmentity:description:description:ProjectMilestone_description:V'),
(47, 4, 'vtiger_crmentity:createdtime:createdtime:ProjectMilestone_Created_Time:DT'),
(47, 5, 'vtiger_crmentity:modifiedtime:modifiedtime:ProjectMilestone_Modified_Time:DT'),
(48, 2, 'vtiger_projecttask:projecttaskname:projecttaskname:ProjectTask_Project_Task_Name:V'),
(48, 3, 'vtiger_projecttask:projectid:projectid:ProjectTask_Related_to:V'),
(48, 4, 'vtiger_projecttask:projecttaskpriority:projecttaskpriority:ProjectTask_Priority:V'),
(48, 5, 'vtiger_projecttask:projecttaskprogress:projecttaskprogress:ProjectTask_Progress:V'),
(48, 6, 'vtiger_projecttask:projecttaskhours:projecttaskhours:ProjectTask_Worked_Hours:V'),
(48, 7, 'vtiger_projecttask:startdate:startdate:ProjectTask_Start_Date:D'),
(48, 8, 'vtiger_projecttask:enddate:enddate:ProjectTask_End_Date:D'),
(48, 9, 'vtiger_crmentity:smownerid:assigned_user_id:ProjectTask_Assigned_To:V'),
(49, 0, 'vtiger_project:projectname:projectname:Project_Project_Name:V'),
(49, 1, 'vtiger_project:startdate:startdate:Project_Start_Date:D'),
(49, 2, 'vtiger_project:targetenddate:targetenddate:Project_Target_End_Date:D'),
(49, 3, 'vtiger_project:actualenddate:actualenddate:Project_Actual_End_Date:D'),
(49, 4, 'vtiger_project:targetbudget:targetbudget:Project_Target_Budget:V'),
(49, 5, 'vtiger_project:progress:progress:Project_Progress:V'),
(49, 6, 'vtiger_project:projectstatus:projectstatus:Project_Status:V'),
(49, 7, 'vtiger_crmentity:smownerid:assigned_user_id:Project_Assigned_To:V'),
(50, 0, 'vtiger_products:productcode:productcode:Products_Part_Number:V'),
(50, 1, 'vtiger_products:productname:productname:Products_Product_Name:V'),
(50, 2, 'vtiger_products:productcategory:productcategory:Products_Product_Category:V'),
(50, 3, 'vtiger_products:qty_per_unit:qty_per_unit:Products_Qty/Unit:N'),
(50, 4, 'vtiger_products:unit_price:unit_price:Products_Unit_Price:N'),
(50, 5, 'vtiger_crmentity:description:description:Products_Description:V'),
(51, 1, 'vtiger_hrm_setting:name:name:SettingHrm_Name:V'),
(51, 2, 'vtiger_hrm_setting:description:description:SettingHrm_Description:V'),
(52, 0, 'vtiger_hrm_position:name:name:SettingPosition_Name:V'),
(52, 1, 'vtiger_hrm_position:description:description:SettingPosition_Description:V'),
(52, 2, 'vtiger_crmentity:source:source:SettingPosition_Source:V'),
(53, 1, 'vtiger_hrm_weight:weight:weight:SettingWeight_Weight:V'),
(54, 0, 'vtiger_hrm_settingdepartment:name:name:SalaryComponent_Name:V'),
(54, 1, 'vtiger_hrm_settingdepartment:description:description:SalaryComponent_Description:V'),
(55, 1, 'vtiger_hrm_salaryreference:employ_id:employ_id:Salary_Employee:V'),
(55, 2, 'vtiger_hrm_salaryreference:current_salary:current_salary:Salary_Current_Salary:V'),
(55, 3, 'vtiger_hrm_salaryreference:before_increase_date:before_increase_date:Salary_Increase_Date_Before:D'),
(55, 4, 'vtiger_hrm_salaryreference:salary_after:salary_after:Salary_After_Increase_Salary:V'),
(55, 5, 'vtiger_hrm_salaryreference:hr_salary_action:hr_salary_action:Salary_HR_Action:V'),
(55, 6, 'vtiger_hrm_salaryreference:reviewer:reviewer:Salary_Reviewer:V'),
(56, 0, 'vtiger_hrm_rating:task_name:task_name:Rating_Task_Name:V'),
(56, 1, 'vtiger_hrm_rating:detail:detail:Rating_Details:V'),
(56, 2, 'vtiger_hrm_rating:rating_weight:rating_weight:Rating_Weight:V'),
(57, 0, 'vtiger_hrm_jd:name:name:JD_Name:V'),
(57, 1, 'vtiger_hrm_jd:description:description:JD_Description:V'),
(57, 2, 'vtiger_hrm_jd:position:position:JD_Position:V'),
(57, 3, 'vtiger_hrm_jd:jd_category:jd_category:JD_Category:V'),
(57, 4, 'vtiger_hrm_jd:jd_status:jd_status:JD_Status:V'),
(58, 0, 'vtiger_hrm_qcm:qcm_title:qcm_title:QCM_QCM_Title:V'),
(58, 1, 'vtiger_hrm_qcm:qcm_category:qcm_category:QCM_Category:V'),
(58, 2, 'vtiger_hrm_qcm:qcm_classify:qcm_classify:QCM_Classify:V'),
(58, 3, 'vtiger_crmentity:smownerid:assigned_user_id:QCM_Created_by:V'),
(58, 4, 'vtiger_hrm_qcm:qcm_status:qcm_status:QCM_Status:V'),
(59, 0, 'vtiger_hrm_kpi:kpi_name:kpi_name:KPI_KPI_Name:V'),
(59, 1, 'vtiger_hrm_kpi:kpi_type:kpi_type:KPI_Type:V'),
(59, 2, 'vtiger_hrm_kpi:kpi_department:kpi_department:KPI_Department:V'),
(59, 3, 'vtiger_crmentity:smownerid:assigned_user_id:KPI_Assigned_To:V'),
(60, 0, 'vtiger_hrm_candidate:firstname:firstname:Candidates_First_Name:V'),
(60, 1, 'vtiger_hrm_candidate:lastname:lastname:Candidates_Last_Name:V'),
(60, 2, 'vtiger_hrm_candidate:email:email:Candidates_Primary_Email:V'),
(60, 3, 'vtiger_hrm_candidate:mobile:mobile:Candidates_Mobile_Phone:V'),
(60, 4, 'vtiger_hrm_candidate:position:position:Candidates_Position:V'),
(60, 5, 'vtiger_crmentity:smownerid:assigned_user_id:Candidates_Assigned_To:V'),
(61, 1, 'vtiger_hrm_leave:employ_id:employ_id:Leave_Employee:V'),
(61, 2, 'vtiger_hrm_leave:from_date:from_date:Leave_From_Date:D'),
(61, 3, 'vtiger_hrm_leave:to_date:to_date:Leave_To_Date:D'),
(61, 4, 'vtiger_hrm_leave:hrm_leave_type:hrm_leave_type:Leave_Leave_Type:V'),
(61, 5, 'vtiger_hrm_leave:hrm_leave_action:hrm_leave_action:Leave_Action:V'),
(62, 0, 'vtiger_hrm_employee:user_id:user_id:Employee_User_ID:V'),
(62, 1, 'vtiger_hrm_employee:lastname:lastname:Employee_Last_Name:V'),
(62, 2, 'vtiger_hrm_employee:firstname:firstname:Employee_First_Name:V'),
(62, 3, 'vtiger_hrm_employee:employ_gender:employ_gender:Employee_Gender:V'),
(62, 4, 'vtiger_hrm_employee:official_salary:official_salary:Employee_Official_Salary:V'),
(62, 5, 'vtiger_hrm_employee:city:city:Employee_City:V'),
(62, 6, 'vtiger_hrm_employee:address:address:Employee_Address:V'),
(63, 0, 'vtiger_hrm_employee:employ_number:employ_number:Employee_Employee_Number:V'),
(63, 1, 'vtiger_hrm_employee:firstname:firstname:Employee_First_Name:V'),
(63, 2, 'vtiger_hrm_employee:lastname:lastname:Employee_Last_Name:V'),
(63, 3, 'vtiger_hrm_employee:employ_gender:employ_gender:Employee_Gender:V'),
(63, 4, 'vtiger_hrm_employee:start_work_date:start_work_date:Employee_Start_Work_Date:D'),
(63, 5, 'vtiger_hrm_employee:official_salary:official_salary:Employee_Official_Salary:V'),
(63, 6, 'vtiger_hrm_employee:address:address:Employee_Address:V'),
(63, 7, 'vtiger_hrm_employee:country:country:Employee_Country:V'),
(64, 0, 'vtiger_hrm_jd:name:name:JD_Name:V'),
(64, 1, 'vtiger_hrm_jd:description:description:JD_Description:V'),
(64, 2, 'vtiger_hrm_jd:position:position:JD_Position:V'),
(64, 3, 'vtiger_hrm_jd:jd_category:jd_category:JD_Category:V'),
(64, 4, 'vtiger_hrm_jd:jd_status:jd_status:JD_Status:V'),
(65, 0, 'vtiger_hrm_jd:name:name:JD_Name:V'),
(65, 1, 'vtiger_hrm_jd:description:description:JD_Description:V'),
(65, 2, 'vtiger_hrm_jd:position:position:JD_Position:V'),
(65, 3, 'vtiger_hrm_jd:jd_category:jd_category:JD_Category:V'),
(65, 4, 'vtiger_hrm_jd:jd_status:jd_status:JD_Status:V'),
(66, 0, 'vtiger_hrm_jd:name:name:JD_Name:V'),
(66, 1, 'vtiger_hrm_jd:description:description:JD_Description:V'),
(66, 2, 'vtiger_hrm_jd:position:position:JD_Position:V'),
(66, 3, 'vtiger_hrm_jd:jd_category:jd_category:JD_Category:V'),
(66, 4, 'vtiger_hrm_jd:jd_status:jd_status:JD_Status:V'),
(75, 0, 'vtiger_customerenterprise:makhachhang:makhachhang:CustomerEnterprise_Ma_Khach_Hang:V'),
(75, 1, 'vtiger_customerenterprisecf:cf_1105:cf_1105:CustomerEnterprise_Tên_khách_hàng:V'),
(75, 2, 'vtiger_customerenterprisecf:cf_1143:cf_1143:CustomerEnterprise_Chức_danh:V'),
(75, 3, 'vtiger_customerenterprisecf:cf_1149:cf_1149:CustomerEnterprise_ĐT_Di_động:V'),
(75, 4, 'vtiger_customerenterprisecf:cf_1151:cf_1151:CustomerEnterprise_ĐT_Cơ_quan:V'),
(75, 5, 'vtiger_customerenterprisecf:cf_1157:cf_1157:CustomerEnterprise_Email_Cơ_quan:E'),
(79, 0, 'vtiger_customerstandalone:makhachhang:makhachhang:CustomerStandalone_Ma_Khach_Hang:V'),
(79, 1, 'vtiger_customerstandalonecf:cf_1199:cf_1199:CustomerStandalone_Ten_khach_hang:V'),
(79, 2, 'vtiger_customerstandalonecf:cf_1197:cf_1197:CustomerStandalone_So_dien_thoai:V'),
(80, 0, 'vtiger_problemcategory:loaivande:loaivande:ProblemCategory_Loai_van_de:V'),
(80, 1, 'vtiger_problemcategorycf:cf_1207:cf_1207:ProblemCategory_Mo_ta_chi_tiet:V'),
(81, 0, 'vtiger_supportprotocol:hinhthuchotro:hinhthuchotro:SupportProtocol_Hinh_thuc_ho_tro:V'),
(81, 1, 'vtiger_supportprotocolcf:cf_1215:cf_1215:SupportProtocol_Mo_ta_chi_tiet:V'),
(86, 0, 'vtiger_phuongtientruyenthong:pttt:pttt:PhuongTienTruyenThong_Phuong_tien_truyen_thong:V'),
(86, 1, 'vtiger_phuongtientruyenthong:motachitiet:motachitiet:PhuongTienTruyenThong_Mo_ta_chi_tiet:V'),
(87, 0, 'vtiger_hinhthuctruyenthong:httt:httt:HinhThucTruyenThong_Hinh_thuc_truyen_thong:V'),
(87, 1, 'vtiger_hinhthuctruyenthong:motachitiet:motachitiet:HinhThucTruyenThong_Mo_ta_chi_tiet:V'),
(88, 0, 'vtiger_quytrinhbanhang:tenquytrinh:tenquytrinh:QuyTrinhBanHang_Ten_quy_trinh:V'),
(88, 1, 'vtiger_quytrinhbanhang:motachitiet:motachitiet:QuyTrinhBanHang_Mo_ta_chi_tiet:V');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_cvstdfilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_cvstdfilter` (
  `cvid` int(19) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `stdfilter` varchar(250) DEFAULT '',
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  KEY `cvstdfilter_cvid_idx` (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_cvstdfilter`
--

INSERT INTO `vtiger_cvstdfilter` (`cvid`, `columnname`, `stdfilter`, `startdate`, `enddate`) VALUES
(3, 'vtiger_crmentity:modifiedtime:modifiedtime:Leads_Modified_Time', 'thismonth', '2005-06-01', '2005-06-30'),
(6, 'vtiger_crmentity:createdtime:createdtime:Accounts_Created_Time', 'thisweek', '2005-06-19', '2005-06-25'),
(9, 'vtiger_contactsubdetails:birthday:birthday:Contacts_Birthdate', 'today', '2005-06-25', '2005-06-25');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_dashboard_tabs`
--

CREATE TABLE IF NOT EXISTS `vtiger_dashboard_tabs` (
  `id` int(19) NOT NULL,
  `tabname` varchar(50) DEFAULT NULL,
  `isdefault` int(1) DEFAULT 0,
  `sequence` int(5) DEFAULT 2,
  `appname` varchar(20) DEFAULT NULL,
  `modulename` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tabname` (`tabname`,`userid`),
  KEY `vtiger_dashboard_tabs_ibfk_1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_dashboard_tabs`
--

INSERT INTO `vtiger_dashboard_tabs` (`id`, `tabname`, `isdefault`, `sequence`, `appname`, `modulename`, `userid`) VALUES
(1, 'Default', 0, 2, NULL, NULL, 1),
(2, 'My Dashboard', 1, 1, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_grp2grp`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2grp` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_grp2grp_share_groupid_idx` (`share_groupid`),
  KEY `datashare_grp2grp_to_groupid_idx` (`to_groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_grp2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2role` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `idx_datashare_grp2role_share_groupid` (`share_groupid`),
  KEY `idx_datashare_grp2role_to_roleid` (`to_roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_grp2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_grp2rs` (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_grp2rs_share_groupid_idx` (`share_groupid`),
  KEY `datashare_grp2rs_to_roleandsubid_idx` (`to_roleandsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_module_rel`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_module_rel` (
  `shareid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `relationtype` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `idx_datashare_module_rel_tabid` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_relatedmodules`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodules` (
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `tabid` int(19) DEFAULT NULL,
  `relatedto_tabid` int(19) DEFAULT NULL,
  PRIMARY KEY (`datashare_relatedmodule_id`),
  KEY `datashare_relatedmodules_tabid_idx` (`tabid`),
  KEY `datashare_relatedmodules_relatedto_tabid_idx` (`relatedto_tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_datashare_relatedmodules`
--

INSERT INTO `vtiger_datashare_relatedmodules` (`datashare_relatedmodule_id`, `tabid`, `relatedto_tabid`) VALUES
(1, 6, 2),
(2, 6, 13),
(3, 6, 20),
(4, 6, 22),
(5, 6, 23),
(6, 2, 20),
(7, 2, 22),
(8, 20, 22),
(9, 22, 23);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_relatedmodules_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodules_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_datashare_relatedmodules_seq`
--

INSERT INTO `vtiger_datashare_relatedmodules_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_relatedmodule_permission`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_relatedmodule_permission` (
  `shareid` int(19) NOT NULL,
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`,`datashare_relatedmodule_id`),
  KEY `datashare_relatedmodule_permission_shareid_permissions_idx` (`shareid`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_role2group`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2group` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `idx_datashare_role2group_share_roleid` (`share_roleid`),
  KEY `idx_datashare_role2group_to_groupid` (`to_groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_role2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2role` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_role2role_share_roleid_idx` (`share_roleid`),
  KEY `datashare_role2role_to_roleid_idx` (`to_roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_role2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_role2rs` (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_role2s_share_roleid_idx` (`share_roleid`),
  KEY `datashare_role2s_to_roleandsubid_idx` (`to_roleandsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_rs2grp`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2grp` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_groupid` int(19) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_rs2grp_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `datashare_rs2grp_to_groupid_idx` (`to_groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_rs2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2role` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_roleid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_rs2role_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `datashare_rs2role_to_roleid_idx` (`to_roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_datashare_rs2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_datashare_rs2rs` (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) DEFAULT NULL,
  `to_roleandsubid` varchar(255) DEFAULT NULL,
  `permission` int(19) DEFAULT NULL,
  PRIMARY KEY (`shareid`),
  KEY `datashare_rs2rs_share_roleandsubid_idx` (`share_roleandsubid`),
  KEY `idx_datashare_rs2rs_to_roleandsubid_idx` (`to_roleandsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_date_format`
--

CREATE TABLE IF NOT EXISTS `vtiger_date_format` (
  `date_formatid` int(19) NOT NULL,
  `date_format` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`date_formatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_date_format`
--

INSERT INTO `vtiger_date_format` (`date_formatid`, `date_format`, `sortorderid`, `presence`) VALUES
(1, 'dd-mm-yyyy', 0, 1),
(2, 'mm-dd-yyyy', 1, 1),
(3, 'yyyy-mm-dd', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_date_format_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_date_format_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_date_format_seq`
--

INSERT INTO `vtiger_date_format_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_dayoftheweek`
--

CREATE TABLE IF NOT EXISTS `vtiger_dayoftheweek` (
  `dayoftheweekid` int(11) NOT NULL,
  `dayoftheweek` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`dayoftheweekid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_dayoftheweek`
--

INSERT INTO `vtiger_dayoftheweek` (`dayoftheweekid`, `dayoftheweek`, `sortorderid`, `presence`) VALUES
(1, 'Sunday', 0, 1),
(2, 'Monday', 1, 1),
(3, 'Tuesday', 2, 1),
(4, 'Wednesday', 3, 1),
(5, 'Thursday', 4, 1),
(6, 'Friday', 5, 1),
(7, 'Saturday', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_dayoftheweek_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_dayoftheweek_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_dayoftheweek_seq`
--

INSERT INTO `vtiger_dayoftheweek_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_defaultactivitytype`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultactivitytype` (
  `defaultactivitytypeid` int(11) NOT NULL,
  `defaultactivitytype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  PRIMARY KEY (`defaultactivitytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_defaultactivitytype`
--

INSERT INTO `vtiger_defaultactivitytype` (`defaultactivitytypeid`, `defaultactivitytype`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Call', 1, 299, 1),
(2, 'Meeting', 1, 300, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_defaultactivitytype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultactivitytype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_defaultactivitytype_seq`
--

INSERT INTO `vtiger_defaultactivitytype_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_defaultcalendarview`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultcalendarview` (
  `defaultcalendarviewid` int(11) NOT NULL,
  `defaultcalendarview` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`defaultcalendarviewid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_defaultcalendarview`
--

INSERT INTO `vtiger_defaultcalendarview` (`defaultcalendarviewid`, `defaultcalendarview`, `sortorderid`, `presence`) VALUES
(1, 'ListView', 0, 1),
(2, 'MyCalendar', 1, 1),
(3, 'SharedCalendar', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_defaultcalendarview_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultcalendarview_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_defaultcalendarview_seq`
--

INSERT INTO `vtiger_defaultcalendarview_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_defaultcv`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaultcv` (
  `tabid` int(19) NOT NULL,
  `defaultviewname` varchar(50) NOT NULL,
  `query` text DEFAULT NULL,
  PRIMARY KEY (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_defaulteventstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaulteventstatus` (
  `defaulteventstatusid` int(11) NOT NULL,
  `defaulteventstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  PRIMARY KEY (`defaulteventstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_defaulteventstatus`
--

INSERT INTO `vtiger_defaulteventstatus` (`defaulteventstatusid`, `defaulteventstatus`, `presence`, `picklist_valueid`, `sortorderid`) VALUES
(1, 'Planned', 1, 296, 1),
(2, 'Held', 1, 297, 2),
(3, 'Not Held', 1, 298, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_defaulteventstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_defaulteventstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_defaulteventstatus_seq`
--

INSERT INTO `vtiger_defaulteventstatus_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_default_record_view`
--

CREATE TABLE IF NOT EXISTS `vtiger_default_record_view` (
  `default_record_viewid` int(11) NOT NULL,
  `default_record_view` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`default_record_viewid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_default_record_view`
--

INSERT INTO `vtiger_default_record_view` (`default_record_viewid`, `default_record_view`, `sortorderid`, `presence`) VALUES
(1, 'Summary', 0, 1),
(2, 'Detail', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_default_record_view_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_default_record_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_default_record_view_seq`
--

INSERT INTO `vtiger_default_record_view_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_def_org_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_field` (
  `tabid` int(10) DEFAULT NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) DEFAULT NULL,
  `readonly` int(19) DEFAULT NULL,
  PRIMARY KEY (`fieldid`),
  KEY `def_org_field_tabid_fieldid_idx` (`tabid`,`fieldid`),
  KEY `def_org_field_tabid_idx` (`tabid`),
  KEY `def_org_field_visible_fieldid_idx` (`visible`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_def_org_field`
--

INSERT INTO `vtiger_def_org_field` (`tabid`, `fieldid`, `visible`, `readonly`) VALUES
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 5, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(6, 8, 0, 0),
(6, 9, 0, 0),
(6, 10, 0, 0),
(6, 11, 0, 0),
(6, 12, 0, 0),
(6, 13, 0, 0),
(6, 14, 0, 0),
(6, 15, 0, 0),
(6, 16, 0, 0),
(6, 17, 0, 0),
(6, 18, 0, 0),
(6, 19, 0, 0),
(6, 20, 0, 0),
(6, 21, 0, 0),
(6, 22, 0, 0),
(6, 23, 0, 0),
(6, 24, 0, 0),
(6, 25, 0, 0),
(6, 26, 0, 0),
(6, 27, 0, 0),
(6, 28, 0, 0),
(6, 29, 0, 0),
(6, 30, 0, 0),
(6, 31, 0, 0),
(6, 32, 0, 0),
(6, 33, 0, 0),
(6, 34, 0, 0),
(6, 35, 0, 0),
(6, 36, 0, 0),
(7, 37, 0, 0),
(7, 38, 0, 0),
(7, 39, 0, 0),
(7, 40, 0, 0),
(7, 41, 0, 0),
(7, 42, 0, 0),
(7, 43, 0, 0),
(7, 44, 0, 0),
(7, 45, 0, 0),
(7, 46, 0, 0),
(7, 47, 0, 0),
(7, 48, 0, 0),
(7, 49, 0, 0),
(7, 50, 0, 0),
(7, 51, 0, 0),
(7, 52, 0, 0),
(7, 53, 0, 0),
(7, 54, 0, 0),
(7, 55, 0, 0),
(7, 56, 0, 0),
(7, 57, 0, 0),
(7, 58, 0, 0),
(7, 59, 0, 0),
(7, 60, 0, 0),
(7, 61, 0, 0),
(7, 62, 0, 0),
(7, 63, 0, 0),
(7, 64, 0, 0),
(7, 65, 0, 0),
(4, 66, 0, 0),
(4, 67, 0, 0),
(4, 68, 0, 0),
(4, 69, 0, 0),
(4, 70, 0, 0),
(4, 71, 0, 0),
(4, 72, 0, 0),
(4, 73, 0, 0),
(4, 74, 0, 0),
(4, 75, 0, 0),
(4, 76, 0, 0),
(4, 77, 0, 0),
(4, 78, 0, 0),
(4, 79, 0, 0),
(4, 80, 0, 0),
(4, 81, 0, 0),
(4, 82, 0, 0),
(4, 83, 0, 0),
(4, 84, 0, 0),
(4, 85, 0, 0),
(4, 86, 0, 0),
(4, 87, 0, 0),
(4, 88, 0, 0),
(4, 89, 0, 0),
(4, 90, 0, 0),
(4, 91, 0, 0),
(4, 92, 0, 0),
(4, 93, 0, 0),
(4, 94, 0, 0),
(4, 95, 0, 0),
(4, 96, 0, 0),
(4, 97, 0, 0),
(4, 98, 0, 0),
(4, 99, 0, 0),
(4, 100, 0, 0),
(4, 101, 0, 0),
(4, 102, 0, 0),
(4, 103, 0, 0),
(4, 104, 0, 0),
(4, 105, 0, 0),
(4, 106, 0, 0),
(4, 107, 0, 0),
(4, 108, 0, 0),
(4, 109, 0, 0),
(2, 110, 0, 0),
(2, 111, 0, 0),
(2, 112, 0, 0),
(2, 113, 0, 0),
(2, 114, 0, 0),
(2, 115, 0, 0),
(2, 116, 0, 0),
(2, 117, 0, 0),
(2, 118, 0, 0),
(2, 119, 0, 0),
(2, 120, 0, 0),
(2, 121, 0, 0),
(2, 122, 0, 0),
(2, 123, 0, 0),
(2, 124, 0, 0),
(2, 125, 0, 0),
(26, 126, 0, 0),
(26, 127, 0, 0),
(26, 128, 0, 0),
(26, 129, 0, 0),
(26, 130, 0, 0),
(26, 131, 0, 0),
(26, 132, 0, 0),
(26, 133, 0, 0),
(26, 134, 0, 0),
(26, 135, 0, 0),
(26, 136, 0, 0),
(26, 137, 0, 0),
(26, 138, 0, 0),
(26, 139, 0, 0),
(26, 140, 0, 0),
(26, 141, 0, 0),
(26, 142, 0, 0),
(26, 143, 0, 0),
(26, 144, 0, 0),
(26, 145, 0, 0),
(26, 146, 0, 0),
(26, 147, 0, 0),
(26, 148, 0, 0),
(26, 149, 0, 0),
(26, 150, 0, 0),
(4, 151, 0, 0),
(6, 152, 0, 0),
(7, 153, 0, 0),
(26, 154, 0, 0),
(13, 155, 0, 0),
(13, 156, 0, 0),
(13, 157, 0, 0),
(13, 158, 0, 0),
(13, 159, 0, 0),
(13, 160, 0, 0),
(13, 161, 0, 0),
(13, 162, 0, 0),
(13, 163, 0, 0),
(13, 164, 0, 0),
(13, 165, 0, 0),
(13, 166, 0, 0),
(13, 167, 0, 0),
(13, 168, 0, 0),
(13, 169, 0, 0),
(13, 170, 0, 0),
(13, 171, 0, 0),
(13, 172, 0, 0),
(13, 173, 0, 0),
(14, 174, 0, 0),
(14, 175, 0, 0),
(14, 176, 0, 0),
(14, 177, 0, 0),
(14, 178, 0, 0),
(14, 179, 0, 0),
(14, 180, 0, 0),
(14, 181, 0, 0),
(14, 182, 0, 0),
(14, 183, 0, 0),
(14, 184, 0, 0),
(14, 185, 0, 0),
(14, 186, 0, 0),
(14, 187, 0, 0),
(14, 188, 0, 0),
(14, 189, 0, 0),
(14, 190, 0, 0),
(14, 191, 0, 0),
(14, 192, 0, 0),
(14, 193, 0, 0),
(14, 194, 0, 0),
(14, 195, 0, 0),
(14, 196, 0, 0),
(14, 197, 0, 0),
(14, 198, 0, 0),
(14, 199, 0, 0),
(14, 200, 0, 0),
(14, 201, 0, 0),
(14, 202, 0, 0),
(14, 203, 0, 0),
(14, 204, 0, 0),
(8, 205, 0, 0),
(8, 206, 0, 0),
(8, 207, 0, 0),
(8, 208, 0, 0),
(8, 209, 0, 0),
(8, 210, 0, 0),
(8, 211, 0, 0),
(8, 212, 0, 0),
(8, 213, 0, 0),
(8, 214, 0, 0),
(8, 215, 0, 0),
(8, 216, 0, 0),
(8, 217, 0, 0),
(8, 218, 0, 0),
(8, 219, 0, 0),
(10, 220, 0, 0),
(10, 221, 0, 0),
(10, 222, 0, 0),
(10, 223, 0, 0),
(10, 224, 0, 0),
(10, 225, 0, 0),
(10, 226, 0, 0),
(10, 227, 0, 0),
(10, 228, 0, 0),
(10, 229, 0, 0),
(10, 230, 0, 0),
(10, 231, 0, 0),
(9, 232, 0, 0),
(9, 233, 0, 0),
(9, 234, 0, 0),
(9, 235, 0, 0),
(9, 236, 0, 0),
(9, 237, 0, 0),
(9, 238, 0, 0),
(9, 239, 0, 0),
(9, 240, 0, 0),
(9, 241, 0, 0),
(9, 242, 0, 0),
(9, 243, 0, 0),
(9, 244, 0, 0),
(9, 245, 0, 0),
(9, 246, 0, 0),
(9, 247, 0, 0),
(9, 248, 0, 0),
(9, 249, 0, 0),
(9, 250, 0, 0),
(9, 251, 0, 0),
(9, 252, 0, 0),
(9, 253, 0, 0),
(9, 254, 0, 0),
(9, 255, 0, 0),
(16, 256, 0, 0),
(16, 257, 0, 0),
(16, 258, 0, 0),
(16, 259, 0, 0),
(16, 260, 0, 0),
(16, 261, 0, 0),
(16, 262, 0, 0),
(16, 263, 0, 0),
(16, 264, 0, 0),
(16, 265, 0, 0),
(16, 266, 0, 0),
(16, 267, 0, 0),
(16, 268, 0, 0),
(16, 269, 0, 0),
(16, 270, 0, 0),
(16, 271, 0, 0),
(16, 272, 0, 0),
(16, 273, 0, 0),
(16, 274, 0, 0),
(16, 275, 0, 0),
(16, 276, 0, 0),
(16, 277, 0, 0),
(16, 278, 0, 0),
(15, 279, 0, 0),
(15, 280, 0, 0),
(15, 281, 0, 0),
(15, 282, 0, 0),
(15, 283, 0, 0),
(15, 284, 0, 0),
(15, 285, 0, 0),
(15, 286, 0, 0),
(15, 287, 0, 0),
(15, 288, 0, 0),
(18, 289, 0, 0),
(18, 290, 0, 0),
(18, 291, 0, 0),
(18, 292, 0, 0),
(18, 293, 0, 0),
(18, 294, 0, 0),
(18, 295, 0, 0),
(18, 296, 0, 0),
(18, 297, 0, 0),
(18, 298, 0, 0),
(18, 299, 0, 0),
(18, 300, 0, 0),
(18, 301, 0, 0),
(18, 302, 0, 0),
(18, 303, 0, 0),
(18, 304, 0, 0),
(18, 305, 0, 0),
(19, 306, 0, 0),
(19, 307, 0, 0),
(19, 308, 0, 0),
(19, 309, 0, 0),
(19, 310, 0, 0),
(19, 311, 0, 0),
(19, 312, 0, 0),
(19, 313, 0, 0),
(20, 314, 0, 0),
(20, 315, 0, 0),
(20, 316, 0, 0),
(20, 317, 0, 0),
(20, 318, 0, 0),
(20, 319, 0, 0),
(20, 320, 0, 0),
(20, 321, 0, 0),
(20, 322, 0, 0),
(20, 323, 0, 0),
(20, 324, 0, 0),
(20, 325, 0, 0),
(20, 326, 0, 0),
(20, 327, 0, 0),
(20, 328, 0, 0),
(20, 329, 0, 0),
(20, 330, 0, 0),
(20, 331, 0, 0),
(20, 332, 0, 0),
(20, 333, 0, 0),
(20, 334, 0, 0),
(20, 335, 0, 0),
(20, 336, 0, 0),
(20, 337, 0, 0),
(20, 338, 0, 0),
(20, 339, 0, 0),
(20, 340, 0, 0),
(20, 341, 0, 0),
(20, 342, 0, 0),
(20, 343, 0, 0),
(20, 344, 0, 0),
(20, 345, 0, 0),
(20, 346, 0, 0),
(20, 347, 0, 0),
(20, 348, 0, 0),
(20, 349, 0, 0),
(20, 350, 0, 0),
(21, 351, 0, 0),
(21, 352, 0, 0),
(21, 353, 0, 0),
(21, 354, 0, 0),
(21, 355, 0, 0),
(21, 356, 0, 0),
(21, 357, 0, 0),
(21, 358, 0, 0),
(21, 359, 0, 0),
(21, 360, 0, 0),
(21, 361, 0, 0),
(21, 362, 0, 0),
(21, 363, 0, 0),
(21, 364, 0, 0),
(21, 365, 0, 0),
(21, 366, 0, 0),
(21, 367, 0, 0),
(21, 368, 0, 0),
(21, 369, 0, 0),
(21, 370, 0, 0),
(21, 371, 0, 0),
(21, 372, 0, 0),
(21, 373, 0, 0),
(21, 374, 0, 0),
(21, 375, 0, 0),
(21, 376, 0, 0),
(21, 377, 0, 0),
(21, 378, 0, 0),
(21, 379, 0, 0),
(21, 380, 0, 0),
(21, 381, 0, 0),
(21, 382, 0, 0),
(21, 383, 0, 0),
(21, 384, 0, 0),
(21, 385, 0, 0),
(21, 386, 0, 0),
(21, 387, 0, 0),
(21, 388, 0, 0),
(22, 389, 0, 0),
(22, 390, 0, 0),
(22, 391, 0, 0),
(22, 392, 0, 0),
(22, 393, 0, 0),
(22, 394, 0, 0),
(22, 395, 0, 0),
(22, 396, 0, 0),
(22, 397, 0, 0),
(22, 398, 0, 0),
(22, 399, 0, 0),
(22, 400, 0, 0),
(22, 401, 0, 0),
(22, 402, 0, 0),
(22, 403, 0, 0),
(22, 404, 0, 0),
(22, 405, 0, 0),
(22, 406, 0, 0),
(22, 407, 0, 0),
(22, 408, 0, 0),
(22, 409, 0, 0),
(22, 410, 0, 0),
(22, 411, 0, 0),
(22, 412, 0, 0),
(22, 413, 0, 0),
(22, 414, 0, 0),
(22, 415, 0, 0),
(22, 416, 0, 0),
(22, 417, 0, 0),
(22, 418, 0, 0),
(22, 419, 0, 0),
(22, 420, 0, 0),
(22, 421, 0, 0),
(22, 422, 0, 0),
(22, 423, 0, 0),
(22, 424, 0, 0),
(22, 425, 0, 0),
(22, 426, 0, 0),
(22, 427, 0, 0),
(22, 428, 0, 0),
(22, 429, 0, 0),
(22, 430, 0, 0),
(22, 431, 0, 0),
(22, 432, 0, 0),
(22, 433, 0, 0),
(22, 434, 0, 0),
(22, 435, 0, 0),
(23, 436, 0, 0),
(23, 437, 0, 0),
(23, 438, 0, 0),
(23, 439, 0, 0),
(23, 440, 0, 0),
(23, 441, 0, 0),
(23, 442, 0, 0),
(23, 443, 0, 0),
(23, 444, 0, 0),
(23, 445, 0, 0),
(23, 446, 0, 0),
(23, 447, 0, 0),
(23, 448, 0, 0),
(23, 449, 0, 0),
(23, 450, 0, 0),
(23, 451, 0, 0),
(23, 452, 0, 0),
(23, 453, 0, 0),
(23, 454, 0, 0),
(23, 455, 0, 0),
(23, 456, 0, 0),
(23, 457, 0, 0),
(23, 458, 0, 0),
(23, 459, 0, 0),
(23, 460, 0, 0),
(23, 461, 0, 0),
(23, 462, 0, 0),
(23, 463, 0, 0),
(23, 464, 0, 0),
(23, 465, 0, 0),
(23, 466, 0, 0),
(23, 467, 0, 0),
(23, 468, 0, 0),
(23, 469, 0, 0),
(23, 470, 0, 0),
(23, 471, 0, 0),
(23, 472, 0, 0),
(23, 473, 0, 0),
(23, 474, 0, 0),
(29, 475, 0, 0),
(29, 479, 0, 0),
(29, 480, 0, 0),
(29, 482, 0, 0),
(29, 489, 0, 0),
(29, 490, 0, 0),
(29, 491, 0, 0),
(29, 492, 0, 0),
(29, 493, 0, 0),
(29, 495, 0, 0),
(29, 496, 0, 0),
(29, 497, 0, 0),
(29, 498, 0, 0),
(29, 499, 0, 0),
(29, 504, 0, 0),
(29, 505, 0, 0),
(29, 506, 0, 0),
(29, 507, 0, 0),
(29, 515, 0, 0),
(10, 520, 0, 0),
(10, 521, 0, 0),
(10, 522, 0, 0),
(10, 523, 0, 0),
(10, 524, 0, 0),
(10, 525, 0, 0),
(34, 526, 0, 0),
(34, 527, 0, 0),
(34, 528, 0, 0),
(34, 529, 0, 0),
(34, 530, 0, 0),
(34, 531, 0, 0),
(34, 532, 0, 0),
(34, 533, 0, 0),
(34, 534, 0, 0),
(34, 535, 0, 0),
(34, 536, 0, 0),
(34, 537, 0, 0),
(34, 538, 0, 0),
(34, 539, 0, 0),
(34, 540, 0, 0),
(34, 541, 0, 0),
(34, 542, 0, 0),
(29, 543, 0, 0),
(35, 544, 0, 0),
(35, 545, 0, 0),
(35, 546, 0, 0),
(35, 547, 0, 0),
(35, 548, 0, 0),
(35, 549, 0, 0),
(35, 550, 0, 0),
(35, 551, 0, 0),
(35, 552, 0, 0),
(35, 553, 0, 0),
(35, 554, 0, 0),
(35, 555, 0, 0),
(35, 556, 0, 0),
(35, 557, 0, 0),
(35, 558, 0, 0),
(35, 559, 0, 0),
(35, 560, 0, 0),
(35, 561, 0, 0),
(35, 562, 0, 0),
(35, 563, 0, 0),
(35, 564, 0, 0),
(35, 565, 0, 0),
(36, 566, 0, 0),
(36, 567, 0, 0),
(36, 568, 0, 0),
(36, 569, 0, 0),
(36, 570, 0, 0),
(36, 571, 0, 0),
(36, 572, 0, 0),
(36, 573, 0, 0),
(36, 574, 0, 0),
(36, 575, 0, 0),
(36, 576, 0, 0),
(36, 577, 0, 0),
(36, 578, 0, 0),
(36, 579, 0, 0),
(36, 580, 0, 0),
(36, 581, 0, 0),
(36, 582, 0, 0),
(36, 583, 0, 0),
(36, 584, 0, 0),
(36, 585, 0, 0),
(36, 586, 0, 0),
(36, 587, 0, 0),
(38, 588, 0, 0),
(38, 589, 0, 0),
(38, 590, 0, 0),
(38, 591, 0, 0),
(38, 592, 0, 0),
(38, 593, 0, 0),
(38, 594, 0, 0),
(38, 595, 0, 0),
(38, 596, 0, 0),
(38, 597, 0, 0),
(38, 598, 0, 0),
(38, 599, 0, 0),
(38, 600, 0, 0),
(38, 601, 0, 0),
(38, 602, 0, 0),
(38, 603, 0, 0),
(38, 604, 0, 0),
(38, 605, 0, 0),
(38, 606, 0, 0),
(38, 607, 0, 0),
(38, 608, 0, 0),
(42, 609, 0, 0),
(42, 610, 0, 0),
(42, 611, 0, 0),
(42, 612, 0, 0),
(42, 613, 0, 0),
(42, 614, 0, 0),
(42, 615, 0, 0),
(42, 616, 0, 0),
(43, 617, 0, 0),
(43, 618, 0, 0),
(43, 619, 0, 0),
(43, 620, 0, 0),
(43, 621, 0, 0),
(43, 622, 0, 0),
(43, 623, 0, 0),
(43, 624, 0, 0),
(43, 625, 0, 0),
(43, 626, 0, 0),
(43, 627, 0, 0),
(43, 628, 0, 0),
(43, 629, 0, 0),
(44, 630, 0, 0),
(44, 631, 0, 0),
(44, 632, 0, 0),
(44, 633, 0, 0),
(44, 634, 0, 0),
(44, 635, 0, 0),
(44, 636, 0, 0),
(44, 637, 0, 0),
(44, 638, 0, 0),
(44, 639, 0, 0),
(44, 640, 0, 0),
(44, 641, 0, 0),
(44, 642, 0, 0),
(44, 643, 0, 0),
(44, 644, 0, 0),
(44, 645, 0, 0),
(44, 646, 0, 0),
(44, 647, 0, 0),
(45, 648, 0, 0),
(45, 649, 0, 0),
(45, 650, 0, 0),
(45, 651, 0, 0),
(45, 652, 0, 0),
(45, 653, 0, 0),
(45, 654, 0, 0),
(45, 655, 0, 0),
(45, 656, 0, 0),
(45, 657, 0, 0),
(45, 658, 0, 0),
(45, 659, 0, 0),
(45, 660, 0, 0),
(45, 661, 0, 0),
(45, 662, 0, 0),
(45, 663, 0, 0),
(45, 664, 0, 0),
(45, 665, 0, 0),
(45, 666, 0, 0),
(45, 667, 0, 0),
(47, 668, 0, 0),
(47, 669, 0, 0),
(47, 670, 0, 0),
(47, 671, 0, 0),
(47, 672, 0, 0),
(47, 673, 0, 0),
(2, 674, 0, 0),
(29, 675, 0, 0),
(23, 676, 0, 0),
(23, 677, 0, 0),
(23, 678, 0, 0),
(23, 679, 0, 0),
(23, 680, 0, 0),
(23, 681, 0, 0),
(23, 682, 0, 0),
(23, 683, 0, 0),
(23, 684, 0, 0),
(22, 685, 0, 0),
(22, 686, 0, 0),
(22, 687, 0, 0),
(22, 688, 0, 0),
(22, 689, 0, 0),
(22, 690, 0, 0),
(22, 691, 0, 0),
(22, 692, 0, 0),
(22, 693, 0, 0),
(21, 694, 0, 0),
(21, 695, 0, 0),
(21, 696, 0, 0),
(21, 697, 0, 0),
(21, 698, 0, 0),
(21, 699, 0, 0),
(21, 700, 0, 0),
(21, 701, 0, 0),
(21, 702, 0, 0),
(20, 703, 0, 0),
(20, 704, 0, 0),
(20, 705, 0, 0),
(20, 706, 0, 0),
(20, 707, 0, 0),
(20, 708, 0, 0),
(20, 709, 0, 0),
(20, 710, 0, 0),
(20, 711, 0, 0),
(29, 712, 0, 0),
(44, 713, 0, 0),
(42, 714, 0, 0),
(29, 715, 0, 0),
(29, 716, 0, 0),
(29, 717, 0, 0),
(23, 718, 0, 0),
(22, 719, 0, 0),
(21, 720, 0, 0),
(20, 721, 0, 0),
(29, 722, 0, 0),
(6, 723, 0, 0),
(4, 724, 0, 0),
(2, 725, 0, 0),
(29, 726, 0, 0),
(23, 727, 0, 0),
(23, 728, 0, 0),
(21, 729, 0, 0),
(21, 730, 0, 0),
(18, 731, 0, 0),
(7, 732, 0, 0),
(42, 733, 0, 0),
(42, 734, 0, 0),
(23, 735, 0, 0),
(20, 736, 0, 0),
(21, 737, 0, 0),
(22, 738, 0, 0),
(29, 739, 0, 0),
(2, 740, 0, 0),
(13, 741, 0, 0),
(29, 742, 0, 0),
(29, 743, 0, 0),
(29, 744, 0, 0),
(29, 745, 0, 0),
(14, 772, 0, 0),
(36, 773, 0, 0),
(23, 774, 0, 0),
(29, 775, 0, 0),
(23, 776, 0, 0),
(23, 777, 0, 0),
(23, 778, 0, 0),
(20, 779, 0, 0),
(20, 780, 0, 0),
(20, 781, 0, 0),
(21, 782, 0, 0),
(22, 783, 0, 0),
(22, 784, 0, 0),
(22, 785, 0, 0),
(42, 786, 0, 0),
(42, 787, 0, 0),
(42, 788, 0, 0),
(2, 789, 0, 0),
(4, 790, 0, 0),
(6, 791, 0, 0),
(7, 792, 0, 0),
(8, 793, 0, 0),
(9, 794, 0, 0),
(10, 795, 0, 0),
(13, 796, 0, 0),
(14, 797, 0, 0),
(15, 798, 0, 0),
(16, 799, 0, 0),
(18, 800, 0, 0),
(19, 801, 0, 0),
(20, 802, 0, 0),
(21, 803, 0, 0),
(22, 804, 0, 0),
(23, 805, 0, 0),
(26, 806, 0, 0),
(10, 807, 0, 0),
(2, 808, 0, 0),
(4, 809, 0, 0),
(6, 810, 0, 0),
(7, 811, 0, 0),
(8, 812, 0, 0),
(9, 813, 0, 0),
(10, 814, 0, 0),
(13, 815, 0, 0),
(14, 816, 0, 0),
(15, 817, 0, 0),
(16, 818, 0, 0),
(18, 819, 0, 0),
(19, 820, 0, 0),
(20, 821, 0, 0),
(21, 822, 0, 0),
(22, 823, 0, 0),
(23, 824, 0, 0),
(26, 825, 0, 0),
(2, 826, 0, 0),
(4, 827, 0, 0),
(6, 828, 0, 0),
(7, 829, 0, 0),
(8, 830, 0, 0),
(9, 831, 0, 0),
(10, 832, 0, 0),
(13, 833, 0, 0),
(14, 834, 0, 0),
(15, 835, 0, 0),
(16, 836, 0, 0),
(18, 837, 0, 0),
(19, 838, 0, 0),
(20, 839, 0, 0),
(21, 840, 0, 0),
(22, 841, 0, 0),
(23, 842, 0, 0),
(26, 843, 0, 0),
(20, 844, 0, 0),
(21, 845, 0, 0),
(22, 846, 0, 0),
(23, 847, 0, 0),
(45, 848, 0, 0),
(45, 849, 0, 0),
(50, 850, 0, 0),
(50, 851, 0, 0),
(50, 852, 0, 0),
(50, 853, 0, 0),
(50, 854, 0, 0),
(50, 855, 0, 0),
(50, 856, 0, 0),
(51, 857, 0, 0),
(51, 858, 0, 0),
(51, 859, 0, 0),
(51, 860, 0, 0),
(51, 861, 0, 0),
(51, 862, 0, 0),
(51, 863, 0, 0),
(52, 864, 0, 0),
(52, 865, 0, 0),
(52, 866, 0, 0),
(52, 867, 0, 0),
(52, 868, 0, 0),
(52, 869, 0, 0),
(53, 870, 0, 0),
(53, 871, 0, 0),
(53, 872, 0, 0),
(53, 873, 0, 0),
(53, 874, 0, 0),
(53, 875, 0, 0),
(53, 876, 0, 0),
(54, 877, 0, 0),
(54, 878, 0, 0),
(54, 879, 0, 0),
(54, 880, 0, 0),
(54, 881, 0, 0),
(54, 882, 0, 0),
(54, 883, 0, 0),
(54, 884, 0, 0),
(54, 885, 0, 0),
(54, 886, 0, 0),
(54, 887, 0, 0),
(54, 888, 0, 0),
(54, 889, 0, 0),
(54, 890, 0, 0),
(55, 891, 0, 0),
(55, 892, 0, 0),
(55, 893, 0, 0),
(55, 894, 0, 0),
(55, 895, 0, 0),
(55, 896, 0, 0),
(55, 897, 0, 0),
(55, 898, 0, 0),
(55, 899, 0, 0),
(55, 900, 0, 0),
(55, 901, 0, 0),
(55, 902, 0, 0),
(56, 903, 0, 0),
(56, 904, 0, 0),
(56, 905, 0, 0),
(56, 906, 0, 0),
(56, 907, 0, 0),
(56, 908, 0, 0),
(56, 909, 0, 0),
(56, 910, 0, 0),
(56, 911, 0, 0),
(56, 912, 0, 0),
(56, 913, 0, 0),
(56, 914, 0, 0),
(57, 915, 0, 0),
(57, 916, 0, 0),
(57, 917, 0, 0),
(57, 918, 0, 0),
(57, 919, 0, 0),
(57, 920, 0, 0),
(57, 921, 0, 0),
(57, 922, 0, 0),
(57, 923, 0, 0),
(57, 924, 0, 0),
(57, 925, 0, 0),
(57, 926, 0, 0),
(57, 927, 0, 0),
(57, 928, 0, 0),
(57, 929, 0, 0),
(58, 930, 0, 0),
(58, 931, 0, 0),
(58, 932, 0, 0),
(58, 933, 0, 0),
(58, 934, 0, 0),
(58, 935, 0, 0),
(58, 936, 0, 0),
(58, 937, 0, 0),
(58, 938, 0, 0),
(58, 939, 0, 0),
(58, 940, 0, 0),
(58, 941, 0, 0),
(58, 942, 0, 0),
(58, 943, 0, 0),
(58, 944, 0, 0),
(58, 945, 0, 0),
(58, 946, 0, 0),
(58, 947, 0, 0),
(58, 948, 0, 0),
(58, 949, 0, 0),
(58, 950, 0, 0),
(58, 951, 0, 0),
(59, 952, 0, 0),
(59, 953, 0, 0),
(59, 954, 0, 0),
(59, 955, 0, 0),
(59, 956, 0, 0),
(59, 957, 0, 0),
(59, 958, 0, 0),
(59, 959, 0, 0),
(59, 960, 0, 0),
(59, 961, 0, 0),
(59, 962, 0, 0),
(59, 963, 0, 0),
(59, 964, 0, 0),
(59, 965, 0, 0),
(59, 966, 0, 0),
(59, 967, 0, 0),
(59, 968, 0, 0),
(59, 969, 0, 0),
(59, 970, 0, 0),
(59, 971, 0, 0),
(59, 972, 0, 0),
(59, 973, 0, 0),
(59, 974, 0, 0),
(59, 975, 0, 0),
(59, 976, 0, 0),
(59, 977, 0, 0),
(59, 978, 0, 0),
(59, 979, 0, 0),
(59, 980, 0, 0),
(59, 981, 0, 0),
(60, 982, 0, 0),
(60, 983, 0, 0),
(60, 984, 0, 0),
(60, 985, 0, 0),
(60, 986, 0, 0),
(60, 987, 0, 0),
(60, 988, 0, 0),
(60, 989, 0, 0),
(60, 990, 0, 0),
(60, 991, 0, 0),
(60, 992, 0, 0),
(60, 993, 0, 0),
(60, 994, 0, 0),
(60, 995, 0, 0),
(61, 996, 0, 0),
(61, 997, 0, 0),
(61, 998, 0, 0),
(61, 999, 0, 0),
(61, 1000, 0, 0),
(61, 1001, 0, 0),
(61, 1002, 0, 0),
(61, 1003, 0, 0),
(61, 1004, 0, 0),
(61, 1005, 0, 0),
(61, 1006, 0, 0),
(61, 1007, 0, 0),
(61, 1008, 0, 0),
(61, 1009, 0, 0),
(61, 1010, 0, 0),
(61, 1011, 0, 0),
(61, 1012, 0, 0),
(61, 1013, 0, 0),
(61, 1014, 0, 0),
(61, 1015, 0, 0),
(61, 1016, 0, 0),
(61, 1017, 0, 0),
(61, 1018, 0, 0),
(61, 1019, 0, 0),
(61, 1020, 0, 0),
(61, 1021, 0, 0),
(61, 1022, 0, 0),
(61, 1023, 0, 0),
(61, 1024, 0, 0),
(62, 1025, 0, 0),
(62, 1026, 0, 0),
(62, 1027, 0, 0),
(62, 1028, 0, 0),
(62, 1029, 0, 0),
(62, 1030, 0, 0),
(62, 1031, 0, 0),
(62, 1032, 0, 0),
(62, 1033, 0, 0),
(62, 1034, 0, 0),
(62, 1035, 0, 0),
(62, 1036, 0, 0),
(62, 1037, 0, 0),
(62, 1038, 0, 0),
(62, 1039, 0, 0),
(62, 1040, 0, 0),
(62, 1041, 0, 0),
(62, 1042, 0, 0),
(62, 1043, 0, 0),
(62, 1044, 0, 0),
(62, 1045, 0, 0),
(62, 1046, 0, 0),
(62, 1047, 0, 0),
(62, 1048, 0, 0),
(62, 1049, 0, 0),
(62, 1050, 0, 0),
(62, 1051, 0, 0),
(62, 1052, 0, 0),
(62, 1053, 0, 0),
(62, 1054, 0, 0),
(63, 1055, 0, 0),
(63, 1056, 0, 0),
(63, 1057, 0, 0),
(63, 1058, 0, 0),
(62, 1059, 0, 0),
(62, 1060, 0, 0),
(62, 1061, 0, 0),
(62, 1062, 0, 0),
(62, 1063, 0, 0),
(62, 1064, 0, 0),
(62, 1065, 0, 0),
(62, 1066, 0, 0),
(62, 1067, 0, 0),
(62, 1068, 0, 0),
(62, 1071, 0, 0),
(62, 1072, 0, 0),
(62, 1073, 0, 0),
(62, 1074, 0, 0),
(62, 1075, 0, 0),
(62, 1076, 0, 0),
(62, 1078, 0, 0),
(62, 1082, 0, 0),
(62, 1084, 0, 0),
(63, 1085, 0, 0),
(63, 1086, 0, 0),
(63, 1087, 0, 0),
(63, 1088, 0, 0),
(63, 1089, 0, 0),
(63, 1090, 0, 0),
(63, 1091, 0, 0),
(63, 1092, 0, 0),
(63, 1093, 0, 0),
(63, 1094, 0, 0),
(63, 1095, 0, 0),
(63, 1096, 0, 0),
(63, 1097, 0, 0),
(63, 1098, 0, 0),
(63, 1099, 0, 0),
(63, 1100, 0, 0),
(63, 1101, 0, 0),
(63, 1102, 0, 0),
(63, 1104, 0, 0),
(63, 1106, 0, 0),
(63, 1108, 0, 0),
(63, 1110, 0, 0),
(63, 1112, 0, 0),
(63, 1114, 0, 0),
(63, 1116, 0, 0),
(63, 1120, 0, 0),
(63, 1122, 0, 0),
(63, 1124, 0, 0),
(63, 1136, 0, 0),
(63, 1138, 0, 0),
(63, 1142, 0, 0),
(63, 1144, 0, 0),
(63, 1146, 0, 0),
(63, 1148, 0, 0),
(63, 1150, 0, 0),
(63, 1152, 0, 0),
(63, 1154, 0, 0),
(63, 1156, 0, 0),
(63, 1158, 0, 0),
(63, 1160, 0, 0),
(63, 1162, 0, 0),
(64, 1163, 0, 0),
(64, 1164, 0, 0),
(64, 1165, 0, 0),
(64, 1166, 0, 0),
(64, 1167, 0, 0),
(64, 1168, 0, 0),
(64, 1169, 0, 0),
(64, 1170, 0, 0),
(64, 1171, 0, 0),
(64, 1172, 0, 0),
(64, 1173, 0, 0),
(64, 1174, 0, 0),
(64, 1175, 0, 0),
(64, 1176, 0, 0),
(64, 1177, 0, 0),
(64, 1178, 0, 0),
(64, 1179, 0, 0),
(64, 1180, 0, 0),
(64, 1182, 0, 0),
(64, 1184, 0, 0),
(64, 1186, 0, 0),
(64, 1187, 0, 0),
(64, 1188, 0, 0),
(64, 1189, 0, 0),
(64, 1190, 0, 0),
(64, 1191, 0, 0),
(64, 1192, 0, 0),
(64, 1194, 0, 0),
(64, 1196, 0, 0),
(64, 1198, 0, 0),
(64, 1200, 0, 0),
(65, 1201, 0, 0),
(65, 1202, 0, 0),
(65, 1203, 0, 0),
(65, 1204, 0, 0),
(65, 1205, 0, 0),
(65, 1206, 0, 0),
(65, 1208, 0, 0),
(66, 1209, 0, 0),
(66, 1210, 0, 0),
(66, 1211, 0, 0),
(66, 1212, 0, 0),
(66, 1213, 0, 0),
(66, 1214, 0, 0),
(66, 1216, 0, 0),
(63, 1218, 0, 0),
(63, 1220, 0, 0),
(63, 1222, 0, 0),
(63, 1226, 0, 0),
(67, 1227, 0, 0),
(67, 1228, 0, 0),
(67, 1229, 0, 0),
(67, 1230, 0, 0),
(67, 1231, 0, 0),
(67, 1232, 0, 0),
(67, 1233, 0, 0),
(67, 1234, 0, 0),
(67, 1235, 0, 0),
(67, 1236, 0, 0),
(67, 1237, 0, 0),
(67, 1238, 0, 0),
(67, 1239, 0, 0),
(67, 1240, 0, 0),
(67, 1241, 0, 0),
(67, 1242, 0, 0),
(67, 1243, 0, 0),
(68, 1244, 0, 0),
(68, 1245, 0, 0),
(68, 1246, 0, 0),
(68, 1247, 0, 0),
(68, 1248, 0, 0),
(68, 1249, 0, 0),
(68, 1250, 0, 0),
(26, 1251, 0, 0),
(70, 1255, 0, 0),
(70, 1256, 0, 0),
(70, 1257, 0, 0),
(70, 1258, 0, 0),
(70, 1259, 0, 0),
(70, 1260, 0, 0),
(70, 1261, 0, 0),
(26, 1262, 0, 0),
(71, 1263, 0, 0),
(71, 1264, 0, 0),
(71, 1265, 0, 0),
(71, 1266, 0, 0),
(71, 1267, 0, 0),
(71, 1268, 0, 0),
(71, 1269, 0, 0),
(26, 1270, 0, 0),
(72, 1271, 0, 0),
(72, 1272, 0, 0),
(72, 1273, 0, 0),
(72, 1274, 0, 0),
(72, 1275, 0, 0),
(72, 1276, 0, 0),
(72, 1277, 0, 0),
(72, 1279, 0, 0),
(72, 1281, 0, 0),
(72, 1285, 0, 0),
(72, 1287, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_def_org_share`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_share` (
  `ruleid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `permission` int(19) DEFAULT NULL,
  `editstatus` int(19) DEFAULT NULL,
  PRIMARY KEY (`ruleid`),
  KEY `fk_1_vtiger_def_org_share` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_def_org_share`
--

INSERT INTO `vtiger_def_org_share` (`ruleid`, `tabid`, `permission`, `editstatus`) VALUES
(1, 2, 2, 0),
(2, 4, 2, 0),
(3, 6, 2, 0),
(4, 7, 2, 0),
(5, 9, 3, 1),
(6, 13, 2, 0),
(7, 16, 3, 2),
(8, 20, 2, 0),
(9, 21, 2, 0),
(10, 22, 2, 0),
(11, 23, 2, 0),
(12, 26, 2, 0),
(13, 8, 2, 0),
(14, 14, 2, 0),
(15, 34, 3, 0),
(16, 35, 2, 0),
(17, 36, 2, 0),
(18, 38, 2, 0),
(19, 42, 2, 0),
(20, 43, 2, 0),
(21, 44, 2, 0),
(22, 45, 2, 0),
(23, 47, 2, 0),
(24, 18, 2, 0),
(25, 10, 2, 0),
(26, 50, 2, 0),
(27, 51, 2, 0),
(28, 52, 2, 0),
(29, 53, 2, 0),
(30, 54, 2, 0),
(31, 55, 2, 0),
(32, 56, 2, 0),
(33, 57, 2, 0),
(34, 58, 2, 0),
(35, 59, 2, 0),
(36, 60, 2, 0),
(37, 61, 2, 0),
(38, 62, 2, 0),
(39, 63, 2, 0),
(40, 64, 2, 0),
(41, 65, 2, 0),
(42, 66, 2, 0),
(43, 67, 2, 0),
(44, 68, 2, 0),
(45, 70, 2, 0),
(46, 71, 2, 0),
(47, 72, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_def_org_share_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_def_org_share_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_def_org_share_seq`
--

INSERT INTO `vtiger_def_org_share_seq` (`id`) VALUES
(47);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_durationhrs`
--

CREATE TABLE IF NOT EXISTS `vtiger_durationhrs` (
  `hrsid` int(19) NOT NULL,
  `hrs` varchar(50) DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`hrsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_durationmins`
--

CREATE TABLE IF NOT EXISTS `vtiger_durationmins` (
  `minsid` int(19) NOT NULL,
  `mins` varchar(50) DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`minsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_duration_minutes`
--

CREATE TABLE IF NOT EXISTS `vtiger_duration_minutes` (
  `minutesid` int(19) NOT NULL,
  `duration_minutes` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`minutesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_duration_minutes`
--

INSERT INTO `vtiger_duration_minutes` (`minutesid`, `duration_minutes`, `sortorderid`, `presence`, `color`) VALUES
(1, '00', 0, 1, NULL),
(2, '15', 1, 1, NULL),
(3, '30', 2, 1, NULL),
(4, '45', 3, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_duration_minutes_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_duration_minutes_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_duration_minutes_seq`
--

INSERT INTO `vtiger_duration_minutes_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_emaildetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_emaildetails` (
  `emailid` int(19) NOT NULL,
  `from_email` varchar(50) NOT NULL DEFAULT '',
  `to_email` text DEFAULT NULL,
  `cc_email` text DEFAULT NULL,
  `bcc_email` text DEFAULT NULL,
  `assigned_user_email` varchar(50) NOT NULL DEFAULT '',
  `idlists` text DEFAULT NULL,
  `email_flag` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_emailslookup`
--

CREATE TABLE IF NOT EXISTS `vtiger_emailslookup` (
  `crmid` int(20) DEFAULT NULL,
  `setype` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `fieldid` int(20) DEFAULT NULL,
  UNIQUE KEY `emailslookup_crmid_setype_fieldname_uk` (`crmid`,`setype`,`fieldid`),
  KEY `emailslookup_fieldid_setype_idx` (`fieldid`,`setype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_emailslookup`
--

INSERT INTO `vtiger_emailslookup` (`crmid`, `setype`, `value`, `fieldid`) VALUES
(29, 'Employee', 'ThienLang99999@gmail.com', 999);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_emails_recipientprefs`
--

CREATE TABLE IF NOT EXISTS `vtiger_emails_recipientprefs` (
  `id` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `prefs` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_emailtemplates`
--

CREATE TABLE IF NOT EXISTS `vtiger_emailtemplates` (
  `foldername` varchar(100) DEFAULT NULL,
  `templatename` varchar(100) DEFAULT NULL,
  `templatepath` varchar(100) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `templateid` int(19) NOT NULL,
  `systemtemplate` int(1) NOT NULL DEFAULT 0,
  `module` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`templateid`),
  KEY `emailtemplates_foldernamd_templatename_subject_idx` (`foldername`,`templatename`,`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_emailtemplates`
--

INSERT INTO `vtiger_emailtemplates` (`foldername`, `templatename`, `templatepath`, `subject`, `description`, `body`, `deleted`, `templateid`, `systemtemplate`, `module`) VALUES
('Public', 'Announcement for Release', '', 'Announcement for Release', 'Announcement of a release', 'Hello!   <br />\n	<br />\n	On behalf of the vtiger team,  I am pleased to announce the release of vtiger crm4.2 . This is a feature packed release including the mass email template handling, custom view feature, vtiger_reports feature and a host of other utilities. vtiger runs on all platforms.    <br />\n        <br />\n	Notable Features of vtiger are :   <br />\n	<br />\n	-Email Client Integration    <br />\n	-Trouble Ticket Integration   <br />\n	-Invoice Management Integration   <br />\n	-Reports Integration   <br />\n	-Portal Integration   <br />\n	-Enhanced Word Plugin Support   <br />\n	-Custom View Integration   <br />\n	<br />\n	Known Issues:   <br />\n	-ABCD   <br />\n	-EFGH   <br />\n	-IJKL   <br />\n	-MNOP   <br />\n	-QRST', 0, 1, 0, ''),
('Public', 'Pending Invoices', '', 'Invoices Pending', 'Payment Due', 'name <br />\nstreet, <br />\ncity, <br />\nstate, <br />\n zip) <br />\n  <br />\n Dear <br />\n <br />\n Please check the following invoices that are yet to be paid by you: <br />\n <br />\n No. Date      Amount <br />\n 1   1/1/01    $4000 <br />\n 2   2/2//01   $5000 <br />\n 3   3/3/01    $10000 <br />\n 4   7/4/01    $23560 <br />\n <br />\n Kindly let us know if there are any issues that you feel are pending to be discussed. <br />\n We will be more than happy to give you a call. <br />\n We would like to continue our business with you.', 0, 2, 0, ''),
('Public', 'Acceptance Proposal', '', 'Acceptance Proposal', 'Acceptance of Proposal', ' Dear <br />\n <br />\nYour proposal on the project XYZW has been reviewed by us <br />\nand is acceptable in its entirety. <br />\n <br />\nWe are eagerly looking forward to this project <br />\nand are pleased about having the opportunity to work <br />\ntogether. We look forward to a long standing relationship <br />\nwith your esteemed firm. <br />\n<br />\nI would like to take this opportunity to invite you <br />\nto a game of golf on Wednesday morning 9am at the <br />\nCuff Links Ground. We will be waiting for you in the <br />\nExecutive Lounge. <br />\n<br />\nLooking forward to seeing you there.', 0, 3, 0, ''),
('Public', 'Goods received acknowledgement', '', 'Goods received acknowledgement', 'Acknowledged Receipt of Goods', ' The undersigned hereby acknowledges receipt and delivery of the goods. <br />\nThe undersigned will release the payment subject to the goods being discovered not satisfactory. <br />\n<br />\nSigned under seal this <date>', 0, 4, 0, ''),
('Public', 'Accept Order', '', 'Accept Order', 'Acknowledgement/Acceptance of Order', ' Dear <br />\n         We are in receipt of your order as contained in the <br />\n   purchase order form.We consider this to be final and binding on both sides. <br />\nIf there be any exceptions noted, we shall consider them <br />\nonly if the objection is received within ten days of receipt of <br />\nthis notice. <br />\n <br />\nThank you for your patronage.', 0, 5, 0, ''),
('Public', 'Address Change', '', 'Change of Address', 'Address Change', 'Dear <br />\n <br />\nWe are relocating our office to <br />\n11111,XYZDEF Cross, <br />\nUVWWX Circle <br />\nThe telephone number for this new location is (101) 1212-1328. <br />\n<br />\nOur Manufacturing Division will continue operations <br />\nat 3250 Lovedale Square Avenue, in Frankfurt. <br />\n<br />\nWe hope to keep in touch with you all. <br />\nPlease update your addressbooks.', 0, 6, 0, ''),
('Public', 'Follow Up', '', 'Follow Up', 'Follow Up of meeting', 'Dear <br />\n<br />\nThank you for extending us the opportunity to meet with <br />\nyou and members of your staff. <br />\n<br />\nI know that John Doe serviced your account <br />\nfor many years and made many friends at your firm. He has personally <br />\ndiscussed with me the deep relationship that he had with your firm. <br />\nWhile his presence will be missed, I can promise that we will <br />\ncontinue to provide the fine service that was accorded by <br />\nJohn to your firm. <br />\n<br />\nI was genuinely touched to receive such fine hospitality. <br />\n<br />\nThank you once again.', 0, 7, 0, ''),
('Public', 'Target Crossed!', '', 'Target Crossed!', 'Fantastic Sales Spree!', 'Congratulations! <br />\n<br />\nThe numbers are in and I am proud to inform you that our <br />\ntotal sales for the previous quarter <br />\namounts to $100,000,00.00!. This is the first time <br />\nwe have exceeded the target by almost 30%. <br />\nWe have also beat the previous quarter record by a <br />\nwhopping 75%! <br />\n<br />\nLet us meet at Smoking Joe for a drink in the evening! <br />\n\nC you all there guys!', 0, 8, 0, ''),
('Public', 'Thanks Note', '', 'Thanks Note', 'Note of thanks', 'Dear <br />\n<br />\nThank you for your confidence in our ability to serve you. <br />\nWe are glad to be given the chance to serve you.I look <br />\nforward to establishing a long term partnership with you. <br />\nConsider me as a friend. <br />\nShould any need arise,please do give us a call.', 0, 9, 0, ''),
('Public', 'Customer Login Details', '', 'Customer Portal Login Details', 'Send Portal login details to customer', '<table width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);\">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width=\"50\"> </td>\n            <td>\n            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;\">\n                                <tr>\n                                    <td align=\"center\" rowspan=\"4\">$logo$</td>\n                                    <td align=\"center\"> </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"left\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;\">vtiger CRM<br /> </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"right\" style=\"padding-right: 100px;\">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\">\n                                <tr>\n                                    <td valign=\"top\">\n                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\">\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">Dear $contact_name$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\"> Thank you very much for subscribing to the vtiger CRM - annual support service.<br />Here is your self service portal login details:</td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"center\">\n                                                <table width=\"75%\" cellspacing=\"0\" cellpadding=\"10\" border=\"0\" style=\"border: 2px solid rgb(180, 180, 179); background-color: rgb(226, 226, 225); font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal;\">\n                                                        <tr>\n                                                            <td><br />User ID     : <font color=\"#990000\"><strong> $login_name$</strong></font> </td>\n                                                        </tr>\n                                                        <tr>\n                                                            <td>Password: <font color=\"#990000\"><strong> $password$</strong></font> </td>\n                                                        </tr>\n                                                        <tr>\n                                                            <td align=\"center\"> <strong>  $URL$<br /> </strong> </td>\n                                                        </tr>\n                                                </table>\n                                                </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\"><strong>NOTE:</strong> We suggest you to change your password after logging in first time. <br /><br /> <strong><u>Help Documentation</u></strong><br />  <br /> After logging in to vtiger Self-service Portal first time, you can access the vtiger CRM documents from the <strong>Documents</strong> tab. Following documents are available for your reference:<br />\n                                                <ul>\n                                                    <li>Installation Manual (Windows &amp; Linux OS)<br /> </li>\n                                                    <li>User &amp; Administrator Manual<br /> </li>\n                                                    <li>vtiger Customer Portal - User Manual<br /> </li>\n                                                    <li>vtiger Outlook Plugin - User Manual<br /> </li>\n                                                    <li>vtiger Office Plug-in - User Manual<br /> </li>\n                                                    <li>vtiger Thunderbird Extension - User Manual<br /> </li>\n                                                    <li>vtiger Web Forms - User Manual<br /> </li>\n                                                    <li>vtiger Firefox Tool bar - User Manual<br /> </li>\n                                                </ul>\n                                                <br />  <br /> <strong><u>Knowledge Base</u></strong><br /> <br /> Periodically we update frequently asked question based on our customer experiences. You can access the latest articles from the <strong>FAQ</strong> tab.<br /> <br /> <strong><u>vtiger CRM - Details</u></strong><br /> <br /> Kindly let us know your current vtiger CRM version and system specification so that we can provide you necessary guidelines to enhance your vtiger CRM system performance. Based on your system specification we alert you about the latest security &amp; upgrade patches.<br />  <br />			 Thank you once again and wish you a wonderful experience with vtiger CRM.<br /> </td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\"><br /><br />Best Regards</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">$support_team$ </td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><a style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\" href=\"http://www.vtiger.com\">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width=\"1%\" valign=\"top\"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);\">\n                                <tr>\n                                    <td align=\"center\">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Email Id: <a style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);\" href=\"mailto:support@vtiger.com\">support@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width=\"50\"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 10, 0, ''),
('Public', 'Support end notification before a week', '', 'VtigerCRM Support Notification', 'Send Notification mail to customer before a week of support end date', '<table width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);\">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width=\"50\"> </td>\n            <td>\n            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;\">\n                                <tr>\n                                    <td align=\"center\" rowspan=\"4\">$logo$</td>\n                                    <td align=\"center\"> </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"left\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;\">vtiger CRM </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"right\" style=\"padding-right: 100px;\">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\">\n                                <tr>\n                                    <td valign=\"top\">\n                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\">\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">Dear $contacts-lastname$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">This is just a notification mail regarding your support end.<br /><span style=\"font-weight: bold;\">Priority:</span> Urgent<br />Your Support is going to expire on next week<br />Please contact support@vtiger.com.<br /><br /><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"center\"><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\"><br /><br />Sincerly</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">Support Team </td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><a style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\" href=\"http://www.vtiger.com\">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width=\"1%\" valign=\"top\"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);\">\n                                <tr>\n                                    <td align=\"center\">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Email Id: <a style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);\" href=\"mailto:info@vtiger.com\">info@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width=\"50\"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 11, 0, ''),
('Public', 'Support end notification before a month', '', 'VtigerCRM Support Notification', 'Send Notification mail to customer before a month of support end date', '<table width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; text-decoration: none; background-color: rgb(122, 122, 254);\">\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td width=\"50\"> </td>\n            <td>\n            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(255, 255, 255); font-weight: normal; line-height: 25px;\">\n                                <tr>\n                                    <td align=\"center\" rowspan=\"4\">$logo$</td>\n                                    <td align=\"center\"> </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"left\" style=\"background-color: rgb(27, 77, 140); font-family: Arial,Helvetica,sans-serif; font-size: 24px; color: rgb(255, 255, 255); font-weight: bolder; line-height: 35px;\">vtiger CRM </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"right\" style=\"padding-right: 100px;\">The honest Open Source CRM </td>\n                                </tr>\n                                <tr>\n                                    <td> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: normal; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\">\n                                <tr>\n                                    <td valign=\"top\">\n                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\">\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\"> </td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 14px; color: rgb(22, 72, 134); font-weight: bolder; line-height: 15px;\">Dear $contacts-lastname$, </td>\n                                            </tr>\n                                            <tr>\n                                                <td style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; text-align: justify; line-height: 20px;\">This is just a notification mail regarding your support end.<br /><span style=\"font-weight: bold;\">Priority:</span> Normal<br />Your Support is going to expire on next month.<br />Please contact support@vtiger.com<br /><br /><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"center\"><br /></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><strong style=\"padding: 2px; font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: bold;\"><br /><br />Sincerly</strong></td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); font-weight: normal; line-height: 20px;\">Support Team </td>\n                                            </tr>\n                                            <tr>\n                                                <td align=\"right\"><a href=\"http://www.vtiger.com\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(66, 66, 253);\">www.vtiger.com</a></td>\n                                            </tr>\n                                            <tr>\n                                                <td> </td>\n                                            </tr>\n                                    </table>\n                                    </td>\n                                    <td width=\"1%\" valign=\"top\"> </td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                        <table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(255, 255, 255); font-weight: normal; line-height: 15px; background-color: rgb(51, 51, 51);\">\n                                <tr>\n                                    <td align=\"center\">Shree Narayana Complex, No 11 Sarathy Nagar, Vijaya Nagar , Velachery, Chennai - 600 042 India </td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Telephone No: +91 - 44 - 4202 - 1990     Toll Free No: +1 877 788 4437</td>\n                                </tr>\n                                <tr>\n                                    <td align=\"center\">Email Id: <a href=\"mailto:info@vtiger.com\" style=\"font-family: Arial,Helvetica,sans-serif; font-size: 12px; font-weight: bolder; text-decoration: none; color: rgb(255, 255, 255);\">info@vtiger.com</a></td>\n                                </tr>\n                        </table>\n                        </td>\n                    </tr>\n            </table>\n            </td>\n            <td width=\"50\"> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n        <tr>\n            <td> </td>\n            <td> </td>\n            <td> </td>\n        </tr>\n</table>', 0, 12, 0, ''),
('Public', 'Activity Reminder', NULL, 'Reminder', 'Reminder', '<p>This is a reminder notification for the Activity<br/>The details are :<br/> \n							&nbsp; Subject : $events-subject$<br/> \n							&nbsp; Start Date & Time : $events-date_start$<br/>\n							&nbsp; End Date & Time : $events-due_date$<br/> \n							&nbsp; Status : $events-eventstatus$<br/> \n							&nbsp; Location : $events-location$<br/> \n							&nbsp; Description : $events-description$<br/><br/> \n							<p/>', 0, 14, 1, NULL),
('Public', 'ToDo Reminder', NULL, 'Activity Reminder', 'Reminder', '<p>This is a reminder notification for the Activity<br/>The details are :<br/>\n								&nbsp; Subject : $calendar-subject$<br/>\n								&nbsp; Start Date & Time : $calendar-date_start$<br/>\n								&nbsp; Due Date : $calendar-due_date$<br/>\n								&nbsp; Status : $calendar-status$<br/>\n								&nbsp; Location : $calendar-location$<br/>\n								&nbsp; Description : $calendar-description$<br/><br/>\n								<p/>', 0, 15, 1, NULL),
('Public', 'Invite Users', NULL, 'Invitation', 'Invite Users', '<p>$invitee_name$,<br/><br/>You have been invited for an activity<br/><br/>The details are :<br/>\n								&nbsp; Subject : $events-subject$<br/>\n								&nbsp; Start Date & Time : $events-date_start$<br/> \n								&nbsp; End Date & Time : $events-due_date$<br/>\n								&nbsp; Status : $events-eventstatus$<br/>\n								&nbsp; Priority : $events-priority$<br/>\n								&nbsp; Related To : $events-crmid$<br/>\n								&nbsp; Contact List : $events-contactid$<br/>\n								&nbsp; Location : $events-location$<br/>\n								&nbsp; Description : $events-description$<br/><br/>\n								Thanks & Regards,<br/>\n								$current_user_name$\n								<p/>', 0, 16, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_emailtemplates_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_emailtemplates_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_emailtemplates_seq`
--

INSERT INTO `vtiger_emailtemplates_seq` (`id`) VALUES
(16);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_email_access`
--

CREATE TABLE IF NOT EXISTS `vtiger_email_access` (
  `crmid` int(11) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `accessdate` date DEFAULT NULL,
  `accesstime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_email_track`
--

CREATE TABLE IF NOT EXISTS `vtiger_email_track` (
  `crmid` int(11) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `access_count` int(11) DEFAULT NULL,
  `click_count` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `link_tabidtype_idx` (`crmid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_employ_gender`
--

CREATE TABLE IF NOT EXISTS `vtiger_employ_gender` (
  `employ_genderid` int(11) NOT NULL,
  `employ_gender` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`employ_genderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_employ_gender`
--

INSERT INTO `vtiger_employ_gender` (`employ_genderid`, `employ_gender`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Mr.', 1, 370, 1, NULL),
(2, 'Ms.', 1, 371, 2, NULL),
(3, 'Mrs.', 1, 372, 3, NULL),
(4, 'Dr.', 1, 373, 4, NULL),
(5, 'Prof.', 1, 374, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_employ_gender_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_employ_gender_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_employ_gender_seq`
--

INSERT INTO `vtiger_employ_gender_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_employ_marital_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_employ_marital_status` (
  `employ_marital_statusid` int(11) NOT NULL,
  `employ_marital_status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`employ_marital_statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_employ_marital_status`
--

INSERT INTO `vtiger_employ_marital_status` (`employ_marital_statusid`, `employ_marital_status`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Married', 1, 375, 1, NULL),
(2, 'Single', 1, 376, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_employ_marital_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_employ_marital_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_employ_marital_status_seq`
--

INSERT INTO `vtiger_employ_marital_status_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_entityname`
--

CREATE TABLE IF NOT EXISTS `vtiger_entityname` (
  `tabid` int(19) NOT NULL DEFAULT 0,
  `modulename` varchar(100) DEFAULT NULL,
  `tablename` varchar(100) NOT NULL,
  `fieldname` varchar(150) NOT NULL,
  `entityidfield` varchar(150) NOT NULL,
  `entityidcolumn` varchar(150) NOT NULL,
  PRIMARY KEY (`tabid`),
  KEY `entityname_tabid_idx` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_entityname`
--

INSERT INTO `vtiger_entityname` (`tabid`, `modulename`, `tablename`, `fieldname`, `entityidfield`, `entityidcolumn`) VALUES
(2, 'Potentials', 'vtiger_potential', 'potentialname', 'potentialid', 'potential_id'),
(4, 'Contacts', 'vtiger_contactdetails', 'firstname,lastname', 'contactid', 'contact_id'),
(6, 'Accounts', 'vtiger_account', 'accountname', 'accountid', 'account_id'),
(7, 'Leads', 'vtiger_leaddetails', 'firstname,lastname', 'leadid', 'leadid'),
(8, 'Documents', 'vtiger_notes', 'title', 'notesid', 'notesid'),
(9, 'Calendar', 'vtiger_activity', 'subject', 'activityid', 'activityid'),
(10, 'Emails', 'vtiger_activity', 'subject', 'activityid', 'activityid'),
(13, 'HelpDesk', 'vtiger_troubletickets', 'title', 'ticketid', 'ticketid'),
(14, 'Products', 'vtiger_products', 'productname', 'productid', 'product_id'),
(15, 'Faq', 'vtiger_faq', 'question', 'id', 'id'),
(18, 'Vendors', 'vtiger_vendor', 'vendorname', 'vendorid', 'vendor_id'),
(19, 'PriceBooks', 'vtiger_pricebook', 'bookname', 'pricebookid', 'pricebookid'),
(20, 'Quotes', 'vtiger_quotes', 'subject', 'quoteid', 'quote_id'),
(21, 'PurchaseOrder', 'vtiger_purchaseorder', 'subject', 'purchaseorderid', 'purchaseorderid'),
(22, 'SalesOrder', 'vtiger_salesorder', 'subject', 'salesorderid', 'salesorder_id'),
(23, 'Invoice', 'vtiger_invoice', 'subject', 'invoiceid', 'invoiceid'),
(26, 'Campaigns', 'vtiger_campaign', 'campaignname', 'campaignid', 'campaignid'),
(29, 'Users', 'vtiger_users', 'first_name,last_name', 'id', 'id'),
(34, 'PBXManager', 'vtiger_pbxmanager', 'customernumber', 'pbxmanagerid', 'pbxmanagerid'),
(35, 'ServiceContracts', 'vtiger_servicecontracts', 'subject', 'servicecontractsid', 'servicecontractsid'),
(36, 'Services', 'vtiger_service', 'servicename', 'serviceid', 'serviceid'),
(38, 'Assets', 'vtiger_assets', 'assetname', 'assetsid', 'assetsid'),
(42, 'ModComments', 'vtiger_modcomments', 'commentcontent', 'modcommentsid', 'modcommentsid'),
(43, 'ProjectMilestone', 'vtiger_projectmilestone', 'projectmilestonename', 'projectmilestoneid', 'projectmilestoneid'),
(44, 'ProjectTask', 'vtiger_projecttask', 'projecttaskname', 'projecttaskid', 'projecttaskid'),
(45, 'Project', 'vtiger_project', 'projectname', 'projectid', 'projectid'),
(47, 'SMSNotifier', 'vtiger_smsnotifier', 'message', 'smsnotifierid', 'smsnotifierid'),
(50, 'SettingHrm', 'vtiger_hrm_setting', 'name', 'id', 'id'),
(51, 'SettingPosition', 'vtiger_hrm_position', 'name', 'id', 'id'),
(52, 'SettingWeight', 'vtiger_hrm_weight', 'weight', 'id', 'id'),
(53, 'SalaryComponent', 'vtiger_hrm_settingdepartment', 'name', 'id', 'id'),
(55, 'Rating', 'vtiger_hrm_rating', 'task_name', 'id', 'id'),
(56, 'JD', 'vtiger_hrm_jd', 'name', 'id', 'id'),
(57, 'QCM', 'vtiger_hrm_qcm', 'qcm_title', 'qcmid', 'qcmid'),
(58, 'KPI', 'vtiger_hrm_kpi', 'kpi_name', 'id', 'id'),
(59, 'Candidates', 'vtiger_hrm_candidate', 'lastname', 'id', 'id'),
(61, 'Employee', 'vtiger_hrm_employee', 'lastname', 'employid', 'employid'),
(63, 'CustomerEnterprise', 'vtiger_customerenterprise', 'makhachhang', 'customerenterpriseid', 'customerenterpriseid'),
(64, 'CustomerStandalone', 'vtiger_customerstandalone', 'makhachhang', 'customerstandaloneid', 'customerstandaloneid'),
(65, 'ProblemCategory', 'vtiger_problemcategory', 'loaivande', 'problemcategoryid', 'problemcategoryid'),
(66, 'SupportProtocol', 'vtiger_supportprotocol', 'hinhthuchotro', 'supportprotocolid', 'supportprotocolid'),
(70, 'PhuongTienTruyenThong', 'vtiger_phuongtientruyenthong', 'pttt', 'phuongtientruyenthongid', 'phuongtientruyenthongid'),
(71, 'HinhThucTruyenThong', 'vtiger_hinhthuctruyenthong', 'httt', 'hinhthuctruyenthongid', 'hinhthuctruyenthongid'),
(72, 'QuyTrinhBanHang', 'vtiger_quytrinhbanhang', 'tenquytrinh', 'quytrinhbanhangid', 'quytrinhbanhangid');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventhandlers`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandlers` (
  `eventhandler_id` int(11) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `handler_path` varchar(400) NOT NULL,
  `handler_class` varchar(100) NOT NULL,
  `cond` text DEFAULT NULL,
  `is_active` int(1) NOT NULL,
  `dependent_on` varchar(255) DEFAULT '[]',
  PRIMARY KEY (`eventhandler_id`,`event_name`,`handler_class`),
  UNIQUE KEY `eventhandler_idx` (`eventhandler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventhandlers`
--

INSERT INTO `vtiger_eventhandlers` (`eventhandler_id`, `event_name`, `handler_path`, `handler_class`, `cond`, `is_active`, `dependent_on`) VALUES
(1, 'vtiger.entity.aftersave', 'modules/SalesOrder/RecurringInvoiceHandler.php', 'RecurringInvoiceHandler', '', 1, '[]'),
(2, 'vtiger.entity.beforesave', 'data/VTEntityDelta.php', 'VTEntityDelta', '', 1, '[]'),
(3, 'vtiger.entity.aftersave', 'data/VTEntityDelta.php', 'VTEntityDelta', '', 1, '[]'),
(4, 'vtiger.entity.aftersave', 'modules/com_vtiger_workflow/VTEventHandler.inc', 'VTWorkflowEventHandler', '', 1, '[\"VTEntityDelta\"]'),
(5, 'vtiger.entity.afterrestore', 'modules/com_vtiger_workflow/VTEventHandler.inc', 'VTWorkflowEventHandler', '', 1, '[]'),
(6, 'vtiger.entity.aftersave.final', 'modules/HelpDesk/HelpDeskHandler.php', 'HelpDeskHandler', '', 1, '[]'),
(7, 'vtiger.entity.aftersave.final', 'modules/ModTracker/ModTrackerHandler.php', 'ModTrackerHandler', '', 1, '[]'),
(8, 'vtiger.entity.beforedelete', 'modules/ModTracker/ModTrackerHandler.php', 'ModTrackerHandler', '', 1, '[]'),
(9, 'vtiger.entity.afterrestore', 'modules/ModTracker/ModTrackerHandler.php', 'ModTrackerHandler', '', 1, '[]'),
(16, 'vtiger.entity.beforesave', 'modules/ServiceContracts/ServiceContractsHandler.php', 'ServiceContractsHandler', '', 0, '[]'),
(17, 'vtiger.entity.aftersave', 'modules/ServiceContracts/ServiceContractsHandler.php', 'ServiceContractsHandler', '', 0, '[]'),
(18, 'vtiger.entity.aftersave', 'modules/WSAPP/WorkFlowHandlers/WSAPPAssignToTracker.php', 'WSAPPAssignToTracker', '', 1, '[\"VTEntityDelta\"]'),
(19, 'vtiger.entity.aftersave', 'modules/Vtiger/handlers/RecordLabelUpdater.php', 'Vtiger_RecordLabelUpdater_Handler', '', 1, '[]'),
(20, 'vtiger.entity.aftersave', 'modules/Invoice/InvoiceHandler.php', 'InvoiceHandler', '', 1, '[]'),
(21, 'vtiger.entity.aftersave', 'modules/PurchaseOrder/PurchaseOrderHandler.php', 'PurchaseOrderHandler', '', 1, '[]'),
(22, 'vtiger.entity.aftersave', 'modules/ModComments/ModCommentsHandler.php', 'ModCommentsHandler', '', 1, '[]'),
(23, 'vtiger.picklist.afterrename', 'modules/Settings/Picklist/handlers/PickListHandler.php', 'PickListHandler', '', 1, '[]'),
(24, 'vtiger.picklist.afterdelete', 'modules/Settings/Picklist/handlers/PickListHandler.php', 'PickListHandler', '', 1, '[]'),
(25, 'vtiger.entity.aftersave', 'modules/Vtiger/handlers/EmailLookupHandler.php', 'EmailLookupHandler', '', 1, '[\"VTEntityDelta\"]'),
(26, 'vtiger.entity.afterdelete', 'modules/Vtiger/handlers/EmailLookupHandler.php', 'EmailLookupHandler', '', 1, '[]'),
(27, 'vtiger.entity.afterrestore', 'modules/Vtiger/handlers/EmailLookupHandler.php', 'EmailLookupHandler', '', 1, '[]'),
(28, 'vtiger.batchevent.save', 'modules/Vtiger/handlers/EmailLookupHandler.php', 'EmailLookupBatchHandler', '', 1, '[]'),
(29, 'vtiger.lead.convertlead', 'modules/Leads/handlers/LeadHandler.php', 'LeadHandler', '', 1, '[]'),
(30, 'vtiger.entity.beforesave', 'modules/Vtiger/handlers/CheckDuplicateHandler.php', 'CheckDuplicateHandler', '', 1, '[]'),
(31, 'vtiger.entity.beforerestore', 'modules/Vtiger/handlers/CheckDuplicateHandler.php', 'CheckDuplicateHandler', '', 1, '[]'),
(32, 'vtiger.entity.aftersave', 'modules/Vtiger/handlers/FollowRecordHandler.php', 'FollowRecordHandler', '', 1, '[]'),
(33, 'vtiger.entity.aftersave.final', 'modules/Rating/RatingHandler.php', 'RatingHandler', '', 1, '[]'),
(34, 'vtiger.entity.aftersave.final', 'modules/KPI/KPIHandler.php', 'KPIHandler', '', 1, '[]'),
(35, 'vtiger.entity.aftersave', 'modules/Candidates/CandidatesHandler.php', 'CandidatesHandler', '', 1, '[]'),
(36, 'vtiger.entity.aftersave', 'modules/Leave/LeaveHandler.php', 'LeaveHandler', '', 1, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventhandlers_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandlers_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventhandlers_seq`
--

INSERT INTO `vtiger_eventhandlers_seq` (`id`) VALUES
(42);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventhandler_module`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandler_module` (
  `eventhandler_module_id` int(11) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `handler_class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eventhandler_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventhandler_module`
--

INSERT INTO `vtiger_eventhandler_module` (`eventhandler_module_id`, `module_name`, `handler_class`) VALUES
(1, 'ModTracker', 'ModTrackerHandler'),
(2, 'ServiceContracts', 'ServiceContractsHandler'),
(3, 'Home', 'Vtiger_RecordLabelUpdater_Handler'),
(4, 'Invoice', 'InvoiceHandler'),
(5, 'PurchaseOrder', 'PurchaseOrderHandler'),
(6, 'Rating', 'RatingHandler'),
(7, 'KPI', 'KPIHandler'),
(8, 'Candidates', 'CandidatesHandler'),
(9, 'Leave', 'LeaveHandler');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventhandler_module_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventhandler_module_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventhandler_module_seq`
--

INSERT INTO `vtiger_eventhandler_module_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventstatus` (
  `eventstatusid` int(19) NOT NULL,
  `eventstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eventstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventstatus`
--

INSERT INTO `vtiger_eventstatus` (`eventstatusid`, `eventstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Planned', 0, 38, 0, NULL),
(2, 'Held', 0, 39, 1, NULL),
(3, 'Not Held', 0, 40, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_eventstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_eventstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_eventstatus_seq`
--

INSERT INTO `vtiger_eventstatus_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_expectedresponse`
--

CREATE TABLE IF NOT EXISTS `vtiger_expectedresponse` (
  `expectedresponseid` int(19) NOT NULL,
  `expectedresponse` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`expectedresponseid`),
  UNIQUE KEY `CampaignExpRes_UK01` (`expectedresponse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_expectedresponse`
--

INSERT INTO `vtiger_expectedresponse` (`expectedresponseid`, `expectedresponse`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Excellent', 1, 42, 1, NULL),
(3, 'Good', 1, 43, 2, NULL),
(4, 'Average', 1, 44, 3, NULL),
(5, 'Poor', 1, 45, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_expectedresponse_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_expectedresponse_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_expectedresponse_seq`
--

INSERT INTO `vtiger_expectedresponse_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_extnstore_users`
--

CREATE TABLE IF NOT EXISTS `vtiger_extnstore_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(75) DEFAULT NULL,
  `instanceurl` varchar(255) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faq` (
  `id` int(11) NOT NULL,
  `faq_no` varchar(100) NOT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `category` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faq_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqcategories`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcategories` (
  `faqcategories_id` int(19) NOT NULL,
  `faqcategories` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`faqcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_faqcategories`
--

INSERT INTO `vtiger_faqcategories` (`faqcategories_id`, `faqcategories`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'General', 1, 46, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqcategories_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcategories_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_faqcategories_seq`
--

INSERT INTO `vtiger_faqcategories_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcf` (
  `faqid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`faqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqcomments` (
  `commentid` int(19) NOT NULL,
  `faqid` int(19) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `faqcomments_faqid_idx` (`faqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqstatus` (
  `faqstatus_id` int(19) NOT NULL,
  `faqstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`faqstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_faqstatus`
--

INSERT INTO `vtiger_faqstatus` (`faqstatus_id`, `faqstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Draft', 0, 47, 0, NULL),
(2, 'Reviewed', 0, 48, 1, NULL),
(3, 'Published', 0, 49, 2, NULL),
(4, 'Obsolete', 0, 50, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_faqstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_faqstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_faqstatus_seq`
--

INSERT INTO `vtiger_faqstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_feedback`
--

CREATE TABLE IF NOT EXISTS `vtiger_feedback` (
  `userid` int(19) DEFAULT NULL,
  `dontshow` varchar(19) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_field` (
  `tabid` int(19) NOT NULL,
  `fieldid` int(19) NOT NULL,
  `columnname` varchar(30) NOT NULL,
  `tablename` varchar(100) DEFAULT NULL,
  `generatedtype` int(19) NOT NULL DEFAULT 0,
  `uitype` varchar(30) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `fieldlabel` varchar(50) NOT NULL,
  `readonly` int(1) NOT NULL,
  `presence` int(19) NOT NULL DEFAULT 1,
  `defaultvalue` text DEFAULT NULL,
  `maximumlength` int(19) DEFAULT NULL,
  `sequence` int(19) DEFAULT NULL,
  `block` int(19) DEFAULT NULL,
  `displaytype` int(19) DEFAULT NULL,
  `typeofdata` varchar(100) DEFAULT NULL,
  `quickcreate` int(10) NOT NULL DEFAULT 1,
  `quickcreatesequence` int(19) DEFAULT NULL,
  `info_type` varchar(20) DEFAULT NULL,
  `masseditable` int(10) NOT NULL DEFAULT 1,
  `helpinfo` text DEFAULT NULL,
  `summaryfield` int(10) NOT NULL DEFAULT 0,
  `headerfield` int(1) DEFAULT 0,
  `isunique` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`fieldid`),
  KEY `field_tabid_idx` (`tabid`),
  KEY `field_fieldname_idx` (`fieldname`),
  KEY `field_block_idx` (`block`),
  KEY `field_displaytype_idx` (`displaytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_field`
--

INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`, `summaryfield`, `headerfield`, `isunique`) VALUES
(6, 1, 'accountname', 'vtiger_account', 1, '2', 'accountname', 'Account Name', 1, 0, '', 100, 1, 9, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 1),
(6, 2, 'account_no', 'vtiger_account', 1, '4', 'account_no', 'Account No', 1, 0, '', 100, 2, 9, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(6, 3, 'phone', 'vtiger_account', 1, '11', 'phone', 'Phone', 1, 2, '', 100, 4, 9, 1, 'V~O', 2, 2, 'BAS', 1, NULL, 0, 1, 0),
(6, 4, 'website', 'vtiger_account', 1, '17', 'website', 'Website', 1, 2, '', 100, 3, 9, 1, 'V~O', 2, 3, 'BAS', 1, NULL, 0, 1, 0),
(6, 5, 'fax', 'vtiger_account', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 6, 9, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 6, 'tickersymbol', 'vtiger_account', 1, '1', 'tickersymbol', 'Ticker Symbol', 1, 2, '', 100, 5, 9, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 7, 'otherphone', 'vtiger_account', 1, '11', 'otherphone', 'Other Phone', 1, 2, '', 100, 8, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 8, 'parentid', 'vtiger_account', 1, '51', 'account_id', 'Member Of', 1, 2, '', 100, 7, 9, 1, 'I~O', 1, NULL, 'BAS', 0, NULL, 0, 0, 0),
(6, 9, 'email1', 'vtiger_account', 1, '13', 'email1', 'Email', 1, 2, '', 100, 10, 9, 1, 'E~O', 1, NULL, 'BAS', 1, NULL, 0, 1, 0),
(6, 10, 'employees', 'vtiger_account', 1, '7', 'employees', 'Employees', 1, 2, '', 100, 9, 9, 1, 'I~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 11, 'email2', 'vtiger_account', 1, '13', 'email2', 'Other Email', 1, 2, '', 100, 11, 9, 1, 'E~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 12, 'ownership', 'vtiger_account', 1, '1', 'ownership', 'Ownership', 1, 2, '', 100, 12, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 13, 'rating', 'vtiger_account', 1, '15', 'rating', 'Rating', 1, 2, '', 100, 14, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 14, 'industry', 'vtiger_account', 1, '15', 'industry', 'industry', 1, 2, '', 100, 13, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 15, 'siccode', 'vtiger_account', 1, '1', 'siccode', 'SIC Code', 1, 2, '', 100, 16, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 16, 'account_type', 'vtiger_account', 1, '15', 'accounttype', 'Type', 1, 2, '', 100, 15, 9, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 17, 'annualrevenue', 'vtiger_account', 1, '71', 'annual_revenue', 'Annual Revenue', 1, 2, '', 100, 18, 9, 1, 'N~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 18, 'emailoptout', 'vtiger_account', 1, '56', 'emailoptout', 'Email Opt Out', 1, 0, '', 100, 17, 9, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 19, 'notify_owner', 'vtiger_account', 1, '56', 'notify_owner', 'Notify Owner', 1, 2, '', 10, 20, 9, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(6, 20, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 19, 9, 1, 'V~M', 0, 4, 'BAS', 1, NULL, 1, 0, 0),
(6, 21, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 22, 9, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(6, 22, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 21, 9, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(6, 23, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 23, 9, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(6, 24, 'bill_street', 'vtiger_accountbillads', 1, '21', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 25, 'ship_street', 'vtiger_accountshipads', 1, '21', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 26, 'bill_city', 'vtiger_accountbillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(6, 27, 'ship_city', 'vtiger_accountshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 28, 'bill_state', 'vtiger_accountbillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 29, 'ship_state', 'vtiger_accountshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 30, 'bill_code', 'vtiger_accountbillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 31, 'ship_code', 'vtiger_accountshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 32, 'bill_country', 'vtiger_accountbillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(6, 33, 'ship_country', 'vtiger_accountshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 34, 'bill_pobox', 'vtiger_accountbillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 35, 'ship_pobox', 'vtiger_accountshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 11, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(6, 36, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 12, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 37, 'salutation', 'vtiger_leaddetails', 1, '55', 'salutationtype', 'Salutation', 1, 0, '', 100, 1, 13, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 38, 'firstname', 'vtiger_leaddetails', 1, '55', 'firstname', 'First Name', 1, 0, '', 100, 2, 13, 1, 'V~O', 2, 1, 'BAS', 1, NULL, 1, 0, 0),
(7, 39, 'lead_no', 'vtiger_leaddetails', 1, '4', 'lead_no', 'Lead No', 1, 0, '', 100, 3, 13, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(7, 40, 'phone', 'vtiger_leadaddress', 1, '11', 'phone', 'Phone', 1, 2, '', 100, 5, 13, 1, 'V~O', 2, 4, 'BAS', 1, NULL, 0, 1, 0),
(7, 41, 'lastname', 'vtiger_leaddetails', 1, '255', 'lastname', 'Last Name', 1, 0, '', 100, 4, 13, 1, 'V~M', 0, 2, 'BAS', 1, NULL, 1, 0, 0),
(7, 42, 'mobile', 'vtiger_leadaddress', 1, '11', 'mobile', 'Mobile', 1, 2, '', 100, 7, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 43, 'company', 'vtiger_leaddetails', 1, '2', 'company', 'Company', 1, 2, '', 100, 6, 13, 1, 'V~O', 2, 3, 'BAS', 1, NULL, 1, 0, 0),
(7, 44, 'fax', 'vtiger_leadaddress', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 9, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 45, 'designation', 'vtiger_leaddetails', 1, '1', 'designation', 'Designation', 1, 2, '', 100, 8, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 46, 'email', 'vtiger_leaddetails', 1, '13', 'email', 'Email', 1, 2, '', 100, 11, 13, 1, 'E~O', 2, 5, 'BAS', 1, NULL, 0, 1, 0),
(7, 47, 'leadsource', 'vtiger_leaddetails', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 10, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(7, 48, 'website', 'vtiger_leadsubdetails', 1, '17', 'website', 'Website', 1, 2, '', 100, 13, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 1, 0, 0),
(7, 49, 'industry', 'vtiger_leaddetails', 1, '15', 'industry', 'Industry', 1, 2, '', 100, 12, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(7, 50, 'leadstatus', 'vtiger_leaddetails', 1, '15', 'leadstatus', 'Lead Status', 1, 2, '', 100, 15, 13, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 51, 'annualrevenue', 'vtiger_leaddetails', 1, '71', 'annualrevenue', 'Annual Revenue', 1, 2, '', 100, 14, 13, 1, 'N~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(7, 52, 'rating', 'vtiger_leaddetails', 1, '15', 'rating', 'Rating', 1, 2, '', 100, 17, 13, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(7, 53, 'noofemployees', 'vtiger_leaddetails', 1, '1', 'noofemployees', 'No Of Employees', 1, 2, '', 100, 16, 13, 1, 'I~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(7, 54, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 19, 13, 1, 'V~M', 0, 6, 'BAS', 1, NULL, 1, 0, 0),
(7, 55, 'secondaryemail', 'vtiger_leaddetails', 1, '13', 'secondaryemail', 'Secondary Email', 1, 2, '', 100, 18, 13, 1, 'E~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(7, 56, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 21, 13, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(7, 57, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 20, 13, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(7, 58, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 23, 13, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(7, 59, 'lane', 'vtiger_leadaddress', 1, '21', 'lane', 'Street', 1, 2, '', 100, 1, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 60, 'code', 'vtiger_leadaddress', 1, '1', 'code', 'Postal Code', 1, 2, '', 100, 3, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 61, 'city', 'vtiger_leadaddress', 1, '1', 'city', 'City', 1, 2, '', 100, 4, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(7, 62, 'country', 'vtiger_leadaddress', 1, '1', 'country', 'Country', 1, 2, '', 100, 5, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(7, 63, 'state', 'vtiger_leadaddress', 1, '1', 'state', 'State', 1, 2, '', 100, 6, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 64, 'pobox', 'vtiger_leadaddress', 1, '1', 'pobox', 'Po Box', 1, 2, '', 100, 2, 15, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(7, 65, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 16, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 66, 'salutation', 'vtiger_contactdetails', 1, '55', 'salutationtype', 'Salutation', 1, 0, '', 100, 1, 4, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 67, 'firstname', 'vtiger_contactdetails', 1, '55', 'firstname', 'First Name', 1, 0, '', 100, 2, 4, 1, 'V~O', 2, 1, 'BAS', 1, NULL, 1, 0, 0),
(4, 68, 'contact_no', 'vtiger_contactdetails', 1, '4', 'contact_no', 'Contact Id', 1, 0, '', 100, 3, 4, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(4, 69, 'phone', 'vtiger_contactdetails', 1, '11', 'phone', 'Office Phone', 1, 2, '', 100, 5, 4, 1, 'V~O', 2, 4, 'BAS', 1, NULL, 0, 1, 0),
(4, 70, 'lastname', 'vtiger_contactdetails', 1, '255', 'lastname', 'Last Name', 1, 0, '', 100, 4, 4, 1, 'V~M', 0, 2, 'BAS', 1, NULL, 1, 0, 0),
(4, 71, 'mobile', 'vtiger_contactdetails', 1, '11', 'mobile', 'Mobile', 1, 2, '', 100, 7, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 72, 'accountid', 'vtiger_contactdetails', 1, '51', 'account_id', 'Account Name', 1, 0, '', 100, 6, 4, 1, 'I~O', 2, 3, 'BAS', 1, NULL, 1, 0, 0),
(4, 73, 'homephone', 'vtiger_contactsubdetails', 1, '11', 'homephone', 'Home Phone', 1, 2, '', 100, 9, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 74, 'leadsource', 'vtiger_contactsubdetails', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 8, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 75, 'otherphone', 'vtiger_contactsubdetails', 1, '11', 'otherphone', 'Other Phone', 1, 2, '', 100, 11, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 76, 'title', 'vtiger_contactdetails', 1, '1', 'title', 'Title', 1, 2, '', 100, 10, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(4, 77, 'fax', 'vtiger_contactdetails', 1, '11', 'fax', 'Fax', 1, 2, '', 100, 13, 4, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 78, 'department', 'vtiger_contactdetails', 1, '1', 'department', 'Department', 1, 2, '', 100, 12, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 79, 'birthday', 'vtiger_contactsubdetails', 1, '5', 'birthday', 'Birthdate', 1, 2, '', 100, 16, 4, 1, 'D~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 80, 'email', 'vtiger_contactdetails', 1, '13', 'email', 'Email', 1, 2, '', 100, 15, 4, 1, 'E~O', 2, 5, 'BAS', 1, NULL, 0, 1, 0),
(4, 81, 'reportsto', 'vtiger_contactdetails', 1, '57', 'contact_id', 'Reports To', 1, 2, '', 100, 18, 4, 1, 'V~O', 1, NULL, 'ADV', 0, NULL, 0, 0, 0),
(4, 82, 'assistant', 'vtiger_contactsubdetails', 1, '1', 'assistant', 'Assistant', 1, 2, '', 100, 17, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 83, 'secondaryemail', 'vtiger_contactdetails', 1, '13', 'secondaryemail', 'Secondary Email', 1, 2, '', 100, 20, 4, 1, 'E~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 84, 'assistantphone', 'vtiger_contactsubdetails', 1, '11', 'assistantphone', 'Assistant Phone', 1, 2, '', 100, 19, 4, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 85, 'donotcall', 'vtiger_contactdetails', 1, '56', 'donotcall', 'Do Not Call', 1, 2, '', 100, 22, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 86, 'emailoptout', 'vtiger_contactdetails', 1, '56', 'emailoptout', 'Email Opt Out', 1, 0, '', 100, 21, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 87, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 24, 4, 1, 'V~M', 0, 6, 'BAS', 1, NULL, 1, 0, 0),
(4, 88, 'reference', 'vtiger_contactdetails', 1, '56', 'reference', 'Reference', 1, 2, '', 10, 23, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 89, 'notify_owner', 'vtiger_contactdetails', 1, '56', 'notify_owner', 'Notify Owner', 1, 2, '', 10, 26, 4, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 90, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 25, 4, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(4, 91, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 27, 4, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(4, 92, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 28, 4, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(4, 93, 'portal', 'vtiger_customerdetails', 1, '56', 'portal', 'Portal User', 1, 2, '', 100, 1, 6, 1, 'C~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 94, 'support_start_date', 'vtiger_customerdetails', 1, '5', 'support_start_date', 'Support Start Date', 1, 2, '', 100, 2, 6, 1, 'D~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 95, 'support_end_date', 'vtiger_customerdetails', 1, '5', 'support_end_date', 'Support End Date', 1, 2, '', 100, 3, 6, 1, 'D~O~OTH~GE~support_start_date~Support Start Date', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(4, 96, 'mailingstreet', 'vtiger_contactaddress', 1, '21', 'mailingstreet', 'Mailing Street', 1, 2, '', 100, 1, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 97, 'otherstreet', 'vtiger_contactaddress', 1, '21', 'otherstreet', 'Other Street', 1, 2, '', 100, 2, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 98, 'mailingcity', 'vtiger_contactaddress', 1, '1', 'mailingcity', 'Mailing City', 1, 2, '', 100, 5, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(4, 99, 'othercity', 'vtiger_contactaddress', 1, '1', 'othercity', 'Other City', 1, 2, '', 100, 6, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 100, 'mailingstate', 'vtiger_contactaddress', 1, '1', 'mailingstate', 'Mailing State', 1, 2, '', 100, 7, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 101, 'otherstate', 'vtiger_contactaddress', 1, '1', 'otherstate', 'Other State', 1, 2, '', 100, 8, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 102, 'mailingzip', 'vtiger_contactaddress', 1, '1', 'mailingzip', 'Mailing Zip', 1, 2, '', 100, 9, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 103, 'otherzip', 'vtiger_contactaddress', 1, '1', 'otherzip', 'Other Zip', 1, 2, '', 100, 10, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 104, 'mailingcountry', 'vtiger_contactaddress', 1, '1', 'mailingcountry', 'Mailing Country', 1, 2, '', 100, 11, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(4, 105, 'othercountry', 'vtiger_contactaddress', 1, '1', 'othercountry', 'Other Country', 1, 2, '', 100, 12, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 106, 'mailingpobox', 'vtiger_contactaddress', 1, '1', 'mailingpobox', 'Mailing Po Box', 1, 2, '', 100, 3, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 107, 'otherpobox', 'vtiger_contactaddress', 1, '1', 'otherpobox', 'Other Po Box', 1, 2, '', 100, 4, 7, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 108, 'imagename', 'vtiger_contactdetails', 1, '69', 'imagename', 'Contact Image', 1, 2, '', 100, 1, 73, 1, 'V~O', 3, NULL, 'ADV', 0, NULL, 0, 0, 0),
(4, 109, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 8, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(2, 110, 'potentialname', 'vtiger_potential', 1, '2', 'potentialname', 'Potential Name', 1, 0, '', 100, 1, 1, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(2, 111, 'potential_no', 'vtiger_potential', 1, '4', 'potential_no', 'Potential No', 1, 0, '', 100, 2, 1, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(2, 112, 'amount', 'vtiger_potential', 1, '71', 'amount', 'Amount', 1, 2, '', 100, 5, 1, 1, 'N~O', 2, 5, 'BAS', 1, NULL, 0, 1, 0),
(2, 113, 'related_to', 'vtiger_potential', 1, '10', 'related_to', 'Related To', 1, 0, '', 100, 3, 1, 1, 'V~O', 0, 2, 'BAS', 1, NULL, 0, 1, 0),
(2, 114, 'closingdate', 'vtiger_potential', 1, '23', 'closingdate', 'Expected Close Date', 1, 2, '', 100, 8, 1, 1, 'D~M', 2, 3, 'BAS', 1, NULL, 1, 0, 0),
(2, 115, 'potentialtype', 'vtiger_potential', 1, '15', 'opportunity_type', 'Type', 1, 2, '', 100, 7, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(2, 116, 'nextstep', 'vtiger_potential', 1, '1', 'nextstep', 'Next Step', 1, 2, '', 100, 10, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(2, 117, 'leadsource', 'vtiger_potential', 1, '15', 'leadsource', 'Lead Source', 1, 2, '', 100, 9, 1, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(2, 118, 'sales_stage', 'vtiger_potential', 1, '15', 'sales_stage', 'Sales Stage', 1, 2, '', 100, 12, 1, 1, 'V~M', 2, 4, 'BAS', 1, NULL, 0, 1, 0),
(2, 119, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 11, 1, 1, 'V~M', 0, 6, 'BAS', 1, NULL, 1, 0, 0),
(2, 120, 'probability', 'vtiger_potential', 1, '9', 'probability', 'Probability', 1, 2, '', 100, 14, 1, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(2, 121, 'campaignid', 'vtiger_potential', 1, '58', 'campaignid', 'Campaign Source', 1, 2, '', 100, 13, 1, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(2, 122, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 16, 1, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(2, 123, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 1, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(2, 124, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 17, 1, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(2, 125, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 3, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 126, 'campaignname', 'vtiger_campaign', 1, '2', 'campaignname', 'Campaign Name', 1, 0, '', 100, 1, 74, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(26, 127, 'campaign_no', 'vtiger_campaign', 1, '4', 'campaign_no', 'Campaign No', 1, 0, '', 100, 2, 74, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(26, 128, 'campaigntype', 'vtiger_campaign', 1, '15', 'campaigntype', 'Campaign Type', 1, 2, '', 100, 5, 74, 1, 'V~O', 2, 3, 'BAS', 1, NULL, 1, 0, 0),
(26, 129, 'product_id', 'vtiger_campaign', 1, '59', 'product_id', 'Product', 1, 2, '', 100, 6, 74, 1, 'I~O', 2, 5, 'BAS', 1, NULL, 0, 0, 0),
(26, 130, 'campaignstatus', 'vtiger_campaign', 1, '15', 'campaignstatus', 'Campaign Status', 1, 2, '', 100, 4, 74, 1, 'V~O', 2, 6, 'BAS', 1, NULL, 1, 0, 0),
(26, 131, 'closingdate', 'vtiger_campaign', 1, '23', 'closingdate', 'Expected Close Date', 1, 2, '', 100, 8, 74, 1, 'D~M', 2, 2, 'BAS', 1, NULL, 1, 0, 0),
(26, 132, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 3, 74, 1, 'V~M', 0, 7, 'BAS', 1, NULL, 1, 0, 0),
(26, 133, 'numsent', 'vtiger_campaign', 1, '9', 'numsent', 'Num Sent', 1, 2, '', 100, 12, 74, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 134, 'sponsor', 'vtiger_campaign', 1, '1', 'sponsor', 'Sponsor', 1, 2, '', 100, 9, 74, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 135, 'targetaudience', 'vtiger_campaign', 1, '1', 'targetaudience', 'Target Audience', 1, 2, '', 100, 7, 74, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 136, 'targetsize', 'vtiger_campaign', 1, '1', 'targetsize', 'TargetSize', 1, 2, '', 100, 10, 74, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 137, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 11, 74, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(26, 138, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 13, 74, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(26, 139, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 74, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(26, 140, 'expectedresponse', 'vtiger_campaign', 1, '15', 'expectedresponse', 'Expected Response', 1, 2, '', 100, 3, 76, 1, 'V~O', 2, 4, 'BAS', 1, NULL, 0, 0, 0),
(26, 141, 'expectedrevenue', 'vtiger_campaign', 1, '71', 'expectedrevenue', 'Expected Revenue', 1, 2, '', 100, 4, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(26, 142, 'budgetcost', 'vtiger_campaign', 1, '71', 'budgetcost', 'Budget Cost', 1, 2, '', 100, 1, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 143, 'actualcost', 'vtiger_campaign', 1, '71', 'actualcost', 'Actual Cost', 1, 2, '', 100, 2, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 144, 'expectedresponsecount', 'vtiger_campaign', 1, '1', 'expectedresponsecount', 'Expected Response Count', 1, 2, '', 100, 7, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 145, 'expectedsalescount', 'vtiger_campaign', 1, '1', 'expectedsalescount', 'Expected Sales Count', 1, 2, '', 100, 5, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 146, 'expectedroi', 'vtiger_campaign', 1, '71', 'expectedroi', 'Expected ROI', 1, 2, '', 100, 9, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 147, 'actualresponsecount', 'vtiger_campaign', 1, '1', 'actualresponsecount', 'Actual Response Count', 1, 2, '', 100, 8, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 148, 'actualsalescount', 'vtiger_campaign', 1, '1', 'actualsalescount', 'Actual Sales Count', 1, 2, '', 100, 6, 76, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 149, 'actualroi', 'vtiger_campaign', 1, '71', 'actualroi', 'Actual ROI', 1, 2, '', 100, 10, 76, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(26, 150, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 81, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(4, 151, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0, 0, 0),
(6, 152, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0, 0, 0),
(7, 153, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0, 0, 0),
(26, 154, 'campaignrelstatus', 'vtiger_campaignrelstatus', 1, '16', 'campaignrelstatus', 'Status', 1, 0, '0', 100, 1, NULL, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0, 0, 0),
(13, 155, 'ticket_no', 'vtiger_troubletickets', 1, '4', 'ticket_no', 'Ticket No', 1, 0, '', 100, 14, 25, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(13, 156, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 5, 25, 1, 'V~M', 0, 4, 'BAS', 1, NULL, 1, 0, 0),
(13, 157, 'parent_id', 'vtiger_troubletickets', 1, '10', 'parent_id', 'Related To', 1, 0, '', 100, 2, 25, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(13, 158, 'priority', 'vtiger_troubletickets', 1, '15', 'ticketpriorities', 'Priority', 1, 2, '', 100, 7, 25, 1, 'V~M', 2, 3, 'BAS', 1, NULL, 0, 1, 0),
(13, 159, 'product_id', 'vtiger_troubletickets', 1, '59', 'product_id', 'Product Name', 1, 2, '', 100, 6, 25, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(13, 160, 'severity', 'vtiger_troubletickets', 1, '15', 'ticketseverities', 'Severity', 1, 2, '', 100, 9, 25, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(13, 161, 'status', 'vtiger_troubletickets', 1, '15', 'ticketstatus', 'Status', 1, 2, '', 100, 8, 25, 1, 'V~M', 1, 2, 'BAS', 1, NULL, 1, 0, 0),
(13, 162, 'category', 'vtiger_troubletickets', 1, '15', 'ticketcategories', 'Category', 1, 2, '', 100, 11, 25, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(13, 163, 'update_log', 'vtiger_troubletickets', 1, '19', 'update_log', 'Update History', 1, 1, '', 100, 12, 25, 3, 'V~O', 1, NULL, 'BAS', 0, NULL, 0, 0, 0),
(13, 164, 'hours', 'vtiger_troubletickets', 1, '1', 'hours', 'Hours', 1, 2, '', 100, 10, 25, 1, 'N~O', 1, NULL, 'BAS', 1, 'This gives the estimated hours for the Ticket.<br>When the same ticket is added to a Service Contract,based on the Tracking Unit of the Service Contract,Used units is updated whenever a ticket is Closed.', 0, 0, 0),
(13, 165, 'days', 'vtiger_troubletickets', 1, '1', 'days', 'Days', 1, 2, '', 100, 11, 25, 1, 'N~O', 1, NULL, 'BAS', 1, 'This gives the estimated days for the Ticket.<br>When the same ticket is added to a Service Contract,based on the Tracking Unit of the Service Contract,Used units is updated whenever a ticket is Closed.', 0, 0, 0),
(13, 166, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 10, 25, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(13, 167, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 13, 25, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(13, 168, 'from_portal', 'vtiger_ticketcf', 1, '56', 'from_portal', 'From Portal', 1, 0, '', 100, 14, 25, 3, 'C~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(13, 169, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 17, 25, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(13, 170, 'title', 'vtiger_troubletickets', 1, '22', 'ticket_title', 'Title', 1, 0, '', 100, 1, 25, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(13, 171, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 28, 1, 'V~O', 2, 4, 'BAS', 1, NULL, 1, 0, 0),
(13, 172, 'solution', 'vtiger_troubletickets', 1, '19', 'solution', 'Solution', 1, 0, '', 100, 1, 29, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(13, 173, 'comments', 'vtiger_ticketcomments', 1, '19', 'comments', 'Add Comment', 1, 1, '', 100, 1, 30, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(14, 174, 'productname', 'vtiger_products', 1, '2', 'productname', 'Product Name', 1, 0, '', 100, 1, 31, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(14, 175, 'product_no', 'vtiger_products', 1, '4', 'product_no', 'Product No', 1, 0, '', 100, 2, 31, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 1, 0),
(14, 176, 'productcode', 'vtiger_products', 1, '1', 'productcode', 'Part Number', 1, 2, '', 100, 4, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(14, 177, 'discontinued', 'vtiger_products', 1, '56', 'discontinued', 'Product Active', 1, 2, '1', 100, 3, 31, 1, 'V~O', 2, 2, 'BAS', 1, NULL, 0, 1, 0),
(14, 178, 'manufacturer', 'vtiger_products', 1, '15', 'manufacturer', 'Manufacturer', 1, 2, '', 100, 6, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 179, 'productcategory', 'vtiger_products', 1, '15', 'productcategory', 'Product Category', 1, 2, '', 100, 6, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 1, 0),
(14, 180, 'sales_start_date', 'vtiger_products', 1, '5', 'sales_start_date', 'Sales Start Date', 1, 2, '', 100, 5, 31, 1, 'D~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 181, 'sales_end_date', 'vtiger_products', 1, '5', 'sales_end_date', 'Sales End Date', 1, 2, '', 100, 8, 31, 1, 'D~O~OTH~GE~sales_start_date~Sales Start Date', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 182, 'start_date', 'vtiger_products', 1, '5', 'start_date', 'Support Start Date', 1, 2, '', 100, 7, 31, 1, 'D~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 183, 'expiry_date', 'vtiger_products', 1, '5', 'expiry_date', 'Support Expiry Date', 1, 2, '', 100, 10, 31, 1, 'D~O~OTH~GE~start_date~Start Date', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 184, 'website', 'vtiger_products', 1, '17', 'website', 'Website', 1, 2, '', 100, 14, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 185, 'vendor_id', 'vtiger_products', 1, '75', 'vendor_id', 'Vendor Name', 1, 2, '', 100, 13, 31, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 186, 'mfr_part_no', 'vtiger_products', 1, '1', 'mfr_part_no', 'Mfr PartNo', 1, 2, '', 100, 16, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 187, 'vendor_part_no', 'vtiger_products', 1, '1', 'vendor_part_no', 'Vendor PartNo', 1, 2, '', 100, 15, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 188, 'serialno', 'vtiger_products', 1, '1', 'serial_no', 'Serial No', 1, 2, '', 100, 18, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 189, 'productsheet', 'vtiger_products', 1, '1', 'productsheet', 'Product Sheet', 1, 2, '', 100, 17, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 190, 'glacct', 'vtiger_products', 1, '15', 'glacct', 'GL Account', 1, 2, '', 100, 20, 31, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 191, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 19, 31, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(14, 192, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 21, 31, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(14, 193, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 31, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(14, 194, 'unit_price', 'vtiger_products', 1, '72', 'unit_price', 'Unit Price', 1, 0, '', 100, 1, 32, 1, 'N~O', 2, 3, 'BAS', 0, NULL, 1, 0, 0),
(14, 195, 'commissionrate', 'vtiger_products', 1, '9', 'commissionrate', 'Commission Rate', 1, 2, '', 100, 2, 32, 1, 'N~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(14, 196, 'taxclass', 'vtiger_products', 1, '83', 'taxclass', 'Taxes', 1, 2, '', 100, 4, 32, 1, 'V~O', 2, NULL, 'BAS', 1, NULL, 0, 0, 0),
(14, 197, 'usageunit', 'vtiger_products', 1, '15', 'usageunit', 'Usage Unit', 1, 2, '', 100, 1, 33, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(14, 198, 'qty_per_unit', 'vtiger_products', 1, '1', 'qty_per_unit', 'Qty/Unit', 1, 2, '', 100, 2, 33, 1, 'N~O', 1, NULL, 'ADV', 1, NULL, 1, 0, 0),
(14, 199, 'qtyinstock', 'vtiger_products', 1, '1', 'qtyinstock', 'Qty In Stock', 1, 2, '', 100, 3, 33, 1, 'NN~O', 0, 4, 'ADV', 1, NULL, 0, 1, 0),
(14, 200, 'reorderlevel', 'vtiger_products', 1, '1', 'reorderlevel', 'Reorder Level', 1, 2, '', 100, 4, 33, 1, 'I~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(14, 201, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Handler', 1, 0, '', 100, 5, 33, 1, 'V~M', 0, 5, 'BAS', 1, NULL, 0, 0, 0),
(14, 202, 'qtyindemand', 'vtiger_products', 1, '1', 'qtyindemand', 'Qty In Demand', 1, 2, '', 100, 6, 33, 1, 'I~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(14, 203, 'imagename', 'vtiger_products', 1, '69', 'imagename', 'Product Image', 1, 2, '', 100, 1, 35, 1, 'V~O', 3, NULL, 'ADV', 0, NULL, 0, 0, 0),
(14, 204, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 36, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(8, 205, 'title', 'vtiger_notes', 1, '2', 'notes_title', 'Title', 1, 0, '', 100, 1, 17, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(8, 206, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 17, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(8, 207, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 17, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(8, 208, 'filename', 'vtiger_notes', 1, '28', 'filename', 'File Name', 1, 2, '', 100, 3, 18, 1, 'V~O', 0, NULL, 'BAS', 0, NULL, 1, 0, 0),
(8, 209, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 4, 17, 1, 'V~M', 0, 3, 'BAS', 1, NULL, 1, 0, 0),
(8, 210, 'notecontent', 'vtiger_notes', 1, '19', 'notecontent', 'Note', 1, 2, '', 100, 1, 84, 1, 'V~O', 1, NULL, 'BAS', 0, NULL, 0, 0, 0),
(8, 211, 'filetype', 'vtiger_notes', 1, '1', 'filetype', 'File Type', 1, 2, NULL, 100, 5, 18, 2, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(8, 212, 'filesize', 'vtiger_notes', 1, '1', 'filesize', 'File Size', 1, 2, NULL, 100, 4, 18, 2, 'I~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(8, 213, 'filelocationtype', 'vtiger_notes', 1, '27', 'filelocationtype', 'Download Type', 1, 0, NULL, 100, 1, 18, 1, 'V~O', 0, NULL, 'BAS', 0, NULL, 0, 0, 0),
(8, 214, 'fileversion', 'vtiger_notes', 1, '1', 'fileversion', 'Version', 1, 2, NULL, 100, 6, 18, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(8, 215, 'filestatus', 'vtiger_notes', 1, '56', 'filestatus', 'Active', 1, 2, '1', 100, 2, 18, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(8, 216, 'filedownloadcount', 'vtiger_notes', 1, '1', 'filedownloadcount', 'Download Count', 1, 2, NULL, 100, 7, 18, 2, 'I~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(8, 217, 'folderid', 'vtiger_notes', 1, '26', 'folderid', 'Folder Name', 1, 2, '', 100, 2, 17, 1, 'V~O', 2, 2, 'BAS', 1, NULL, 1, 0, 0),
(8, 218, 'note_no', 'vtiger_notes', 1, '4', 'note_no', 'Document No', 1, 0, '', 100, 3, 17, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(8, 219, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 17, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 220, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Date & Time Sent', 1, 0, '', 100, 1, 21, 1, 'DT~M~time_start~Time Start', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 221, 'semodule', 'vtiger_activity', 1, '2', 'parent_type', 'Sales Enity Module', 1, 0, '', 100, 2, 21, 3, '', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 222, 'activitytype', 'vtiger_activity', 1, '2', 'activitytype', 'Activtiy Type', 1, 0, '', 100, 3, 21, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 223, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 5, 21, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 224, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 23, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 225, 'name', 'vtiger_attachments', 1, '61', 'filename', 'Attachment', 1, 0, '', 100, 2, 23, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 226, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 24, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 227, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 9, 23, 1, 'T~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 228, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 10, 22, 1, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 229, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 11, 21, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 230, 'access_count', 'vtiger_email_track', 1, '25', 'access_count', 'Access Count', 1, 0, '0', 100, 6, 21, 3, 'I~O', 1, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 231, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 21, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(9, 232, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 19, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(9, 233, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 19, 1, 'V~M', 0, 4, 'BAS', 1, NULL, 1, 0, 0),
(9, 234, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Start Date & Time', 1, 0, '', 100, 3, 19, 1, 'DT~M~time_start', 0, 2, 'BAS', 1, NULL, 1, 0, 0),
(9, 235, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 4, 19, 3, 'T~M', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(9, 236, 'time_end', 'vtiger_activity', 1, '2', 'time_end', 'End Time', 1, 0, '', 100, 4, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(9, 237, 'due_date', 'vtiger_activity', 1, '23', 'due_date', 'Due Date', 1, 0, '', 100, 5, 19, 1, 'D~M~OTH~GE~date_start~Start Date & Time', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(9, 238, 'crmid', 'vtiger_seactivityrel', 1, '66', 'parent_id', 'Related To', 1, 0, '', 100, 7, 19, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(9, 239, 'contactid', 'vtiger_cntactivityrel', 1, '57', 'contact_id', 'Contact Name', 1, 0, '', 100, 8, 19, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 240, 'status', 'vtiger_activity', 1, '15', 'taskstatus', 'Status', 1, 0, '', 100, 8, 19, 1, 'V~M', 0, 3, 'BAS', 1, NULL, 0, 0, 0),
(9, 241, 'eventstatus', 'vtiger_activity', 1, '15', 'eventstatus', 'Status', 1, 0, '', 100, 9, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 242, 'priority', 'vtiger_activity', 1, '15', 'taskpriority', 'Priority', 1, 0, '', 100, 10, 19, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 243, 'sendnotification', 'vtiger_activity', 1, '56', 'sendnotification', 'Send Notification', 1, 0, '', 100, 11, 19, 1, 'C~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 244, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 19, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(9, 245, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 19, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(9, 246, 'activitytype', 'vtiger_activity', 1, '15', 'activitytype', 'Activity Type', 1, 0, '', 100, 16, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(9, 247, 'visibility', 'vtiger_activity', 1, '16', 'visibility', 'Visibility', 1, 0, '', 100, 17, 19, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 248, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 20, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 249, 'duration_hours', 'vtiger_activity', 1, '63', 'duration_hours', 'Duration', 1, 0, '', 100, 17, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 250, 'duration_minutes', 'vtiger_activity', 1, '16', 'duration_minutes', 'Duration Minutes', 1, 0, '', 100, 18, 19, 3, 'T~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 251, 'location', 'vtiger_activity', 1, '1', 'location', 'Location', 1, 0, '', 100, 19, 19, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 252, 'reminder_time', 'vtiger_activity_reminder', 1, '30', 'reminder_time', 'Send Reminder', 1, 0, '', 100, 1, 120, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 253, 'recurringtype', 'vtiger_activity', 1, '16', 'recurringtype', 'Recurrence', 1, 0, '', 100, 6, 19, 3, 'O~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(9, 254, 'notime', 'vtiger_activity', 1, '56', 'notime', 'No Time', 1, 0, '', 100, 20, 19, 3, 'C~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(9, 255, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 19, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(16, 256, 'subject', 'vtiger_activity', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 39, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(16, 257, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 39, 1, 'V~M', 0, 6, 'BAS', 1, NULL, 1, 0, 0),
(16, 258, 'date_start', 'vtiger_activity', 1, '6', 'date_start', 'Start Date & Time', 1, 0, '', 100, 3, 39, 1, 'DT~M~time_start', 0, 2, 'BAS', 1, NULL, 1, 0, 0),
(16, 259, 'time_start', 'vtiger_activity', 1, '2', 'time_start', 'Time Start', 1, 0, '', 100, 4, 39, 3, 'T~M', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(16, 260, 'due_date', 'vtiger_activity', 1, '23', 'due_date', 'End Date', 1, 0, '', 100, 5, 39, 1, 'D~M~OTH~GE~date_start~Start Date & Time', 0, 5, 'BAS', 1, NULL, 1, 0, 0),
(16, 261, 'time_end', 'vtiger_activity', 1, '2', 'time_end', 'End Time', 1, 0, '', 100, 5, 39, 3, 'T~M', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(16, 262, 'recurringtype', 'vtiger_activity', 1, '16', 'recurringtype', 'Recurrence', 1, 0, '', 100, 6, 117, 1, 'O~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(16, 263, 'duration_hours', 'vtiger_activity', 1, '63', 'duration_hours', 'Duration', 1, 0, '', 100, 7, 39, 3, 'I~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 264, 'duration_minutes', 'vtiger_activity', 1, '16', 'duration_minutes', 'Duration Minutes', 1, 0, '', 100, 8, 39, 3, 'O~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 265, 'crmid', 'vtiger_seactivityrel', 1, '66', 'parent_id', 'Related To', 1, 0, '', 100, 9, 119, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(16, 266, 'eventstatus', 'vtiger_activity', 1, '15', 'eventstatus', 'Status', 1, 0, '', 100, 10, 39, 1, 'V~M', 0, 3, 'BAS', 1, NULL, 0, 0, 0),
(16, 267, 'sendnotification', 'vtiger_activity', 1, '56', 'sendnotification', 'Send Notification', 1, 0, '', 100, 11, 39, 1, 'C~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 268, 'activitytype', 'vtiger_activity', 1, '15', 'activitytype', 'Activity Type', 1, 0, '', 100, 12, 39, 1, 'V~M', 0, 4, 'BAS', 1, NULL, 1, 0, 0),
(16, 269, 'location', 'vtiger_activity', 1, '1', 'location', 'Location', 1, 0, '', 100, 13, 39, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 270, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 39, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(16, 271, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 39, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(16, 272, 'priority', 'vtiger_activity', 1, '15', 'taskpriority', 'Priority', 1, 0, '', 100, 16, 39, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 273, 'notime', 'vtiger_activity', 1, '56', 'notime', 'No Time', 1, 0, '', 100, 17, 39, 3, 'C~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 274, 'visibility', 'vtiger_activity', 1, '16', 'visibility', 'Visibility', 1, 0, '', 100, 18, 39, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 275, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 39, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(16, 276, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 0, '', 100, 1, 41, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 277, 'reminder_time', 'vtiger_activity_reminder', 1, '30', 'reminder_time', 'Send Reminder', 1, 0, '', 100, 1, 40, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(16, 278, 'contactid', 'vtiger_cntactivityrel', 1, '57', 'contact_id', 'Contact Name', 1, 0, '', 100, 1, 119, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(15, 279, 'product_id', 'vtiger_faq', 1, '59', 'product_id', 'Product Name', 1, 2, '', 100, 1, 37, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(15, 280, 'faq_no', 'vtiger_faq', 1, '4', 'faq_no', 'Faq No', 1, 0, '', 100, 2, 37, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(15, 281, 'category', 'vtiger_faq', 1, '15', 'faqcategories', 'Category', 1, 2, '', 100, 4, 37, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(15, 282, 'status', 'vtiger_faq', 1, '15', 'faqstatus', 'Status', 1, 2, '', 100, 3, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(15, 283, 'question', 'vtiger_faq', 1, '20', 'question', 'Question', 1, 2, '', 100, 7, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(15, 284, 'answer', 'vtiger_faq', 1, '20', 'faq_answer', 'Answer', 1, 2, '', 100, 8, 37, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(15, 285, 'comments', 'vtiger_faqcomments', 1, '19', 'comments', 'Add Comment', 1, 1, '', 100, 1, 38, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(15, 286, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 37, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(15, 287, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 37, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(15, 288, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 37, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(18, 289, 'vendorname', 'vtiger_vendor', 1, '2', 'vendorname', 'Vendor Name', 1, 0, '', 100, 1, 42, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(18, 290, 'vendor_no', 'vtiger_vendor', 1, '4', 'vendor_no', 'Vendor No', 1, 0, '', 100, 2, 42, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(18, 291, 'phone', 'vtiger_vendor', 1, '1', 'phone', 'Phone', 1, 2, '', 100, 4, 42, 1, 'V~O', 2, 2, 'BAS', 1, NULL, 0, 1, 0),
(18, 292, 'email', 'vtiger_vendor', 1, '13', 'email', 'Email', 1, 2, '', 100, 3, 42, 1, 'E~O', 2, 3, 'BAS', 1, NULL, 0, 1, 0),
(18, 293, 'website', 'vtiger_vendor', 1, '17', 'website', 'Website', 1, 2, '', 100, 6, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 1, 0),
(18, 294, 'glacct', 'vtiger_vendor', 1, '15', 'glacct', 'GL Account', 1, 2, '', 100, 5, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(18, 295, 'category', 'vtiger_vendor', 1, '1', 'category', 'Category', 1, 2, '', 100, 8, 42, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(18, 296, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 7, 42, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(18, 297, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 9, 42, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(18, 298, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 12, 42, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(18, 299, 'street', 'vtiger_vendor', 1, '21', 'street', 'Street', 1, 2, '', 100, 1, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(18, 300, 'pobox', 'vtiger_vendor', 1, '1', 'pobox', 'Po Box', 1, 2, '', 100, 2, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(18, 301, 'city', 'vtiger_vendor', 1, '1', 'city', 'City', 1, 2, '', 100, 3, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(18, 302, 'state', 'vtiger_vendor', 1, '1', 'state', 'State', 1, 2, '', 100, 4, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(18, 303, 'postalcode', 'vtiger_vendor', 1, '1', 'postalcode', 'Postal Code', 1, 2, '', 100, 5, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(18, 304, 'country', 'vtiger_vendor', 1, '1', 'country', 'Country', 1, 2, '', 100, 6, 44, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(18, 305, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 45, 1, 'V~O', 1, NULL, 'ADV', 1, NULL, 0, 0, 0),
(19, 306, 'bookname', 'vtiger_pricebook', 1, '2', 'bookname', 'Price Book Name', 1, 0, '', 100, 1, 46, 1, 'V~M', 0, 1, 'BAS', 1, NULL, 1, 0, 0),
(19, 307, 'pricebook_no', 'vtiger_pricebook', 1, '4', 'pricebook_no', 'PriceBook No', 1, 0, '', 100, 3, 46, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(19, 308, 'active', 'vtiger_pricebook', 1, '56', 'active', 'Active', 1, 2, '1', 100, 2, 46, 1, 'C~O', 2, 2, 'BAS', 1, NULL, 1, 0, 0),
(19, 309, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 4, 46, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(19, 310, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 5, 46, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(19, 311, 'currency_id', 'vtiger_pricebook', 1, '117', 'currency_id', 'Currency', 1, 0, '', 100, 5, 46, 1, 'I~M', 0, 3, 'BAS', 0, NULL, 0, 0, 0),
(19, 312, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 46, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(19, 313, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 48, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 314, 'quote_no', 'vtiger_quotes', 1, '4', 'quote_no', 'Quote No', 1, 0, '', 100, 3, 49, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(20, 315, 'subject', 'vtiger_quotes', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 49, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 1, 0, 0),
(20, 316, 'potentialid', 'vtiger_quotes', 1, '76', 'potential_id', 'Potential Name', 1, 2, '', 100, 2, 49, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(20, 317, 'quotestage', 'vtiger_quotes', 1, '15', 'quotestage', 'Quote Stage', 1, 2, '', 100, 4, 49, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(20, 318, 'validtill', 'vtiger_quotes', 1, '5', 'validtill', 'Valid Till', 1, 2, '', 100, 5, 49, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 319, 'contactid', 'vtiger_quotes', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(20, 320, 'carrier', 'vtiger_quotes', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 8, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 321, 'subtotal', 'vtiger_quotes', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 9, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 322, 'shipping', 'vtiger_quotes', 1, '1', 'shipping', 'Shipping', 1, 2, '', 100, 10, 49, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 323, 'inventorymanager', 'vtiger_quotes', 1, '77', 'assigned_user_id1', 'Inventory Manager', 1, 2, '', 100, 11, 49, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 324, 'adjustment', 'vtiger_quotes', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 20, 49, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 325, 'total', 'vtiger_quotes', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(20, 326, 'taxtype', 'vtiger_quotes', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 14, 49, 3, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 327, 'discount_percent', 'vtiger_quotes', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 14, 116, 5, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 328, 'discount_amount', 'vtiger_quotes', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 2, '', 100, 14, 116, 5, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 329, 's_h_amount', 'vtiger_quotes', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 330, 'accountid', 'vtiger_quotes', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 16, 49, 1, 'I~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(20, 331, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 17, 49, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(20, 332, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 18, 49, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(20, 333, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 49, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(20, 334, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 49, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0);
INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`, `summaryfield`, `headerfield`, `isunique`) VALUES
(20, 335, 'currency_id', 'vtiger_quotes', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 20, 49, 3, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 336, 'conversion_rate', 'vtiger_quotes', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 21, 49, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 337, 'bill_street', 'vtiger_quotesbillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 51, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 338, 'ship_street', 'vtiger_quotesshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 51, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 339, 'bill_city', 'vtiger_quotesbillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 340, 'ship_city', 'vtiger_quotesshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 341, 'bill_state', 'vtiger_quotesbillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 342, 'ship_state', 'vtiger_quotesshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 343, 'bill_code', 'vtiger_quotesbillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 344, 'ship_code', 'vtiger_quotesshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 345, 'bill_country', 'vtiger_quotesbillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 346, 'ship_country', 'vtiger_quotesshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 347, 'bill_pobox', 'vtiger_quotesbillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 348, 'ship_pobox', 'vtiger_quotesshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 51, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(20, 349, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 54, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0, 0, 0),
(20, 350, 'terms_conditions', 'vtiger_quotes', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 53, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0, 0, 0),
(21, 351, 'purchaseorder_no', 'vtiger_purchaseorder', 1, '4', 'purchaseorder_no', 'PurchaseOrder No', 1, 0, '', 100, 2, 55, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(21, 352, 'subject', 'vtiger_purchaseorder', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(21, 353, 'vendorid', 'vtiger_purchaseorder', 1, '81', 'vendor_id', 'Vendor Name', 1, 0, '', 100, 3, 55, 1, 'I~M', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(21, 354, 'requisition_no', 'vtiger_purchaseorder', 1, '1', 'requisition_no', 'Requisition No', 1, 2, '', 100, 4, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 355, 'tracking_no', 'vtiger_purchaseorder', 1, '1', 'tracking_no', 'Tracking Number', 1, 2, '', 100, 5, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(21, 356, 'contactid', 'vtiger_purchaseorder', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 55, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(21, 357, 'duedate', 'vtiger_purchaseorder', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 7, 55, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 358, 'carrier', 'vtiger_purchaseorder', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 8, 55, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 359, 'adjustment', 'vtiger_purchaseorder', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 10, 55, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 360, 'salescommission', 'vtiger_purchaseorder', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 100, 11, 55, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 361, 'exciseduty', 'vtiger_purchaseorder', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 12, 55, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 362, 'total', 'vtiger_purchaseorder', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 13, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(21, 363, 'subtotal', 'vtiger_purchaseorder', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 364, 'taxtype', 'vtiger_purchaseorder', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 14, 55, 3, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 365, 'discount_percent', 'vtiger_purchaseorder', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 14, 115, 5, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 366, 'discount_amount', 'vtiger_purchaseorder', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 0, '', 100, 14, 115, 5, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 367, 's_h_amount', 'vtiger_purchaseorder', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 368, 'postatus', 'vtiger_purchaseorder', 1, '15', 'postatus', 'Status', 1, 2, '', 100, 15, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(21, 369, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 16, 55, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(21, 370, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 55, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(21, 371, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 55, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(21, 372, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 55, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(21, 373, 'currency_id', 'vtiger_purchaseorder', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 19, 55, 3, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 374, 'conversion_rate', 'vtiger_purchaseorder', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 20, 55, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 375, 'bill_street', 'vtiger_pobillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 57, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 376, 'ship_street', 'vtiger_poshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 57, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 377, 'bill_city', 'vtiger_pobillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 378, 'ship_city', 'vtiger_poshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 379, 'bill_state', 'vtiger_pobillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 380, 'ship_state', 'vtiger_poshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 381, 'bill_code', 'vtiger_pobillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 382, 'ship_code', 'vtiger_poshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 383, 'bill_country', 'vtiger_pobillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 384, 'ship_country', 'vtiger_poshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 385, 'bill_pobox', 'vtiger_pobillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 386, 'ship_pobox', 'vtiger_poshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 57, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(21, 387, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 60, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0, 0, 0),
(21, 388, 'terms_conditions', 'vtiger_purchaseorder', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 59, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0, 0, 0),
(22, 389, 'salesorder_no', 'vtiger_salesorder', 1, '4', 'salesorder_no', 'SalesOrder No', 1, 0, '', 100, 4, 61, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(22, 390, 'subject', 'vtiger_salesorder', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(22, 391, 'potentialid', 'vtiger_salesorder', 1, '76', 'potential_id', 'Potential Name', 1, 2, '', 100, 2, 61, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 392, 'customerno', 'vtiger_salesorder', 1, '1', 'customerno', 'Customer No', 1, 2, '', 100, 3, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 393, 'quoteid', 'vtiger_salesorder', 1, '78', 'quote_id', 'Quote Name', 1, 2, '', 100, 5, 61, 1, 'I~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(22, 394, 'purchaseorder', 'vtiger_salesorder', 1, '1', 'vtiger_purchaseorder', 'Purchase Order', 1, 2, '', 100, 5, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 395, 'contactid', 'vtiger_salesorder', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 6, 61, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(22, 396, 'duedate', 'vtiger_salesorder', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 8, 61, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 397, 'carrier', 'vtiger_salesorder', 1, '15', 'carrier', 'Carrier', 1, 2, '', 100, 9, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 398, 'pending', 'vtiger_salesorder', 1, '1', 'pending', 'Pending', 1, 2, '', 100, 10, 61, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 399, 'sostatus', 'vtiger_salesorder', 1, '15', 'sostatus', 'Status', 1, 2, '', 100, 11, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(22, 400, 'adjustment', 'vtiger_salesorder', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 12, 61, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 401, 'salescommission', 'vtiger_salesorder', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 100, 13, 61, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 402, 'exciseduty', 'vtiger_salesorder', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 13, 61, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 403, 'total', 'vtiger_salesorder', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 14, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(22, 404, 'subtotal', 'vtiger_salesorder', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 405, 'taxtype', 'vtiger_salesorder', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 15, 61, 3, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 406, 'discount_percent', 'vtiger_salesorder', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 15, 114, 5, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 407, 'discount_amount', 'vtiger_salesorder', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 0, '', 100, 15, 114, 5, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 408, 's_h_amount', 'vtiger_salesorder', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 15, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 409, 'accountid', 'vtiger_salesorder', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 16, 61, 1, 'I~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(22, 410, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 17, 61, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(22, 411, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 18, 61, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(22, 412, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 61, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(22, 413, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 61, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(22, 414, 'currency_id', 'vtiger_salesorder', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 20, 61, 3, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 415, 'conversion_rate', 'vtiger_salesorder', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 21, 61, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 416, 'bill_street', 'vtiger_sobillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 63, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 417, 'ship_street', 'vtiger_soshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 63, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 418, 'bill_city', 'vtiger_sobillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 419, 'ship_city', 'vtiger_soshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 420, 'bill_state', 'vtiger_sobillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 421, 'ship_state', 'vtiger_soshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 422, 'bill_code', 'vtiger_sobillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 423, 'ship_code', 'vtiger_soshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 424, 'bill_country', 'vtiger_sobillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 425, 'ship_country', 'vtiger_soshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 426, 'bill_pobox', 'vtiger_sobillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 427, 'ship_pobox', 'vtiger_soshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 63, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(22, 428, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 66, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0, 0, 0),
(22, 429, 'terms_conditions', 'vtiger_salesorder', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 65, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0, 0, 0),
(22, 430, 'enable_recurring', 'vtiger_salesorder', 1, '56', 'enable_recurring', 'Enable Recurring', 1, 0, '', 100, 1, 85, 1, 'C~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(22, 431, 'recurring_frequency', 'vtiger_invoice_recurring_info', 1, '16', 'recurring_frequency', 'Frequency', 1, 0, '', 100, 2, 85, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(22, 432, 'start_period', 'vtiger_invoice_recurring_info', 1, '5', 'start_period', 'Start Period', 1, 0, '', 100, 3, 85, 1, 'D~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(22, 433, 'end_period', 'vtiger_invoice_recurring_info', 1, '5', 'end_period', 'End Period', 1, 0, '', 100, 4, 85, 1, 'D~O~OTH~G~start_period~Start Period', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(22, 434, 'payment_duration', 'vtiger_invoice_recurring_info', 1, '16', 'payment_duration', 'Payment Duration', 1, 0, '', 100, 5, 85, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(22, 435, 'invoice_status', 'vtiger_invoice_recurring_info', 1, '15', 'invoicestatus', 'Invoice Status', 1, 0, '', 100, 6, 85, 1, 'V~M', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(23, 436, 'subject', 'vtiger_invoice', 1, '2', 'subject', 'Subject', 1, 0, '', 100, 1, 67, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(23, 437, 'salesorderid', 'vtiger_invoice', 1, '80', 'salesorder_id', 'Sales Order', 1, 2, '', 100, 2, 67, 1, 'I~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(23, 438, 'customerno', 'vtiger_invoice', 1, '1', 'customerno', 'Customer No', 1, 2, '', 100, 3, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 439, 'contactid', 'vtiger_invoice', 1, '57', 'contact_id', 'Contact Name', 1, 2, '', 100, 4, 67, 1, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(23, 440, 'invoicedate', 'vtiger_invoice', 1, '5', 'invoicedate', 'Invoice Date', 1, 2, '', 100, 5, 67, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 441, 'duedate', 'vtiger_invoice', 1, '5', 'duedate', 'Due Date', 1, 2, '', 100, 6, 67, 1, 'D~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 442, 'purchaseorder', 'vtiger_invoice', 1, '1', 'vtiger_purchaseorder', 'Purchase Order', 1, 2, '', 100, 8, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 443, 'adjustment', 'vtiger_invoice', 1, '72', 'txtAdjustment', 'Adjustment', 1, 2, '', 100, 9, 67, 3, 'NN~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 444, 'salescommission', 'vtiger_invoice', 1, '1', 'salescommission', 'Sales Commission', 1, 2, '', 10, 13, 67, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 445, 'exciseduty', 'vtiger_invoice', 1, '1', 'exciseduty', 'Excise Duty', 1, 2, '', 100, 11, 67, 1, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 446, 'subtotal', 'vtiger_invoice', 1, '72', 'hdnSubTotal', 'Sub Total', 1, 2, '', 100, 12, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 447, 'total', 'vtiger_invoice', 1, '72', 'hdnGrandTotal', 'Total', 1, 2, '', 100, 13, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 1, 0, 0),
(23, 448, 'taxtype', 'vtiger_invoice', 1, '16', 'hdnTaxType', 'Tax Type', 1, 2, '', 100, 13, 67, 3, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 449, 'discount_percent', 'vtiger_invoice', 1, '1', 'hdnDiscountPercent', 'Discount Percent', 1, 2, '', 100, 13, 113, 5, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 450, 'discount_amount', 'vtiger_invoice', 1, '72', 'hdnDiscountAmount', 'Discount Amount', 1, 2, '', 100, 13, 113, 5, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 451, 's_h_amount', 'vtiger_invoice', 1, '72', 'hdnS_H_Amount', 'S&H Amount', 1, 2, '', 100, 14, 69, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 452, 'accountid', 'vtiger_invoice', 1, '73', 'account_id', 'Account Name', 1, 2, '', 100, 14, 67, 1, 'I~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(23, 453, 'invoicestatus', 'vtiger_invoice', 1, '15', 'invoicestatus', 'Status', 1, 2, '', 100, 15, 67, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(23, 454, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 16, 67, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 1, 0),
(23, 455, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 67, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(23, 456, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 67, 2, 'DT~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(23, 457, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 22, 67, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(23, 458, 'currency_id', 'vtiger_invoice', 1, '117', 'currency_id', 'Currency', 1, 2, '1', 100, 19, 67, 3, 'I~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 459, 'conversion_rate', 'vtiger_invoice', 1, '1', 'conversion_rate', 'Conversion Rate', 1, 2, '1', 100, 20, 67, 3, 'N~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 460, 'bill_street', 'vtiger_invoicebillads', 1, '24', 'bill_street', 'Billing Address', 1, 2, '', 100, 1, 69, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 461, 'ship_street', 'vtiger_invoiceshipads', 1, '24', 'ship_street', 'Shipping Address', 1, 2, '', 100, 2, 69, 1, 'V~M', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 462, 'bill_city', 'vtiger_invoicebillads', 1, '1', 'bill_city', 'Billing City', 1, 2, '', 100, 5, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 463, 'ship_city', 'vtiger_invoiceshipads', 1, '1', 'ship_city', 'Shipping City', 1, 2, '', 100, 6, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 464, 'bill_state', 'vtiger_invoicebillads', 1, '1', 'bill_state', 'Billing State', 1, 2, '', 100, 7, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 465, 'ship_state', 'vtiger_invoiceshipads', 1, '1', 'ship_state', 'Shipping State', 1, 2, '', 100, 8, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 466, 'bill_code', 'vtiger_invoicebillads', 1, '1', 'bill_code', 'Billing Code', 1, 2, '', 100, 9, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 467, 'ship_code', 'vtiger_invoiceshipads', 1, '1', 'ship_code', 'Shipping Code', 1, 2, '', 100, 10, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 468, 'bill_country', 'vtiger_invoicebillads', 1, '1', 'bill_country', 'Billing Country', 1, 2, '', 100, 11, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 469, 'ship_country', 'vtiger_invoiceshipads', 1, '1', 'ship_country', 'Shipping Country', 1, 2, '', 100, 12, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 470, 'bill_pobox', 'vtiger_invoicebillads', 1, '1', 'bill_pobox', 'Billing Po Box', 1, 2, '', 100, 3, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 471, 'ship_pobox', 'vtiger_invoiceshipads', 1, '1', 'ship_pobox', 'Shipping Po Box', 1, 2, '', 100, 4, 69, 1, 'V~O', 3, NULL, 'BAS', 1, NULL, 0, 0, 0),
(23, 472, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 72, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0, 0, 0),
(23, 473, 'terms_conditions', 'vtiger_invoice', 1, '19', 'terms_conditions', 'Terms & Conditions', 1, 2, '', 100, 1, 71, 1, 'V~O', 3, NULL, 'ADV', 1, NULL, 0, 0, 0),
(23, 474, 'invoice_no', 'vtiger_invoice', 1, '4', 'invoice_no', 'Invoice No', 1, 0, '', 100, 3, 67, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 1, 0, 0),
(29, 475, 'user_name', 'vtiger_users', 1, '106', 'user_name', 'User Name', 1, 0, '', 11, 1, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 476, 'is_admin', 'vtiger_users', 1, '156', 'is_admin', 'Admin', 1, 0, '', 3, 7, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 477, 'user_password', 'vtiger_users', 1, '99', 'user_password', 'Password', 1, 0, '', 30, 5, 77, 4, 'P~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 478, 'confirm_password', 'vtiger_users', 1, '99', 'confirm_password', 'Confirm Password', 1, 0, '', 30, 6, 77, 4, 'P~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 479, 'first_name', 'vtiger_users', 1, '1', 'first_name', 'First Name', 1, 0, '', 30, 3, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 480, 'last_name', 'vtiger_users', 1, '2', 'last_name', 'Last Name', 1, 0, '', 30, 4, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 481, 'roleid', 'vtiger_user2role', 1, '98', 'roleid', 'Role', 1, 0, '', 200, 8, 77, 1, 'V~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 482, 'email1', 'vtiger_users', 1, '104', 'email1', 'Email', 1, 0, '', 100, 2, 77, 1, 'E~M', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 483, 'status', 'vtiger_users', 1, '115', 'status', 'Status', 1, 0, 'Active', 100, 10, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 484, 'activity_view', 'vtiger_users', 1, '16', 'activity_view', 'Default Activity View', 1, 0, '', 100, 6, 118, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 485, 'lead_view', 'vtiger_users', 1, '16', 'lead_view', 'Default Lead View', 1, 0, '', 100, 9, 77, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 486, 'hour_format', 'vtiger_users', 1, '16', 'hour_format', 'Calendar Hour Format', 1, 0, '12', 100, 4, 118, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 487, 'end_hour', 'vtiger_users', 1, '116', 'end_hour', 'Day ends at', 1, 0, '', 100, 11, 77, 3, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 488, 'start_hour', 'vtiger_users', 1, '16', 'start_hour', 'Day starts at', 1, 0, '', 100, 2, 118, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 489, 'is_owner', 'vtiger_users', 1, '1', 'is_owner', 'Account Owner', 0, 2, '0', 100, 12, 77, 5, 'V~O', 0, 1, 'BAS', 0, NULL, 0, 0, 0),
(29, 490, 'title', 'vtiger_users', 1, '1', 'title', 'Title', 1, 0, '', 50, 1, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 491, 'phone_work', 'vtiger_users', 1, '11', 'phone_work', 'Office Phone', 1, 0, '', 50, 5, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 492, 'department', 'vtiger_users', 1, '1', 'department', 'Department', 1, 0, '', 50, 3, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 493, 'phone_mobile', 'vtiger_users', 1, '11', 'phone_mobile', 'Mobile', 1, 0, '', 50, 7, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 494, 'reports_to_id', 'vtiger_users', 1, '101', 'reports_to_id', 'Reports To', 1, 0, '', 50, 8, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 495, 'phone_other', 'vtiger_users', 1, '11', 'phone_other', 'Other Phone', 1, 0, '', 50, 11, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 496, 'email2', 'vtiger_users', 1, '13', 'email2', 'Other Email', 1, 0, '', 100, 4, 79, 1, 'E~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 497, 'phone_fax', 'vtiger_users', 1, '11', 'phone_fax', 'Fax', 1, 0, '', 50, 2, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 498, 'secondaryemail', 'vtiger_users', 1, '13', 'secondaryemail', 'Secondary Email', 1, 0, '', 100, 6, 79, 1, 'E~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 499, 'phone_home', 'vtiger_users', 1, '11', 'phone_home', 'Home Phone', 1, 0, '', 50, 9, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 500, 'date_format', 'vtiger_users', 1, '16', 'date_format', 'Date Format', 1, 0, '', 30, 3, 118, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 501, 'signature', 'vtiger_users', 1, '21', 'signature', 'Signature', 1, 0, '', 250, 13, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 502, 'description', 'vtiger_users', 1, '21', 'description', 'Documents', 1, 0, '', 250, 14, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 503, 'address_street', 'vtiger_users', 1, '21', 'address_street', 'Street Address', 1, 0, '', 250, 1, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 504, 'address_city', 'vtiger_users', 1, '1', 'address_city', 'City', 1, 0, '', 100, 3, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 505, 'address_state', 'vtiger_users', 1, '1', 'address_state', 'State', 1, 0, '', 100, 5, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 506, 'address_postalcode', 'vtiger_users', 1, '1', 'address_postalcode', 'Postal Code', 1, 0, '', 100, 4, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 507, 'address_country', 'vtiger_users', 1, '1', 'address_country', 'Country', 1, 0, '', 100, 2, 80, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 508, 'accesskey', 'vtiger_users', 1, '3', 'accesskey', 'Webservice Access Key', 1, 0, '', 100, 2, 83, 2, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 509, 'time_zone', 'vtiger_users', 1, '16', 'time_zone', 'Time Zone', 1, 0, '', 200, 5, 118, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 510, 'currency_id', 'vtiger_users', 1, '117', 'currency_id', 'Currency', 1, 0, '', 100, 1, 78, 1, 'I~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 511, 'currency_grouping_pattern', 'vtiger_users', 1, '16', 'currency_grouping_pattern', 'Digit Grouping Pattern', 1, 0, '', 100, 2, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Digit Grouping Pattern</b> <br/><br/>This pattern specifies the format in which the currency separator will be placed.', 0, 0, 0),
(29, 512, 'currency_decimal_separator', 'vtiger_users', 1, '16', 'currency_decimal_separator', 'Decimal Separator', 1, 0, '.', 2, 3, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Decimal Separator</b> <br/><br/>Decimal separator specifies the separator to be used to separate the fractional values from the whole number part. <br/><b>Eg:</b> <br/>. => 123.45 <br/>, => 123,45 <br/>\' => 123\'45 <br/>  => 123 45 <br/>$ => 123$45 <br/>', 0, 0, 0),
(29, 513, 'currency_grouping_separator', 'vtiger_users', 1, '16', 'currency_grouping_separator', 'Digit Grouping Separator', 1, 0, ',', 2, 4, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Grouping Separator</b> <br/><br/>Grouping separator specifies the separator to be used to group the whole number part into hundreds, thousands etc. <br/><b>Eg:</b> <br/>. => 123.456.789 <br/>, => 123,456,789 <br/>\' => 123\'456\'789 <br/>  => 123 456 789 <br/>$ => 123$456$789 <br/>', 0, 0, 0),
(29, 514, 'currency_symbol_placement', 'vtiger_users', 1, '16', 'currency_symbol_placement', 'Symbol Placement', 1, 0, '', 20, 5, 78, 1, 'V~O', 1, NULL, 'BAS', 1, '<b>Currency - Symbol Placement</b> <br/><br/>Symbol Placement allows you to configure the position of the currency symbol with respect to the currency value.<br/><b>Eg:</b> <br/>$1.0 => $123,456,789.50 <br/>1.0$ => 123,456,789.50$ <br/>', 0, 0, 0),
(29, 515, 'imagename', 'vtiger_users', 1, '105', 'imagename', 'User Image', 1, 0, '', 250, 10, 82, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 516, 'internal_mailer', 'vtiger_users', 1, '56', 'internal_mailer', 'INTERNAL_MAIL_COMPOSER', 1, 0, '', 50, 15, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 517, 'theme', 'vtiger_users', 1, '31', 'theme', 'Theme', 1, 0, 'softed', 100, 16, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 518, 'language', 'vtiger_users', 1, '32', 'language', 'Language', 1, 0, 'en_us', 100, 17, 79, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(29, 519, 'reminder_interval', 'vtiger_users', 1, '16', 'reminder_interval', 'Reminder Interval', 1, 0, '', 100, 11, 118, 1, 'V~O', 1, NULL, 'BAS', 1, NULL, 0, 0, 0),
(10, 520, 'from_email', 'vtiger_emaildetails', 1, '12', 'from_email', 'From', 1, 2, '', 100, 1, 21, 3, 'V~M', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 521, 'to_email', 'vtiger_emaildetails', 1, '8', 'saved_toid', 'To', 1, 2, '', 100, 2, 21, 1, 'V~M', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 522, 'cc_email', 'vtiger_emaildetails', 1, '8', 'ccmail', 'CC', 1, 2, '', 1000, 3, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 523, 'bcc_email', 'vtiger_emaildetails', 1, '8', 'bccmail', 'BCC', 1, 2, '', 1000, 4, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 524, 'idlists', 'vtiger_emaildetails', 1, '357', 'parent_id', 'Parent ID', 1, 2, '', 1000, 5, 21, 1, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(10, 525, 'email_flag', 'vtiger_emaildetails', 1, '16', 'email_flag', 'Email Flag', 1, 2, '', 1000, 6, 21, 3, 'V~O', 3, NULL, 'BAS', 0, NULL, 0, 0, 0),
(34, 526, 'direction', 'vtiger_pbxmanager', 1, '1', 'direction', 'Direction', 1, 2, '', 100, 1, 88, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 527, 'callstatus', 'vtiger_pbxmanager', 1, '1', 'callstatus', 'Call Status', 1, 2, '', 100, 2, 88, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(34, 528, 'starttime', 'vtiger_pbxmanager', 1, '70', 'starttime', 'Start Time', 1, 2, '', 100, 7, 88, 1, 'DT~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(34, 529, 'endtime', 'vtiger_pbxmanager', 1, '70', 'endtime', 'End Time', 1, 2, '', 100, 8, 88, 1, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 530, 'totalduration', 'vtiger_pbxmanager', 1, '7', 'totalduration', 'Total Duration', 1, 2, '', 100, 10, 88, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 531, 'billduration', 'vtiger_pbxmanager', 1, '7', 'billduration', 'Bill Duration', 1, 2, '', 100, 11, 88, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 532, 'recordingurl', 'vtiger_pbxmanager', 1, '17', 'recordingurl', 'Recording URL', 1, 2, '', 100, 9, 88, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(34, 533, 'sourceuuid', 'vtiger_pbxmanager', 1, '1', 'sourceuuid', 'Source UUID', 1, 2, '', 100, 12, 88, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 534, 'gateway', 'vtiger_pbxmanager', 1, '1', 'gateway', 'Gateway', 1, 2, '', 100, 13, 88, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 535, 'customer', 'vtiger_pbxmanager', 1, '10', 'customer', 'Customer', 1, 2, '', 100, 3, 88, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(34, 536, 'user', 'vtiger_pbxmanager', 1, '52', 'user', 'User', 1, 2, '', 100, 4, 88, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(34, 537, 'customernumber', 'vtiger_pbxmanager', 1, '11', 'customernumber', 'Customer Number', 1, 2, '', 100, 5, 88, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 538, 'customertype', 'vtiger_pbxmanager', 1, '1', 'customertype', 'Customer Type', 1, 2, '', 100, 6, 88, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 539, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 14, 88, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(34, 540, 'createdtime', 'vtiger_crmentity', 1, '70', 'CreatedTime', 'Created Time', 1, 2, '', 100, 15, 88, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(34, 541, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'ModifiedTime', 'Modified Time', 1, 2, '', 100, 16, 88, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(34, 542, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 17, 88, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(29, 543, 'phone_crm_extension', 'vtiger_users', 1, '11', 'phone_crm_extension', 'CRM Phone Extension', 1, 2, '', 100, 18, 79, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(35, 544, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 89, 1, 'V~M', 2, 2, 'BAS', 1, '', 1, 0, 0),
(35, 545, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 89, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(35, 546, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 89, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(35, 547, 'start_date', 'vtiger_servicecontracts', 1, '5', 'start_date', 'Start Date', 1, 2, '', 100, 7, 89, 1, 'D~O', 2, 4, 'BAS', 1, '', 0, 0, 0),
(35, 548, 'end_date', 'vtiger_servicecontracts', 1, '5', 'end_date', 'End Date', 1, 2, '', 100, 11, 89, 2, 'D~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(35, 549, 'sc_related_to', 'vtiger_servicecontracts', 1, '10', 'sc_related_to', 'Related to', 1, 2, '', 100, 3, 89, 1, 'V~O', 2, 6, 'BAS', 1, '', 0, 0, 0),
(35, 550, 'tracking_unit', 'vtiger_servicecontracts', 1, '15', 'tracking_unit', 'Tracking Unit', 1, 2, '', 100, 6, 89, 1, 'V~O', 2, 7, 'BAS', 1, '', 0, 0, 0),
(35, 551, 'total_units', 'vtiger_servicecontracts', 1, '7', 'total_units', 'Total Units', 1, 2, '', 100, 8, 89, 1, 'NN~O', 2, 8, 'BAS', 1, '', 1, 0, 0),
(35, 552, 'used_units', 'vtiger_servicecontracts', 1, '7', 'used_units', 'Used Units', 1, 2, '', 100, 10, 89, 1, 'NN~O', 2, 9, 'BAS', 1, '', 1, 0, 0),
(35, 553, 'subject', 'vtiger_servicecontracts', 1, '1', 'subject', 'Subject', 1, 0, '', 100, 1, 89, 1, 'V~M', 0, 1, 'BAS', 1, '', 1, 0, 0),
(35, 554, 'due_date', 'vtiger_servicecontracts', 1, '23', 'due_date', 'Due date', 1, 2, '', 100, 9, 89, 1, 'D~O', 2, 5, 'BAS', 1, '', 0, 0, 0),
(35, 555, 'planned_duration', 'vtiger_servicecontracts', 1, '1', 'planned_duration', 'Planned Duration', 1, 2, '', 100, 13, 89, 2, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(35, 556, 'actual_duration', 'vtiger_servicecontracts', 1, '1', 'actual_duration', 'Actual Duration', 1, 2, '', 100, 15, 89, 2, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(35, 557, 'contract_status', 'vtiger_servicecontracts', 1, '15', 'contract_status', 'Status', 1, 2, '', 100, 12, 89, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(35, 558, 'priority', 'vtiger_servicecontracts', 1, '15', 'contract_priority', 'Priority', 1, 2, '', 100, 14, 89, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(35, 559, 'contract_type', 'vtiger_servicecontracts', 1, '15', 'contract_type', 'Type', 1, 2, '', 100, 5, 89, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(35, 560, 'progress', 'vtiger_servicecontracts', 1, '9', 'progress', 'Progress', 1, 2, '', 100, 16, 89, 2, 'N~O~2~2', 3, 3, 'BAS', 0, '', 0, 0, 0),
(35, 561, 'contract_no', 'vtiger_servicecontracts', 1, '4', 'contract_no', 'Contract No', 1, 0, '', 100, 2, 89, 1, 'V~O', 3, 0, 'BAS', 0, '', 1, 0, 0),
(35, 562, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 17, 89, 3, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(35, 563, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 19, 89, 2, 'V~O', 3, 10, 'BAS', 0, '', 0, 0, 0),
(35, 564, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 20, 89, 6, 'C~O', 3, 11, 'BAS', 0, '', 0, 0, 0),
(35, 565, 'tags', 'vtiger_servicecontracts', 1, '1', 'tags', 'tags', 1, 2, '', 100, 21, 89, 6, 'V~O', 3, 12, 'BAS', 0, '', 0, 0, 0),
(36, 566, 'servicename', 'vtiger_service', 1, '2', 'servicename', 'Service Name', 1, 0, '', 100, 1, 91, 1, 'V~M', 0, 1, 'BAS', 1, '', 1, 0, 0),
(36, 567, 'service_no', 'vtiger_service', 1, '4', 'service_no', 'Service No', 1, 0, '', 100, 2, 91, 1, 'V~O', 3, 0, 'BAS', 0, '', 1, 0, 0),
(36, 568, 'discontinued', 'vtiger_service', 1, '56', 'discontinued', 'Service Active', 1, 2, '1', 100, 4, 91, 1, 'V~O', 2, 3, 'BAS', 1, '', 0, 0, 0),
(36, 569, 'sales_start_date', 'vtiger_service', 1, '5', 'sales_start_date', 'Sales Start Date', 1, 2, '', 100, 9, 91, 1, 'D~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 570, 'sales_end_date', 'vtiger_service', 1, '5', 'sales_end_date', 'Sales End Date', 1, 2, '', 100, 10, 91, 1, 'D~O~OTH~GE~sales_start_date~Sales Start Date', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 571, 'start_date', 'vtiger_service', 1, '5', 'start_date', 'Support Start Date', 1, 2, '', 100, 11, 91, 1, 'D~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 572, 'expiry_date', 'vtiger_service', 1, '5', 'expiry_date', 'Support Expiry Date', 1, 2, '', 100, 12, 91, 1, 'D~O~OTH~GE~start_date~Start Date', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 573, 'website', 'vtiger_service', 1, '17', 'website', 'Website', 1, 2, '', 100, 6, 91, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 574, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 13, 91, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(36, 575, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 14, 91, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(36, 576, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 91, 3, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(36, 577, 'service_usageunit', 'vtiger_service', 1, '15', 'service_usageunit', 'Usage Unit', 1, 2, '', 100, 3, 91, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 578, 'qty_per_unit', 'vtiger_service', 1, '1', 'qty_per_unit', 'No of Units', 1, 2, '', 100, 5, 91, 1, 'N~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(36, 579, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Owner', 1, 0, '', 100, 8, 91, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 580, 'servicecategory', 'vtiger_service', 1, '15', 'servicecategory', 'Service Category', 1, 2, '', 100, 7, 91, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 581, 'unit_price', 'vtiger_service', 1, '72', 'unit_price', 'Price', 1, 0, '', 100, 1, 92, 1, 'N~O', 2, 2, 'BAS', 0, '', 1, 0, 0),
(36, 582, 'taxclass', 'vtiger_service', 1, '83', 'taxclass', 'Taxes', 1, 2, '', 100, 4, 92, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(36, 583, 'commissionrate', 'vtiger_service', 1, '9', 'commissionrate', 'Commission Rate', 1, 2, '', 100, 2, 92, 1, 'N~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(36, 584, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 94, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 585, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 17, 91, 2, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(36, 586, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 18, 91, 6, 'C~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(36, 587, 'tags', 'vtiger_service', 1, '1', 'tags', 'tags', 1, 2, '', 100, 19, 91, 6, 'V~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(38, 588, 'asset_no', 'vtiger_assets', 1, '4', 'asset_no', 'Asset No', 1, 0, '', 100, 2, 95, 1, 'V~O', 3, 0, 'BAS', 0, '\n					', 1, 0, 0),
(38, 589, 'product', 'vtiger_assets', 1, '10', 'product', 'Product Name', 1, 2, '', 100, 3, 95, 1, 'V~M', 0, 3, 'BAS', 1, '\n					', 1, 0, 0),
(38, 590, 'serialnumber', 'vtiger_assets', 1, '2', 'serialnumber', 'Serial Number', 1, 2, '', 100, 4, 95, 1, 'V~M', 0, 5, 'BAS', 1, '\n					', 0, 0, 0),
(38, 591, 'datesold', 'vtiger_assets', 1, '5', 'datesold', 'Date Sold', 1, 2, '', 100, 5, 95, 1, 'D~M~OTH~GE~datesold~Date Sold', 0, 0, 'BAS', 1, '\n					', 0, 0, 0),
(38, 592, 'dateinservice', 'vtiger_assets', 1, '5', 'dateinservice', 'Date in Service', 1, 2, '', 100, 6, 95, 1, 'D~M~OTH~GE~dateinservice~Date in Service', 0, 4, 'BAS', 1, '\n					', 0, 0, 0),
(38, 593, 'assetstatus', 'vtiger_assets', 1, '15', 'assetstatus', 'Status', 1, 2, '', 100, 7, 95, 1, 'V~M', 0, 0, 'BAS', 1, '\n					', 0, 0, 0),
(38, 594, 'tagnumber', 'vtiger_assets', 1, '2', 'tagnumber', 'Tag Number', 1, 2, '', 100, 8, 95, 1, 'V~O', 1, 0, 'BAS', 1, '\n					', 0, 0, 0),
(38, 595, 'invoiceid', 'vtiger_assets', 1, '10', 'invoiceid', 'Invoice Name', 1, 2, '', 100, 9, 95, 1, 'V~O', 1, 0, 'BAS', 1, '\n					', 0, 0, 0),
(38, 596, 'shippingmethod', 'vtiger_assets', 1, '2', 'shippingmethod', 'Shipping Method', 1, 2, '', 100, 10, 95, 1, 'V~O', 1, 0, 'BAS', 1, '\n					', 0, 0, 0),
(38, 597, 'shippingtrackingnumber', 'vtiger_assets', 1, '2', 'shippingtrackingnumber', 'Shipping Tracking Number', 1, 2, '', 100, 11, 95, 1, 'V~O', 1, 0, 'BAS', 1, '\n					', 0, 0, 0),
(38, 598, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 95, 1, 'V~M', 0, 2, 'BAS', 1, '\n					', 0, 0, 0),
(38, 599, 'assetname', 'vtiger_assets', 1, '1', 'assetname', 'Asset Name', 1, 0, '', 100, 12, 95, 1, 'V~M', 0, 6, 'BAS', 1, '\n					', 1, 0, 0),
(38, 600, 'account', 'vtiger_assets', 1, '10', 'account', 'Customer Name', 1, 2, '', 100, 13, 95, 1, 'V~M', 0, 0, 'BAS', 1, '\n					', 1, 0, 0),
(38, 601, 'contact', 'vtiger_assets', 1, '10', 'contact', 'Contact Name', 1, 2, '', 100, 14, 95, 1, 'V~O', 0, 0, 'BAS', 1, '\n					', 0, 0, 0),
(38, 602, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 14, 95, 2, 'DT~O', 3, 0, 'BAS', 0, '\n					', 0, 0, 0),
(38, 603, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 15, 95, 2, 'DT~O', 3, 0, 'BAS', 0, '\n					', 0, 0, 0),
(38, 604, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 16, 95, 3, 'V~O', 3, 0, 'BAS', 0, '\n					', 0, 0, 0),
(38, 605, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Notes', 1, 2, '', 100, 1, 97, 1, 'V~O', 1, 0, 'BAS', 1, '\n					', 0, 0, 0),
(38, 606, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 17, 95, 2, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(38, 607, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 18, 95, 6, 'C~O', 3, 8, 'BAS', 0, '', 0, 0, 0),
(38, 608, 'tags', 'vtiger_assets', 1, '1', 'tags', 'tags', 1, 2, '', 100, 19, 95, 6, 'V~O', 3, 9, 'BAS', 0, '', 0, 0, 0),
(42, 609, 'commentcontent', 'vtiger_modcomments', 1, '19', 'commentcontent', 'Comment', 1, 0, '', 100, 4, 98, 1, 'V~M', 0, 4, 'BAS', 2, '', 1, 0, 0),
(42, 610, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 1, 99, 1, 'V~M', 0, 1, 'BAS', 2, '', 1, 0, 0),
(42, 611, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 99, 2, 'DT~O', 0, 2, 'BAS', 0, '', 0, 0, 0),
(42, 612, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 99, 2, 'DT~O', 0, 3, 'BAS', 0, '', 0, 0, 0),
(42, 613, 'related_to', 'vtiger_modcomments', 1, '10', 'related_to', 'Related To', 1, 2, '', 100, 2, 99, 1, 'V~M', 2, 5, 'BAS', 2, '', 0, 0, 0),
(42, 614, 'smcreatorid', 'vtiger_crmentity', 1, '52', 'creator', 'Creator', 1, 2, '', 100, 4, 99, 2, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(42, 615, 'parent_comments', 'vtiger_modcomments', 1, '10', 'parent_comments', 'Related To Comments', 1, 2, '', 100, 7, 99, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(42, 616, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 5, 98, 2, 'V~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(43, 617, 'projectmilestonename', 'vtiger_projectmilestone', 1, '2', 'projectmilestonename', 'Project Milestone Name', 1, 2, '', 100, 1, 101, 1, 'V~M', 0, 1, 'BAS', 1, '', 1, 0, 0),
(43, 618, 'projectmilestonedate', 'vtiger_projectmilestone', 1, '5', 'projectmilestonedate', 'Milestone Date', 1, 2, '', 100, 5, 101, 1, 'D~O', 0, 3, 'BAS', 1, '', 1, 0, 0),
(43, 619, 'projectid', 'vtiger_projectmilestone', 1, '10', 'projectid', 'Related to', 1, 0, '', 100, 4, 101, 1, 'V~M', 0, 4, 'BAS', 1, '', 0, 0, 0),
(43, 620, 'projectmilestonetype', 'vtiger_projectmilestone', 1, '15', 'projectmilestonetype', 'Type', 1, 2, '', 100, 7, 101, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(43, 621, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 6, 101, 1, 'V~M', 0, 2, 'BAS', 1, '', 0, 0, 0),
(43, 622, 'projectmilestone_no', 'vtiger_projectmilestone', 2, '4', 'projectmilestone_no', 'Project Milestone No', 1, 0, '', 100, 2, 101, 1, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(43, 623, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 1, 102, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(43, 624, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 2, 102, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(43, 625, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 3, 102, 3, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(43, 626, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 103, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(43, 627, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 8, 101, 2, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(43, 628, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 9, 101, 6, 'C~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(43, 629, 'tags', 'vtiger_projectmilestone', 1, '1', 'tags', 'tags', 1, 2, '', 100, 10, 101, 6, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(44, 630, 'projecttaskname', 'vtiger_projecttask', 1, '2', 'projecttaskname', 'Project Task Name', 1, 2, '', 100, 1, 104, 1, 'V~M', 0, 1, 'BAS', 1, '', 1, 0, 0),
(44, 631, 'projecttasktype', 'vtiger_projecttask', 1, '15', 'projecttasktype', 'Type', 1, 2, '', 100, 4, 104, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(44, 632, 'projecttaskpriority', 'vtiger_projecttask', 1, '15', 'projecttaskpriority', 'Priority', 1, 2, '', 100, 3, 104, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(44, 633, 'projectid', 'vtiger_projecttask', 1, '10', 'projectid', 'Related to', 1, 0, '', 100, 6, 104, 1, 'V~M', 0, 5, 'BAS', 1, '', 0, 0, 0),
(44, 634, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 7, 104, 1, 'V~M', 0, 2, 'BAS', 1, '', 1, 0, 0),
(44, 635, 'projecttasknumber', 'vtiger_projecttask', 1, '7', 'projecttasknumber', 'Project Task Number', 1, 2, '', 100, 5, 104, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(44, 636, 'projecttask_no', 'vtiger_projecttask', 2, '4', 'projecttask_no', 'Project Task No', 1, 0, '', 100, 2, 104, 1, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(44, 637, 'projecttaskprogress', 'vtiger_projecttask', 1, '15', 'projecttaskprogress', 'Progress', 1, 2, '', 100, 1, 105, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(44, 638, 'projecttaskhours', 'vtiger_projecttask', 1, '7', 'projecttaskhours', 'Worked Hours', 1, 2, '', 100, 2, 105, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(44, 639, 'startdate', 'vtiger_projecttask', 1, '5', 'startdate', 'Start Date', 1, 2, '', 100, 3, 105, 1, 'D~O', 0, 3, 'BAS', 1, '', 1, 0, 0),
(44, 640, 'enddate', 'vtiger_projecttask', 1, '5', 'enddate', 'End Date', 1, 2, '', 100, 4, 105, 1, 'D~O~OTH~GE~startdate~Start Date', 1, 0, 'BAS', 1, '', 1, 0, 0),
(44, 641, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 5, 105, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(44, 642, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 6, 105, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(44, 643, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 105, 3, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(44, 644, 'description', 'vtiger_crmentity', 1, '19', 'description', 'description', 1, 2, '', 100, 1, 106, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(44, 645, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 8, 104, 2, 'V~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(44, 646, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 9, 104, 6, 'C~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(44, 647, 'tags', 'vtiger_projecttask', 1, '1', 'tags', 'tags', 1, 2, '', 100, 10, 104, 6, 'V~O', 3, 8, 'BAS', 0, '', 0, 0, 0),
(45, 648, 'projectname', 'vtiger_project', 1, '2', 'projectname', 'Project Name', 1, 2, '', 100, 1, 107, 1, 'V~M', 0, 1, 'BAS', 1, '', 1, 0, 0),
(45, 649, 'startdate', 'vtiger_project', 1, '23', 'startdate', 'Start Date', 1, 2, '', 100, 3, 107, 1, 'D~O', 0, 3, 'BAS', 1, '', 1, 0, 0),
(45, 650, 'targetenddate', 'vtiger_project', 1, '23', 'targetenddate', 'Target End Date', 1, 2, '', 100, 5, 107, 1, 'D~O~OTH~GE~startdate~Start Date', 0, 4, 'BAS', 1, '', 1, 0, 0),
(45, 651, 'actualenddate', 'vtiger_project', 1, '23', 'actualenddate', 'Actual End Date', 1, 2, '', 100, 6, 107, 1, 'D~O~OTH~GE~startdate~Start Date', 1, 0, 'BAS', 1, '', 0, 0, 0),
(45, 652, 'projectstatus', 'vtiger_project', 1, '15', 'projectstatus', 'Status', 1, 2, '', 100, 7, 107, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(45, 653, 'projecttype', 'vtiger_project', 1, '15', 'projecttype', 'Type', 1, 2, '', 100, 8, 107, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(45, 654, 'linktoaccountscontacts', 'vtiger_project', 1, '10', 'linktoaccountscontacts', 'Related to', 1, 2, '', 100, 9, 107, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 1, 0),
(45, 655, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 4, 107, 1, 'V~M', 0, 2, 'BAS', 1, '', 1, 0, 0),
(45, 656, 'project_no', 'vtiger_project', 2, '4', 'project_no', 'Project No', 1, 0, '', 100, 2, 107, 1, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(45, 657, 'targetbudget', 'vtiger_project', 1, '7', 'targetbudget', 'Target Budget', 1, 2, '', 100, 1, 108, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(45, 658, 'projecturl', 'vtiger_project', 1, '17', 'projecturl', 'Project Url', 1, 2, '', 100, 2, 108, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(45, 659, 'projectpriority', 'vtiger_project', 1, '15', 'projectpriority', 'Priority', 1, 2, '', 100, 3, 108, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0);
INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`, `summaryfield`, `headerfield`, `isunique`) VALUES
(45, 660, 'progress', 'vtiger_project', 1, '15', 'progress', 'Progress', 1, 2, '', 100, 4, 108, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(45, 661, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 5, 108, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(45, 662, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 6, 108, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(45, 663, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 108, 3, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(45, 664, 'description', 'vtiger_crmentity', 1, '19', 'description', 'Description', 1, 2, '', 100, 1, 109, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(45, 665, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 10, 107, 2, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(45, 666, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 11, 107, 6, 'C~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(45, 667, 'tags', 'vtiger_project', 1, '1', 'tags', 'tags', 1, 2, '', 100, 12, 107, 6, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(47, 668, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 0, '', 100, 2, 110, 1, 'V~M', 1, 0, 'BAS', 1, '', 1, 0, 0),
(47, 669, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 5, 110, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(47, 670, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 6, 110, 2, 'DT~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(47, 671, 'message', 'vtiger_smsnotifier', 1, '21', 'message', 'message', 1, 0, '', 100, 1, 110, 1, 'V~M', 1, 0, 'BAS', 1, '', 1, 0, 0),
(47, 672, 'modifiedby', 'vtiger_crmentity', 1, '52', 'modifiedby', 'Last Modified By', 1, 0, '', 100, 7, 110, 3, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(47, 673, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 8, 110, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(2, 674, 'forecast_amount', 'vtiger_potential', 1, '71', 'forecast_amount', 'Forecast Amount', 1, 2, '', 100, 18, 1, 1, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(29, 675, 'no_of_currency_decimals', 'vtiger_users', 1, '16', 'no_of_currency_decimals', 'Number Of Currency Decimals', 1, 2, '2', 100, 6, 78, 1, 'V~O', 1, 0, 'BAS', 1, '<b>Currency - Number of Decimal places</b> <br/><br/>Number of decimal places specifies how many number of decimals will be shown after decimal separator.<br/><b>Eg:</b> 123.00', 0, 0, 0),
(23, 676, 'productid', 'vtiger_inventoryproductrel', 1, '10', 'productid', 'Item Name', 0, 2, '', 100, 1, 113, 5, 'V~M', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 677, 'quantity', 'vtiger_inventoryproductrel', 1, '7', 'quantity', 'Quantity', 0, 2, '', 100, 2, 113, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 678, 'listprice', 'vtiger_inventoryproductrel', 1, '71', 'listprice', 'List Price', 0, 2, '', 100, 3, 113, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 679, 'comment', 'vtiger_inventoryproductrel', 1, '19', 'comment', 'Item Comment', 0, 2, '', 100, 4, 113, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 680, 'discount_amount', 'vtiger_inventoryproductrel', 1, '71', 'discount_amount', 'Item Discount Amount', 0, 2, '', 100, 5, 113, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 681, 'discount_percent', 'vtiger_inventoryproductrel', 1, '7', 'discount_percent', 'Item Discount Percent', 0, 2, '', 100, 6, 113, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 682, 'tax1', 'vtiger_inventoryproductrel', 1, '83', 'tax1', 'VAT', 0, 2, '', 100, 7, 113, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 683, 'tax2', 'vtiger_inventoryproductrel', 1, '83', 'tax2', 'Sales', 0, 2, '', 100, 8, 113, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 684, 'tax3', 'vtiger_inventoryproductrel', 1, '83', 'tax3', 'Service', 0, 2, '', 100, 9, 113, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 685, 'productid', 'vtiger_inventoryproductrel', 1, '10', 'productid', 'Item Name', 0, 2, '', 100, 1, 114, 5, 'V~M', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 686, 'quantity', 'vtiger_inventoryproductrel', 1, '7', 'quantity', 'Quantity', 0, 2, '', 100, 2, 114, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 687, 'listprice', 'vtiger_inventoryproductrel', 1, '71', 'listprice', 'List Price', 0, 2, '', 100, 3, 114, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 688, 'comment', 'vtiger_inventoryproductrel', 1, '19', 'comment', 'Item Comment', 0, 2, '', 100, 4, 114, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 689, 'discount_amount', 'vtiger_inventoryproductrel', 1, '71', 'discount_amount', 'Item Discount Amount', 0, 2, '', 100, 5, 114, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 690, 'discount_percent', 'vtiger_inventoryproductrel', 1, '7', 'discount_percent', 'Item Discount Percent', 0, 2, '', 100, 6, 114, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 691, 'tax1', 'vtiger_inventoryproductrel', 1, '83', 'tax1', 'VAT', 0, 2, '', 100, 7, 114, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 692, 'tax2', 'vtiger_inventoryproductrel', 1, '83', 'tax2', 'Sales', 0, 2, '', 100, 8, 114, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 693, 'tax3', 'vtiger_inventoryproductrel', 1, '83', 'tax3', 'Service', 0, 2, '', 100, 9, 114, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 694, 'productid', 'vtiger_inventoryproductrel', 1, '10', 'productid', 'Item Name', 0, 2, '', 100, 1, 115, 5, 'V~M', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 695, 'quantity', 'vtiger_inventoryproductrel', 1, '7', 'quantity', 'Quantity', 0, 2, '', 100, 2, 115, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 696, 'listprice', 'vtiger_inventoryproductrel', 1, '71', 'listprice', 'List Price', 0, 2, '', 100, 3, 115, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 697, 'comment', 'vtiger_inventoryproductrel', 1, '19', 'comment', 'Item Comment', 0, 2, '', 100, 4, 115, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 698, 'discount_amount', 'vtiger_inventoryproductrel', 1, '71', 'discount_amount', 'Item Discount Amount', 0, 2, '', 100, 5, 115, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 699, 'discount_percent', 'vtiger_inventoryproductrel', 1, '7', 'discount_percent', 'Item Discount Percent', 0, 2, '', 100, 6, 115, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 700, 'tax1', 'vtiger_inventoryproductrel', 1, '83', 'tax1', 'VAT', 0, 2, '', 100, 7, 115, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 701, 'tax2', 'vtiger_inventoryproductrel', 1, '83', 'tax2', 'Sales', 0, 2, '', 100, 8, 115, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 702, 'tax3', 'vtiger_inventoryproductrel', 1, '83', 'tax3', 'Service', 0, 2, '', 100, 9, 115, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 703, 'productid', 'vtiger_inventoryproductrel', 1, '10', 'productid', 'Item Name', 0, 2, '', 100, 1, 116, 5, 'V~M', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 704, 'quantity', 'vtiger_inventoryproductrel', 1, '7', 'quantity', 'Quantity', 0, 2, '', 100, 2, 116, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 705, 'listprice', 'vtiger_inventoryproductrel', 1, '71', 'listprice', 'List Price', 0, 2, '', 100, 3, 116, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 706, 'comment', 'vtiger_inventoryproductrel', 1, '19', 'comment', 'Item Comment', 0, 2, '', 100, 4, 116, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 707, 'discount_amount', 'vtiger_inventoryproductrel', 1, '71', 'discount_amount', 'Item Discount Amount', 0, 2, '', 100, 5, 116, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 708, 'discount_percent', 'vtiger_inventoryproductrel', 1, '7', 'discount_percent', 'Item Discount Percent', 0, 2, '', 100, 6, 116, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 709, 'tax1', 'vtiger_inventoryproductrel', 1, '83', 'tax1', 'VAT', 0, 2, '', 100, 7, 116, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 710, 'tax2', 'vtiger_inventoryproductrel', 1, '83', 'tax2', 'Sales', 0, 2, '', 100, 8, 116, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 711, 'tax3', 'vtiger_inventoryproductrel', 1, '83', 'tax3', 'Service', 0, 2, '', 100, 9, 116, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(29, 712, 'truncate_trailing_zeros', 'vtiger_users', 1, '56', 'truncate_trailing_zeros', 'Truncate Trailing Zeros', 1, 2, '0', 100, 7, 78, 1, 'V~O', 1, 0, 'BAS', 1, '<b> Truncate Trailing Zeros </b> <br/><br/>It truncated trailing 0s in any of Currency, Decimal and Percentage Field types<br/><br/><b>Ex:</b><br/>If value is 89.00000 then <br/>decimal and Percentage fields were shows 89<br/>currency field type - shows 89.00<br/>', 0, 0, 0),
(44, 713, 'projecttaskstatus', 'vtiger_projecttask', 1, '15', 'projecttaskstatus', 'Status', 1, 2, '', 100, 11, 104, 1, 'V~O', 0, 9, 'BAS', 1, '', 0, 0, 0),
(42, 714, 'customer', 'vtiger_modcomments', 1, '10', 'customer', 'Customer', 1, 2, '', 100, 6, 98, 3, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 715, 'dayoftheweek', 'vtiger_users', 1, '16', 'dayoftheweek', 'Starting Day of the week', 1, 2, 'Monday', 100, 1, 118, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 716, 'callduration', 'vtiger_users', 1, '16', 'callduration', 'Default Call Duration', 1, 2, '5', 100, 7, 118, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 717, 'othereventduration', 'vtiger_users', 1, '16', 'othereventduration', 'Other Event Duration', 1, 2, '5', 100, 8, 118, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(23, 718, 'pre_tax_total', 'vtiger_invoice', 1, '72', 'pre_tax_total', 'Pre Tax Total', 1, 2, '', 100, 23, 67, 3, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(22, 719, 'pre_tax_total', 'vtiger_salesorder', 1, '72', 'pre_tax_total', 'Pre Tax Total', 1, 2, '', 100, 23, 61, 3, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(21, 720, 'pre_tax_total', 'vtiger_purchaseorder', 1, '72', 'pre_tax_total', 'Pre Tax Total', 1, 2, '', 100, 23, 55, 3, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(20, 721, 'pre_tax_total', 'vtiger_quotes', 1, '72', 'pre_tax_total', 'Pre Tax Total', 1, 2, '', 100, 23, 49, 3, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 722, 'calendarsharedtype', 'vtiger_users', 1, '16', 'calendarsharedtype', 'Calendar Shared Type', 1, 2, 'Public', 100, 12, 118, 3, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(6, 723, 'isconvertedfromlead', 'vtiger_account', 1, '56', 'isconvertedfromlead', 'Is Converted From Lead', 1, 2, 'no', 100, 24, 9, 1, 'C~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(4, 724, 'isconvertedfromlead', 'vtiger_contactdetails', 1, '56', 'isconvertedfromlead', 'Is Converted From Lead', 1, 2, 'no', 100, 29, 4, 1, 'C~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(2, 725, 'isconvertedfromlead', 'vtiger_potential', 1, '56', 'isconvertedfromlead', 'Is Converted From Lead', 1, 2, 'no', 100, 19, 1, 1, 'C~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 726, 'default_record_view', 'vtiger_users', 1, '16', 'default_record_view', 'Default Record View', 1, 2, 'Summary', 100, 19, 79, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(23, 727, 'received', 'vtiger_invoice', 1, '72', 'received', 'Received', 1, 2, '0', 100, 24, 67, 3, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(23, 728, 'balance', 'vtiger_invoice', 1, '72', 'balance', 'Balance', 1, 2, '0', 100, 25, 67, 3, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(21, 729, 'paid', 'vtiger_purchaseorder', 1, '72', 'paid', 'Paid', 1, 2, '0', 100, 24, 55, 3, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(21, 730, 'balance', 'vtiger_purchaseorder', 1, '72', 'balance', 'Balance', 1, 2, '0', 100, 25, 55, 3, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(18, 731, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 13, 42, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(7, 732, 'emailoptout', 'vtiger_leaddetails', 1, '56', 'emailoptout', 'Email Opt Out', 1, 0, '', 100, 24, 13, 1, 'C~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(42, 733, 'userid', 'vtiger_modcomments', 1, '10', 'userid', 'UserId', 1, 2, '', 100, 7, 98, 3, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(42, 734, 'reasontoedit', 'vtiger_modcomments', 1, '19', 'reasontoedit', 'ReasonToEdit', 1, 2, '', 100, 8, 98, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(23, 735, 's_h_percent', 'vtiger_invoice', 1, '1', 'hdnS_H_Percent', 'S&H Percent', 0, 2, '', 100, 10, 113, 5, 'N~O', 0, 1, 'BAS', 0, '', 0, 0, 0),
(20, 736, 's_h_percent', 'vtiger_quotes', 1, '1', 'hdnS_H_Percent', 'S&H Percent', 0, 2, '', 100, 10, 116, 5, 'N~O', 0, 1, 'BAS', 0, '', 0, 0, 0),
(21, 737, 's_h_percent', 'vtiger_purchaseorder', 1, '1', 'hdnS_H_Percent', 'S&H Percent', 0, 2, '', 100, 10, 115, 5, 'N~O', 0, 1, 'BAS', 0, '', 0, 0, 0),
(22, 738, 's_h_percent', 'vtiger_salesorder', 1, '1', 'hdnS_H_Percent', 'S&H Percent', 0, 2, '', 100, 10, 114, 5, 'N~O', 0, 1, 'BAS', 0, '', 0, 0, 0),
(29, 739, 'leftpanelhide', 'vtiger_users', 1, '56', 'leftpanelhide', 'Left Panel Hide', 1, 2, '0', 100, 20, 79, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(2, 740, 'contact_id', 'vtiger_potential', 1, '10', 'contact_id', 'Contact Name', 1, 2, '', 100, 4, 1, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(13, 741, 'contact_id', 'vtiger_troubletickets', 1, '10', 'contact_id', 'Contact Name', 1, 2, '', 100, 3, 25, 1, 'V~O', 1, 0, 'BAS', 1, '', 1, 0, 0),
(29, 742, 'rowheight', 'vtiger_users', 1, '16', 'rowheight', 'Row Height', 1, 2, 'medium', 100, 21, 79, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 743, 'defaulteventstatus', 'vtiger_users', 1, '15', 'defaulteventstatus', 'Default Event Status', 1, 2, 'Planned', 100, 9, 118, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 744, 'defaultactivitytype', 'vtiger_users', 1, '15', 'defaultactivitytype', 'Default Activity Type', 1, 2, 'Call', 100, 10, 118, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 745, 'hidecompletedevents', 'vtiger_users', 1, '56', 'hidecompletedevents', 'LBL_HIDE_COMPLETED_EVENTS', 1, 2, '0', 100, 13, 118, 1, 'C~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(14, 772, 'purchase_cost', 'vtiger_products', 1, '71', 'purchase_cost', 'Purchase Cost', 1, 0, '', 100, 5, 32, 1, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(36, 773, 'purchase_cost', 'vtiger_service', 1, '71', 'purchase_cost', 'Purchase Cost', 1, 0, '', 100, 5, 92, 1, 'N~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(23, 774, 'potential_id', 'vtiger_invoice', 1, '10', 'potential_id', 'Potential Name', 1, 2, '', 100, 26, 67, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(29, 775, 'defaultcalendarview', 'vtiger_users', 1, '16', 'defaultcalendarview', 'Default Calendar View', 1, 0, 'MyCalendar', 100, 14, 118, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(23, 776, 'image', 'vtiger_inventoryproductrel', 1, '56', 'image', 'Image', 0, 1, '', 100, 14, 113, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 777, 'purchase_cost', 'vtiger_inventoryproductrel', 1, '71', 'purchase_cost', 'Purchase Cost', 0, 1, '', 100, 15, 113, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 778, 'margin', 'vtiger_inventoryproductrel', 1, '71', 'margin', 'Margin', 0, 1, '', 100, 16, 113, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 779, 'image', 'vtiger_inventoryproductrel', 1, '56', 'image', 'Image', 0, 1, '', 100, 15, 116, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 780, 'purchase_cost', 'vtiger_inventoryproductrel', 1, '71', 'purchase_cost', 'Purchase Cost', 0, 1, '', 100, 16, 116, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(20, 781, 'margin', 'vtiger_inventoryproductrel', 1, '71', 'margin', 'Margin', 0, 1, '', 100, 17, 116, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 782, 'image', 'vtiger_inventoryproductrel', 1, '56', 'image', 'Image', 0, 1, '', 100, 15, 115, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 783, 'image', 'vtiger_inventoryproductrel', 1, '56', 'image', 'Image', 0, 1, '', 100, 16, 114, 5, 'V~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 784, 'purchase_cost', 'vtiger_inventoryproductrel', 1, '71', 'purchase_cost', 'Purchase Cost', 0, 1, '', 100, 17, 114, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 785, 'margin', 'vtiger_inventoryproductrel', 1, '71', 'margin', 'Margin', 0, 1, '', 100, 18, 114, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(42, 786, 'is_private', 'vtiger_modcomments', 1, '7', 'is_private', 'Is Private', 1, 2, '', 100, 9, 98, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(42, 787, 'filename', 'vtiger_modcomments', 1, '61', 'filename', 'Attachment', 1, 0, '', 100, 10, 98, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(42, 788, 'related_email_id', 'vtiger_modcomments', 1, '1', 'related_email_id', 'Related Email Id', 1, 2, '0', 100, 11, 98, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(2, 789, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 1, 2, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(4, 790, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 30, 4, 2, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(6, 791, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 25, 9, 2, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(7, 792, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 25, 13, 2, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(8, 793, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 13, 17, 2, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(9, 794, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 23, 19, 2, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(10, 795, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 13, 21, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(13, 796, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 18, 25, 2, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(14, 797, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 23, 31, 2, 'V~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(15, 798, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 9, 37, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(16, 799, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 23, 39, 2, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(18, 800, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 14, 42, 2, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(19, 801, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 8, 46, 2, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(20, 802, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 24, 49, 2, 'V~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(21, 803, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 26, 55, 2, 'V~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(22, 804, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 24, 61, 2, 'V~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(23, 805, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 27, 67, 2, 'V~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(26, 806, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 17, 74, 2, 'V~O', 3, 8, 'BAS', 0, '', 0, 0, 0),
(10, 807, 'click_count', 'vtiger_email_track', 1, '25', 'click_count', 'Click Count', 1, 2, '0', 100, 14, 21, 3, 'I~O', 0, 2, 'BAS', 0, '', 0, 0, 0),
(2, 808, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 1, 6, 'C~O', 3, 8, 'BAS', 0, '', 0, 0, 0),
(4, 809, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 31, 4, 6, 'C~O', 3, 8, 'BAS', 0, '', 0, 0, 0),
(6, 810, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 26, 9, 6, 'C~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(7, 811, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 26, 13, 6, 'C~O', 3, 8, 'BAS', 0, '', 0, 0, 0),
(8, 812, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 14, 17, 6, 'C~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(9, 813, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 24, 19, 6, 'C~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(10, 814, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 15, 21, 6, 'C~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(13, 815, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 19, 25, 6, 'C~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(14, 816, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 24, 31, 6, 'C~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(15, 817, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 10, 37, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(16, 818, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 24, 39, 6, 'C~O', 3, 8, 'BAS', 0, '', 0, 0, 0),
(18, 819, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 15, 42, 6, 'C~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(19, 820, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 9, 46, 6, 'C~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(20, 821, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 25, 49, 6, 'C~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(21, 822, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 27, 55, 6, 'C~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(22, 823, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 25, 61, 6, 'C~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(23, 824, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 28, 67, 6, 'C~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(26, 825, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 18, 74, 6, 'C~O', 3, 9, 'BAS', 0, '', 0, 0, 0),
(2, 826, 'tags', 'vtiger_potential', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 1, 6, 'V~O', 3, 9, 'BAS', 0, '', 0, 0, 0),
(4, 827, 'tags', 'vtiger_contactdetails', 1, '1', 'tags', 'tags', 1, 2, '', 100, 32, 4, 6, 'V~O', 3, 9, 'BAS', 0, '', 0, 0, 0),
(6, 828, 'tags', 'vtiger_account', 1, '1', 'tags', 'tags', 1, 2, '', 100, 27, 9, 6, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(7, 829, 'tags', 'vtiger_leaddetails', 1, '1', 'tags', 'tags', 1, 2, '', 100, 27, 13, 6, 'V~O', 3, 9, 'BAS', 0, '', 0, 0, 0),
(8, 830, 'tags', 'vtiger_notes', 1, '1', 'tags', 'tags', 1, 2, '', 100, 15, 17, 6, 'V~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(9, 831, 'tags', 'vtiger_activity', 1, '1', 'tags', 'tags', 1, 2, '', 100, 25, 19, 6, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(10, 832, 'tags', 'vtiger_activity', 1, '1', 'tags', 'tags', 1, 2, '', 100, 16, 21, 6, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(13, 833, 'tags', 'vtiger_troubletickets', 1, '1', 'tags', 'tags', 1, 2, '', 100, 20, 25, 6, 'V~O', 3, 7, 'BAS', 0, '', 0, 0, 0),
(14, 834, 'tags', 'vtiger_products', 1, '1', 'tags', 'tags', 1, 2, '', 100, 25, 31, 6, 'V~O', 3, 8, 'BAS', 0, '', 0, 0, 0),
(15, 835, 'tags', 'vtiger_faq', 1, '1', 'tags', 'tags', 1, 2, '', 100, 11, 37, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(16, 836, 'tags', 'vtiger_activity', 1, '1', 'tags', 'tags', 1, 2, '', 100, 25, 39, 6, 'V~O', 3, 9, 'BAS', 0, '', 0, 0, 0),
(18, 837, 'tags', 'vtiger_vendor', 1, '1', 'tags', 'tags', 1, 2, '', 100, 16, 42, 6, 'V~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(19, 838, 'tags', 'vtiger_pricebook', 1, '1', 'tags', 'tags', 1, 2, '', 100, 10, 46, 6, 'V~O', 3, 6, 'BAS', 0, '', 0, 0, 0),
(20, 839, 'tags', 'vtiger_quotes', 1, '1', 'tags', 'tags', 1, 2, '', 100, 26, 49, 6, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(21, 840, 'tags', 'vtiger_purchaseorder', 1, '1', 'tags', 'tags', 1, 2, '', 100, 28, 55, 6, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(22, 841, 'tags', 'vtiger_salesorder', 1, '1', 'tags', 'tags', 1, 2, '', 100, 26, 61, 6, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(23, 842, 'tags', 'vtiger_invoice', 1, '1', 'tags', 'tags', 1, 2, '', 100, 29, 67, 6, 'V~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(26, 843, 'tags', 'vtiger_campaign', 1, '1', 'tags', 'tags', 1, 2, '', 100, 19, 74, 6, 'V~O', 3, 10, 'BAS', 0, '', 0, 0, 0),
(20, 844, 'region_id', 'vtiger_quotes', 1, '16', 'region_id', 'Tax Region', 0, 2, '', 100, 18, 116, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(21, 845, 'region_id', 'vtiger_purchaseorder', 1, '16', 'region_id', 'Tax Region', 0, 2, '', 100, 16, 115, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(22, 846, 'region_id', 'vtiger_salesorder', 1, '16', 'region_id', 'Tax Region', 0, 2, '', 100, 19, 114, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(23, 847, 'region_id', 'vtiger_invoice', 1, '16', 'region_id', 'Tax Region', 0, 2, '', 100, 17, 113, 5, 'N~O', 1, 0, 'BAS', 0, '', 0, 0, 0),
(45, 848, 'isconvertedfrompotential', 'vtiger_project', 1, '56', 'isconvertedfrompotential', 'Is Converted From Opportunity', 1, 2, '', 100, 13, 107, 1, 'C~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(45, 849, 'potentialid', 'vtiger_project', 1, '10', 'potentialid', 'Potential Name', 1, 2, '', 100, 14, 107, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(50, 850, 'name', 'vtiger_hrm_setting', 1, '2', 'name', 'Name', 1, 0, '', 100, 2, 121, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(50, 851, 'description', 'vtiger_hrm_setting', 1, '19', 'description', 'Description', 1, 0, '', 100, 2, 121, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(50, 852, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 121, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(50, 853, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 121, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(50, 854, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 121, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(50, 855, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 121, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(50, 856, 'tags', 'vtiger_hrm_setting', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 121, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(51, 857, 'name', 'vtiger_hrm_position', 1, '2', 'name', 'Name', 1, 0, '', 100, 2, 122, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(51, 858, 'description', 'vtiger_hrm_position', 1, '19', 'description', 'Description', 1, 0, '', 100, 2, 122, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(51, 859, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 122, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(51, 860, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 122, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(51, 861, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 122, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(51, 862, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 122, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(51, 863, 'tags', 'vtiger_hrm_position', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 122, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(52, 864, 'weight', 'vtiger_hrm_weight', 1, '2', 'weight', 'Weight', 1, 0, '', 100, 2, 123, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(52, 865, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 123, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(52, 866, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 123, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(52, 867, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 123, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(52, 868, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 123, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(52, 869, 'tags', 'vtiger_hrm_weight', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 123, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(53, 870, 'name', 'vtiger_hrm_settingdepartment', 1, '2', 'name', 'Name', 1, 0, '', 100, 1, 124, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(53, 871, 'description', 'vtiger_hrm_settingdepartment', 1, '19', 'description', 'Description', 1, 0, '', 100, 2, 124, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(53, 872, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 10, 124, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(53, 873, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 124, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(53, 874, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 19, 124, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(53, 875, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 20, 124, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(53, 876, 'tags', 'vtiger_hrm_settingdepartment', 1, '1', 'tags', 'tags', 1, 2, '', 100, 21, 124, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(54, 877, 'employ_id', 'vtiger_hrm_salaryreference', 1, '10', 'employ_id', 'Employee', 1, 2, '', 100, 1, 125, 1, 'V~M', 2, 0, 'BAS', 1, '', 1, 0, 0),
(54, 878, 'current_salary', 'vtiger_hrm_salaryreference', 1, '1', 'current_salary', 'Current Salary', 1, 0, '', 100, 2, 125, 1, 'V~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(54, 879, 'before_increase_date', 'vtiger_hrm_salaryreference', 1, '5', 'before_increase_date', 'Increase Date Before', 1, 0, '', 100, 3, 125, 1, 'D~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(54, 880, 'salary_after', 'vtiger_hrm_salaryreference', 1, '1', 'salary_after', 'After Increase Salary', 1, 0, '', 100, 4, 125, 1, 'V~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(54, 881, 'reviewer', 'vtiger_hrm_salaryreference', 1, '53', 'reviewer', 'Reviewer', 1, 2, '', 100, 5, 125, 1, 'V~M', 2, 2, 'BAS', 1, '', 1, 0, 0),
(54, 882, 'hr_salary_action', 'vtiger_hrm_salaryreference', 1, '15', 'hr_salary_action', 'HR Action', 1, 0, '', 100, 6, 125, 1, 'V~O', 3, 0, 'BAS', 1, '', 1, 0, 0),
(54, 883, 'note', 'vtiger_hrm_salaryreference', 1, '19', 'note', 'Note', 1, 0, '', 100, 7, 125, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(54, 884, 'review_date', 'vtiger_hrm_salaryreference', 1, '5', 'review_date', 'Review date', 1, 0, '', 100, 7, 125, 1, 'D~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(54, 885, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 10, 125, 1, 'V~M', 2, 2, 'BAS', 1, '', 0, 0, 0),
(54, 886, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 125, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(54, 887, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 125, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(54, 888, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 125, 2, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(54, 889, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 125, 6, 'C~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(54, 890, 'tags', 'vtiger_hrm_salaryreference', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 125, 6, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(55, 891, 'task_name', 'vtiger_hrm_rating', 1, '2', 'task_name', 'Task Name', 1, 0, '', 100, 2, 126, 1, 'V~M', 3, 0, 'BAS', 1, '', 0, 0, 0),
(55, 892, 'rating_weight', 'vtiger_hrm_rating', 1, '10', 'rating_weight', 'Weight', 1, 0, '', 100, 2, 126, 1, 'V~O', 3, 0, 'BAS', 1, '', 0, 0, 0),
(55, 893, 'detail', 'vtiger_hrm_rating', 1, '19', 'detail', 'Details', 1, 0, '', 100, 2, 126, 1, 'V~O', 3, 0, 'BAS', 1, '', 0, 0, 0),
(55, 894, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 126, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(55, 895, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 126, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(55, 896, 'ranking_1', 'vtiger_hrm_rating', 1, '1', 'ranking_1', '1', 1, 0, '', 100, 2, 127, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(55, 897, 'ranking_2', 'vtiger_hrm_rating', 1, '1', 'ranking_2', '2', 1, 0, '', 100, 2, 127, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(55, 898, 'ranking_3', 'vtiger_hrm_rating', 1, '1', 'ranking_3', '3', 1, 0, '', 100, 2, 127, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(55, 899, 'ranking_4', 'vtiger_hrm_rating', 1, '1', 'ranking_4', '4', 1, 0, '', 100, 2, 127, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(55, 900, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 19, 126, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(55, 901, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 20, 126, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(55, 902, 'tags', 'vtiger_hrm_rating', 1, '1', 'tags', 'tags', 1, 2, '', 100, 21, 126, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(56, 903, 'name', 'vtiger_hrm_jd', 1, '2', 'name', 'Name', 1, 0, '', 100, 1, 128, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(56, 904, 'jd_status', 'vtiger_hrm_jd', 1, '15', 'jd_status', 'Status', 1, 0, '', 100, 2, 128, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(56, 905, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created', 1, 0, '', 100, 3, 128, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(56, 906, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Created By', 1, 2, '', 100, 4, 128, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(56, 907, 'jd_category', 'vtiger_hrm_jd', 1, '15', 'jd_category', 'Category', 1, 0, '', 100, 5, 128, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(56, 908, 'jd_classify', 'vtiger_hrm_jd', 1, '15', 'jd_classify', 'Classify', 1, 0, '', 100, 6, 128, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(56, 909, 'description', 'vtiger_hrm_jd', 1, '19', 'description', 'Description', 1, 0, '', 100, 7, 128, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(56, 910, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 128, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(56, 911, 'position', 'vtiger_hrm_jd', 1, '10', 'position', 'Position', 1, 2, '', 100, 19, 128, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(56, 912, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 128, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(56, 913, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 128, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(56, 914, 'tags', 'vtiger_hrm_jd', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 128, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(57, 915, 'qcm_title', 'vtiger_hrm_qcm', 1, '2', 'qcm_title', 'QCM Title', 1, 0, '', 100, 1, 129, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(57, 916, 'qcm_code', 'vtiger_hrm_qcm', 1, '4', 'qcm_code', 'QCM Code', 1, 0, '', 100, 2, 129, 1, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(57, 917, 'qcm_category', 'vtiger_hrm_qcm', 1, '15', 'qcm_category', 'Category', 1, 0, '', 100, 3, 129, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(57, 918, 'qcm_classify', 'vtiger_hrm_qcm', 1, '15', 'qcm_classify', 'Classify', 1, 0, '', 100, 4, 129, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(57, 919, 'qcm_created', 'vtiger_hrm_qcm', 1, '5', 'qcm_created', 'Created', 1, 0, '', 100, 5, 129, 1, 'D~O', 3, 0, 'BAS', 1, '', 0, 0, 0),
(57, 920, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Created by', 1, 2, '', 100, 6, 129, 1, 'V~O', 2, 2, 'BAS', 1, '', 0, 0, 0),
(57, 921, 'qcm_status', 'vtiger_hrm_qcm', 1, '15', 'qcm_status', 'Status', 1, 0, '', 100, 7, 129, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(57, 922, 'fined', 'vtiger_hrm_qcm', 1, '1', 'fined', 'Fined', 1, 0, '', 100, 8, 129, 1, 'V~O', 3, 0, 'BAS', 1, '', 0, 0, 0),
(57, 923, 'description', 'vtiger_hrm_qcm', 1, '19', 'description', 'Description', 1, 0, '', 100, 9, 129, 1, 'V~O', 3, 0, 'BAS', 1, '', 0, 0, 0),
(57, 924, 'position', 'vtiger_hrm_qcm', 1, '10', 'position', 'Position', 1, 2, '', 100, 4, 129, 1, 'V~O', 3, 0, 'BAS', 1, '', 0, 0, 0),
(57, 925, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 129, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(57, 926, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 129, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(57, 927, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 129, 2, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(57, 928, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 129, 6, 'C~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(57, 929, 'tags', 'vtiger_hrm_qcm', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 129, 6, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(58, 930, 'kpi_name', 'vtiger_hrm_kpi', 1, '2', 'kpi_name', 'KPI Name', 1, 0, '', 100, 1, 130, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(58, 931, 'kpi_type', 'vtiger_hrm_kpi', 2, '15', 'kpi_type', 'Type', 1, 2, '', 100, 2, 130, 1, 'V~M', 2, 0, 'BAS', 1, '', 1, 0, 0),
(58, 932, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 3, 130, 1, 'V~M', 2, 2, 'BAS', 1, '', 0, 0, 0),
(58, 933, 'kpi_manager', 'vtiger_hrm_kpi', 1, '53', 'kpi_manager', 'Manager', 1, 2, '', 100, 4, 130, 1, 'V~M', 2, 2, 'BAS', 1, '', 0, 0, 0),
(58, 934, 'api_manager', 'vtiger_hrm_kpi', 1, '101', 'api_manager', 'Manager', 1, 2, '', 100, 4, 130, 1, 'V~M', 2, 2, 'BAS', 1, '', 0, 0, 0),
(58, 935, 'kpi_department', 'vtiger_hrm_kpi', 2, '15', 'kpi_department', 'Department', 1, 2, '', 100, 5, 130, 1, 'V~M', 2, 0, 'BAS', 1, '', 1, 0, 0),
(58, 936, 'start_date', 'vtiger_hrm_kpi', 2, '5', 'start_date', 'Start Date', 1, 2, '', 100, 6, 130, 1, 'D~M', 2, 0, 'BAS', 1, '', 1, 0, 0),
(58, 937, 'kpi_status', 'vtiger_hrm_kpi', 2, '15', 'kpi_status', 'Status', 1, 2, '', 100, 7, 130, 1, 'V~M', 2, 0, 'BAS', 1, '', 1, 0, 0),
(58, 938, 'due_date', 'vtiger_hrm_kpi', 2, '5', 'due_date', 'Due Date', 1, 2, '', 100, 8, 130, 1, 'D~M', 2, 0, 'BAS', 1, '', 1, 0, 0),
(58, 939, 'kpi_description', 'vtiger_hrm_kpi', 1, '19', 'kpi_description', 'KPI Description', 1, 0, '', 100, 9, 130, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(58, 940, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 10, 130, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(58, 941, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 11, 130, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(58, 942, 'cf_01', 'vtiger_hrm_kpi', 1, '1', 'cf_01', 'Target', 1, 0, '', 100, 12, 131, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(58, 943, 'cf_02', 'vtiger_hrm_kpi', 1, '1', 'cf_02', 'Actual', 1, 0, '', 100, 13, 131, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(58, 944, 'cf_03', 'vtiger_hrm_kpi', 1, '1', 'cf_03', 'Total Tickets', 1, 0, '', 100, 14, 131, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(58, 945, 'cf_04', 'vtiger_hrm_kpi', 1, '1', 'cf_04', 'Total Reviews', 1, 0, '', 100, 15, 131, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(58, 946, 'kpi_weight', 'vtiger_hrm_kpi', 1, '10', 'kpi_weight', 'Weight', 1, 0, '', 100, 16, 131, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(58, 947, 'kpi_ranking', 'vtiger_hrm_kpi', 1, '10', 'kpi_ranking', 'Ranking', 1, 0, '', 100, 18, 132, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(58, 948, 'cf_07', 'vtiger_hrm_kpi', 1, '1', 'cf_07', 'Bonus-Fined', 1, 0, '', 100, 19, 132, 1, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(58, 949, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 12, 130, 2, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(58, 950, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 13, 130, 6, 'C~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(58, 951, 'tags', 'vtiger_hrm_kpi', 1, '1', 'tags', 'tags', 1, 2, '', 100, 14, 130, 6, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(59, 952, 'email', 'vtiger_hrm_candidate', 1, '13', 'email', 'Primary Email', 1, 0, '', 100, 1, 133, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 953, 'firstname', 'vtiger_hrm_candidate', 1, '2', 'firstname', 'First Name', 1, 2, '', 100, 2, 133, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 954, 'lastname', 'vtiger_hrm_candidate', 1, '2', 'lastname', 'Last Name', 1, 0, '', 100, 3, 133, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 955, 'date_of_birth', 'vtiger_hrm_candidate', 1, '5', 'date_of_birth', 'Date of Birth', 1, 0, '', 100, 4, 133, 1, 'D~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 956, 'mobile', 'vtiger_hrm_candidate', 1, '1', 'mobile', 'Mobile Phone', 1, 0, '', 100, 5, 133, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 957, 'position', 'vtiger_hrm_candidate', 1, '10', 'position', 'Position', 1, 2, '', 100, 6, 133, 1, 'V~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(59, 958, 'description', 'vtiger_hrm_candidate', 1, '19', 'description', 'Description', 1, 0, '', 100, 7, 133, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 959, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 8, 133, 1, 'V~M', 2, 2, 'BAS', 1, '', 0, 0, 0),
(59, 960, 'application_date', 'vtiger_hrm_candidate', 1, '5', 'application_date', 'Application Date', 1, 0, '', 100, 9, 133, 1, 'D~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 961, 'candidate_resource_cv', 'vtiger_hrm_candidate', 1, '15', 'candidate_resource_cv', 'Resource CV', 1, 0, '', 100, 10, 133, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 962, 'candidate_action', 'vtiger_hrm_candidate', 1, '15', 'candidate_action', 'Action', 1, 0, '', 100, 11, 133, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(59, 963, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 133, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(59, 964, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 133, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(59, 965, 'status', 'vtiger_hrm_candidate', 1, '1', 'status', 'Status', 1, 0, '', 100, 12, 133, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 966, 'shortlist_note', 'vtiger_hrm_candidate', 1, '19', 'shortlist_note', 'Short list Notes', 1, 0, '', 100, 13, 134, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 967, 'reject_note', 'vtiger_hrm_candidate', 1, '19', 'reject_note', 'Reject Notes', 1, 0, '', 100, 14, 135, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 968, 'si_name', 'vtiger_hrm_candidate', 1, '53', 'si_name', 'Interviewer Name', 1, 0, '', 100, 15, 136, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 969, 'si_date', 'vtiger_hrm_candidate', 1, '5', 'si_date', 'Date', 1, 0, '', 100, 16, 136, 1, 'D~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 970, 'si_time', 'vtiger_hrm_candidate', 1, '2', 'si_time', 'Time', 1, 0, '', 100, 17, 136, 1, 'T~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 971, 'si_note', 'vtiger_hrm_candidate', 1, '19', 'si_note', 'Note', 1, 0, '', 100, 18, 136, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 972, 'mip_swork', 'vtiger_hrm_candidate', 1, '5', 'mip_swork', 'Start Work Date', 1, 0, '', 100, 19, 137, 1, 'D~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 973, 'mip_de_salary', 'vtiger_hrm_candidate', 1, '1', 'mip_de_salary', 'Desired Salary', 1, 0, '', 100, 20, 137, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 974, 'official_salary', 'vtiger_hrm_candidate', 1, '1', 'official_salary', 'Official Salary', 1, 0, '', 100, 21, 137, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 975, 'mip_probation', 'vtiger_hrm_candidate', 1, '1', 'mip_probation', 'Probationary Period', 1, 0, '', 100, 22, 137, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 976, 'mip_note', 'vtiger_hrm_candidate', 1, '19', 'mip_note', 'Note', 1, 0, '', 100, 23, 137, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 977, 'mif_note', 'vtiger_hrm_candidate', 1, '19', 'mif_note', 'Mark Interview Failed Note', 1, 0, '', 100, 24, 138, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 978, 'oj_note', 'vtiger_hrm_candidate', 1, '19', 'oj_note', 'Offer Job Note', 1, 0, '', 100, 25, 139, 1, 'V~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(59, 979, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 133, 2, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(59, 980, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 133, 6, 'C~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(59, 981, 'tags', 'vtiger_hrm_candidate', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 133, 6, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(60, 982, 'employ_id', 'vtiger_hrm_leave', 1, '10', 'employ_id', 'Employee', 1, 2, '', 100, 1, 140, 1, 'V~M', 2, 0, 'BAS', 1, '', 1, 0, 0),
(60, 983, 'from_date', 'vtiger_hrm_leave', 1, '5', 'from_date', 'From Date', 1, 0, '', 100, 2, 140, 1, 'D~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(60, 984, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 3, 140, 1, 'V~M', 2, 2, 'BAS', 1, '', 1, 0, 0),
(60, 985, 'to_date', 'vtiger_hrm_leave', 1, '5', 'to_date', 'To Date', 1, 0, '', 100, 4, 140, 1, 'D~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(60, 986, 'hrm_leave_type', 'vtiger_hrm_leave', 1, '15', 'hrm_leave_type', 'Leave Type', 1, 0, '', 100, 5, 140, 1, 'V~O', 3, 0, 'BAS', 1, '', 1, 0, 0),
(60, 987, 'partial_day', 'vtiger_hrm_leave', 1, '1', 'partial_day', 'Partial Days', 1, 0, '', 100, 6, 140, 1, 'V~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(60, 988, 'hrm_leave_action', 'vtiger_hrm_leave', 1, '15', 'hrm_leave_action', 'Action', 1, 0, '', 100, 7, 140, 1, 'V~O', 3, 0, 'BAS', 1, '', 1, 0, 0),
(60, 989, 'note', 'vtiger_hrm_leave', 1, '19', 'note', 'Note', 1, 0, '', 100, 16, 140, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(60, 990, 'hr', 'vtiger_hrm_leave', 1, '15', 'hr', 'HR', 1, 0, '', 100, 12, 140, 1, 'V~O', 2, 0, 'BAS', 0, '', 1, 0, 0),
(60, 991, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 0, '', 100, 17, 140, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(60, 992, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 19, 140, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(60, 993, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 20, 140, 2, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(60, 994, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 21, 140, 6, 'C~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(60, 995, 'tags', 'vtiger_hrm_leave', 1, '1', 'tags', 'tags', 1, 2, '', 100, 22, 140, 6, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(61, 996, 'firstname', 'vtiger_hrm_employee', 1, '2', 'firstname', 'First Name', 1, 0, '', 100, 1, 141, 1, 'V~M', 2, 0, 'BAS', 0, '', 1, 0, 0),
(61, 997, 'lastname', 'vtiger_hrm_employee', 1, '2', 'lastname', 'Last Name', 1, 0, '', 100, 2, 141, 1, 'V~M', 2, 0, 'BAS', 0, '', 1, 0, 0),
(61, 998, 'employ_gender', 'vtiger_hrm_employee', 1, '15', 'employ_gender', 'Gender', 1, 0, '', 100, 3, 141, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(61, 999, 'email', 'vtiger_hrm_employee', 1, '13', 'email', 'Email', 1, 0, '', 100, 4, 141, 1, 'E~M', 2, 0, 'BAS', 0, '', 1, 0, 0),
(61, 1000, 'user_id', 'vtiger_hrm_employee', 1, '3', 'user_id', 'User ID', 1, 0, '', 100, 5, 141, 1, 'V~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(61, 1001, 'date_of_birth', 'vtiger_hrm_employee', 1, '5', 'date_of_birth', 'Date of Birth', 1, 0, '', 100, 6, 141, 1, 'D~O', 2, 0, 'BAS', 0, '', 0, 0, 0),
(61, 1002, 'mobile', 'vtiger_hrm_employee', 1, '1', 'mobile', 'Mobile', 1, 0, '', 100, 7, 141, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1003, 'position', 'vtiger_hrm_employee', 1, '10', 'position', 'Position', 1, 0, '', 100, 8, 141, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1004, 'employ_marital_status', 'vtiger_hrm_employee', 1, '15', 'employ_marital_status', 'Marital Status', 1, 0, '', 100, 9, 141, 1, 'V~O', 2, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1005, 'address', 'vtiger_hrm_employee', 1, '1', 'address', 'Address', 1, 0, '', 100, 10, 141, 1, 'V~O', 2, 0, 'BAS', 0, '', 1, 0, 0),
(61, 1006, 'city', 'vtiger_hrm_employee', 1, '1', 'city', 'City', 1, 0, '', 100, 11, 141, 1, 'V~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(61, 1007, 'country', 'vtiger_hrm_employee', 1, '1', 'country', 'Country', 1, 0, '', 100, 12, 141, 1, 'V~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(61, 1008, 'smownerid', 'vtiger_crmentity', 1, '53', 'assigned_user_id', 'Assigned To', 1, 2, '', 100, 16, 141, 1, 'V~M', 2, 2, 'BAS', 1, '', 0, 0, 0),
(61, 1009, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created', 1, 0, '', 100, 17, 141, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(61, 1010, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 0, '', 100, 18, 141, 2, 'DT~O', 3, 0, 'BAS', 0, '', 0, 0, 0),
(61, 1011, 'flag', 'vtiger_hrm_employee', 1, '3', 'flag', 'Flag', 1, 2, '', 100, 19, 141, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1012, 'candidate_id', 'vtiger_hrm_employee', 1, '3', 'candidate_id', 'candidate', 1, 2, '', 100, 20, 141, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1013, 'action', 'vtiger_hrm_employee', 1, '3', 'action', 'action', 1, 2, '', 100, 21, 141, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1014, 'start_work_date', 'vtiger_hrm_employee', 1, '5', 'start_work_date', 'Start Work Date', 1, 2, '', 100, 22, 141, 1, 'D~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1015, 'employ_number', 'vtiger_hrm_employee', 1, '1', 'employ_number', 'Employee Number', 1, 2, '', 100, 23, 141, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1016, 'official_date', 'vtiger_hrm_employee', 1, '5', 'official_date', 'Official Working', 1, 2, '', 100, 24, 141, 1, 'D~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1017, 'desired_salary', 'vtiger_hrm_employee', 1, '1', 'desired_salary', 'Desired Salary', 1, 2, '', 100, 25, 141, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1018, 'probality_period', 'vtiger_hrm_employee', 1, '1', 'probality_period', 'Probationary Period', 1, 2, '', 100, 26, 141, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1019, 'official_salary', 'vtiger_hrm_employee', 1, '1', 'official_salary', 'Official Salary', 1, 2, '', 100, 27, 141, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1020, 'private_email', 'vtiger_hrm_employee', 1, '1', 'private_email', 'Private Email', 1, 2, '', 100, 28, 141, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(61, 1021, 'salary_department', 'vtiger_hrm_employee', 1, '10', 'salary_department', 'Salary Department', 1, 2, '', 100, 1, 141, 1, 'V~O', 2, 0, 'BAS', 1, '', 1, 0, 0),
(61, 1022, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 29, 141, 2, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(61, 1023, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 30, 141, 6, 'C~O', 3, 4, 'BAS', 0, '', 0, 0, 0),
(61, 1024, 'tags', 'vtiger_hrm_employee', 1, '1', 'tags', 'tags', 1, 2, '', 100, 31, 141, 6, 'V~O', 3, 5, 'BAS', 0, '', 0, 0, 0),
(63, 1097, 'makhachhang', 'vtiger_customerenterprise', 1, '8', 'makhachhang', 'Ma Khach Hang', 1, 2, '', 100, 1, 159, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1098, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 2, 159, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1099, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 3, 159, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1100, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 4, 159, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(63, 1101, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 5, 159, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0);
INSERT INTO `vtiger_field` (`tabid`, `fieldid`, `columnname`, `tablename`, `generatedtype`, `uitype`, `fieldname`, `fieldlabel`, `readonly`, `presence`, `defaultvalue`, `maximumlength`, `sequence`, `block`, `displaytype`, `typeofdata`, `quickcreate`, `quickcreatesequence`, `info_type`, `masseditable`, `helpinfo`, `summaryfield`, `headerfield`, `isunique`) VALUES
(63, 1102, 'tags', 'vtiger_customerenterprise', 1, '1', 'tags', 'tags', 1, 2, '', 100, 6, 159, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(63, 1104, 'cf_1103', 'vtiger_customerenterprisecf', 2, '1', 'cf_1103', 'Mã số thuế', 1, 2, '', 100, 7, 159, 1, 'V~O~LE~255', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1106, 'cf_1105', 'vtiger_customerenterprisecf', 2, '1', 'cf_1105', 'Tên khách hàng', 1, 2, '', 100, 8, 159, 1, 'V~M~LE~255', 2, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1108, 'cf_1107', 'vtiger_customerenterprisecf', 2, '1', 'cf_1107', 'Tên viết tắt', 1, 2, '', 100, 9, 159, 1, 'V~O~LE~10', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1110, 'cf_1109', 'vtiger_customerenterprisecf', 2, '1', 'cf_1109', 'Mã NS', 1, 2, '', 100, 10, 159, 1, 'V~O~LE~10', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1112, 'cf_1111', 'vtiger_customerenterprisecf', 2, '1', 'cf_1111', 'Mã số KD', 1, 2, '', 100, 11, 159, 1, 'V~O~LE~10', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1114, 'cf_1113', 'vtiger_customerenterprisecf', 2, '1', 'cf_1113', 'Điện thoại', 1, 2, '', 100, 12, 159, 1, 'V~O~LE~13', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1116, 'cf_1115', 'vtiger_customerenterprisecf', 2, '1', 'cf_1115', 'Fax', 1, 2, '', 100, 13, 159, 1, 'V~O~LE~50', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1120, 'cf_1119', 'vtiger_customerenterprisecf', 2, '1', 'cf_1119', 'Email', 1, 2, '', 100, 14, 159, 1, 'V~O~LE~255', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1122, 'cf_1121', 'vtiger_customerenterprisecf', 2, '16', 'cf_1121', 'Xưng hô', 1, 2, ' ', 100, 1, 161, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1124, 'cf_1123', 'vtiger_customerenterprisecf', 2, '1', 'cf_1123', 'Họ và Tên', 1, 2, '', 100, 2, 161, 1, 'V~O~LE~255', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1136, 'cf_1135', 'vtiger_customerenterprisecf', 2, '21', 'cf_1135', 'Ghi chú', 1, 2, '', 100, 1, 160, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1138, 'cf_1137', 'vtiger_customerenterprisecf', 2, '16', 'cf_1137', 'Phân loại khách hàng', 1, 2, ' ', 100, 1, 162, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1142, 'cf_1141', 'vtiger_customerenterprisecf', 2, '16', 'cf_1141', 'Phòng ban', 1, 2, ' ', 100, 9, 161, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1144, 'cf_1143', 'vtiger_customerenterprisecf', 2, '16', 'cf_1143', 'Chức danh', 1, 2, ' ', 100, 10, 161, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1146, 'cf_1145', 'vtiger_customerenterprisecf', 2, '16', 'cf_1145', 'Loại hình', 1, 2, ' ', 100, 11, 161, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1148, 'cf_1147', 'vtiger_customerenterprisecf', 2, '16', 'cf_1147', 'Loại công ty', 1, 2, ' ', 100, 2, 162, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1150, 'cf_1149', 'vtiger_customerenterprisecf', 2, '11', 'cf_1149', 'ĐT Di động', 1, 2, '', 100, 12, 161, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1152, 'cf_1151', 'vtiger_customerenterprisecf', 2, '11', 'cf_1151', 'ĐT Cơ quan', 1, 2, '', 100, 13, 161, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1154, 'cf_1153', 'vtiger_customerenterprisecf', 2, '11', 'cf_1153', 'ĐT Di động khác', 1, 2, '', 100, 14, 161, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1156, 'cf_1155', 'vtiger_customerenterprisecf', 2, '13', 'cf_1155', 'Email Cá nhân', 1, 2, '', 100, 15, 161, 1, 'E~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1158, 'cf_1157', 'vtiger_customerenterprisecf', 2, '13', 'cf_1157', 'Email Cơ quan', 1, 2, '', 100, 16, 161, 1, 'E~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1160, 'cf_1159', 'vtiger_customerenterprisecf', 2, '1', 'cf_1159', 'Trực thuộc', 1, 2, '', 100, 3, 162, 1, 'V~O~LE~255', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1162, 'cf_1161', 'vtiger_customerenterprisecf', 2, '16', 'cf_1161', 'Lĩnh vực', 1, 2, ' ', 100, 4, 162, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(64, 1187, 'makhachhang', 'vtiger_customerstandalone', 1, '8', 'makhachhang', 'Ma Khach Hang', 1, 2, '', 100, 1, 169, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(64, 1188, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 2, 169, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(64, 1189, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 3, 169, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(64, 1190, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 4, 169, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(64, 1191, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 5, 169, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(64, 1192, 'tags', 'vtiger_customerstandalone', 1, '1', 'tags', 'tags', 1, 2, '', 100, 6, 169, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(64, 1194, 'cf_1193', 'vtiger_customerstandalonecf', 2, '13', 'cf_1193', 'Email Ca nhan', 1, 2, '', 100, 7, 169, 1, 'E~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(64, 1196, 'cf_1195', 'vtiger_customerstandalonecf', 2, '21', 'cf_1195', 'Dia chi', 1, 2, '', 100, 8, 169, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(64, 1198, 'cf_1197', 'vtiger_customerstandalonecf', 2, '11', 'cf_1197', 'So dien thoai', 1, 2, '', 100, 9, 169, 1, 'V~M', 2, 0, 'BAS', 1, '', 0, 0, 0),
(64, 1200, 'cf_1199', 'vtiger_customerstandalonecf', 2, '1', 'cf_1199', 'Ten khach hang', 1, 2, '', 100, 10, 169, 1, 'V~M~LE~255', 2, 0, 'BAS', 1, '', 0, 0, 0),
(65, 1201, 'loaivande', 'vtiger_problemcategory', 1, '8', 'loaivande', 'Loai van de', 1, 2, '', 100, 1, 171, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(65, 1202, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 2, 171, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(65, 1203, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 3, 171, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(65, 1204, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 4, 171, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(65, 1205, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 5, 171, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(65, 1206, 'tags', 'vtiger_problemcategory', 1, '1', 'tags', 'tags', 1, 2, '', 100, 6, 171, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(65, 1208, 'cf_1207', 'vtiger_problemcategorycf', 2, '21', 'cf_1207', 'Mo ta chi tiet', 1, 2, '', 100, 7, 171, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(66, 1209, 'hinhthuchotro', 'vtiger_supportprotocol', 1, '8', 'hinhthuchotro', 'Hinh thuc ho tro', 1, 2, '', 100, 1, 173, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(66, 1210, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 2, 173, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(66, 1211, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 3, 173, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(66, 1212, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 4, 173, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(66, 1213, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 5, 173, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(66, 1214, 'tags', 'vtiger_supportprotocol', 1, '1', 'tags', 'tags', 1, 2, '', 100, 6, 173, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(66, 1216, 'cf_1215', 'vtiger_supportprotocolcf', 2, '21', 'cf_1215', 'Mo ta chi tiet', 1, 2, '', 100, 7, 173, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1218, 'cf_1217', 'vtiger_customerenterprisecf', 2, '5', 'cf_1217', 'Là đối tác từ', 1, 2, '', 100, 5, 162, 1, 'D~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1220, 'cf_1219', 'vtiger_customerenterprisecf', 2, '21', 'cf_1219', 'Địa chỉ', 1, 2, '', 100, 1, 175, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1222, 'cf_1221', 'vtiger_customerenterprisecf', 2, '16', 'cf_1221', 'Quốc gia', 1, 2, ' ', 100, 2, 175, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(63, 1226, 'cf_1225', 'vtiger_customerenterprisecf', 2, '1', 'cf_1225', 'Website', 1, 2, '', 100, 15, 159, 1, 'V~O~LE~255', 1, 0, 'BAS', 1, '', 0, 0, 0),
(70, 1255, 'pttt', 'vtiger_phuongtientruyenthong', 1, '8', 'pttt', 'Phuong tien truyen thong', 1, 2, '', 100, 1, 185, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(70, 1256, 'motachitiet', 'vtiger_phuongtientruyenthong', 1, '21', 'motachitiet', 'Mo ta chi tiet', 1, 2, '', 100, 2, 185, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(70, 1257, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 3, 185, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(70, 1258, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 4, 185, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(70, 1259, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 5, 185, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(70, 1260, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 6, 185, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(70, 1261, 'tags', 'vtiger_phuongtientruyenthong', 1, '1', 'tags', 'tags', 1, 2, '', 100, 7, 185, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(26, 1262, 'cf_1262', 'vtiger_campaign', 2, '10', 'cf_1262', 'Phuong tien truyen thong', 1, 2, '', 100, 20, 74, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(71, 1263, 'httt', 'vtiger_hinhthuctruyenthong', 1, '8', 'httt', 'Hinh thuc truyen thong', 1, 2, '', 100, 1, 187, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(71, 1264, 'motachitiet', 'vtiger_hinhthuctruyenthong', 1, '21', 'motachitiet', 'Mo ta chi tiet', 1, 2, '', 100, 2, 187, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(71, 1265, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 3, 187, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(71, 1266, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 4, 187, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(71, 1267, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 5, 187, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(71, 1268, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 6, 187, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(71, 1269, 'tags', 'vtiger_hinhthuctruyenthong', 1, '1', 'tags', 'tags', 1, 2, '', 100, 7, 187, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(26, 1270, 'cf_1270', 'vtiger_campaign', 2, '10', 'cf_1270', 'Hinh thuc truyen thong', 1, 2, '', 100, 21, 74, 1, 'I~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(72, 1271, 'tenquytrinh', 'vtiger_quytrinhbanhang', 1, '8', 'tenquytrinh', 'Ten quy trinh', 1, 2, '', 100, 1, 189, 1, 'V~M', 1, 0, 'BAS', 1, '', 0, 0, 0),
(72, 1272, 'motachitiet', 'vtiger_quytrinhbanhang', 1, '21', 'motachitiet', 'Mo ta chi tiet', 1, 2, '', 100, 2, 189, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(72, 1273, 'createdtime', 'vtiger_crmentity', 1, '70', 'createdtime', 'Created Time', 1, 2, '', 100, 3, 189, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(72, 1274, 'modifiedtime', 'vtiger_crmentity', 1, '70', 'modifiedtime', 'Modified Time', 1, 2, '', 100, 4, 189, 2, 'DT~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(72, 1275, 'source', 'vtiger_crmentity', 1, '1', 'source', 'Source', 1, 2, '', 100, 5, 189, 2, 'V~O', 3, 1, 'BAS', 0, '', 0, 0, 0),
(72, 1276, 'starred', 'vtiger_crmentity_user_field', 1, '56', 'starred', 'starred', 1, 2, '', 100, 6, 189, 6, 'C~O', 3, 2, 'BAS', 0, '', 0, 0, 0),
(72, 1277, 'tags', 'vtiger_quytrinhbanhang', 1, '1', 'tags', 'tags', 1, 2, '', 100, 7, 189, 6, 'V~O', 3, 3, 'BAS', 0, '', 0, 0, 0),
(72, 1279, 'cf_1278', 'vtiger_quytrinhbanhangcf', 2, '1', 'cf_1278', 'Ten giai doan', 1, 2, '', 100, 1, 191, 1, 'V~O~LE~255', 1, 0, 'BAS', 1, '', 0, 0, 0),
(72, 1281, 'cf_1280', 'vtiger_quytrinhbanhangcf', 2, '9', 'cf_1280', 'Ti le thanh cong', 1, 2, '', 100, 2, 191, 1, 'N~O~2~2', 1, 0, 'BAS', 1, '', 0, 0, 0),
(72, 1285, 'cf_1284', 'vtiger_quytrinhbanhangcf', 2, '21', 'cf_1284', 'Dien giai', 1, 2, '', 100, 4, 191, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0),
(72, 1287, 'cf_1286', 'vtiger_quytrinhbanhangcf', 2, '16', 'cf_1286', 'Phan loai', 1, 2, ' ', 100, 5, 191, 1, 'V~O', 1, 0, 'BAS', 1, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_fieldmodulerel`
--

CREATE TABLE IF NOT EXISTS `vtiger_fieldmodulerel` (
  `fieldid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `relmodule` varchar(100) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_fieldmodulerel`
--

INSERT INTO `vtiger_fieldmodulerel` (`fieldid`, `module`, `relmodule`, `status`, `sequence`) VALUES
(113, 'Potentials', 'Accounts', NULL, 0),
(535, 'PBXManager', 'Leads', NULL, NULL),
(535, 'PBXManager', 'Contacts', NULL, NULL),
(535, 'PBXManager', 'Accounts', NULL, NULL),
(549, 'ServiceContracts', 'Contacts', NULL, NULL),
(549, 'ServiceContracts', 'Accounts', NULL, NULL),
(589, 'Assets', 'Products', NULL, NULL),
(595, 'Assets', 'Invoice', NULL, NULL),
(600, 'Assets', 'Accounts', NULL, NULL),
(601, 'Assets', 'Contacts', NULL, NULL),
(613, 'ModComments', 'Leads', NULL, NULL),
(613, 'ModComments', 'Contacts', NULL, NULL),
(613, 'ModComments', 'Accounts', NULL, NULL),
(615, 'ModComments', 'ModComments', NULL, NULL),
(613, 'ModComments', 'Potentials', NULL, NULL),
(619, 'ProjectMilestone', 'Project', NULL, NULL),
(633, 'ProjectTask', 'Project', NULL, NULL),
(613, 'ModComments', 'ProjectTask', NULL, NULL),
(654, 'Project', 'Accounts', NULL, NULL),
(654, 'Project', 'Contacts', NULL, NULL),
(613, 'ModComments', 'Project', NULL, NULL),
(676, 'Invoice', 'Products', NULL, NULL),
(676, 'Invoice', 'Services', NULL, NULL),
(685, 'SalesOrder', 'Products', NULL, NULL),
(685, 'SalesOrder', 'Services', NULL, NULL),
(694, 'PurchaseOrder', 'Products', NULL, NULL),
(694, 'PurchaseOrder', 'Services', NULL, NULL),
(703, 'Quotes', 'Products', NULL, NULL),
(703, 'Quotes', 'Services', NULL, NULL),
(714, 'ModComments', 'Contacts', NULL, NULL),
(613, 'ModComments', 'HelpDesk', NULL, NULL),
(613, 'ModComments', 'Faq', NULL, NULL),
(740, 'Potentials', 'Contacts', NULL, NULL),
(157, 'HelpDesk', 'Accounts', NULL, NULL),
(741, 'HelpDesk', 'Contacts', NULL, NULL),
(238, 'Accounts', 'Calendar', NULL, NULL),
(238, 'Leads', 'Calendar', NULL, NULL),
(238, 'HelpDesk', 'Calendar', NULL, NULL),
(238, 'Campaigns', 'Calendar', NULL, NULL),
(238, 'Potentials', 'Calendar', NULL, NULL),
(238, 'PurchaseOrder', 'Calendar', NULL, NULL),
(238, 'SalesOrder', 'Calendar', NULL, NULL),
(238, 'Quotes', 'Calendar', NULL, NULL),
(238, 'Invoice', 'Calendar', NULL, NULL),
(239, 'Contacts', 'Calendar', NULL, NULL),
(774, 'Invoice', 'Potentials', NULL, NULL),
(613, 'ModComments', 'Invoice', NULL, NULL),
(613, 'ModComments', 'Quotes', NULL, NULL),
(613, 'ModComments', 'PurchaseOrder', NULL, NULL),
(613, 'ModComments', 'SalesOrder', NULL, NULL),
(849, 'Project', 'Potentials', NULL, NULL),
(877, 'Salary', 'Employee', NULL, NULL),
(892, 'Rating', 'SettingWeight', NULL, NULL),
(911, 'JD', 'SettingPosition', NULL, NULL),
(924, 'QCM', 'SettingPosition', NULL, NULL),
(946, 'KPI', 'SettingWeight', NULL, NULL),
(947, 'KPI', 'SettingWeight', NULL, NULL),
(957, 'Candidates', 'SettingPosition', NULL, NULL),
(982, 'Leave', 'Employee', NULL, NULL),
(1003, 'Employee', 'SettingPosition', NULL, NULL),
(1021, 'Employee', 'SalaryComponent', NULL, NULL),
(1254, 'Campaigns', 'PhuongTienTruyenThong', NULL, NULL),
(1262, 'Campaigns', 'PhuongTienTruyenThong', NULL, NULL),
(1270, 'Campaigns', 'HinhThucTruyenThong', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_field_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_field_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_field_seq`
--

INSERT INTO `vtiger_field_seq` (`id`) VALUES
(1287);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_freetagged_objects`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetagged_objects` (
  `tag_id` int(20) NOT NULL DEFAULT 0,
  `tagger_id` int(20) NOT NULL DEFAULT 0,
  `object_id` int(20) NOT NULL DEFAULT 0,
  `tagged_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `module` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tag_id`,`tagger_id`,`object_id`),
  KEY `freetagged_objects_tag_id_tagger_id_object_id_idx` (`tag_id`,`tagger_id`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_freetags`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetags` (
  `id` int(19) NOT NULL,
  `tag` varchar(50) NOT NULL DEFAULT '',
  `raw_tag` varchar(50) NOT NULL DEFAULT '',
  `visibility` varchar(100) NOT NULL DEFAULT 'PRIVATE',
  `owner` int(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_freetags`
--

INSERT INTO `vtiger_freetags` (`id`, `tag`, `raw_tag`, `visibility`, `owner`) VALUES
(2, 'c', 'c', 'private', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_freetags_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_freetags_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_freetags_seq`
--

INSERT INTO `vtiger_freetags_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_glacct`
--

CREATE TABLE IF NOT EXISTS `vtiger_glacct` (
  `glacctid` int(19) NOT NULL,
  `glacct` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`glacctid`),
  UNIQUE KEY `glacct_glacct_idx` (`glacct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_glacct`
--

INSERT INTO `vtiger_glacct` (`glacctid`, `glacct`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, '300-Sales-Software', 1, 51, 0, NULL),
(2, '301-Sales-Hardware', 1, 52, 1, NULL),
(3, '302-Rental-Income', 1, 53, 2, NULL),
(4, '303-Interest-Income', 1, 54, 3, NULL),
(5, '304-Sales-Software-Support', 1, 55, 4, NULL),
(6, '305-Sales Other', 1, 56, 5, NULL),
(7, '306-Internet Sales', 1, 57, 6, NULL),
(8, '307-Service-Hardware Labor', 1, 58, 7, NULL),
(9, '308-Sales-Books', 1, 59, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_glacct_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_glacct_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_glacct_seq`
--

INSERT INTO `vtiger_glacct_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_google_event_calendar_mapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_google_event_calendar_mapping` (
  `event_id` varchar(255) DEFAULT NULL,
  `calendar_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_google_oauth2`
--

CREATE TABLE IF NOT EXISTS `vtiger_google_oauth2` (
  `service` varchar(20) DEFAULT NULL,
  `access_token` varchar(500) DEFAULT NULL,
  `refresh_token` varchar(500) DEFAULT NULL,
  `userid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_google_sync_fieldmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_google_sync_fieldmapping` (
  `vtiger_field` varchar(255) DEFAULT NULL,
  `google_field` varchar(255) DEFAULT NULL,
  `google_field_type` varchar(255) DEFAULT NULL,
  `google_custom_label` varchar(255) DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_google_sync_settings`
--

CREATE TABLE IF NOT EXISTS `vtiger_google_sync_settings` (
  `user` int(11) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `clientgroup` varchar(255) DEFAULT NULL,
  `direction` varchar(50) DEFAULT NULL,
  `enabled` tinyint(3) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_group2grouprel`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2grouprel` (
  `groupid` int(19) NOT NULL,
  `containsgroupid` int(19) NOT NULL,
  PRIMARY KEY (`groupid`,`containsgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_group2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2role` (
  `groupid` int(19) NOT NULL,
  `roleid` varchar(255) NOT NULL,
  PRIMARY KEY (`groupid`,`roleid`),
  KEY `fk_2_vtiger_group2role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_group2role`
--

INSERT INTO `vtiger_group2role` (`groupid`, `roleid`) VALUES
(2, 'H4'),
(3, 'H2'),
(4, 'H3');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_group2rs`
--

CREATE TABLE IF NOT EXISTS `vtiger_group2rs` (
  `groupid` int(19) NOT NULL,
  `roleandsubid` varchar(255) NOT NULL,
  PRIMARY KEY (`groupid`,`roleandsubid`),
  KEY `fk_2_vtiger_group2rs` (`roleandsubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_group2rs`
--

INSERT INTO `vtiger_group2rs` (`groupid`, `roleandsubid`) VALUES
(2, 'H5'),
(3, 'H3'),
(4, 'H3');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_groups`
--

CREATE TABLE IF NOT EXISTS `vtiger_groups` (
  `groupid` int(19) NOT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`groupid`),
  UNIQUE KEY `groups_groupname_idx` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_groups`
--

INSERT INTO `vtiger_groups` (`groupid`, `groupname`, `description`) VALUES
(2, 'Team Selling', 'Group Related to Sales'),
(3, 'Marketing Group', 'Group Related to Marketing Activities'),
(4, 'Support Group', 'Group Related to providing Support to Customers');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hinhthuctruyenthong`
--

CREATE TABLE IF NOT EXISTS `vtiger_hinhthuctruyenthong` (
  `hinhthuctruyenthongid` int(19) NOT NULL,
  `httt` varchar(255) DEFAULT NULL,
  `motachitiet` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`hinhthuctruyenthongid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hinhthuctruyenthong`
--

INSERT INTO `vtiger_hinhthuctruyenthong` (`hinhthuctruyenthongid`, `httt`, `motachitiet`, `tags`) VALUES
(34, '[\"Ch\\u1ea1y qu\\u1ea3ng c\\u00e1o\"]', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hinhthuctruyenthongcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_hinhthuctruyenthongcf` (
  `hinhthuctruyenthongid` int(19) NOT NULL,
  PRIMARY KEY (`hinhthuctruyenthongid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hinhthuctruyenthongcf`
--

INSERT INTO `vtiger_hinhthuctruyenthongcf` (`hinhthuctruyenthongid`) VALUES
(34);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homedashbd`
--

CREATE TABLE IF NOT EXISTS `vtiger_homedashbd` (
  `stuffid` int(19) NOT NULL DEFAULT 0,
  `dashbdname` varchar(100) DEFAULT NULL,
  `dashbdtype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homedefault`
--

CREATE TABLE IF NOT EXISTS `vtiger_homedefault` (
  `stuffid` int(19) NOT NULL DEFAULT 0,
  `hometype` varchar(30) NOT NULL,
  `maxentries` int(19) DEFAULT NULL,
  `setype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_homedefault`
--

INSERT INTO `vtiger_homedefault` (`stuffid`, `hometype`, `maxentries`, `setype`) VALUES
(1, 'ALVT', 5, 'Accounts'),
(2, 'HDB', 5, 'Dashboard'),
(3, 'PLVT', 5, 'Potentials'),
(4, 'QLTQ', 5, 'Quotes'),
(5, 'CVLVT', 5, 'NULL'),
(6, 'HLT', 5, 'HelpDesk'),
(7, 'UA', 5, 'Calendar'),
(8, 'GRT', 5, 'NULL'),
(9, 'OLTSO', 5, 'SalesOrder'),
(10, 'ILTI', 5, 'Invoice'),
(11, 'MNL', 5, 'Leads'),
(12, 'OLTPO', 5, 'PurchaseOrder'),
(13, 'PA', 5, 'Calendar'),
(14, 'LTFAQ', 5, 'Faq');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homemodule`
--

CREATE TABLE IF NOT EXISTS `vtiger_homemodule` (
  `stuffid` int(19) NOT NULL,
  `modulename` varchar(100) DEFAULT NULL,
  `maxentries` int(19) NOT NULL,
  `customviewid` int(19) NOT NULL,
  `setype` varchar(30) NOT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homemoduleflds`
--

CREATE TABLE IF NOT EXISTS `vtiger_homemoduleflds` (
  `stuffid` int(19) DEFAULT NULL,
  `fieldname` varchar(100) DEFAULT NULL,
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homereportchart`
--

CREATE TABLE IF NOT EXISTS `vtiger_homereportchart` (
  `stuffid` int(11) NOT NULL,
  `reportid` int(19) DEFAULT NULL,
  `reportcharttype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homerss`
--

CREATE TABLE IF NOT EXISTS `vtiger_homerss` (
  `stuffid` int(19) NOT NULL DEFAULT 0,
  `url` varchar(100) DEFAULT NULL,
  `maxentries` int(19) NOT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homestuff`
--

CREATE TABLE IF NOT EXISTS `vtiger_homestuff` (
  `stuffid` int(19) NOT NULL DEFAULT 0,
  `stuffsequence` int(19) NOT NULL DEFAULT 0,
  `stufftype` varchar(100) DEFAULT NULL,
  `userid` int(19) NOT NULL,
  `visible` int(10) NOT NULL DEFAULT 0,
  `stufftitle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stuffid`),
  KEY `stuff_stuffid_idx` (`stuffid`),
  KEY `fk_1_vtiger_homestuff` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_homestuff`
--

INSERT INTO `vtiger_homestuff` (`stuffid`, `stuffsequence`, `stufftype`, `userid`, `visible`, `stufftitle`) VALUES
(1, 1, 'Default', 1, 1, 'Top Accounts'),
(2, 2, 'Default', 1, 1, 'Home Page Dashboard'),
(3, 3, 'Default', 1, 1, 'Top Potentials'),
(4, 4, 'Default', 1, 1, 'Top Quotes'),
(5, 5, 'Default', 1, 1, 'Key Metrics'),
(6, 6, 'Default', 1, 1, 'Top Trouble Tickets'),
(7, 7, 'Default', 1, 1, 'Upcoming Activities'),
(8, 8, 'Default', 1, 1, 'My Group Allocation'),
(9, 9, 'Default', 1, 1, 'Top Sales Orders'),
(10, 10, 'Default', 1, 1, 'Top Invoices'),
(11, 11, 'Default', 1, 1, 'My New Leads'),
(12, 12, 'Default', 1, 1, 'Top Purchase Orders'),
(13, 13, 'Default', 1, 1, 'Pending Activities'),
(14, 14, 'Default', 1, 1, 'My Recent FAQs'),
(15, 15, 'Tag Cloud', 1, 0, 'Tag Cloud');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_homestuff_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_homestuff_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_homestuff_seq`
--

INSERT INTO `vtiger_homestuff_seq` (`id`) VALUES
(15);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_home_layout`
--

CREATE TABLE IF NOT EXISTS `vtiger_home_layout` (
  `userid` int(19) NOT NULL,
  `layout` int(19) NOT NULL DEFAULT 4,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hour_format`
--

CREATE TABLE IF NOT EXISTS `vtiger_hour_format` (
  `hour_formatid` int(11) NOT NULL,
  `hour_format` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`hour_formatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hour_format`
--

INSERT INTO `vtiger_hour_format` (`hour_formatid`, `hour_format`, `sortorderid`, `presence`) VALUES
(1, '12', 0, 1),
(2, '24', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hour_format_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_hour_format_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hour_format_seq`
--

INSERT INTO `vtiger_hour_format_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hr`
--

CREATE TABLE IF NOT EXISTS `vtiger_hr` (
  `hrid` int(11) NOT NULL,
  `hr` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`hrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hr`
--

INSERT INTO `vtiger_hr` (`hrid`, `hr`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Hasn\'t salary', 1, 368, 1, NULL),
(2, 'Has salary', 1, 369, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_candidate`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_candidate` (
  `id` int(19) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `application_date` varchar(255) DEFAULT NULL,
  `candidate_resource_cv` varchar(255) DEFAULT NULL,
  `candidate_action` varchar(255) DEFAULT NULL,
  `reject_note` text DEFAULT NULL,
  `shortlist_note` text DEFAULT NULL,
  `si_name` varchar(255) DEFAULT NULL,
  `si_date` varchar(255) DEFAULT NULL,
  `si_time` varchar(255) DEFAULT NULL,
  `si_note` varchar(255) DEFAULT NULL,
  `mip_swork` varchar(255) DEFAULT NULL,
  `mip_de_salary` varchar(255) DEFAULT NULL,
  `mip_probation` varchar(255) DEFAULT NULL,
  `mip_note` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `mif_note` text DEFAULT NULL,
  `oj_note` text DEFAULT NULL,
  `official_salary` text DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_candidatecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_candidatecf` (
  `id` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_employcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_employcf` (
  `employid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`employid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hrm_employcf`
--

INSERT INTO `vtiger_hrm_employcf` (`employid`) VALUES
(2),
(29);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_employee`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_employee` (
  `employid` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `employ_gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `employ_marital_status` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `candidate_id` varchar(100) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `start_work_date` varchar(100) DEFAULT NULL,
  `employ_number` varchar(100) DEFAULT NULL,
  `official_date` varchar(100) DEFAULT NULL,
  `desired_salary` varchar(100) DEFAULT NULL,
  `probality_period` varchar(100) DEFAULT NULL,
  `official_salary` varchar(100) DEFAULT NULL,
  `private_email` varchar(100) DEFAULT NULL,
  `salary_department` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`employid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hrm_employee`
--

INSERT INTO `vtiger_hrm_employee` (`employid`, `firstname`, `lastname`, `employ_gender`, `email`, `user_id`, `date_of_birth`, `mobile`, `position`, `employ_marital_status`, `address`, `city`, `country`, `flag`, `candidate_id`, `action`, `start_work_date`, `employ_number`, `official_date`, `desired_salary`, `probality_period`, `official_salary`, `private_email`, `salary_department`, `tags`) VALUES
(2, 'Leonce', 'Wang', '', 'ThienLang99999@gmail.com', '1', NULL, '', '', '', '', '', '', '', '', '', NULL, 'EMPL1', NULL, '', '', '', '', '', ''),
(29, 'Leonce', 'Wang', '', 'ThienLang99999@gmail.com', '1', NULL, '', '', '', '', '', '', '', '', '', NULL, 'EMPL1', NULL, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_jd`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_jd` (
  `id` int(19) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `jd_category` varchar(255) DEFAULT NULL,
  `jd_status` varchar(255) DEFAULT NULL,
  `jd_classify` varchar(255) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_jdcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_jdcf` (
  `id` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_jd_tasks`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_jd_tasks` (
  `id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_desc` text NOT NULL,
  `jd_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_kpi`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_kpi` (
  `id` int(11) NOT NULL,
  `kpi_name` varchar(255) NOT NULL,
  `kpi_description` varchar(255) NOT NULL,
  `kpi_status` varchar(255) NOT NULL,
  `kpi_type` varchar(100) NOT NULL,
  `kpi_manager` varchar(100) NOT NULL,
  `kpi_department` varchar(100) NOT NULL,
  `start_date` varchar(100) NOT NULL,
  `due_date` varchar(100) NOT NULL,
  `cf_01` varchar(100) NOT NULL,
  `cf_02` varchar(100) NOT NULL,
  `cf_03` varchar(100) NOT NULL,
  `cf_04` varchar(100) NOT NULL,
  `kpi_weight` varchar(100) NOT NULL,
  `kpi_ranking` varchar(100) NOT NULL,
  `cf_07` varchar(100) NOT NULL,
  `api_manager` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_kpicf`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_kpicf` (
  `id` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_leave`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_leave` (
  `id` int(19) NOT NULL,
  `employ_id` int(11) DEFAULT NULL,
  `from_date` varchar(255) DEFAULT NULL,
  `to_date` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `hrm_leave_type` varchar(255) DEFAULT NULL,
  `partial_day` varchar(255) DEFAULT NULL,
  `hr` varchar(255) DEFAULT NULL,
  `hrm_leave_action` varchar(255) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_leave_action`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_leave_action` (
  `hrm_leave_actionid` int(11) NOT NULL,
  `hrm_leave_action` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`hrm_leave_actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hrm_leave_action`
--

INSERT INTO `vtiger_hrm_leave_action` (`hrm_leave_actionid`, `hrm_leave_action`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Accept', 1, 366, 1, NULL),
(2, 'Reject', 1, 367, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_leave_action_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_leave_action_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hrm_leave_action_seq`
--

INSERT INTO `vtiger_hrm_leave_action_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_leave_type`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_leave_type` (
  `hrm_leave_typeid` int(11) NOT NULL,
  `hrm_leave_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`hrm_leave_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hrm_leave_type`
--

INSERT INTO `vtiger_hrm_leave_type` (`hrm_leave_typeid`, `hrm_leave_type`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Sick leave', 1, 361, 1, NULL),
(2, 'Personal leave', 1, 362, 2, NULL),
(3, 'Wedding', 1, 363, 3, NULL),
(4, 'Leave of Absence', 1, 364, 4, NULL),
(5, 'Other', 1, 365, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_leave_type_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_leave_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hrm_leave_type_seq`
--

INSERT INTO `vtiger_hrm_leave_type_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_position`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_position` (
  `id` int(19) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_qcm`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_qcm` (
  `qcmid` int(11) NOT NULL,
  `qcm_title` varchar(255) DEFAULT NULL,
  `qcm_code` varchar(255) DEFAULT NULL,
  `qcm_category` varchar(255) DEFAULT NULL,
  `qcm_classify` varchar(255) DEFAULT NULL,
  `qcm_created` varchar(255) DEFAULT NULL,
  `qcm_status` varchar(255) DEFAULT NULL,
  `fined` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`qcmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_qcmcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_qcmcf` (
  `qcmid` int(11) NOT NULL,
  PRIMARY KEY (`qcmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_rating`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_rating` (
  `id` int(19) NOT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `rating_weight` varchar(255) DEFAULT NULL,
  `ranking_1` varchar(255) DEFAULT NULL,
  `ranking_2` varchar(255) DEFAULT NULL,
  `ranking_3` varchar(255) DEFAULT NULL,
  `ranking_4` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_ratingcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_ratingcf` (
  `id` int(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_salaryreference`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_salaryreference` (
  `id` int(19) NOT NULL,
  `employ_id` int(11) DEFAULT NULL,
  `current_salary` varchar(255) DEFAULT NULL,
  `before_increase_date` varchar(255) DEFAULT NULL,
  `salary_after` varchar(255) DEFAULT NULL,
  `reviewer` varchar(255) DEFAULT NULL,
  `hr_salary_action` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `review_date` varchar(255) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_setting`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_setting` (
  `id` int(19) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_settingdepartment`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_settingdepartment` (
  `id` int(19) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_settingdepartmentcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_settingdepartmentcf` (
  `id` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_settingdepartmentcust`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_settingdepartmentcust` (
  `id` int(11) NOT NULL,
  `department_id` varchar(255) NOT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `management_scale` varchar(255) DEFAULT NULL,
  `time_to_review` varchar(100) DEFAULT NULL,
  `level1` varchar(100) DEFAULT NULL,
  `level2` varchar(100) DEFAULT NULL,
  `level3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hrm_weight`
--

CREATE TABLE IF NOT EXISTS `vtiger_hrm_weight` (
  `id` int(19) NOT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hr_salary_action`
--

CREATE TABLE IF NOT EXISTS `vtiger_hr_salary_action` (
  `hr_salary_actionid` int(11) NOT NULL,
  `hr_salary_action` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`hr_salary_actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hr_salary_action`
--

INSERT INTO `vtiger_hr_salary_action` (`hr_salary_actionid`, `hr_salary_action`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Accept', 1, 303, 1, NULL),
(2, 'Reject', 1, 304, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hr_salary_action_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_hr_salary_action_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hr_salary_action_seq`
--

INSERT INTO `vtiger_hr_salary_action_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_hr_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_hr_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_hr_seq`
--

INSERT INTO `vtiger_hr_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_import_locks`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_locks` (
  `vtiger_import_lock_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `importid` int(11) NOT NULL,
  `locked_since` datetime DEFAULT NULL,
  PRIMARY KEY (`vtiger_import_lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_import_maps`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_maps` (
  `id` int(19) NOT NULL,
  `name` varchar(36) NOT NULL,
  `module` varchar(36) NOT NULL,
  `content` longblob DEFAULT NULL,
  `has_header` int(1) NOT NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `date_entered` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` varchar(36) DEFAULT NULL,
  `is_published` varchar(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `import_maps_assigned_user_id_module_name_deleted_idx` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_import_queue`
--

CREATE TABLE IF NOT EXISTS `vtiger_import_queue` (
  `importid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `field_mapping` text DEFAULT NULL,
  `default_values` text DEFAULT NULL,
  `merge_type` int(11) DEFAULT NULL,
  `merge_fields` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `lineitem_currency_id` int(5) DEFAULT NULL,
  `paging` int(1) DEFAULT 0,
  PRIMARY KEY (`importid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_industry`
--

CREATE TABLE IF NOT EXISTS `vtiger_industry` (
  `industryid` int(19) NOT NULL,
  `industry` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`industryid`),
  UNIQUE KEY `industry_industry_idx` (`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_industry`
--

INSERT INTO `vtiger_industry` (`industryid`, `industry`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Apparel', 1, 61, 1, NULL),
(3, 'Banking', 1, 62, 2, NULL),
(4, 'Biotechnology', 1, 63, 3, NULL),
(5, 'Chemicals', 1, 64, 4, NULL),
(6, 'Communications', 1, 65, 5, NULL),
(7, 'Construction', 1, 66, 6, NULL),
(8, 'Consulting', 1, 67, 7, NULL),
(9, 'Education', 1, 68, 8, NULL),
(10, 'Electronics', 1, 69, 9, NULL),
(11, 'Energy', 1, 70, 10, NULL),
(12, 'Engineering', 1, 71, 11, NULL),
(13, 'Entertainment', 1, 72, 12, NULL),
(14, 'Environmental', 1, 73, 13, NULL),
(15, 'Finance', 1, 74, 14, NULL),
(16, 'Food & Beverage', 1, 75, 15, NULL),
(17, 'Government', 1, 76, 16, NULL),
(18, 'Healthcare', 1, 77, 17, NULL),
(19, 'Hospitality', 1, 78, 18, NULL),
(20, 'Insurance', 1, 79, 19, NULL),
(21, 'Machinery', 1, 80, 20, NULL),
(22, 'Manufacturing', 1, 81, 21, NULL),
(23, 'Media', 1, 82, 22, NULL),
(24, 'Not For Profit', 1, 83, 23, NULL),
(25, 'Recreation', 1, 84, 24, NULL),
(26, 'Retail', 1, 85, 25, NULL),
(27, 'Shipping', 1, 86, 26, NULL),
(28, 'Technology', 1, 87, 27, NULL),
(29, 'Telecommunications', 1, 88, 28, NULL),
(30, 'Transportation', 1, 89, 29, NULL),
(31, 'Utilities', 1, 90, 30, NULL),
(32, 'Other', 1, 91, 31, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_industry_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_industry_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_industry_seq`
--

INSERT INTO `vtiger_industry_seq` (`id`) VALUES
(32);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorycharges`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorycharges` (
  `chargeid` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `format` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `value` decimal(12,5) DEFAULT NULL,
  `regions` text DEFAULT NULL,
  `istaxable` int(1) NOT NULL DEFAULT 1,
  `taxes` varchar(1024) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`chargeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventorycharges`
--

INSERT INTO `vtiger_inventorycharges` (`chargeid`, `name`, `format`, `type`, `value`, `regions`, `istaxable`, `taxes`, `deleted`) VALUES
(1, 'Shipping & Handling', 'Flat', 'Fixed', NULL, '[]', 1, '[\"1\",\"2\",\"3\"]', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorychargesrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorychargesrel` (
  `recordid` int(19) NOT NULL,
  `charges` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorynotification`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorynotification` (
  `notificationid` int(19) NOT NULL,
  `notificationname` varchar(200) DEFAULT NULL,
  `notificationsubject` varchar(200) DEFAULT NULL,
  `notificationbody` text DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`notificationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventorynotification`
--

INSERT INTO `vtiger_inventorynotification` (`notificationid`, `notificationname`, `notificationsubject`, `notificationbody`, `label`, `status`) VALUES
(1, 'InvoiceNotification', '{PRODUCTNAME} Stock Level is Low', 'Dear {HANDLER},\n\nThe current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}. Kindly procure required number of units as the stock level is below reorder level {REORDERLEVELVALUE}.\n\nPlease treat this information as Urgent as the invoice is already sent  to the customer.\n\nSeverity: Critical\n\nThanks,\n{CURRENTUSER} ', 'InvoiceNotificationDescription', NULL),
(2, 'QuoteNotification', 'Quote given for {PRODUCTNAME}', 'Dear {HANDLER},\n\nQuote is generated for {QUOTEQUANTITY} units of {PRODUCTNAME}. The current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}.\n\nSeverity: Minor\n\nThanks,\n{CURRENTUSER} ', 'QuoteNotificationDescription', NULL),
(3, 'SalesOrderNotification', 'Sales Order generated for {PRODUCTNAME}', 'Dear {HANDLER},\n\nSalesOrder is generated for {SOQUANTITY} units of {PRODUCTNAME}. The current stock of {PRODUCTNAME} in our warehouse is {CURRENTSTOCK}.\n\nPlease treat this information  with priority as the sales order is already generated.\n\nSeverity: Major\n\nThanks,\n{CURRENTUSER} ', 'SalesOrderNotificationDescription', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorynotification_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorynotification_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventorynotification_seq`
--

INSERT INTO `vtiger_inventorynotification_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventoryproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventoryproductrel` (
  `id` int(19) DEFAULT NULL,
  `productid` int(19) DEFAULT NULL,
  `sequence_no` int(4) DEFAULT NULL,
  `quantity` decimal(25,3) DEFAULT NULL,
  `listprice` decimal(27,8) DEFAULT NULL,
  `discount_percent` decimal(7,3) DEFAULT NULL,
  `discount_amount` decimal(27,8) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `incrementondel` int(11) NOT NULL DEFAULT 0,
  `lineitem_id` int(11) NOT NULL,
  `tax1` decimal(7,3) DEFAULT NULL,
  `tax2` decimal(7,3) DEFAULT NULL,
  `tax3` decimal(7,3) DEFAULT NULL,
  `image` varchar(2) DEFAULT NULL,
  `purchase_cost` decimal(27,8) DEFAULT NULL,
  `margin` decimal(27,8) DEFAULT NULL,
  PRIMARY KEY (`lineitem_id`),
  KEY `inventoryproductrel_id_idx` (`id`),
  KEY `inventoryproductrel_productid_idx` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventoryproductrel_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventoryproductrel_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventoryproductrel_seq`
--

INSERT INTO `vtiger_inventoryproductrel_seq` (`id`) VALUES
(0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventoryshippingrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventoryshippingrel` (
  `id` int(19) DEFAULT NULL,
  `shtax1` decimal(7,3) DEFAULT NULL,
  `shtax2` decimal(7,3) DEFAULT NULL,
  `shtax3` decimal(7,3) DEFAULT NULL,
  KEY `inventoryishippingrel_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorysubproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorysubproductrel` (
  `id` int(19) NOT NULL,
  `sequence_no` int(10) NOT NULL,
  `productid` int(19) NOT NULL,
  `quantity` int(19) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorytaxinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorytaxinfo` (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) DEFAULT NULL,
  `taxlabel` varchar(50) DEFAULT NULL,
  `percentage` decimal(7,3) DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `compoundon` varchar(400) DEFAULT NULL,
  `regions` text DEFAULT NULL,
  PRIMARY KEY (`taxid`),
  KEY `inventorytaxinfo_taxname_idx` (`taxname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventorytaxinfo`
--

INSERT INTO `vtiger_inventorytaxinfo` (`taxid`, `taxname`, `taxlabel`, `percentage`, `deleted`, `method`, `type`, `compoundon`, `regions`) VALUES
(1, 'tax1', 'VAT', '4.500', 0, 'Simple', 'Fixed', '[]', '[]'),
(2, 'tax2', 'Sales', '10.000', 0, 'Simple', 'Fixed', '[]', '[]'),
(3, 'tax3', 'Service', '12.500', 0, 'Simple', 'Fixed', '[]', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventorytaxinfo_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventorytaxinfo_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventorytaxinfo_seq`
--

INSERT INTO `vtiger_inventorytaxinfo_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventory_tandc`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventory_tandc` (
  `id` int(19) NOT NULL,
  `type` varchar(30) NOT NULL,
  `tandc` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventory_tandc`
--

INSERT INTO `vtiger_inventory_tandc` (`id`, `type`, `tandc`) VALUES
(2, 'Invoice', '\n - Unless otherwise agreed in writing by the supplier all invoices are payable within thirty (30) days of the date of invoice, in the currency of the invoice, drawn on a bank based in India or by such other method as is agreed in advance by the Supplier.\n\n - All prices are not inclusive of VAT which shall be payable in addition by the Customer at the applicable rate.'),
(3, 'Quotes', '\n - Unless otherwise agreed in writing by the supplier all invoices are payable within thirty (30) days of the date of invoice, in the currency of the invoice, drawn on a bank based in India or by such other method as is agreed in advance by the Supplier.\n\n - All prices are not inclusive of VAT which shall be payable in addition by the Customer at the applicable rate.'),
(4, 'PurchaseOrder', '\n - Unless otherwise agreed in writing by the supplier all invoices are payable within thirty (30) days of the date of invoice, in the currency of the invoice, drawn on a bank based in India or by such other method as is agreed in advance by the Supplier.\n\n - All prices are not inclusive of VAT which shall be payable in addition by the Customer at the applicable rate.'),
(5, 'SalesOrder', '\n - Unless otherwise agreed in writing by the supplier all invoices are payable within thirty (30) days of the date of invoice, in the currency of the invoice, drawn on a bank based in India or by such other method as is agreed in advance by the Supplier.\n\n - All prices are not inclusive of VAT which shall be payable in addition by the Customer at the applicable rate.');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_inventory_tandc_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_inventory_tandc_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_inventory_tandc_seq`
--

INSERT INTO `vtiger_inventory_tandc_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invitees`
--

CREATE TABLE IF NOT EXISTS `vtiger_invitees` (
  `activityid` int(19) NOT NULL,
  `inviteeid` int(19) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`activityid`,`inviteeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoice`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoice` (
  `invoiceid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) DEFAULT NULL,
  `salesorderid` int(19) DEFAULT NULL,
  `customerno` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `invoiceterms` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,8) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `subtotal` decimal(25,8) DEFAULT NULL,
  `total` decimal(25,8) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,8) DEFAULT NULL,
  `s_h_amount` decimal(25,8) DEFAULT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text DEFAULT NULL,
  `purchaseorder` varchar(200) DEFAULT NULL,
  `invoicestatus` varchar(200) DEFAULT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT 1.000,
  `compound_taxes_info` text DEFAULT NULL,
  `pre_tax_total` decimal(25,8) DEFAULT NULL,
  `received` decimal(25,8) DEFAULT NULL,
  `balance` decimal(25,8) DEFAULT NULL,
  `s_h_percent` decimal(25,8) DEFAULT NULL,
  `potential_id` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `region_id` int(19) DEFAULT NULL,
  PRIMARY KEY (`invoiceid`),
  KEY `invoice_purchaseorderid_idx` (`invoiceid`),
  KEY `fk_2_vtiger_invoice` (`salesorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicebillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicebillads` (
  `invoicebilladdressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`invoicebilladdressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicecf` (
  `invoiceid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoiceshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoiceshipads` (
  `invoiceshipaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`invoiceshipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicestatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatus` (
  `invoicestatusid` int(19) NOT NULL,
  `invoicestatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`invoicestatusid`),
  UNIQUE KEY `invoicestatus_invoiestatus_idx` (`invoicestatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_invoicestatus`
--

INSERT INTO `vtiger_invoicestatus` (`invoicestatusid`, `invoicestatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'AutoCreated', 0, 92, 0, NULL),
(2, 'Created', 0, 93, 1, NULL),
(3, 'Approved', 0, 94, 2, NULL),
(4, 'Sent', 0, 95, 3, NULL),
(5, 'Credit Invoice', 0, 96, 4, NULL),
(6, 'Paid', 0, 97, 5, NULL),
(7, 'Cancel', 1, 288, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicestatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatushistory` (
  `historyid` int(19) NOT NULL,
  `invoiceid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `invoicestatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `invoicestatushistory_invoiceid_idx` (`invoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoicestatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoicestatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_invoicestatus_seq`
--

INSERT INTO `vtiger_invoicestatus_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_invoice_recurring_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_invoice_recurring_info` (
  `salesorderid` int(11) NOT NULL,
  `recurring_frequency` varchar(200) DEFAULT NULL,
  `start_period` date DEFAULT NULL,
  `end_period` date DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `payment_duration` varchar(200) DEFAULT NULL,
  `invoice_status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`salesorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_jd_category`
--

CREATE TABLE IF NOT EXISTS `vtiger_jd_category` (
  `jd_categoryid` int(11) NOT NULL,
  `jd_category` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`jd_categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_jd_category`
--

INSERT INTO `vtiger_jd_category` (`jd_categoryid`, `jd_category`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'IT', 1, 307, 1, NULL),
(2, 'RD', 1, 308, 2, NULL),
(3, 'Sale Marketing', 1, 309, 3, NULL),
(4, 'Service', 1, 310, 4, NULL),
(5, 'System', 1, 311, 5, NULL),
(6, 'Manager', 1, 312, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_jd_category_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_jd_category_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_jd_category_seq`
--

INSERT INTO `vtiger_jd_category_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_jd_classify`
--

CREATE TABLE IF NOT EXISTS `vtiger_jd_classify` (
  `jd_classifyid` int(11) NOT NULL,
  `jd_classify` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`jd_classifyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_jd_classify`
--

INSERT INTO `vtiger_jd_classify` (`jd_classifyid`, `jd_classify`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Role', 1, 313, 1, NULL),
(2, 'Responsibility', 1, 314, 2, NULL),
(3, 'Skill', 1, 315, 3, NULL),
(4, 'Knowledge', 1, 316, 4, NULL),
(5, 'Experience', 1, 317, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_jd_classify_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_jd_classify_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_jd_classify_seq`
--

INSERT INTO `vtiger_jd_classify_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_jd_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_jd_status` (
  `jd_statusid` int(11) NOT NULL,
  `jd_status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`jd_statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_jd_status`
--

INSERT INTO `vtiger_jd_status` (`jd_statusid`, `jd_status`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Active', 1, 305, 1, NULL),
(2, 'Inactive', 1, 306, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_jd_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_jd_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_jd_status_seq`
--

INSERT INTO `vtiger_jd_status_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_kpi_department`
--

CREATE TABLE IF NOT EXISTS `vtiger_kpi_department` (
  `kpi_departmentid` int(11) NOT NULL,
  `kpi_department` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`kpi_departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_kpi_department`
--

INSERT INTO `vtiger_kpi_department` (`kpi_departmentid`, `kpi_department`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Sales', 1, 332, 1, NULL),
(2, 'Marketing', 1, 333, 2, NULL),
(3, 'Product', 1, 334, 3, NULL),
(4, 'HR Admin', 1, 335, 4, NULL),
(5, 'Service', 1, 336, 5, NULL),
(6, 'Other', 1, 337, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_kpi_department_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_kpi_department_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_kpi_department_seq`
--

INSERT INTO `vtiger_kpi_department_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_kpi_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_kpi_status` (
  `kpi_statusid` int(11) NOT NULL,
  `kpi_status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`kpi_statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_kpi_status`
--

INSERT INTO `vtiger_kpi_status` (`kpi_statusid`, `kpi_status`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Planning', 1, 338, 1, NULL),
(2, 'Active', 1, 339, 2, NULL),
(3, 'Inactive', 1, 340, 3, NULL),
(4, 'Completed', 1, 341, 4, NULL),
(5, 'Cancelled', 1, 342, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_kpi_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_kpi_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_kpi_status_seq`
--

INSERT INTO `vtiger_kpi_status_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_kpi_type`
--

CREATE TABLE IF NOT EXISTS `vtiger_kpi_type` (
  `kpi_typeid` int(11) NOT NULL,
  `kpi_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`kpi_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_kpi_type`
--

INSERT INTO `vtiger_kpi_type` (`kpi_typeid`, `kpi_type`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Test', 1, 331, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_kpi_type_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_kpi_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_kpi_type_seq`
--

INSERT INTO `vtiger_kpi_type_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_language`
--

CREATE TABLE IF NOT EXISTS `vtiger_language` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `label` varchar(30) DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `isdefault` int(1) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_language`
--

INSERT INTO `vtiger_language` (`id`, `name`, `prefix`, `label`, `lastupdated`, `sequence`, `isdefault`, `active`) VALUES
(1, 'English', 'en_us', 'US English', '2020-04-03 16:54:03', NULL, 1, 1),
(2, 'Arabic', 'ar_ae', 'Arabic', '2020-04-03 16:55:44', NULL, 0, 1),
(3, 'Brazilian', 'pt_br', 'PT Brasil', '2020-04-03 16:55:17', NULL, 0, 1),
(4, 'British English', 'en_gb', 'British English', '2020-04-03 16:54:58', NULL, 0, 1),
(5, 'Deutsch', 'de_de', 'DE Deutsch', '2020-04-03 16:54:59', NULL, 0, 1),
(6, 'Dutch', 'nl_nl', 'NL-Dutch', '2020-04-03 16:54:59', NULL, 0, 1),
(7, 'Pack de langue français', 'fr_fr', 'Pack de langue français', '2020-04-03 16:55:17', NULL, 0, 1),
(8, 'Hungarian', 'hu_hu', 'HU Magyar', '2020-04-03 16:55:00', NULL, 0, 1),
(9, 'Italian', 'it_it', 'IT Italian', '2020-04-03 16:55:01', NULL, 0, 1),
(10, 'Mexican Spanish', 'es_mx', 'ES Mexico', '2020-04-03 16:55:01', NULL, 0, 1),
(11, 'Język Polski', 'pl_pl', 'Język Polski', '2020-04-03 16:55:17', NULL, 0, 1),
(12, 'Romana', 'ro_ro', 'Romana', '2020-04-03 16:55:17', NULL, 0, 1),
(13, 'Russian', 'ru_ru', 'Russian', '2020-04-03 16:55:12', NULL, 0, 1),
(14, 'Spanish', 'es_es', 'ES Spanish', '2020-04-03 16:55:14', NULL, 0, 1),
(15, 'Swedish', 'sv_se', 'Swedish', '2020-04-03 16:55:44', NULL, 0, 1),
(16, 'Turkce', 'tr_tr', 'Turkce Dil Paketi', '2020-04-03 16:55:14', NULL, 0, 1),
(17, 'Vietnamese', 'vn_vn', 'Tiếng Việt | Vietnamese', '2020-04-08 12:37:37', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_language_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_language_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_language_seq`
--

INSERT INTO `vtiger_language_seq` (`id`) VALUES
(17);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadaddress`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadaddress` (
  `leadaddressid` int(19) NOT NULL DEFAULT 0,
  `city` varchar(30) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `pobox` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `lane` varchar(250) DEFAULT NULL,
  `leadaddresstype` varchar(30) DEFAULT 'Billing',
  PRIMARY KEY (`leadaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leaddetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_leaddetails` (
  `leadid` int(19) NOT NULL,
  `lead_no` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `interest` varchar(50) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `salutation` varchar(200) DEFAULT NULL,
  `lastname` varchar(80) NOT NULL,
  `company` varchar(100) NOT NULL,
  `annualrevenue` decimal(25,8) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `campaign` varchar(30) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `leadstatus` varchar(200) DEFAULT NULL,
  `leadsource` varchar(200) DEFAULT NULL,
  `converted` int(1) DEFAULT 0,
  `designation` varchar(50) DEFAULT 'SalesMan',
  `licencekeystatus` varchar(50) DEFAULT NULL,
  `space` varchar(250) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `priority` varchar(50) DEFAULT NULL,
  `demorequest` varchar(50) DEFAULT NULL,
  `partnercontact` varchar(50) DEFAULT NULL,
  `productversion` varchar(20) DEFAULT NULL,
  `product` varchar(50) DEFAULT NULL,
  `maildate` date DEFAULT NULL,
  `nextstepdate` date DEFAULT NULL,
  `fundingsituation` varchar(50) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `evaluationstatus` varchar(50) DEFAULT NULL,
  `transferdate` date DEFAULT NULL,
  `revenuetype` varchar(50) DEFAULT NULL,
  `noofemployees` int(50) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `assignleadchk` int(1) DEFAULT 0,
  `emailoptout` varchar(3) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`leadid`),
  KEY `leaddetails_converted_leadstatus_idx` (`converted`,`leadstatus`),
  KEY `email_idx` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadscf` (
  `leadid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`leadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadsource`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsource` (
  `leadsourceid` int(19) NOT NULL,
  `leadsource` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`leadsourceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_leadsource`
--

INSERT INTO `vtiger_leadsource` (`leadsourceid`, `leadsource`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Cold Call', 1, 99, 1, NULL),
(3, 'Existing Customer', 1, 100, 2, NULL),
(4, 'Self Generated', 1, 101, 3, NULL),
(5, 'Employee', 1, 102, 4, NULL),
(6, 'Partner', 1, 103, 5, NULL),
(7, 'Public Relations', 1, 104, 6, NULL),
(8, 'Direct Mail', 1, 105, 7, NULL),
(9, 'Conference', 1, 106, 8, NULL),
(10, 'Trade Show', 1, 107, 9, NULL),
(11, 'Web Site', 1, 108, 10, NULL),
(12, 'Word of mouth', 1, 109, 11, NULL),
(13, 'Other', 1, 110, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadsource_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsource_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_leadsource_seq`
--

INSERT INTO `vtiger_leadsource_seq` (`id`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadstage`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstage` (
  `leadstageid` int(19) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`leadstageid`),
  UNIQUE KEY `leadstage_stage_idx` (`stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstatus` (
  `leadstatusid` int(19) NOT NULL,
  `leadstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`leadstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_leadstatus`
--

INSERT INTO `vtiger_leadstatus` (`leadstatusid`, `leadstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Attempted to Contact', 1, 112, 1, NULL),
(3, 'Cold', 1, 113, 2, NULL),
(4, 'Contact in Future', 1, 114, 3, NULL),
(5, 'Contacted', 1, 115, 4, NULL),
(6, 'Hot', 1, 116, 5, NULL),
(7, 'Junk Lead', 1, 117, 6, NULL),
(8, 'Lost Lead', 1, 118, 7, NULL),
(9, 'Not Contacted', 1, 119, 8, NULL),
(10, 'Pre Qualified', 1, 120, 9, NULL),
(11, 'Qualified', 1, 121, 10, NULL),
(12, 'Warm', 1, 122, 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_leadstatus_seq`
--

INSERT INTO `vtiger_leadstatus_seq` (`id`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_leadsubdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_leadsubdetails` (
  `leadsubscriptionid` int(19) NOT NULL DEFAULT 0,
  `website` varchar(255) DEFAULT NULL,
  `callornot` int(1) DEFAULT 0,
  `readornot` int(1) DEFAULT 0,
  `empct` int(10) DEFAULT 0,
  PRIMARY KEY (`leadsubscriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_lead_view`
--

CREATE TABLE IF NOT EXISTS `vtiger_lead_view` (
  `lead_viewid` int(19) NOT NULL,
  `lead_view` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`lead_viewid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_lead_view`
--

INSERT INTO `vtiger_lead_view` (`lead_viewid`, `lead_view`, `sortorderid`, `presence`) VALUES
(1, 'Today', 0, 1),
(2, 'Last 2 Days', 1, 1),
(3, 'Last Week', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_lead_view_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_lead_view_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_lead_view_seq`
--

INSERT INTO `vtiger_lead_view_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_links`
--

CREATE TABLE IF NOT EXISTS `vtiger_links` (
  `linkid` int(11) NOT NULL,
  `tabid` int(11) DEFAULT NULL,
  `linktype` varchar(50) DEFAULT NULL,
  `linklabel` varchar(50) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `linkicon` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `handler_path` varchar(128) DEFAULT NULL,
  `handler_class` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `parent_link` int(19) DEFAULT NULL,
  PRIMARY KEY (`linkid`),
  KEY `link_tabidtype_idx` (`tabid`,`linktype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_links`
--

INSERT INTO `vtiger_links` (`linkid`, `tabid`, `linktype`, `linklabel`, `linkurl`, `linkicon`, `sequence`, `handler_path`, `handler_class`, `handler`, `parent_link`) VALUES
(2, 6, 'DETAILVIEW', 'LBL_SHOW_ACCOUNT_HIERARCHY', 'index.php?module=Accounts&action=AccountHierarchy&accountid=$RECORD$', '', 0, NULL, NULL, NULL, NULL),
(11, 7, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL, NULL),
(12, 4, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL, NULL),
(13, 6, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL, NULL),
(14, 2, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL, NULL),
(15, 42, 'HEADERSCRIPT', 'ModCommentsCommonHeaderScript', 'modules/ModComments/ModCommentsCommon.js', '', 0, NULL, NULL, NULL, NULL),
(28, 49, 'HEADERSCRIPT', 'ExtensionStoreCommonHeaderScript', 'modules/ExtensionStore/ExtensionStore.js', '', 0, NULL, NULL, NULL, NULL),
(30, 44, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL, NULL),
(31, 45, 'DETAILVIEWBASIC', 'Add Project Task', 'index.php?module=ProjectTask&action=EditView&projectid=$RECORD$&return_module=Project&return_action=DetailView&return_id=$RECORD$', '', 0, 'modules/ProjectTask/ProjectTask.php', 'ProjectTask', 'isLinkPermitted', NULL),
(33, 45, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL, NULL),
(34, 2, 'DASHBOARDWIDGET', 'History', 'index.php?module=Potentials&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL, NULL),
(35, 2, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Potentials&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL, NULL),
(36, 2, 'DASHBOARDWIDGET', 'Funnel', 'index.php?module=Potentials&view=ShowWidget&name=GroupedBySalesStage', '', 3, NULL, NULL, NULL, NULL),
(37, 2, 'DASHBOARDWIDGET', 'Potentials by Stage', 'index.php?module=Potentials&view=ShowWidget&name=GroupedBySalesPerson', '', 4, NULL, NULL, NULL, NULL),
(38, 2, 'DASHBOARDWIDGET', 'Pipelined Amount', 'index.php?module=Potentials&view=ShowWidget&name=PipelinedAmountPerSalesPerson', '', 5, NULL, NULL, NULL, NULL),
(39, 2, 'DASHBOARDWIDGET', 'Total Revenue', 'index.php?module=Potentials&view=ShowWidget&name=TotalRevenuePerSalesPerson', '', 6, NULL, NULL, NULL, NULL),
(40, 2, 'DASHBOARDWIDGET', 'Top Potentials', 'index.php?module=Potentials&view=ShowWidget&name=TopPotentials', '', 7, NULL, NULL, NULL, NULL),
(41, 2, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Potentials&view=ShowWidget&name=OverdueActivities', '', 9, NULL, NULL, NULL, NULL),
(42, 6, 'DASHBOARDWIDGET', 'History', 'index.php?module=Accounts&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL, NULL),
(43, 6, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Accounts&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL, NULL),
(44, 6, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Accounts&view=ShowWidget&name=OverdueActivities', '', 3, NULL, NULL, NULL, NULL),
(45, 4, 'DASHBOARDWIDGET', 'History', 'index.php?module=Contacts&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL, NULL),
(46, 4, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Contacts&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL, NULL),
(47, 4, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Contacts&view=ShowWidget&name=OverdueActivities', '', 3, NULL, NULL, NULL, NULL),
(48, 7, 'DASHBOARDWIDGET', 'History', 'index.php?module=Leads&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL, NULL),
(49, 7, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Leads&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL, NULL),
(50, 7, 'DASHBOARDWIDGET', 'Leads by Status', 'index.php?module=Leads&view=ShowWidget&name=LeadsByStatus', '', 4, NULL, NULL, NULL, NULL),
(51, 7, 'DASHBOARDWIDGET', 'Leads by Source', 'index.php?module=Leads&view=ShowWidget&name=LeadsBySource', '', 5, NULL, NULL, NULL, NULL),
(52, 7, 'DASHBOARDWIDGET', 'Leads by Industry', 'index.php?module=Leads&view=ShowWidget&name=LeadsByIndustry', '', 6, NULL, NULL, NULL, NULL),
(53, 7, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Leads&view=ShowWidget&name=OverdueActivities', '', 7, NULL, NULL, NULL, NULL),
(54, 13, 'DASHBOARDWIDGET', 'Tickets by Status', 'index.php?module=HelpDesk&view=ShowWidget&name=TicketsByStatus', '', 1, NULL, NULL, NULL, NULL),
(55, 13, 'DASHBOARDWIDGET', 'Open Tickets', 'index.php?module=HelpDesk&view=ShowWidget&name=OpenTickets', '', 2, NULL, NULL, NULL, NULL),
(56, 3, 'DASHBOARDWIDGET', 'History', 'index.php?module=Home&view=ShowWidget&name=History', '', 1, NULL, NULL, NULL, NULL),
(57, 3, 'DASHBOARDWIDGET', 'Upcoming Activities', 'index.php?module=Home&view=ShowWidget&name=CalendarActivities', '', 2, NULL, NULL, NULL, NULL),
(58, 3, 'DASHBOARDWIDGET', 'Funnel', 'index.php?module=Potentials&view=ShowWidget&name=GroupedBySalesStage', '', 3, NULL, NULL, NULL, NULL),
(59, 3, 'DASHBOARDWIDGET', 'Potentials by Stage', 'index.php?module=Potentials&view=ShowWidget&name=GroupedBySalesPerson', '', 4, NULL, NULL, NULL, NULL),
(60, 3, 'DASHBOARDWIDGET', 'Pipelined Amount', 'index.php?module=Potentials&view=ShowWidget&name=PipelinedAmountPerSalesPerson', '', 5, NULL, NULL, NULL, NULL),
(61, 3, 'DASHBOARDWIDGET', 'Total Revenue', 'index.php?module=Potentials&view=ShowWidget&name=TotalRevenuePerSalesPerson', '', 6, NULL, NULL, NULL, NULL),
(62, 3, 'DASHBOARDWIDGET', 'Top Potentials', 'index.php?module=Potentials&view=ShowWidget&name=TopPotentials', '', 7, NULL, NULL, NULL, NULL),
(63, 3, 'DASHBOARDWIDGET', 'Leads by Status', 'index.php?module=Leads&view=ShowWidget&name=LeadsByStatus', '', 10, NULL, NULL, NULL, NULL),
(64, 3, 'DASHBOARDWIDGET', 'Leads by Source', 'index.php?module=Leads&view=ShowWidget&name=LeadsBySource', '', 11, NULL, NULL, NULL, NULL),
(65, 3, 'DASHBOARDWIDGET', 'Leads by Industry', 'index.php?module=Leads&view=ShowWidget&name=LeadsByIndustry', '', 12, NULL, NULL, NULL, NULL),
(66, 3, 'DASHBOARDWIDGET', 'Overdue Activities', 'index.php?module=Home&view=ShowWidget&name=OverdueActivities', '', 13, NULL, NULL, NULL, NULL),
(67, 3, 'DASHBOARDWIDGET', 'Tickets by Status', 'index.php?module=HelpDesk&view=ShowWidget&name=TicketsByStatus', '', 13, NULL, NULL, NULL, NULL),
(68, 3, 'DASHBOARDWIDGET', 'Open Tickets', 'index.php?module=HelpDesk&view=ShowWidget&name=OpenTickets', '', 14, NULL, NULL, NULL, NULL),
(69, 13, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL, NULL),
(70, 15, 'DETAILVIEWWIDGET', 'DetailViewBlockCommentWidget', 'block://ModComments:modules/ModComments/ModComments.php', '', 0, NULL, NULL, NULL, NULL),
(99, 3, 'DASHBOARDWIDGET', 'Key Metrics', 'index.php?module=Home&view=ShowWidget&name=KeyMetrics', '', 0, NULL, NULL, NULL, NULL),
(100, 3, 'DASHBOARDWIDGET', 'Mini List', 'index.php?module=Home&view=ShowWidget&name=MiniList', '', 0, NULL, NULL, NULL, NULL),
(101, 3, 'DASHBOARDWIDGET', 'Tag Cloud', 'index.php?module=Home&view=ShowWidget&name=TagCloud', '', 0, NULL, NULL, NULL, NULL),
(102, 2, 'DASHBOARDWIDGET', 'Funnel Amount', 'index.php?module=Potentials&view=ShowWidget&name=FunnelAmount', '', 10, NULL, NULL, NULL, NULL),
(103, 3, 'DASHBOARDWIDGET', 'Funnel Amount', 'index.php?module=Potentials&view=ShowWidget&name=FunnelAmount', '', 10, NULL, NULL, NULL, NULL),
(104, 3, 'DASHBOARDWIDGET', 'Notebook', 'index.php?module=Home&view=ShowWidget&name=Notebook', '', 0, NULL, NULL, NULL, NULL),
(105, 25, 'LISTVIEWBASIC', 'LBL_ADD_RECORD', '', '', 0, NULL, NULL, NULL, NULL),
(106, 25, 'LISTVIEWBASIC', 'LBL_DETAIL_REPORT', 'javascript:Reports_List_Js.addReport(\"index.php?module=Reports&view=Edit\")', '', 0, 'modules/Reports/models/Module.php', 'Reports_Module_Model', 'checkLinkAccess', 105),
(107, 25, 'LISTVIEWBASIC', 'LBL_CHARTS', 'javascript:Reports_List_Js.addReport(\"index.php?module=Reports&view=ChartEdit\")', '', 0, 'modules/Reports/models/Module.php', 'Reports_Module_Model', 'checkLinkAccess', 105),
(108, 25, 'LISTVIEWBASIC', 'LBL_ADD_FOLDER', 'javascript:Reports_List_Js.triggerAddFolder(\"index.php?module=Reports&view=EditFolder\")', '', 0, 'modules/Reports/models/Module.php', 'Reports_Module_Model', 'checkLinkAccess', NULL),
(109, 4, 'EXTENSIONLINK', 'Google', 'index.php?module=Contacts&view=Extension&extensionModule=Google&extensionView=Index', '', 0, NULL, NULL, NULL, NULL),
(110, 9, 'EXTENSIONLINK', 'Google', 'index.php?module=Calendar&view=Extension&extensionModule=Google&extensionView=Index', '', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_links_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_links_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_links_seq`
--

INSERT INTO `vtiger_links_seq` (`id`) VALUES
(111);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_loginhistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_loginhistory` (
  `login_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_ip` varchar(25) NOT NULL,
  `logout_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `login_time` datetime DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_loginhistory`
--

INSERT INTO `vtiger_loginhistory` (`login_id`, `user_name`, `user_ip`, `logout_time`, `login_time`, `status`) VALUES
(0, 'admin', '::1', '2020-05-05 03:09:30', '2020-05-05 10:09:30', 'Signed in'),
(1, 'admin', '::1', '2020-04-03 01:56:19', '2020-04-03 15:56:19', 'Signed in'),
(2, 'admin', '::1', '2020-04-07 22:39:05', '2020-04-08 12:27:39', 'Signed off'),
(3, 'admin', '::1', '2020-04-07 22:39:14', '2020-04-08 12:39:14', 'Signed in'),
(4, 'admin', '::1', '2020-04-12 15:54:18', '2020-04-13 05:54:18', 'Signed in'),
(5, 'admin', '::1', '2020-04-12 18:14:04', '2020-04-13 08:14:04', 'Signed in'),
(6, 'admin', '::1', '2020-04-12 19:02:17', '2020-04-13 09:02:17', 'Signed in'),
(7, 'admin', '::1', '2020-04-12 20:05:04', '2020-04-13 10:05:04', 'Signed in'),
(8, 'admin', '::1', '2020-04-15 22:32:33', '2020-04-16 12:32:33', 'Signed in'),
(9, 'admin', '::1', '2020-05-05 03:53:36', '2020-04-17 12:56:26', 'Signed off');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailer_queue`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailer_queue` (
  `id` int(11) NOT NULL,
  `fromname` varchar(100) DEFAULT NULL,
  `fromemail` varchar(100) DEFAULT NULL,
  `mailer` varchar(10) DEFAULT NULL,
  `content_type` varchar(15) DEFAULT NULL,
  `subject` varchar(999) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `relcrmid` int(11) DEFAULT NULL,
  `failed` int(1) NOT NULL DEFAULT 0,
  `failreason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailer_queueattachments`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailer_queueattachments` (
  `id` int(11) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `encoding` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailer_queueinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailer_queueinfo` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailmanager_mailattachments`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailattachments` (
  `userid` int(11) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  `aname` varchar(100) DEFAULT NULL,
  `lastsavedtime` int(11) DEFAULT NULL,
  `attachid` int(19) NOT NULL,
  `path` varchar(200) NOT NULL,
  `cid` varchar(100) DEFAULT NULL,
  KEY `userid_muid_idx` (`userid`,`muid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailmanager_mailrecord`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailrecord` (
  `userid` int(11) DEFAULT NULL,
  `mfrom` varchar(255) DEFAULT NULL,
  `mto` varchar(255) DEFAULT NULL,
  `mcc` varchar(500) DEFAULT NULL,
  `mbcc` varchar(500) DEFAULT NULL,
  `mdate` varchar(20) DEFAULT NULL,
  `msubject` varchar(500) DEFAULT NULL,
  `mbody` text DEFAULT NULL,
  `mcharset` varchar(10) DEFAULT NULL,
  `misbodyhtml` int(1) DEFAULT NULL,
  `mplainmessage` int(1) DEFAULT NULL,
  `mhtmlmessage` int(1) DEFAULT NULL,
  `muniqueid` varchar(500) DEFAULT NULL,
  `mbodyparsed` int(1) DEFAULT NULL,
  `muid` int(11) DEFAULT NULL,
  `lastsavedtime` int(11) DEFAULT NULL,
  `folder` varchar(250) DEFAULT NULL,
  `mfolder` varchar(250) DEFAULT NULL,
  KEY `userid_lastsavedtime_idx` (`userid`,`lastsavedtime`),
  KEY `userid_muid_idx` (`userid`,`muid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailmanager_mailrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailmanager_mailrel` (
  `mailuid` varchar(999) DEFAULT NULL,
  `crmid` int(11) DEFAULT NULL,
  `emailid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner` (
  `scannerid` int(11) NOT NULL,
  `scannername` varchar(30) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `protocol` varchar(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ssltype` varchar(10) DEFAULT NULL,
  `sslmethod` varchar(30) DEFAULT NULL,
  `connecturl` varchar(255) DEFAULT NULL,
  `searchfor` varchar(10) DEFAULT NULL,
  `markas` varchar(10) DEFAULT NULL,
  `isvalid` int(1) DEFAULT NULL,
  `scanfrom` varchar(10) DEFAULT 'ALL',
  `time_zone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`scannerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_actions`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_actions` (
  `actionid` int(11) NOT NULL,
  `scannerid` int(11) DEFAULT NULL,
  `actiontype` varchar(10) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `lookup` varchar(30) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_folders`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_folders` (
  `folderid` int(11) NOT NULL,
  `scannerid` int(11) DEFAULT NULL,
  `foldername` varchar(255) DEFAULT NULL,
  `lastscan` varchar(30) DEFAULT NULL,
  `rescan` int(1) DEFAULT NULL,
  `enabled` int(1) DEFAULT NULL,
  PRIMARY KEY (`folderid`),
  KEY `folderid_idx` (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_ids`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_ids` (
  `scannerid` int(11) DEFAULT NULL,
  `messageid` varchar(512) DEFAULT NULL,
  `crmid` int(11) DEFAULT NULL,
  `refids` text DEFAULT NULL,
  KEY `scanner_message_ids_idx` (`scannerid`,`messageid`),
  KEY `messageids_crmid_idx` (`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_ruleactions`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_ruleactions` (
  `ruleid` int(11) DEFAULT NULL,
  `actionid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mailscanner_rules`
--

CREATE TABLE IF NOT EXISTS `vtiger_mailscanner_rules` (
  `ruleid` int(11) NOT NULL,
  `scannerid` int(11) DEFAULT NULL,
  `fromaddress` varchar(255) DEFAULT NULL,
  `toaddress` varchar(255) DEFAULT NULL,
  `subjectop` varchar(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `bodyop` varchar(20) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `matchusing` varchar(5) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `assigned_to` int(10) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mail_accounts`
--

CREATE TABLE IF NOT EXISTS `vtiger_mail_accounts` (
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `mail_id` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `mail_protocol` varchar(20) DEFAULT NULL,
  `mail_username` varchar(50) NOT NULL,
  `mail_password` text DEFAULT NULL,
  `mail_servername` varchar(50) DEFAULT NULL,
  `box_refresh` int(10) DEFAULT NULL,
  `mails_per_page` int(10) DEFAULT NULL,
  `ssltype` varchar(50) DEFAULT NULL,
  `sslmeth` varchar(50) DEFAULT NULL,
  `int_mailer` int(1) DEFAULT 0,
  `status` varchar(10) DEFAULT NULL,
  `set_default` int(2) DEFAULT NULL,
  `sent_folder` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_manufacturer`
--

CREATE TABLE IF NOT EXISTS `vtiger_manufacturer` (
  `manufacturerid` int(19) NOT NULL,
  `manufacturer` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`manufacturerid`),
  UNIQUE KEY `manufacturer_manufacturer_idx` (`manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_manufacturer`
--

INSERT INTO `vtiger_manufacturer` (`manufacturerid`, `manufacturer`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'AltvetPet Inc.', 1, 124, 1, NULL),
(3, 'LexPon Inc.', 1, 125, 2, NULL),
(4, 'MetBeat Corp', 1, 126, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_manufacturer_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_manufacturer_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_manufacturer_seq`
--

INSERT INTO `vtiger_manufacturer_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_mobile_alerts`
--

CREATE TABLE IF NOT EXISTS `vtiger_mobile_alerts` (
  `id` int(11) NOT NULL,
  `handler_path` varchar(500) DEFAULT NULL,
  `handler_class` varchar(50) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_mobile_alerts`
--

INSERT INTO `vtiger_mobile_alerts` (`id`, `handler_path`, `handler_class`, `sequence`, `deleted`) VALUES
(1, 'modules/Mobile/api/ws/models/alerts/IdleTicketsOfMine.php', 'Mobile_WS_AlertModel_IdleTicketsOfMine', NULL, 0),
(2, 'modules/Mobile/api/ws/models/alerts/NewTicketOfMine.php', 'Mobile_WS_AlertModel_NewTicketOfMine', NULL, 0),
(3, 'modules/Mobile/api/ws/models/alerts/PendingTicketsOfMine.php', 'Mobile_WS_AlertModel_PendingTicketsOfMine', NULL, 0),
(4, 'modules/Mobile/api/ws/models/alerts/PotentialsDueIn5Days.php', 'Mobile_WS_AlertModel_PotentialsDueIn5Days', NULL, 0),
(5, 'modules/Mobile/api/ws/models/alerts/EventsOfMineToday.php', 'Mobile_WS_AlertModel_EventsOfMineToday', NULL, 0),
(6, 'modules/Mobile/api/ws/models/alerts/ProjectTasksOfMine.php', 'Mobile_WS_AlertModel_ProjectTasksOfMine', NULL, 0),
(7, 'modules/Mobile/api/ws/models/alerts/Projects.php', 'Mobile_WS_AlertModel_Projects', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_modcomments` (
  `modcommentsid` int(11) DEFAULT NULL,
  `commentcontent` text DEFAULT NULL,
  `related_to` int(19) DEFAULT NULL,
  `parent_comments` int(19) DEFAULT NULL,
  `customer` int(19) DEFAULT NULL,
  `userid` int(19) DEFAULT NULL,
  `reasontoedit` varchar(100) DEFAULT NULL,
  `is_private` int(1) DEFAULT 0,
  `filename` varchar(255) DEFAULT NULL,
  `related_email_id` int(11) DEFAULT NULL,
  KEY `relatedto_idx` (`related_to`),
  KEY `fk_crmid_vtiger_modcomments` (`modcommentsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modcommentscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_modcommentscf` (
  `modcommentsid` int(11) NOT NULL,
  PRIMARY KEY (`modcommentsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modentity_num`
--

CREATE TABLE IF NOT EXISTS `vtiger_modentity_num` (
  `num_id` int(19) NOT NULL,
  `semodule` varchar(100) DEFAULT NULL,
  `prefix` varchar(50) NOT NULL DEFAULT '',
  `start_id` varchar(50) NOT NULL,
  `cur_id` varchar(50) NOT NULL,
  `active` varchar(2) NOT NULL,
  PRIMARY KEY (`num_id`),
  UNIQUE KEY `num_idx` (`num_id`),
  KEY `semodule_active_idx` (`semodule`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_modentity_num`
--

INSERT INTO `vtiger_modentity_num` (`num_id`, `semodule`, `prefix`, `start_id`, `cur_id`, `active`) VALUES
(1, 'Leads', 'LEA', '1', '1', '1'),
(2, 'Accounts', 'ACC', '1', '1', '1'),
(3, 'Campaigns', 'CAM', '1', '1', '1'),
(4, 'Contacts', 'CON', '1', '1', '1'),
(5, 'Potentials', 'POT', '1', '1', '1'),
(6, 'HelpDesk', 'TT', '1', '1', '1'),
(7, 'Quotes', 'QUO', '1', '1', '1'),
(8, 'SalesOrder', 'SO', '1', '1', '1'),
(9, 'PurchaseOrder', 'PO', '1', '1', '1'),
(10, 'Invoice', 'INV', '1', '1', '1'),
(11, 'Products', 'PRO', '1', '2', '1'),
(12, 'Vendors', 'VEN', '1', '1', '1'),
(13, 'PriceBooks', 'PB', '1', '1', '1'),
(14, 'Faq', 'FAQ', '1', '1', '1'),
(15, 'Documents', 'DOC', '1', '1', '1'),
(16, 'ServiceContracts', 'SERCON', '1', '1', '1'),
(17, 'Services', 'SER', '1', '1', '1'),
(18, 'Assets', 'ASSET', '1', '1', '1'),
(19, 'ProjectMilestone', 'PM', '1', '1', '1'),
(20, 'ProjectTask', 'PT', '1', '1', '1'),
(21, 'Project', 'PROJ', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modentity_num_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_modentity_num_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_modentity_num_seq`
--

INSERT INTO `vtiger_modentity_num_seq` (`id`) VALUES
(21);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modtracker_basic`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_basic` (
  `id` int(20) NOT NULL,
  `crmid` int(20) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `whodid` int(20) DEFAULT NULL,
  `changedon` datetime DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `crmidx` (`crmid`),
  KEY `idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_modtracker_basic`
--

INSERT INTO `vtiger_modtracker_basic` (`id`, `crmid`, `module`, `whodid`, `changedon`, `status`) VALUES
(1, 31, 'Products', 1, '2020-05-21 16:58:20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modtracker_basic_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_basic_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vtiger_modtracker_basic_seq`
--

INSERT INTO `vtiger_modtracker_basic_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modtracker_detail`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_detail` (
  `id` int(11) DEFAULT NULL,
  `fieldname` varchar(100) DEFAULT NULL,
  `prevalue` text DEFAULT NULL,
  `postvalue` text DEFAULT NULL,
  KEY `idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_modtracker_detail`
--

INSERT INTO `vtiger_modtracker_detail` (`id`, `fieldname`, `prevalue`, `postvalue`) VALUES
(1, 'label', NULL, 'M&aacute;y t&iacute;nh'),
(1, 'productname', NULL, 'M&aacute;y t&iacute;nh'),
(1, 'product_no', NULL, 'PRO1'),
(1, 'discontinued', NULL, '1'),
(1, 'createdtime', NULL, '2020-05-21 16:58:20'),
(1, 'modifiedby', NULL, '1'),
(1, 'unit_price', NULL, '100000.00000000'),
(1, 'commissionrate', NULL, '0.000'),
(1, 'qty_per_unit', NULL, '0.00'),
(1, 'qtyinstock', NULL, '0.000'),
(1, 'assigned_user_id', NULL, '1'),
(1, 'purchase_cost', NULL, '0.00000000'),
(1, 'source', NULL, 'CRM'),
(1, 'record_id', NULL, '31'),
(1, 'record_module', NULL, 'Products');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modtracker_relations`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_relations` (
  `id` int(19) NOT NULL,
  `targetmodule` varchar(100) NOT NULL,
  `targetid` int(19) NOT NULL,
  `changedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_modtracker_tabs`
--

CREATE TABLE IF NOT EXISTS `vtiger_modtracker_tabs` (
  `tabid` int(11) NOT NULL,
  `visible` int(11) DEFAULT 0,
  PRIMARY KEY (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_modtracker_tabs`
--

INSERT INTO `vtiger_modtracker_tabs` (`tabid`, `visible`) VALUES
(2, 1),
(4, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(26, 1),
(28, 1),
(34, 1),
(35, 1),
(36, 1),
(38, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(47, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_module_dashboard_widgets`
--

CREATE TABLE IF NOT EXISTS `vtiger_module_dashboard_widgets` (
  `id` int(19) NOT NULL,
  `linkid` int(19) DEFAULT NULL,
  `userid` int(19) DEFAULT NULL,
  `filterid` int(19) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `reportid` int(19) DEFAULT NULL,
  `dashboardtabid` int(11) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboardtabid` (`dashboardtabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notebook_contents`
--

CREATE TABLE IF NOT EXISTS `vtiger_notebook_contents` (
  `userid` int(19) NOT NULL,
  `notebookid` int(19) NOT NULL,
  `contents` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notes`
--

CREATE TABLE IF NOT EXISTS `vtiger_notes` (
  `notesid` int(19) NOT NULL DEFAULT 0,
  `note_no` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `notecontent` text DEFAULT NULL,
  `folderid` int(19) NOT NULL DEFAULT 1,
  `filetype` varchar(50) DEFAULT NULL,
  `filelocationtype` varchar(5) DEFAULT NULL,
  `filedownloadcount` int(19) DEFAULT NULL,
  `filestatus` int(19) DEFAULT NULL,
  `filesize` int(19) NOT NULL DEFAULT 0,
  `fileversion` varchar(50) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`notesid`),
  KEY `notes_title_idx` (`title`),
  KEY `notes_notesid_idx` (`notesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notescf`
--

CREATE TABLE IF NOT EXISTS `vtiger_notescf` (
  `notesid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`notesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notificationscheduler`
--

CREATE TABLE IF NOT EXISTS `vtiger_notificationscheduler` (
  `schedulednotificationid` int(19) NOT NULL,
  `schedulednotificationname` varchar(200) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `notificationsubject` varchar(200) DEFAULT NULL,
  `notificationbody` text DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`schedulednotificationid`),
  UNIQUE KEY `notificationscheduler_schedulednotificationname_idx` (`schedulednotificationname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_notificationscheduler`
--

INSERT INTO `vtiger_notificationscheduler` (`schedulednotificationid`, `schedulednotificationname`, `active`, `notificationsubject`, `notificationbody`, `label`, `type`) VALUES
(1, 'LBL_TASK_NOTIFICATION_DESCRITPION', 1, 'Task Delay Notification', 'Tasks delayed beyond 24 hrs ', 'LBL_TASK_NOTIFICATION', NULL),
(2, 'LBL_BIG_DEAL_DESCRIPTION', 1, 'Big Deal notification', 'Success! A big deal has been won! ', 'LBL_BIG_DEAL', NULL),
(3, 'LBL_TICKETS_DESCRIPTION', 1, 'Pending Tickets notification', 'Ticket pending please ', 'LBL_PENDING_TICKETS', NULL),
(4, 'LBL_MANY_TICKETS_DESCRIPTION', 1, 'Too many tickets Notification', 'Too many tickets pending against this entity ', 'LBL_MANY_TICKETS', NULL),
(5, 'LBL_START_DESCRIPTION', 1, 'Support Start Notification', '10', 'LBL_START_NOTIFICATION', 'select'),
(6, 'LBL_SUPPORT_DESCRIPTION', 1, 'Support ending please', '11', 'LBL_SUPPORT_NOTICIATION', 'select'),
(7, 'LBL_SUPPORT_DESCRIPTION_MONTH', 1, 'Support ending please', '12', 'LBL_SUPPORT_NOTICIATION_MONTH', 'select'),
(8, 'LBL_ACTIVITY_REMINDER_DESCRIPTION', 1, 'Activity Reminder Notification', 'This is a reminder notification for the Activity', 'LBL_ACTIVITY_NOTIFICATION', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_notificationscheduler_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_notificationscheduler_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_notificationscheduler_seq`
--

INSERT INTO `vtiger_notificationscheduler_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_no_of_currency_decimals`
--

CREATE TABLE IF NOT EXISTS `vtiger_no_of_currency_decimals` (
  `no_of_currency_decimalsid` int(11) NOT NULL,
  `no_of_currency_decimals` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`no_of_currency_decimalsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_no_of_currency_decimals`
--

INSERT INTO `vtiger_no_of_currency_decimals` (`no_of_currency_decimalsid`, `no_of_currency_decimals`, `sortorderid`, `presence`) VALUES
(2, '2', 2, 1),
(3, '3', 3, 1),
(4, '4', 4, 1),
(5, '5', 5, 1),
(6, '0', 0, 1),
(7, '1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_no_of_currency_decimals_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_no_of_currency_decimals_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_no_of_currency_decimals_seq`
--

INSERT INTO `vtiger_no_of_currency_decimals_seq` (`id`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_opportunitystage`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunitystage` (
  `potstageid` int(19) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  `probability` decimal(3,2) DEFAULT 0.00,
  PRIMARY KEY (`potstageid`),
  UNIQUE KEY `opportunitystage_stage_idx` (`stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_opportunity_type`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunity_type` (
  `opptypeid` int(19) NOT NULL,
  `opportunity_type` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`opptypeid`),
  UNIQUE KEY `opportunity_type_opportunity_type_idx` (`opportunity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_opportunity_type`
--

INSERT INTO `vtiger_opportunity_type` (`opptypeid`, `opportunity_type`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Existing Business', 1, 128, 1, NULL),
(3, 'New Business', 1, 129, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_opportunity_type_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_opportunity_type_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_opportunity_type_seq`
--

INSERT INTO `vtiger_opportunity_type_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_organizationdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_organizationdetails` (
  `organization_id` int(11) NOT NULL,
  `organizationname` varchar(60) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `logoname` varchar(50) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `vatid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_organizationdetails`
--

INSERT INTO `vtiger_organizationdetails` (`organization_id`, `organizationname`, `address`, `city`, `state`, `country`, `code`, `phone`, `fax`, `website`, `logoname`, `logo`, `vatid`) VALUES
(1, 'vtiger', '95, 12th Main Road, 3rd Block, Rajajinagar', 'Bangalore', 'Karnataka', 'India', '560010', '+91 9243602352', '+91 9243602352', 'www.vtiger.com', 'vtiger-crm-logo.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_organizationdetails_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_organizationdetails_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_organizationdetails_seq`
--

INSERT INTO `vtiger_organizationdetails_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_org_share_action2tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_org_share_action2tab` (
  `share_action_id` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  PRIMARY KEY (`share_action_id`,`tabid`),
  KEY `fk_2_vtiger_org_share_action2tab` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_org_share_action2tab`
--

INSERT INTO `vtiger_org_share_action2tab` (`share_action_id`, `tabid`) VALUES
(0, 2),
(0, 4),
(0, 6),
(0, 7),
(0, 8),
(0, 9),
(0, 10),
(0, 13),
(0, 14),
(0, 16),
(0, 18),
(0, 20),
(0, 21),
(0, 22),
(0, 23),
(0, 26),
(0, 34),
(0, 35),
(0, 36),
(0, 38),
(0, 42),
(0, 43),
(0, 44),
(0, 45),
(0, 47),
(0, 50),
(0, 51),
(0, 52),
(0, 53),
(0, 54),
(0, 55),
(0, 56),
(0, 57),
(0, 58),
(0, 59),
(0, 60),
(0, 61),
(0, 63),
(0, 64),
(0, 65),
(0, 66),
(0, 70),
(0, 71),
(0, 72),
(1, 2),
(1, 4),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 13),
(1, 14),
(1, 16),
(1, 18),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 26),
(1, 34),
(1, 35),
(1, 36),
(1, 38),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 47),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 70),
(1, 71),
(1, 72),
(2, 2),
(2, 4),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 13),
(2, 14),
(2, 16),
(2, 18),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 26),
(2, 34),
(2, 35),
(2, 36),
(2, 38),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 47),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 70),
(2, 71),
(2, 72),
(3, 2),
(3, 4),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 13),
(3, 14),
(3, 16),
(3, 18),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 26),
(3, 34),
(3, 35),
(3, 36),
(3, 38),
(3, 42),
(3, 43),
(3, 44),
(3, 45),
(3, 47),
(3, 50),
(3, 51),
(3, 52),
(3, 53),
(3, 54),
(3, 55),
(3, 56),
(3, 57),
(3, 58),
(3, 59),
(3, 60),
(3, 61),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(3, 70),
(3, 71),
(3, 72);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_org_share_action_mapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_org_share_action_mapping` (
  `share_action_id` int(19) NOT NULL,
  `share_action_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`share_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_org_share_action_mapping`
--

INSERT INTO `vtiger_org_share_action_mapping` (`share_action_id`, `share_action_name`) VALUES
(0, 'Public: Read Only'),
(1, 'Public: Read, Create/Edit'),
(2, 'Public: Read, Create/Edit, Delete'),
(3, 'Private'),
(4, 'Hide Details'),
(5, 'Hide Details and Add Events'),
(6, 'Show Details'),
(7, 'Show Details and Add Events');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_othereventduration`
--

CREATE TABLE IF NOT EXISTS `vtiger_othereventduration` (
  `othereventdurationid` int(11) NOT NULL,
  `othereventduration` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`othereventdurationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_othereventduration`
--

INSERT INTO `vtiger_othereventduration` (`othereventdurationid`, `othereventduration`, `sortorderid`, `presence`) VALUES
(1, '5', 0, 1),
(2, '10', 1, 1),
(3, '30', 2, 1),
(4, '60', 3, 1),
(5, '120', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_othereventduration_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_othereventduration_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_othereventduration_seq`
--

INSERT INTO `vtiger_othereventduration_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_parenttab`
--

CREATE TABLE IF NOT EXISTS `vtiger_parenttab` (
  `parenttabid` int(19) NOT NULL,
  `parenttab_label` varchar(100) NOT NULL,
  `sequence` int(10) NOT NULL,
  `visible` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`parenttabid`),
  KEY `parenttab_parenttabid_parenttabl_label_visible_idx` (`parenttabid`,`parenttab_label`,`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_parenttab`
--

INSERT INTO `vtiger_parenttab` (`parenttabid`, `parenttab_label`, `sequence`, `visible`) VALUES
(1, 'My Home Page', 1, 0),
(2, 'Marketing', 2, 0),
(3, 'Sales', 3, 0),
(4, 'Support', 4, 0),
(5, 'Analytics', 5, 0),
(6, 'Inventory', 6, 0),
(7, 'Tools', 7, 0),
(8, 'Settings', 8, 0),
(9, 'HRM', 9, 0),
(10, 'Contacts', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_parenttabrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_parenttabrel` (
  `parenttabid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sequence` int(3) NOT NULL,
  KEY `parenttabrel_tabid_parenttabid_idx` (`tabid`,`parenttabid`),
  KEY `fk_2_vtiger_parenttabrel` (`parenttabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_parenttabrel`
--

INSERT INTO `vtiger_parenttabrel` (`parenttabid`, `tabid`, `sequence`) VALUES
(1, 9, 2),
(1, 28, 4),
(1, 3, 1),
(3, 7, 1),
(3, 6, 2),
(3, 4, 3),
(3, 2, 4),
(3, 20, 5),
(3, 22, 6),
(3, 23, 7),
(3, 19, 8),
(3, 8, 9),
(4, 13, 1),
(4, 15, 2),
(4, 6, 3),
(4, 4, 4),
(4, 8, 5),
(5, 1, 2),
(5, 25, 1),
(6, 14, 1),
(6, 18, 2),
(6, 19, 3),
(6, 21, 4),
(6, 22, 5),
(6, 20, 6),
(6, 23, 7),
(7, 24, 1),
(7, 27, 2),
(7, 8, 3),
(2, 26, 1),
(2, 6, 2),
(2, 4, 3),
(2, 28, 4),
(4, 28, 7),
(2, 7, 5),
(2, 9, 6),
(4, 9, 8),
(2, 8, 8),
(3, 9, 11),
(7, 31, 4),
(7, 31, 5),
(7, 34, 6),
(7, 34, 7),
(4, 35, 9),
(4, 35, 10),
(6, 36, 8),
(6, 36, 9),
(6, 38, 10),
(6, 38, 11),
(7, 40, 8),
(7, 40, 9),
(4, 43, 11),
(4, 43, 12),
(4, 44, 13),
(4, 44, 14),
(4, 45, 15),
(4, 45, 16),
(7, 46, 10),
(7, 46, 11),
(3, 47, 12),
(3, 47, 13),
(8, 49, 1),
(8, 49, 2),
(7, 24, 12),
(7, 27, 13),
(7, 40, 14),
(7, 46, 15),
(7, 50, 16),
(7, 50, 17),
(9, 51, 1),
(9, 51, 2),
(9, 52, 3),
(9, 52, 4),
(9, 53, 5),
(9, 53, 6),
(9, 54, 7),
(9, 54, 8),
(9, 55, 9),
(9, 55, 10),
(9, 56, 11),
(9, 56, 12),
(9, 57, 13),
(9, 57, 14),
(9, 58, 15),
(9, 58, 16),
(9, 59, 17),
(9, 59, 18),
(9, 60, 19),
(9, 60, 20),
(9, 61, 21),
(9, 61, 22),
(10, 63, 1),
(10, 64, 2),
(4, 65, 17),
(4, 66, 18),
(10, 64, 3),
(2, 70, 10),
(2, 71, 11),
(3, 72, 14);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_payment_duration`
--

CREATE TABLE IF NOT EXISTS `vtiger_payment_duration` (
  `payment_duration_id` int(11) DEFAULT NULL,
  `payment_duration` varchar(200) DEFAULT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_payment_duration`
--

INSERT INTO `vtiger_payment_duration` (`payment_duration_id`, `payment_duration`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Net 30 days', 0, 1, NULL),
(2, 'Net 45 days', 1, 1, NULL),
(3, 'Net 60 days', 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_payment_duration_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_payment_duration_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_payment_duration_seq`
--

INSERT INTO `vtiger_payment_duration_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pbxmanager`
--

CREATE TABLE IF NOT EXISTS `vtiger_pbxmanager` (
  `pbxmanagerid` int(20) NOT NULL,
  `direction` varchar(10) DEFAULT NULL,
  `callstatus` varchar(20) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `totalduration` int(11) DEFAULT NULL,
  `billduration` int(11) DEFAULT NULL,
  `recordingurl` varchar(200) DEFAULT NULL,
  `sourceuuid` varchar(100) DEFAULT NULL,
  `gateway` varchar(20) DEFAULT NULL,
  `customer` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `customernumber` varchar(100) DEFAULT NULL,
  `customertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pbxmanagerid`),
  KEY `index_sourceuuid` (`sourceuuid`),
  KEY `index_pbxmanager_id` (`pbxmanagerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pbxmanagercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_pbxmanagercf` (
  `pbxmanagerid` int(11) NOT NULL,
  PRIMARY KEY (`pbxmanagerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pbxmanager_gateway`
--

CREATE TABLE IF NOT EXISTS `vtiger_pbxmanager_gateway` (
  `id` int(11) NOT NULL,
  `gateway` varchar(20) DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pbxmanager_phonelookup`
--

CREATE TABLE IF NOT EXISTS `vtiger_pbxmanager_phonelookup` (
  `crmid` int(20) DEFAULT NULL,
  `setype` varchar(30) DEFAULT NULL,
  `fnumber` varchar(100) DEFAULT NULL,
  `rnumber` varchar(100) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  UNIQUE KEY `unique_key` (`crmid`,`setype`,`fieldname`),
  KEY `index_phone_number` (`fnumber`,`rnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_phuongtientruyenthong`
--

CREATE TABLE IF NOT EXISTS `vtiger_phuongtientruyenthong` (
  `phuongtientruyenthongid` int(19) NOT NULL,
  `pttt` varchar(255) DEFAULT NULL,
  `motachitiet` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`phuongtientruyenthongid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_phuongtientruyenthong`
--

INSERT INTO `vtiger_phuongtientruyenthong` (`phuongtientruyenthongid`, `pttt`, `motachitiet`, `tags`) VALUES
(33, '[\"Facebook\"]', 'Chạy Facebook ads', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_phuongtientruyenthongcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_phuongtientruyenthongcf` (
  `phuongtientruyenthongid` int(19) NOT NULL,
  PRIMARY KEY (`phuongtientruyenthongid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_phuongtientruyenthongcf`
--

INSERT INTO `vtiger_phuongtientruyenthongcf` (`phuongtientruyenthongid`) VALUES
(33);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklist`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist` (
  `picklistid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`picklistid`),
  UNIQUE KEY `picklist_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_picklist`
--

INSERT INTO `vtiger_picklist` (`picklistid`, `name`) VALUES
(1, 'accounttype'),
(2, 'activitytype'),
(37, 'assetstatus'),
(3, 'campaignstatus'),
(4, 'campaigntype'),
(60, 'candidate_action'),
(59, 'candidate_resource_cv'),
(5, 'carrier'),
(66, 'cf_1139'),
(33, 'contract_priority'),
(32, 'contract_status'),
(34, 'contract_type'),
(48, 'defaultactivitytype'),
(47, 'defaulteventstatus'),
(64, 'employ_gender'),
(65, 'employ_marital_status'),
(6, 'eventstatus'),
(7, 'expectedresponse'),
(8, 'faqcategories'),
(9, 'faqstatus'),
(10, 'glacct'),
(63, 'hr'),
(62, 'hrm_leave_action'),
(61, 'hrm_leave_type'),
(49, 'hr_salary_action'),
(11, 'industry'),
(12, 'invoicestatus'),
(51, 'jd_category'),
(52, 'jd_classify'),
(50, 'jd_status'),
(57, 'kpi_department'),
(58, 'kpi_status'),
(56, 'kpi_type'),
(13, 'leadsource'),
(14, 'leadstatus'),
(15, 'manufacturer'),
(16, 'opportunity_type'),
(17, 'postatus'),
(18, 'productcategory'),
(45, 'progress'),
(38, 'projectmilestonetype'),
(44, 'projectpriority'),
(42, 'projectstatus'),
(40, 'projecttaskpriority'),
(41, 'projecttaskprogress'),
(46, 'projecttaskstatus'),
(39, 'projecttasktype'),
(43, 'projecttype'),
(53, 'qcm_category'),
(54, 'qcm_classify'),
(55, 'qcm_status'),
(19, 'quotestage'),
(20, 'rating'),
(21, 'sales_stage'),
(22, 'salutationtype'),
(36, 'servicecategory'),
(35, 'service_usageunit'),
(23, 'sostatus'),
(24, 'taskpriority'),
(25, 'taskstatus'),
(26, 'ticketcategories'),
(27, 'ticketpriorities'),
(28, 'ticketseverities'),
(29, 'ticketstatus'),
(31, 'tracking_unit'),
(30, 'usageunit');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklistvalues_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklistvalues_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_picklistvalues_seq`
--

INSERT INTO `vtiger_picklistvalues_seq` (`id`) VALUES
(385);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklist_dependency`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist_dependency` (
  `id` int(11) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sourcefield` varchar(255) DEFAULT NULL,
  `targetfield` varchar(255) DEFAULT NULL,
  `sourcevalue` varchar(100) DEFAULT NULL,
  `targetvalues` text DEFAULT NULL,
  `criteria` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklist_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_picklist_seq`
--

INSERT INTO `vtiger_picklist_seq` (`id`) VALUES
(66);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_picklist_transitions`
--

CREATE TABLE IF NOT EXISTS `vtiger_picklist_transitions` (
  `fieldname` varchar(255) NOT NULL,
  `module` varchar(100) NOT NULL,
  `transition_data` varchar(1000) NOT NULL,
  PRIMARY KEY (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pobillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_pobillads` (
  `pobilladdressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pobilladdressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_portal`
--

CREATE TABLE IF NOT EXISTS `vtiger_portal` (
  `portalid` int(19) NOT NULL,
  `portalname` varchar(200) NOT NULL,
  `portalurl` varchar(255) NOT NULL,
  `sequence` int(3) NOT NULL,
  `setdefault` int(3) NOT NULL DEFAULT 0,
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`portalid`),
  KEY `portal_portalname_idx` (`portalname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_portalinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_portalinfo` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `cryptmode` varchar(20) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_poshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_poshipads` (
  `poshipaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`poshipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_postatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatus` (
  `postatusid` int(19) NOT NULL,
  `postatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`postatusid`),
  UNIQUE KEY `postatus_postatus_idx` (`postatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_postatus`
--

INSERT INTO `vtiger_postatus` (`postatusid`, `postatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Created', 0, 130, 0, NULL),
(2, 'Approved', 0, 131, 1, NULL),
(3, 'Delivered', 0, 132, 2, NULL),
(4, 'Cancelled', 0, 133, 3, NULL),
(5, 'Received Shipment', 0, 134, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_postatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatushistory` (
  `historyid` int(19) NOT NULL,
  `purchaseorderid` int(19) NOT NULL,
  `vendorname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `postatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `postatushistory_purchaseorderid_idx` (`purchaseorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_postatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_postatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_postatus_seq`
--

INSERT INTO `vtiger_postatus_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_potential`
--

CREATE TABLE IF NOT EXISTS `vtiger_potential` (
  `potentialid` int(19) NOT NULL DEFAULT 0,
  `potential_no` varchar(100) NOT NULL,
  `related_to` int(19) DEFAULT NULL,
  `potentialname` varchar(120) NOT NULL,
  `amount` decimal(25,8) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `closingdate` date DEFAULT NULL,
  `typeofrevenue` varchar(50) DEFAULT NULL,
  `nextstep` varchar(100) DEFAULT NULL,
  `private` int(1) DEFAULT 0,
  `probability` decimal(7,3) DEFAULT 0.000,
  `campaignid` int(19) DEFAULT NULL,
  `sales_stage` varchar(200) DEFAULT NULL,
  `potentialtype` varchar(200) DEFAULT NULL,
  `leadsource` varchar(200) DEFAULT NULL,
  `productid` int(50) DEFAULT NULL,
  `productversion` varchar(50) DEFAULT NULL,
  `quotationref` varchar(50) DEFAULT NULL,
  `partnercontact` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `runtimefee` int(19) DEFAULT 0,
  `followupdate` date DEFAULT NULL,
  `evaluationstatus` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `forecastcategory` int(19) DEFAULT 0,
  `outcomeanalysis` int(19) DEFAULT 0,
  `forecast_amount` decimal(25,8) DEFAULT NULL,
  `isconvertedfromlead` varchar(3) DEFAULT '0',
  `contact_id` int(19) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `converted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`potentialid`),
  KEY `potential_relatedto_idx` (`related_to`),
  KEY `potentail_sales_stage_idx` (`sales_stage`),
  KEY `potentail_sales_stage_amount_idx` (`amount`,`sales_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_potentialscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_potentialscf` (
  `potentialid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`potentialid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_potstagehistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_potstagehistory` (
  `historyid` int(19) NOT NULL,
  `potentialid` int(19) NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `stage` varchar(100) DEFAULT NULL,
  `probability` decimal(7,3) DEFAULT NULL,
  `expectedrevenue` decimal(10,0) DEFAULT NULL,
  `closedate` date DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `potstagehistory_potentialid_idx` (`potentialid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pricebook`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebook` (
  `pricebookid` int(19) NOT NULL DEFAULT 0,
  `pricebook_no` varchar(100) NOT NULL,
  `bookname` varchar(100) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`pricebookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pricebookcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebookcf` (
  `pricebookid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pricebookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_pricebookproductrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_pricebookproductrel` (
  `pricebookid` int(19) NOT NULL,
  `productid` int(19) NOT NULL,
  `listprice` decimal(27,8) DEFAULT NULL,
  `usedcurrency` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pricebookid`,`productid`),
  KEY `pricebookproductrel_pricebookid_idx` (`pricebookid`),
  KEY `pricebookproductrel_productid_idx` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_priority`
--

CREATE TABLE IF NOT EXISTS `vtiger_priority` (
  `priorityid` int(19) NOT NULL,
  `priority` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`priorityid`),
  UNIQUE KEY `priority_priority_idx` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_problemcategory`
--

CREATE TABLE IF NOT EXISTS `vtiger_problemcategory` (
  `problemcategoryid` int(19) NOT NULL,
  `loaivande` varchar(255) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`problemcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_problemcategorycf`
--

CREATE TABLE IF NOT EXISTS `vtiger_problemcategorycf` (
  `problemcategoryid` int(19) NOT NULL,
  `cf_1207` text DEFAULT NULL,
  PRIMARY KEY (`problemcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcategory`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcategory` (
  `productcategoryid` int(19) NOT NULL,
  `productcategory` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`productcategoryid`),
  UNIQUE KEY `productcategory_productcategory_idx` (`productcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_productcategory`
--

INSERT INTO `vtiger_productcategory` (`productcategoryid`, `productcategory`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Hardware', 1, 136, 1, NULL),
(3, 'Software', 1, 137, 2, NULL),
(4, 'CRM Applications', 1, 138, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcategory_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcategory_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_productcategory_seq`
--

INSERT INTO `vtiger_productcategory_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcf` (
  `productid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_productcf`
--

INSERT INTO `vtiger_productcf` (`productid`) VALUES
(31);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_productcurrencyrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_productcurrencyrel` (
  `productid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `converted_price` decimal(28,8) DEFAULT NULL,
  `actual_price` decimal(28,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_products`
--

CREATE TABLE IF NOT EXISTS `vtiger_products` (
  `productid` int(11) NOT NULL,
  `product_no` varchar(100) NOT NULL,
  `productname` varchar(100) DEFAULT NULL,
  `productcode` varchar(40) DEFAULT NULL,
  `productcategory` varchar(200) DEFAULT NULL,
  `manufacturer` varchar(200) DEFAULT NULL,
  `qty_per_unit` decimal(11,2) DEFAULT 0.00,
  `unit_price` decimal(25,8) DEFAULT NULL,
  `weight` decimal(11,3) DEFAULT NULL,
  `pack_size` int(11) DEFAULT NULL,
  `sales_start_date` date DEFAULT NULL,
  `sales_end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `cost_factor` int(11) DEFAULT NULL,
  `commissionrate` decimal(7,3) DEFAULT NULL,
  `commissionmethod` varchar(50) DEFAULT NULL,
  `discontinued` int(1) NOT NULL DEFAULT 0,
  `usageunit` varchar(200) DEFAULT NULL,
  `reorderlevel` int(11) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `taxclass` varchar(200) DEFAULT NULL,
  `mfr_part_no` varchar(200) DEFAULT NULL,
  `vendor_part_no` varchar(200) DEFAULT NULL,
  `serialno` varchar(200) DEFAULT NULL,
  `qtyinstock` decimal(25,3) DEFAULT NULL,
  `productsheet` varchar(200) DEFAULT NULL,
  `qtyindemand` int(11) DEFAULT NULL,
  `glacct` varchar(200) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `imagename` text DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `is_subproducts_viewable` int(1) DEFAULT 1,
  `purchase_cost` decimal(27,8) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_products`
--

INSERT INTO `vtiger_products` (`productid`, `product_no`, `productname`, `productcode`, `productcategory`, `manufacturer`, `qty_per_unit`, `unit_price`, `weight`, `pack_size`, `sales_start_date`, `sales_end_date`, `start_date`, `expiry_date`, `cost_factor`, `commissionrate`, `commissionmethod`, `discontinued`, `usageunit`, `reorderlevel`, `website`, `taxclass`, `mfr_part_no`, `vendor_part_no`, `serialno`, `qtyinstock`, `productsheet`, `qtyindemand`, `glacct`, `vendor_id`, `imagename`, `currency_id`, `is_subproducts_viewable`, `purchase_cost`, `tags`) VALUES
(31, 'PRO1', 'Máy tính', '', '', '', '0.00', '100000.00000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', NULL, 1, '', 0, '', '', '', '', '', '0.000', '', 0, '', 0, '', 1, 1, '0.00000000', '');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_producttaxrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_producttaxrel` (
  `productid` int(11) NOT NULL,
  `taxid` int(3) NOT NULL,
  `taxpercentage` decimal(7,3) DEFAULT NULL,
  `regions` text DEFAULT NULL,
  KEY `producttaxrel_productid_idx` (`productid`),
  KEY `producttaxrel_taxid_idx` (`taxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile` (
  `profileid` int(10) NOT NULL,
  `profilename` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `directly_related_to_role` int(1) DEFAULT 0,
  PRIMARY KEY (`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile`
--

INSERT INTO `vtiger_profile` (`profileid`, `profilename`, `description`, `directly_related_to_role`) VALUES
(1, 'Administrator', 'Admin Profile', 0),
(2, 'Sales Profile', 'Profile Related to Sales', 0),
(3, 'Support Profile', 'Profile Related to Support', 0),
(4, 'Guest Profile', 'Guest Profile for Test Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2field`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2field` (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) DEFAULT NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) DEFAULT NULL,
  `readonly` int(19) DEFAULT NULL,
  PRIMARY KEY (`profileid`,`fieldid`),
  KEY `profile2field_profileid_tabid_fieldname_idx` (`profileid`,`tabid`),
  KEY `profile2field_tabid_profileid_idx` (`tabid`,`profileid`),
  KEY `profile2field_visible_profileid_idx` (`visible`,`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2field`
--

INSERT INTO `vtiger_profile2field` (`profileid`, `tabid`, `fieldid`, `visible`, `readonly`) VALUES
(1, 6, 1, 0, 0),
(1, 6, 2, 0, 0),
(1, 6, 3, 0, 0),
(1, 6, 4, 0, 0),
(1, 6, 5, 0, 0),
(1, 6, 6, 0, 0),
(1, 6, 7, 0, 0),
(1, 6, 8, 0, 0),
(1, 6, 9, 0, 0),
(1, 6, 10, 0, 0),
(1, 6, 11, 0, 0),
(1, 6, 12, 0, 0),
(1, 6, 13, 0, 0),
(1, 6, 14, 0, 0),
(1, 6, 15, 0, 0),
(1, 6, 16, 0, 0),
(1, 6, 17, 0, 0),
(1, 6, 18, 0, 0),
(1, 6, 19, 0, 0),
(1, 6, 20, 0, 0),
(1, 6, 21, 0, 0),
(1, 6, 22, 0, 0),
(1, 6, 23, 0, 0),
(1, 6, 24, 0, 0),
(1, 6, 25, 0, 0),
(1, 6, 26, 0, 0),
(1, 6, 27, 0, 0),
(1, 6, 28, 0, 0),
(1, 6, 29, 0, 0),
(1, 6, 30, 0, 0),
(1, 6, 31, 0, 0),
(1, 6, 32, 0, 0),
(1, 6, 33, 0, 0),
(1, 6, 34, 0, 0),
(1, 6, 35, 0, 0),
(1, 6, 36, 0, 0),
(1, 7, 37, 0, 0),
(1, 7, 38, 0, 0),
(1, 7, 39, 0, 0),
(1, 7, 40, 0, 0),
(1, 7, 41, 0, 0),
(1, 7, 42, 0, 0),
(1, 7, 43, 0, 0),
(1, 7, 44, 0, 0),
(1, 7, 45, 0, 0),
(1, 7, 46, 0, 0),
(1, 7, 47, 0, 0),
(1, 7, 48, 0, 0),
(1, 7, 49, 0, 0),
(1, 7, 50, 0, 0),
(1, 7, 51, 0, 0),
(1, 7, 52, 0, 0),
(1, 7, 53, 0, 0),
(1, 7, 54, 0, 0),
(1, 7, 55, 0, 0),
(1, 7, 56, 0, 0),
(1, 7, 57, 0, 0),
(1, 7, 58, 0, 0),
(1, 7, 59, 0, 0),
(1, 7, 60, 0, 0),
(1, 7, 61, 0, 0),
(1, 7, 62, 0, 0),
(1, 7, 63, 0, 0),
(1, 7, 64, 0, 0),
(1, 7, 65, 0, 0),
(1, 4, 66, 0, 0),
(1, 4, 67, 0, 0),
(1, 4, 68, 0, 0),
(1, 4, 69, 0, 0),
(1, 4, 70, 0, 0),
(1, 4, 71, 0, 0),
(1, 4, 72, 0, 0),
(1, 4, 73, 0, 0),
(1, 4, 74, 0, 0),
(1, 4, 75, 0, 0),
(1, 4, 76, 0, 0),
(1, 4, 77, 0, 0),
(1, 4, 78, 0, 0),
(1, 4, 79, 0, 0),
(1, 4, 80, 0, 0),
(1, 4, 81, 0, 0),
(1, 4, 82, 0, 0),
(1, 4, 83, 0, 0),
(1, 4, 84, 0, 0),
(1, 4, 85, 0, 0),
(1, 4, 86, 0, 0),
(1, 4, 87, 0, 0),
(1, 4, 88, 0, 0),
(1, 4, 89, 0, 0),
(1, 4, 90, 0, 0),
(1, 4, 91, 0, 0),
(1, 4, 92, 0, 0),
(1, 4, 93, 0, 0),
(1, 4, 94, 0, 0),
(1, 4, 95, 0, 0),
(1, 4, 96, 0, 0),
(1, 4, 97, 0, 0),
(1, 4, 98, 0, 0),
(1, 4, 99, 0, 0),
(1, 4, 100, 0, 0),
(1, 4, 101, 0, 0),
(1, 4, 102, 0, 0),
(1, 4, 103, 0, 0),
(1, 4, 104, 0, 0),
(1, 4, 105, 0, 0),
(1, 4, 106, 0, 0),
(1, 4, 107, 0, 0),
(1, 4, 108, 0, 0),
(1, 4, 109, 0, 0),
(1, 2, 110, 0, 0),
(1, 2, 111, 0, 0),
(1, 2, 112, 0, 0),
(1, 2, 113, 0, 0),
(1, 2, 114, 0, 0),
(1, 2, 115, 0, 0),
(1, 2, 116, 0, 0),
(1, 2, 117, 0, 0),
(1, 2, 118, 0, 0),
(1, 2, 119, 0, 0),
(1, 2, 120, 0, 0),
(1, 2, 121, 0, 0),
(1, 2, 122, 0, 0),
(1, 2, 123, 0, 0),
(1, 2, 124, 0, 0),
(1, 2, 125, 0, 0),
(1, 26, 126, 0, 0),
(1, 26, 127, 0, 0),
(1, 26, 128, 0, 0),
(1, 26, 129, 0, 0),
(1, 26, 130, 0, 0),
(1, 26, 131, 0, 0),
(1, 26, 132, 0, 0),
(1, 26, 133, 0, 0),
(1, 26, 134, 0, 0),
(1, 26, 135, 0, 0),
(1, 26, 136, 0, 0),
(1, 26, 137, 0, 0),
(1, 26, 138, 0, 0),
(1, 26, 139, 0, 0),
(1, 26, 140, 0, 0),
(1, 26, 141, 0, 0),
(1, 26, 142, 0, 0),
(1, 26, 143, 0, 0),
(1, 26, 144, 0, 0),
(1, 26, 145, 0, 0),
(1, 26, 146, 0, 0),
(1, 26, 147, 0, 0),
(1, 26, 148, 0, 0),
(1, 26, 149, 0, 0),
(1, 26, 150, 0, 0),
(1, 4, 151, 0, 0),
(1, 6, 152, 0, 0),
(1, 7, 153, 0, 0),
(1, 26, 154, 0, 0),
(1, 13, 155, 0, 0),
(1, 13, 156, 0, 0),
(1, 13, 157, 0, 0),
(1, 13, 158, 0, 0),
(1, 13, 159, 0, 0),
(1, 13, 160, 0, 0),
(1, 13, 161, 0, 0),
(1, 13, 162, 0, 0),
(1, 13, 163, 0, 0),
(1, 13, 164, 0, 0),
(1, 13, 165, 0, 0),
(1, 13, 166, 0, 0),
(1, 13, 167, 0, 0),
(1, 13, 168, 0, 0),
(1, 13, 169, 0, 0),
(1, 13, 170, 0, 0),
(1, 13, 171, 0, 0),
(1, 13, 172, 0, 0),
(1, 13, 173, 0, 0),
(1, 14, 174, 0, 0),
(1, 14, 175, 0, 0),
(1, 14, 176, 0, 0),
(1, 14, 177, 0, 0),
(1, 14, 178, 0, 0),
(1, 14, 179, 0, 0),
(1, 14, 180, 0, 0),
(1, 14, 181, 0, 0),
(1, 14, 182, 0, 0),
(1, 14, 183, 0, 0),
(1, 14, 184, 0, 0),
(1, 14, 185, 0, 0),
(1, 14, 186, 0, 0),
(1, 14, 187, 0, 0),
(1, 14, 188, 0, 0),
(1, 14, 189, 0, 0),
(1, 14, 190, 0, 0),
(1, 14, 191, 0, 0),
(1, 14, 192, 0, 0),
(1, 14, 193, 0, 0),
(1, 14, 194, 0, 0),
(1, 14, 195, 0, 0),
(1, 14, 196, 0, 0),
(1, 14, 197, 0, 0),
(1, 14, 198, 0, 0),
(1, 14, 199, 0, 0),
(1, 14, 200, 0, 0),
(1, 14, 201, 0, 0),
(1, 14, 202, 0, 0),
(1, 14, 203, 0, 0),
(1, 14, 204, 0, 0),
(1, 8, 205, 0, 0),
(1, 8, 206, 0, 0),
(1, 8, 207, 0, 0),
(1, 8, 208, 0, 0),
(1, 8, 209, 0, 0),
(1, 8, 210, 0, 0),
(1, 8, 211, 0, 0),
(1, 8, 212, 0, 0),
(1, 8, 213, 0, 0),
(1, 8, 214, 0, 0),
(1, 8, 215, 0, 0),
(1, 8, 216, 0, 0),
(1, 8, 217, 0, 0),
(1, 8, 218, 0, 0),
(1, 8, 219, 0, 0),
(1, 10, 220, 0, 0),
(1, 10, 221, 0, 0),
(1, 10, 222, 0, 0),
(1, 10, 223, 0, 0),
(1, 10, 224, 0, 0),
(1, 10, 225, 0, 0),
(1, 10, 226, 0, 0),
(1, 10, 227, 0, 0),
(1, 10, 228, 0, 0),
(1, 10, 229, 0, 0),
(1, 10, 230, 0, 0),
(1, 10, 231, 0, 0),
(1, 9, 232, 0, 0),
(1, 9, 233, 0, 0),
(1, 9, 234, 0, 0),
(1, 9, 235, 0, 0),
(1, 9, 236, 0, 0),
(1, 9, 237, 0, 0),
(1, 9, 238, 0, 0),
(1, 9, 239, 0, 0),
(1, 9, 240, 0, 0),
(1, 9, 241, 0, 0),
(1, 9, 242, 0, 0),
(1, 9, 243, 0, 0),
(1, 9, 244, 0, 0),
(1, 9, 245, 0, 0),
(1, 9, 246, 0, 0),
(1, 9, 247, 0, 0),
(1, 9, 248, 0, 0),
(1, 9, 249, 0, 0),
(1, 9, 250, 0, 0),
(1, 9, 251, 0, 0),
(1, 9, 252, 0, 0),
(1, 9, 253, 0, 0),
(1, 9, 254, 0, 0),
(1, 9, 255, 0, 0),
(1, 16, 256, 0, 0),
(1, 16, 257, 0, 0),
(1, 16, 258, 0, 0),
(1, 16, 259, 0, 0),
(1, 16, 260, 0, 0),
(1, 16, 261, 0, 0),
(1, 16, 262, 0, 0),
(1, 16, 263, 0, 0),
(1, 16, 264, 0, 0),
(1, 16, 265, 0, 0),
(1, 16, 266, 0, 0),
(1, 16, 267, 0, 0),
(1, 16, 268, 0, 0),
(1, 16, 269, 0, 0),
(1, 16, 270, 0, 0),
(1, 16, 271, 0, 0),
(1, 16, 272, 0, 0),
(1, 16, 273, 0, 0),
(1, 16, 274, 0, 0),
(1, 16, 275, 0, 0),
(1, 16, 276, 0, 0),
(1, 16, 277, 0, 0),
(1, 16, 278, 0, 0),
(1, 15, 279, 0, 0),
(1, 15, 280, 0, 0),
(1, 15, 281, 0, 0),
(1, 15, 282, 0, 0),
(1, 15, 283, 0, 0),
(1, 15, 284, 0, 0),
(1, 15, 285, 0, 0),
(1, 15, 286, 0, 0),
(1, 15, 287, 0, 0),
(1, 15, 288, 0, 0),
(1, 18, 289, 0, 0),
(1, 18, 290, 0, 0),
(1, 18, 291, 0, 0),
(1, 18, 292, 0, 0),
(1, 18, 293, 0, 0),
(1, 18, 294, 0, 0),
(1, 18, 295, 0, 0),
(1, 18, 296, 0, 0),
(1, 18, 297, 0, 0),
(1, 18, 298, 0, 0),
(1, 18, 299, 0, 0),
(1, 18, 300, 0, 0),
(1, 18, 301, 0, 0),
(1, 18, 302, 0, 0),
(1, 18, 303, 0, 0),
(1, 18, 304, 0, 0),
(1, 18, 305, 0, 0),
(1, 19, 306, 0, 0),
(1, 19, 307, 0, 0),
(1, 19, 308, 0, 0),
(1, 19, 309, 0, 0),
(1, 19, 310, 0, 0),
(1, 19, 311, 0, 0),
(1, 19, 312, 0, 0),
(1, 19, 313, 0, 0),
(1, 20, 314, 0, 0),
(1, 20, 315, 0, 0),
(1, 20, 316, 0, 0),
(1, 20, 317, 0, 0),
(1, 20, 318, 0, 0),
(1, 20, 319, 0, 0),
(1, 20, 320, 0, 0),
(1, 20, 321, 0, 0),
(1, 20, 322, 0, 0),
(1, 20, 323, 0, 0),
(1, 20, 324, 0, 0),
(1, 20, 325, 0, 0),
(1, 20, 326, 0, 0),
(1, 20, 327, 0, 0),
(1, 20, 328, 0, 0),
(1, 20, 329, 0, 0),
(1, 20, 330, 0, 0),
(1, 20, 331, 0, 0),
(1, 20, 332, 0, 0),
(1, 20, 333, 0, 0),
(1, 20, 334, 0, 0),
(1, 20, 335, 0, 0),
(1, 20, 336, 0, 0),
(1, 20, 337, 0, 0),
(1, 20, 338, 0, 0),
(1, 20, 339, 0, 0),
(1, 20, 340, 0, 0),
(1, 20, 341, 0, 0),
(1, 20, 342, 0, 0),
(1, 20, 343, 0, 0),
(1, 20, 344, 0, 0),
(1, 20, 345, 0, 0),
(1, 20, 346, 0, 0),
(1, 20, 347, 0, 0),
(1, 20, 348, 0, 0),
(1, 20, 349, 0, 0),
(1, 20, 350, 0, 0),
(1, 21, 351, 0, 0),
(1, 21, 352, 0, 0),
(1, 21, 353, 0, 0),
(1, 21, 354, 0, 0),
(1, 21, 355, 0, 0),
(1, 21, 356, 0, 0),
(1, 21, 357, 0, 0),
(1, 21, 358, 0, 0),
(1, 21, 359, 0, 0),
(1, 21, 360, 0, 0),
(1, 21, 361, 0, 0),
(1, 21, 362, 0, 0),
(1, 21, 363, 0, 0),
(1, 21, 364, 0, 0),
(1, 21, 365, 0, 0),
(1, 21, 366, 0, 0),
(1, 21, 367, 0, 0),
(1, 21, 368, 0, 0),
(1, 21, 369, 0, 0),
(1, 21, 370, 0, 0),
(1, 21, 371, 0, 0),
(1, 21, 372, 0, 0),
(1, 21, 373, 0, 0),
(1, 21, 374, 0, 0),
(1, 21, 375, 0, 0),
(1, 21, 376, 0, 0),
(1, 21, 377, 0, 0),
(1, 21, 378, 0, 0),
(1, 21, 379, 0, 0),
(1, 21, 380, 0, 0),
(1, 21, 381, 0, 0),
(1, 21, 382, 0, 0),
(1, 21, 383, 0, 0),
(1, 21, 384, 0, 0),
(1, 21, 385, 0, 0),
(1, 21, 386, 0, 0),
(1, 21, 387, 0, 0),
(1, 21, 388, 0, 0),
(1, 22, 389, 0, 0),
(1, 22, 390, 0, 0),
(1, 22, 391, 0, 0),
(1, 22, 392, 0, 0),
(1, 22, 393, 0, 0),
(1, 22, 394, 0, 0),
(1, 22, 395, 0, 0),
(1, 22, 396, 0, 0),
(1, 22, 397, 0, 0),
(1, 22, 398, 0, 0),
(1, 22, 399, 0, 0),
(1, 22, 400, 0, 0),
(1, 22, 401, 0, 0),
(1, 22, 402, 0, 0),
(1, 22, 403, 0, 0),
(1, 22, 404, 0, 0),
(1, 22, 405, 0, 0),
(1, 22, 406, 0, 0),
(1, 22, 407, 0, 0),
(1, 22, 408, 0, 0),
(1, 22, 409, 0, 0),
(1, 22, 410, 0, 0),
(1, 22, 411, 0, 0),
(1, 22, 412, 0, 0),
(1, 22, 413, 0, 0),
(1, 22, 414, 0, 0),
(1, 22, 415, 0, 0),
(1, 22, 416, 0, 0),
(1, 22, 417, 0, 0),
(1, 22, 418, 0, 0),
(1, 22, 419, 0, 0),
(1, 22, 420, 0, 0),
(1, 22, 421, 0, 0),
(1, 22, 422, 0, 0),
(1, 22, 423, 0, 0),
(1, 22, 424, 0, 0),
(1, 22, 425, 0, 0),
(1, 22, 426, 0, 0),
(1, 22, 427, 0, 0),
(1, 22, 428, 0, 0),
(1, 22, 429, 0, 0),
(1, 22, 430, 0, 0),
(1, 22, 431, 0, 0),
(1, 22, 432, 0, 0),
(1, 22, 433, 0, 0),
(1, 22, 434, 0, 0),
(1, 22, 435, 0, 0),
(1, 23, 436, 0, 0),
(1, 23, 437, 0, 0),
(1, 23, 438, 0, 0),
(1, 23, 439, 0, 0),
(1, 23, 440, 0, 0),
(1, 23, 441, 0, 0),
(1, 23, 442, 0, 0),
(1, 23, 443, 0, 0),
(1, 23, 444, 0, 0),
(1, 23, 445, 0, 0),
(1, 23, 446, 0, 0),
(1, 23, 447, 0, 0),
(1, 23, 448, 0, 0),
(1, 23, 449, 0, 0),
(1, 23, 450, 0, 0),
(1, 23, 451, 0, 0),
(1, 23, 452, 0, 0),
(1, 23, 453, 0, 0),
(1, 23, 454, 0, 0),
(1, 23, 455, 0, 0),
(1, 23, 456, 0, 0),
(1, 23, 457, 0, 0),
(1, 23, 458, 0, 0),
(1, 23, 459, 0, 0),
(1, 23, 460, 0, 0),
(1, 23, 461, 0, 0),
(1, 23, 462, 0, 0),
(1, 23, 463, 0, 0),
(1, 23, 464, 0, 0),
(1, 23, 465, 0, 0),
(1, 23, 466, 0, 0),
(1, 23, 467, 0, 0),
(1, 23, 468, 0, 0),
(1, 23, 469, 0, 0),
(1, 23, 470, 0, 0),
(1, 23, 471, 0, 0),
(1, 23, 472, 0, 0),
(1, 23, 473, 0, 0),
(1, 23, 474, 0, 0),
(1, 29, 475, 0, 0),
(1, 29, 479, 0, 0),
(1, 29, 480, 0, 0),
(1, 29, 482, 0, 0),
(1, 29, 489, 0, 0),
(1, 29, 490, 0, 0),
(1, 29, 491, 0, 0),
(1, 29, 492, 0, 0),
(1, 29, 493, 0, 0),
(1, 29, 495, 0, 0),
(1, 29, 496, 0, 0),
(1, 29, 497, 0, 0),
(1, 29, 498, 0, 0),
(1, 29, 499, 0, 0),
(1, 29, 504, 0, 0),
(1, 29, 505, 0, 0),
(1, 29, 506, 0, 0),
(1, 29, 507, 0, 0),
(1, 29, 515, 0, 0),
(1, 10, 520, 0, 0),
(1, 10, 521, 0, 0),
(1, 10, 522, 0, 0),
(1, 10, 523, 0, 0),
(1, 10, 524, 0, 0),
(1, 10, 525, 0, 0),
(1, 34, 526, 0, 0),
(1, 34, 527, 0, 0),
(1, 34, 528, 0, 0),
(1, 34, 529, 0, 0),
(1, 34, 530, 0, 0),
(1, 34, 531, 0, 0),
(1, 34, 532, 0, 0),
(1, 34, 533, 0, 0),
(1, 34, 534, 0, 0),
(1, 34, 535, 0, 0),
(1, 34, 536, 0, 0),
(1, 34, 537, 0, 0),
(1, 34, 538, 0, 0),
(1, 34, 539, 0, 0),
(1, 34, 540, 0, 0),
(1, 34, 541, 0, 0),
(1, 34, 542, 0, 0),
(1, 29, 543, 0, 0),
(1, 35, 544, 0, 0),
(1, 35, 545, 0, 0),
(1, 35, 546, 0, 0),
(1, 35, 547, 0, 0),
(1, 35, 548, 0, 0),
(1, 35, 549, 0, 0),
(1, 35, 550, 0, 0),
(1, 35, 551, 0, 0),
(1, 35, 552, 0, 0),
(1, 35, 553, 0, 0),
(1, 35, 554, 0, 0),
(1, 35, 555, 0, 0),
(1, 35, 556, 0, 0),
(1, 35, 557, 0, 0),
(1, 35, 558, 0, 0),
(1, 35, 559, 0, 0),
(1, 35, 560, 0, 0),
(1, 35, 561, 0, 0),
(1, 35, 562, 0, 0),
(1, 35, 563, 0, 0),
(1, 35, 564, 0, 0),
(1, 35, 565, 0, 0),
(1, 36, 566, 0, 0),
(1, 36, 567, 0, 0),
(1, 36, 568, 0, 0),
(1, 36, 569, 0, 0),
(1, 36, 570, 0, 0),
(1, 36, 571, 0, 0),
(1, 36, 572, 0, 0),
(1, 36, 573, 0, 0),
(1, 36, 574, 0, 0),
(1, 36, 575, 0, 0),
(1, 36, 576, 0, 0),
(1, 36, 577, 0, 0),
(1, 36, 578, 0, 0),
(1, 36, 579, 0, 0),
(1, 36, 580, 0, 0),
(1, 36, 581, 0, 0),
(1, 36, 582, 0, 0),
(1, 36, 583, 0, 0),
(1, 36, 584, 0, 0),
(1, 36, 585, 0, 0),
(1, 36, 586, 0, 0),
(1, 36, 587, 0, 0),
(1, 38, 588, 0, 0),
(1, 38, 589, 0, 0),
(1, 38, 590, 0, 0),
(1, 38, 591, 0, 0),
(1, 38, 592, 0, 0),
(1, 38, 593, 0, 0),
(1, 38, 594, 0, 0),
(1, 38, 595, 0, 0),
(1, 38, 596, 0, 0),
(1, 38, 597, 0, 0),
(1, 38, 598, 0, 0),
(1, 38, 599, 0, 0),
(1, 38, 600, 0, 0),
(1, 38, 601, 0, 0),
(1, 38, 602, 0, 0),
(1, 38, 603, 0, 0),
(1, 38, 604, 0, 0),
(1, 38, 605, 0, 0),
(1, 38, 606, 0, 0),
(1, 38, 607, 0, 0),
(1, 38, 608, 0, 0),
(1, 42, 609, 0, 0),
(1, 42, 610, 0, 0),
(1, 42, 611, 0, 0),
(1, 42, 612, 0, 0),
(1, 42, 613, 0, 0),
(1, 42, 614, 0, 0),
(1, 42, 615, 0, 0),
(1, 42, 616, 0, 0),
(1, 43, 617, 0, 0),
(1, 43, 618, 0, 0),
(1, 43, 619, 0, 0),
(1, 43, 620, 0, 0),
(1, 43, 621, 0, 0),
(1, 43, 622, 0, 0),
(1, 43, 623, 0, 0),
(1, 43, 624, 0, 0),
(1, 43, 625, 0, 0),
(1, 43, 626, 0, 0),
(1, 43, 627, 0, 0),
(1, 43, 628, 0, 0),
(1, 43, 629, 0, 0),
(1, 44, 630, 0, 0),
(1, 44, 631, 0, 0),
(1, 44, 632, 0, 0),
(1, 44, 633, 0, 0),
(1, 44, 634, 0, 0),
(1, 44, 635, 0, 0),
(1, 44, 636, 0, 0),
(1, 44, 637, 0, 0),
(1, 44, 638, 0, 0),
(1, 44, 639, 0, 0),
(1, 44, 640, 0, 0),
(1, 44, 641, 0, 0),
(1, 44, 642, 0, 0),
(1, 44, 643, 0, 0),
(1, 44, 644, 0, 0),
(1, 44, 645, 0, 0),
(1, 44, 646, 0, 0),
(1, 44, 647, 0, 0),
(1, 45, 648, 0, 0),
(1, 45, 649, 0, 0),
(1, 45, 650, 0, 0),
(1, 45, 651, 0, 0),
(1, 45, 652, 0, 0),
(1, 45, 653, 0, 0),
(1, 45, 654, 0, 0),
(1, 45, 655, 0, 0),
(1, 45, 656, 0, 0),
(1, 45, 657, 0, 0),
(1, 45, 658, 0, 0),
(1, 45, 659, 0, 0),
(1, 45, 660, 0, 0),
(1, 45, 661, 0, 0),
(1, 45, 662, 0, 0),
(1, 45, 663, 0, 0),
(1, 45, 664, 0, 0),
(1, 45, 665, 0, 0),
(1, 45, 666, 0, 0),
(1, 45, 667, 0, 0),
(1, 47, 668, 0, 0),
(1, 47, 669, 0, 0),
(1, 47, 670, 0, 0),
(1, 47, 671, 0, 0),
(1, 47, 672, 0, 0),
(1, 47, 673, 0, 0),
(1, 2, 674, 0, 0),
(1, 29, 675, 0, 0),
(1, 23, 676, 0, 0),
(1, 23, 677, 0, 0),
(1, 23, 678, 0, 0),
(1, 23, 679, 0, 0),
(1, 23, 680, 0, 0),
(1, 23, 681, 0, 0),
(1, 23, 682, 0, 0),
(1, 23, 683, 0, 0),
(1, 23, 684, 0, 0),
(1, 22, 685, 0, 0),
(1, 22, 686, 0, 0),
(1, 22, 687, 0, 0),
(1, 22, 688, 0, 0),
(1, 22, 689, 0, 0),
(1, 22, 690, 0, 0),
(1, 22, 691, 0, 0),
(1, 22, 692, 0, 0),
(1, 22, 693, 0, 0),
(1, 21, 694, 0, 0),
(1, 21, 695, 0, 0),
(1, 21, 696, 0, 0),
(1, 21, 697, 0, 0),
(1, 21, 698, 0, 0),
(1, 21, 699, 0, 0),
(1, 21, 700, 0, 0),
(1, 21, 701, 0, 0),
(1, 21, 702, 0, 0),
(1, 20, 703, 0, 0),
(1, 20, 704, 0, 0),
(1, 20, 705, 0, 0),
(1, 20, 706, 0, 0),
(1, 20, 707, 0, 0),
(1, 20, 708, 0, 0),
(1, 20, 709, 0, 0),
(1, 20, 710, 0, 0),
(1, 20, 711, 0, 0),
(1, 29, 712, 0, 0),
(1, 44, 713, 0, 0),
(1, 42, 714, 0, 0),
(1, 29, 715, 0, 0),
(1, 29, 716, 0, 0),
(1, 29, 717, 0, 0),
(1, 23, 718, 0, 0),
(1, 22, 719, 0, 0),
(1, 21, 720, 0, 0),
(1, 20, 721, 0, 0),
(1, 29, 722, 0, 0),
(1, 6, 723, 0, 0),
(1, 4, 724, 0, 0),
(1, 2, 725, 0, 0),
(1, 29, 726, 0, 0),
(1, 23, 727, 0, 0),
(1, 23, 728, 0, 0),
(1, 21, 729, 0, 0),
(1, 21, 730, 0, 0),
(1, 18, 731, 0, 0),
(1, 7, 732, 0, 0),
(1, 42, 733, 0, 0),
(1, 42, 734, 0, 0),
(1, 23, 735, 0, 0),
(1, 20, 736, 0, 0),
(1, 21, 737, 0, 0),
(1, 22, 738, 0, 0),
(1, 29, 739, 0, 0),
(1, 2, 740, 0, 0),
(1, 13, 741, 0, 0),
(1, 29, 742, 0, 0),
(1, 29, 743, 0, 0),
(1, 29, 744, 0, 0),
(1, 29, 745, 0, 0),
(1, 14, 772, 0, 0),
(1, 36, 773, 0, 0),
(1, 23, 774, 0, 0),
(1, 29, 775, 0, 0),
(1, 23, 776, 0, 0),
(1, 23, 777, 0, 0),
(1, 23, 778, 0, 0),
(1, 20, 779, 0, 0),
(1, 20, 780, 0, 0),
(1, 20, 781, 0, 0),
(1, 21, 782, 0, 0),
(1, 22, 783, 0, 0),
(1, 22, 784, 0, 0),
(1, 22, 785, 0, 0),
(1, 42, 786, 0, 0),
(1, 42, 787, 0, 0),
(1, 42, 788, 0, 0),
(1, 2, 789, 0, 0),
(1, 4, 790, 0, 0),
(1, 6, 791, 0, 0),
(1, 7, 792, 0, 0),
(1, 8, 793, 0, 0),
(1, 9, 794, 0, 0),
(1, 10, 795, 0, 0),
(1, 13, 796, 0, 0),
(1, 14, 797, 0, 0),
(1, 15, 798, 0, 0),
(1, 16, 799, 0, 0),
(1, 18, 800, 0, 0),
(1, 19, 801, 0, 0),
(1, 20, 802, 0, 0),
(1, 21, 803, 0, 0),
(1, 22, 804, 0, 0),
(1, 23, 805, 0, 0),
(1, 26, 806, 0, 0),
(1, 10, 807, 0, 0),
(1, 2, 808, 0, 0),
(1, 4, 809, 0, 0),
(1, 6, 810, 0, 0),
(1, 7, 811, 0, 0),
(1, 8, 812, 0, 0),
(1, 9, 813, 0, 0),
(1, 10, 814, 0, 0),
(1, 13, 815, 0, 0),
(1, 14, 816, 0, 0),
(1, 15, 817, 0, 0),
(1, 16, 818, 0, 0),
(1, 18, 819, 0, 0),
(1, 19, 820, 0, 0),
(1, 20, 821, 0, 0),
(1, 21, 822, 0, 0),
(1, 22, 823, 0, 0),
(1, 23, 824, 0, 0),
(1, 26, 825, 0, 0),
(1, 2, 826, 0, 0),
(1, 4, 827, 0, 0),
(1, 6, 828, 0, 0),
(1, 7, 829, 0, 0),
(1, 8, 830, 0, 0),
(1, 9, 831, 0, 0),
(1, 10, 832, 0, 0),
(1, 13, 833, 0, 0),
(1, 14, 834, 0, 0),
(1, 15, 835, 0, 0),
(1, 16, 836, 0, 0),
(1, 18, 837, 0, 0),
(1, 19, 838, 0, 0),
(1, 20, 839, 0, 0),
(1, 21, 840, 0, 0),
(1, 22, 841, 0, 0),
(1, 23, 842, 0, 0),
(1, 26, 843, 0, 0),
(1, 20, 844, 0, 0),
(1, 21, 845, 0, 0),
(1, 22, 846, 0, 0),
(1, 23, 847, 0, 0),
(1, 45, 848, 0, 0),
(1, 45, 849, 0, 0),
(1, 50, 850, 0, 0),
(1, 50, 851, 0, 0),
(1, 50, 852, 0, 0),
(1, 50, 853, 0, 0),
(1, 50, 854, 0, 0),
(1, 50, 855, 0, 0),
(1, 50, 856, 0, 0),
(1, 51, 857, 0, 0),
(1, 51, 858, 0, 0),
(1, 51, 859, 0, 0),
(1, 51, 860, 0, 0),
(1, 51, 861, 0, 0),
(1, 51, 862, 0, 0),
(1, 51, 863, 0, 0),
(1, 52, 864, 0, 0),
(1, 52, 865, 0, 0),
(1, 52, 866, 0, 0),
(1, 52, 867, 0, 0),
(1, 52, 868, 0, 0),
(1, 52, 869, 0, 0),
(1, 53, 870, 0, 0),
(1, 53, 871, 0, 0),
(1, 53, 872, 0, 0),
(1, 53, 873, 0, 0),
(1, 53, 874, 0, 0),
(1, 53, 875, 0, 0),
(1, 53, 876, 0, 0),
(1, 54, 877, 0, 0),
(1, 54, 878, 0, 0),
(1, 54, 879, 0, 0),
(1, 54, 880, 0, 0),
(1, 54, 881, 0, 0),
(1, 54, 882, 0, 0),
(1, 54, 883, 0, 0),
(1, 54, 884, 0, 0),
(1, 54, 885, 0, 0),
(1, 54, 886, 0, 0),
(1, 54, 887, 0, 0),
(1, 54, 888, 0, 0),
(1, 54, 889, 0, 0),
(1, 54, 890, 0, 0),
(1, 55, 891, 0, 0),
(1, 55, 892, 0, 0),
(1, 55, 893, 0, 0),
(1, 55, 894, 0, 0),
(1, 55, 895, 0, 0),
(1, 55, 896, 0, 0),
(1, 55, 897, 0, 0),
(1, 55, 898, 0, 0),
(1, 55, 899, 0, 0),
(1, 55, 900, 0, 0),
(1, 55, 901, 0, 0),
(1, 55, 902, 0, 0),
(1, 56, 903, 0, 0),
(1, 56, 904, 0, 0),
(1, 56, 905, 0, 0),
(1, 56, 906, 0, 0),
(1, 56, 907, 0, 0),
(1, 56, 908, 0, 0),
(1, 56, 909, 0, 0),
(1, 56, 910, 0, 0),
(1, 56, 911, 0, 0),
(1, 56, 912, 0, 0),
(1, 56, 913, 0, 0),
(1, 56, 914, 0, 0),
(1, 57, 915, 0, 0),
(1, 57, 916, 0, 0),
(1, 57, 917, 0, 0),
(1, 57, 918, 0, 0),
(1, 57, 919, 0, 0),
(1, 57, 920, 0, 0),
(1, 57, 921, 0, 0),
(1, 57, 922, 0, 0),
(1, 57, 923, 0, 0),
(1, 57, 924, 0, 0),
(1, 57, 925, 0, 0),
(1, 57, 926, 0, 0),
(1, 57, 927, 0, 0),
(1, 57, 928, 0, 0),
(1, 57, 929, 0, 0),
(1, 58, 930, 0, 0),
(1, 58, 931, 0, 0),
(1, 58, 932, 0, 0),
(1, 58, 933, 0, 0),
(1, 58, 934, 0, 0),
(1, 58, 935, 0, 0),
(1, 58, 936, 0, 0),
(1, 58, 937, 0, 0),
(1, 58, 938, 0, 0),
(1, 58, 939, 0, 0),
(1, 58, 940, 0, 0),
(1, 58, 941, 0, 0),
(1, 58, 942, 0, 0),
(1, 58, 943, 0, 0),
(1, 58, 944, 0, 0),
(1, 58, 945, 0, 0),
(1, 58, 946, 0, 0),
(1, 58, 947, 0, 0),
(1, 58, 948, 0, 0),
(1, 58, 949, 0, 0),
(1, 58, 950, 0, 0),
(1, 58, 951, 0, 0),
(1, 59, 952, 0, 0),
(1, 59, 953, 0, 0),
(1, 59, 954, 0, 0),
(1, 59, 955, 0, 0),
(1, 59, 956, 0, 0),
(1, 59, 957, 0, 0),
(1, 59, 958, 0, 0),
(1, 59, 959, 0, 0),
(1, 59, 960, 0, 0),
(1, 59, 961, 0, 0),
(1, 59, 962, 0, 0),
(1, 59, 963, 0, 0),
(1, 59, 964, 0, 0),
(1, 59, 965, 0, 0),
(1, 59, 966, 0, 0),
(1, 59, 967, 0, 0),
(1, 59, 968, 0, 0),
(1, 59, 969, 0, 0),
(1, 59, 970, 0, 0),
(1, 59, 971, 0, 0),
(1, 59, 972, 0, 0),
(1, 59, 973, 0, 0),
(1, 59, 974, 0, 0),
(1, 59, 975, 0, 0),
(1, 59, 976, 0, 0),
(1, 59, 977, 0, 0),
(1, 59, 978, 0, 0),
(1, 59, 979, 0, 0),
(1, 59, 980, 0, 0),
(1, 59, 981, 0, 0),
(1, 60, 982, 0, 0),
(1, 60, 983, 0, 0),
(1, 60, 984, 0, 0),
(1, 60, 985, 0, 0),
(1, 60, 986, 0, 0),
(1, 60, 987, 0, 0),
(1, 60, 988, 0, 0),
(1, 60, 989, 0, 0),
(1, 60, 990, 0, 0),
(1, 60, 991, 0, 0),
(1, 60, 992, 0, 0),
(1, 60, 993, 0, 0),
(1, 60, 994, 0, 0),
(1, 60, 995, 0, 0),
(1, 61, 996, 0, 0),
(1, 61, 997, 0, 0),
(1, 61, 998, 0, 0),
(1, 61, 999, 0, 0),
(1, 61, 1000, 0, 0),
(1, 61, 1001, 0, 0),
(1, 61, 1002, 0, 0),
(1, 61, 1003, 0, 0),
(1, 61, 1004, 0, 0),
(1, 61, 1005, 0, 0),
(1, 61, 1006, 0, 0),
(1, 61, 1007, 0, 0),
(1, 61, 1008, 0, 0),
(1, 61, 1009, 0, 0),
(1, 61, 1010, 0, 0),
(1, 61, 1011, 0, 0),
(1, 61, 1012, 0, 0),
(1, 61, 1013, 0, 0),
(1, 61, 1014, 0, 0),
(1, 61, 1015, 0, 0),
(1, 61, 1016, 0, 0),
(1, 61, 1017, 0, 0),
(1, 61, 1018, 0, 0),
(1, 61, 1019, 0, 0),
(1, 61, 1020, 0, 0),
(1, 61, 1021, 0, 0),
(1, 61, 1022, 0, 0),
(1, 61, 1023, 0, 0),
(1, 61, 1024, 0, 0),
(1, 62, 1025, 0, 0),
(1, 62, 1026, 0, 0),
(1, 62, 1027, 0, 0),
(1, 62, 1028, 0, 0),
(1, 62, 1029, 0, 0),
(1, 62, 1030, 0, 0),
(1, 62, 1031, 0, 0),
(1, 62, 1032, 0, 0),
(1, 62, 1033, 0, 0),
(1, 62, 1034, 0, 0),
(1, 62, 1035, 0, 0),
(1, 62, 1036, 0, 0),
(1, 62, 1037, 0, 0),
(1, 62, 1038, 0, 0),
(1, 62, 1039, 0, 0),
(1, 62, 1040, 0, 0),
(1, 62, 1041, 0, 0),
(1, 62, 1042, 0, 0),
(1, 62, 1043, 0, 0),
(1, 62, 1044, 0, 0),
(1, 62, 1045, 0, 0),
(1, 62, 1046, 0, 0),
(1, 62, 1047, 0, 0),
(1, 62, 1048, 0, 0),
(1, 62, 1049, 0, 0),
(1, 62, 1050, 0, 0),
(1, 62, 1051, 0, 0),
(1, 62, 1052, 0, 0),
(1, 62, 1053, 0, 0),
(1, 62, 1054, 0, 0),
(1, 63, 1055, 0, 0),
(1, 63, 1056, 0, 0),
(1, 63, 1057, 0, 0),
(1, 63, 1058, 0, 0),
(1, 62, 1059, 0, 0),
(1, 62, 1060, 0, 0),
(1, 62, 1061, 0, 0),
(1, 62, 1062, 0, 0),
(1, 62, 1063, 0, 0),
(1, 62, 1064, 0, 0),
(1, 62, 1065, 0, 0),
(1, 62, 1066, 0, 0),
(1, 62, 1067, 0, 0),
(1, 62, 1068, 0, 0),
(1, 62, 1071, 0, 0),
(1, 62, 1072, 0, 0),
(1, 62, 1073, 0, 0),
(1, 62, 1074, 0, 0),
(1, 62, 1075, 0, 0),
(1, 62, 1076, 0, 0),
(1, 62, 1078, 0, 0),
(1, 62, 1082, 0, 0),
(1, 62, 1084, 0, 0),
(1, 63, 1085, 0, 0),
(1, 63, 1086, 0, 0),
(1, 63, 1087, 0, 0),
(1, 63, 1088, 0, 0),
(1, 63, 1089, 0, 0),
(1, 63, 1090, 0, 0),
(1, 63, 1091, 0, 0),
(1, 63, 1092, 0, 0),
(1, 63, 1093, 0, 0),
(1, 63, 1094, 0, 0),
(1, 63, 1095, 0, 0),
(1, 63, 1096, 0, 0),
(1, 63, 1097, 0, 0),
(1, 63, 1098, 0, 0),
(1, 63, 1099, 0, 0),
(1, 63, 1100, 0, 0),
(1, 63, 1101, 0, 0),
(1, 63, 1102, 0, 0),
(1, 63, 1104, 0, 0),
(1, 63, 1106, 0, 0),
(1, 63, 1108, 0, 0),
(1, 63, 1110, 0, 0),
(1, 63, 1112, 0, 0),
(1, 63, 1114, 0, 0),
(1, 63, 1116, 0, 0),
(1, 63, 1120, 0, 0),
(1, 63, 1122, 0, 0),
(1, 63, 1124, 0, 0),
(1, 63, 1136, 0, 0),
(1, 63, 1138, 0, 0),
(1, 63, 1142, 0, 0),
(1, 63, 1144, 0, 0),
(1, 63, 1146, 0, 0),
(1, 63, 1148, 0, 0),
(1, 63, 1150, 0, 0),
(1, 63, 1152, 0, 0),
(1, 63, 1154, 0, 0),
(1, 63, 1156, 0, 0),
(1, 63, 1158, 0, 0),
(1, 63, 1160, 0, 0),
(1, 63, 1162, 0, 0),
(1, 64, 1163, 0, 0),
(1, 64, 1164, 0, 0),
(1, 64, 1165, 0, 0),
(1, 64, 1166, 0, 0),
(1, 64, 1167, 0, 0),
(1, 64, 1168, 0, 0),
(1, 64, 1169, 0, 0),
(1, 64, 1170, 0, 0),
(1, 64, 1171, 0, 0),
(1, 64, 1172, 0, 0),
(1, 64, 1173, 0, 0),
(1, 64, 1174, 0, 0),
(1, 64, 1175, 0, 0),
(1, 64, 1176, 0, 0),
(1, 64, 1177, 0, 0),
(1, 64, 1178, 0, 0),
(1, 64, 1179, 0, 0),
(1, 64, 1180, 0, 0),
(1, 64, 1182, 0, 0),
(1, 64, 1184, 0, 0),
(1, 64, 1186, 0, 0),
(1, 64, 1187, 0, 0),
(1, 64, 1188, 0, 0),
(1, 64, 1189, 0, 0),
(1, 64, 1190, 0, 0),
(1, 64, 1191, 0, 0),
(1, 64, 1192, 0, 0),
(1, 64, 1194, 0, 0),
(1, 64, 1196, 0, 0),
(1, 64, 1198, 0, 0),
(1, 64, 1200, 0, 0),
(1, 65, 1201, 0, 0),
(1, 65, 1202, 0, 0),
(1, 65, 1203, 0, 0),
(1, 65, 1204, 0, 0),
(1, 65, 1205, 0, 0),
(1, 65, 1206, 0, 0),
(1, 65, 1208, 0, 0),
(1, 66, 1209, 0, 0),
(1, 66, 1210, 0, 0),
(1, 66, 1211, 0, 0),
(1, 66, 1212, 0, 0),
(1, 66, 1213, 0, 0),
(1, 66, 1214, 0, 0),
(1, 66, 1216, 0, 0),
(1, 63, 1218, 0, 0),
(1, 63, 1220, 0, 0),
(1, 63, 1222, 0, 0),
(1, 63, 1226, 0, 0),
(1, 67, 1227, 0, 0),
(1, 67, 1228, 0, 0),
(1, 67, 1229, 0, 0),
(1, 67, 1230, 0, 0),
(1, 67, 1231, 0, 0),
(1, 67, 1232, 0, 0),
(1, 67, 1233, 0, 0),
(1, 67, 1234, 0, 0),
(1, 67, 1235, 0, 0),
(1, 67, 1236, 0, 0),
(1, 67, 1237, 0, 0),
(1, 67, 1238, 0, 0),
(1, 67, 1239, 0, 0),
(1, 67, 1240, 0, 0),
(1, 67, 1241, 0, 0),
(1, 67, 1242, 0, 0),
(1, 67, 1243, 0, 0),
(1, 68, 1244, 0, 0),
(1, 68, 1245, 0, 0),
(1, 68, 1246, 0, 0),
(1, 68, 1247, 0, 0),
(1, 68, 1248, 0, 0),
(1, 68, 1249, 0, 0),
(1, 68, 1250, 0, 0),
(1, 26, 1251, 0, 0),
(1, 70, 1255, 0, 0),
(1, 70, 1256, 0, 0),
(1, 70, 1257, 0, 0),
(1, 70, 1258, 0, 0),
(1, 70, 1259, 0, 0),
(1, 70, 1260, 0, 0),
(1, 70, 1261, 0, 0),
(1, 26, 1262, 0, 0),
(1, 71, 1263, 0, 0),
(1, 71, 1264, 0, 0),
(1, 71, 1265, 0, 0),
(1, 71, 1266, 0, 0),
(1, 71, 1267, 0, 0),
(1, 71, 1268, 0, 0),
(1, 71, 1269, 0, 0),
(1, 26, 1270, 0, 0),
(1, 72, 1271, 0, 0),
(1, 72, 1272, 0, 0),
(1, 72, 1273, 0, 0),
(1, 72, 1274, 0, 0),
(1, 72, 1275, 0, 0),
(1, 72, 1276, 0, 0),
(1, 72, 1277, 0, 0),
(1, 72, 1279, 0, 0),
(1, 72, 1281, 0, 0),
(1, 72, 1285, 0, 0),
(1, 72, 1287, 0, 0),
(2, 6, 1, 0, 0),
(2, 6, 2, 0, 0),
(2, 6, 3, 0, 0),
(2, 6, 4, 0, 0),
(2, 6, 5, 0, 0),
(2, 6, 6, 0, 0),
(2, 6, 7, 0, 0),
(2, 6, 8, 0, 0),
(2, 6, 9, 0, 0),
(2, 6, 10, 0, 0),
(2, 6, 11, 0, 0),
(2, 6, 12, 0, 0),
(2, 6, 13, 0, 0),
(2, 6, 14, 0, 0),
(2, 6, 15, 0, 0),
(2, 6, 16, 0, 0),
(2, 6, 17, 0, 0),
(2, 6, 18, 0, 0),
(2, 6, 19, 0, 0),
(2, 6, 20, 0, 0),
(2, 6, 21, 0, 0),
(2, 6, 22, 0, 0),
(2, 6, 23, 0, 0),
(2, 6, 24, 0, 0),
(2, 6, 25, 0, 0),
(2, 6, 26, 0, 0),
(2, 6, 27, 0, 0),
(2, 6, 28, 0, 0),
(2, 6, 29, 0, 0),
(2, 6, 30, 0, 0),
(2, 6, 31, 0, 0),
(2, 6, 32, 0, 0),
(2, 6, 33, 0, 0),
(2, 6, 34, 0, 0),
(2, 6, 35, 0, 0),
(2, 6, 36, 0, 0),
(2, 7, 37, 0, 0),
(2, 7, 38, 0, 0),
(2, 7, 39, 0, 0),
(2, 7, 40, 0, 0),
(2, 7, 41, 0, 0),
(2, 7, 42, 0, 0),
(2, 7, 43, 0, 0),
(2, 7, 44, 0, 0),
(2, 7, 45, 0, 0),
(2, 7, 46, 0, 0),
(2, 7, 47, 0, 0),
(2, 7, 48, 0, 0),
(2, 7, 49, 0, 0),
(2, 7, 50, 0, 0),
(2, 7, 51, 0, 0),
(2, 7, 52, 0, 0),
(2, 7, 53, 0, 0),
(2, 7, 54, 0, 0),
(2, 7, 55, 0, 0),
(2, 7, 56, 0, 0),
(2, 7, 57, 0, 0),
(2, 7, 58, 0, 0),
(2, 7, 59, 0, 0),
(2, 7, 60, 0, 0),
(2, 7, 61, 0, 0),
(2, 7, 62, 0, 0),
(2, 7, 63, 0, 0),
(2, 7, 64, 0, 0),
(2, 7, 65, 0, 0),
(2, 4, 66, 0, 0),
(2, 4, 67, 0, 0),
(2, 4, 68, 0, 0),
(2, 4, 69, 0, 0),
(2, 4, 70, 0, 0),
(2, 4, 71, 0, 0),
(2, 4, 72, 0, 0),
(2, 4, 73, 0, 0),
(2, 4, 74, 0, 0),
(2, 4, 75, 0, 0),
(2, 4, 76, 0, 0),
(2, 4, 77, 0, 0),
(2, 4, 78, 0, 0),
(2, 4, 79, 0, 0),
(2, 4, 80, 0, 0),
(2, 4, 81, 0, 0),
(2, 4, 82, 0, 0),
(2, 4, 83, 0, 0),
(2, 4, 84, 0, 0),
(2, 4, 85, 0, 0),
(2, 4, 86, 0, 0),
(2, 4, 87, 0, 0),
(2, 4, 88, 0, 0),
(2, 4, 89, 0, 0),
(2, 4, 90, 0, 0),
(2, 4, 91, 0, 0),
(2, 4, 92, 0, 0),
(2, 4, 93, 0, 0),
(2, 4, 94, 0, 0),
(2, 4, 95, 0, 0),
(2, 4, 96, 0, 0),
(2, 4, 97, 0, 0),
(2, 4, 98, 0, 0),
(2, 4, 99, 0, 0),
(2, 4, 100, 0, 0),
(2, 4, 101, 0, 0),
(2, 4, 102, 0, 0),
(2, 4, 103, 0, 0),
(2, 4, 104, 0, 0),
(2, 4, 105, 0, 0),
(2, 4, 106, 0, 0),
(2, 4, 107, 0, 0),
(2, 4, 108, 0, 0),
(2, 4, 109, 0, 0),
(2, 2, 110, 0, 0),
(2, 2, 111, 0, 0),
(2, 2, 112, 0, 0),
(2, 2, 113, 0, 0),
(2, 2, 114, 0, 0),
(2, 2, 115, 0, 0),
(2, 2, 116, 0, 0),
(2, 2, 117, 0, 0),
(2, 2, 118, 0, 0),
(2, 2, 119, 0, 0),
(2, 2, 120, 0, 0),
(2, 2, 121, 0, 0),
(2, 2, 122, 0, 0),
(2, 2, 123, 0, 0),
(2, 2, 124, 0, 0),
(2, 2, 125, 0, 0),
(2, 26, 126, 0, 0),
(2, 26, 127, 0, 0),
(2, 26, 128, 0, 0),
(2, 26, 129, 0, 0),
(2, 26, 130, 0, 0),
(2, 26, 131, 0, 0),
(2, 26, 132, 0, 0),
(2, 26, 133, 0, 0),
(2, 26, 134, 0, 0),
(2, 26, 135, 0, 0),
(2, 26, 136, 0, 0),
(2, 26, 137, 0, 0),
(2, 26, 138, 0, 0),
(2, 26, 139, 0, 0),
(2, 26, 140, 0, 0),
(2, 26, 141, 0, 0),
(2, 26, 142, 0, 0),
(2, 26, 143, 0, 0),
(2, 26, 144, 0, 0),
(2, 26, 145, 0, 0),
(2, 26, 146, 0, 0),
(2, 26, 147, 0, 0),
(2, 26, 148, 0, 0),
(2, 26, 149, 0, 0),
(2, 26, 150, 0, 0),
(2, 4, 151, 0, 0),
(2, 6, 152, 0, 0),
(2, 7, 153, 0, 0),
(2, 26, 154, 0, 0),
(2, 13, 155, 0, 0),
(2, 13, 156, 0, 0),
(2, 13, 157, 0, 0),
(2, 13, 158, 0, 0),
(2, 13, 159, 0, 0),
(2, 13, 160, 0, 0),
(2, 13, 161, 0, 0),
(2, 13, 162, 0, 0),
(2, 13, 163, 0, 0),
(2, 13, 164, 0, 0),
(2, 13, 165, 0, 0),
(2, 13, 166, 0, 0),
(2, 13, 167, 0, 0),
(2, 13, 168, 0, 0),
(2, 13, 169, 0, 0),
(2, 13, 170, 0, 0),
(2, 13, 171, 0, 0),
(2, 13, 172, 0, 0),
(2, 13, 173, 0, 0),
(2, 14, 174, 0, 0),
(2, 14, 175, 0, 0),
(2, 14, 176, 0, 0),
(2, 14, 177, 0, 0),
(2, 14, 178, 0, 0),
(2, 14, 179, 0, 0),
(2, 14, 180, 0, 0),
(2, 14, 181, 0, 0),
(2, 14, 182, 0, 0),
(2, 14, 183, 0, 0),
(2, 14, 184, 0, 0),
(2, 14, 185, 0, 0),
(2, 14, 186, 0, 0),
(2, 14, 187, 0, 0),
(2, 14, 188, 0, 0),
(2, 14, 189, 0, 0),
(2, 14, 190, 0, 0),
(2, 14, 191, 0, 0),
(2, 14, 192, 0, 0),
(2, 14, 193, 0, 0),
(2, 14, 194, 0, 0),
(2, 14, 195, 0, 0),
(2, 14, 196, 0, 0),
(2, 14, 197, 0, 0),
(2, 14, 198, 0, 0),
(2, 14, 199, 0, 0),
(2, 14, 200, 0, 0),
(2, 14, 201, 0, 0),
(2, 14, 202, 0, 0),
(2, 14, 203, 0, 0),
(2, 14, 204, 0, 0),
(2, 8, 205, 0, 0),
(2, 8, 206, 0, 0),
(2, 8, 207, 0, 0),
(2, 8, 208, 0, 0),
(2, 8, 209, 0, 0),
(2, 8, 210, 0, 0),
(2, 8, 211, 0, 0),
(2, 8, 212, 0, 0),
(2, 8, 213, 0, 0),
(2, 8, 214, 0, 0),
(2, 8, 215, 0, 0),
(2, 8, 216, 0, 0),
(2, 8, 217, 0, 0),
(2, 8, 218, 0, 0),
(2, 8, 219, 0, 0),
(2, 10, 220, 0, 0),
(2, 10, 221, 0, 0),
(2, 10, 222, 0, 0),
(2, 10, 223, 0, 0),
(2, 10, 224, 0, 0),
(2, 10, 225, 0, 0),
(2, 10, 226, 0, 0),
(2, 10, 227, 0, 0),
(2, 10, 228, 0, 0),
(2, 10, 229, 0, 0),
(2, 10, 230, 0, 0),
(2, 10, 231, 0, 0),
(2, 9, 232, 0, 0),
(2, 9, 233, 0, 0),
(2, 9, 234, 0, 0),
(2, 9, 235, 0, 0),
(2, 9, 236, 0, 0),
(2, 9, 237, 0, 0),
(2, 9, 238, 0, 0),
(2, 9, 239, 0, 0),
(2, 9, 240, 0, 0),
(2, 9, 241, 0, 0),
(2, 9, 242, 0, 0),
(2, 9, 243, 0, 0),
(2, 9, 244, 0, 0),
(2, 9, 245, 0, 0),
(2, 9, 246, 0, 0),
(2, 9, 247, 0, 0),
(2, 9, 248, 0, 0),
(2, 9, 249, 0, 0),
(2, 9, 250, 0, 0),
(2, 9, 251, 0, 0),
(2, 9, 252, 0, 0),
(2, 9, 253, 0, 0),
(2, 9, 254, 0, 0),
(2, 9, 255, 0, 0),
(2, 16, 256, 0, 0),
(2, 16, 257, 0, 0),
(2, 16, 258, 0, 0),
(2, 16, 259, 0, 0),
(2, 16, 260, 0, 0),
(2, 16, 261, 0, 0),
(2, 16, 262, 0, 0),
(2, 16, 263, 0, 0),
(2, 16, 264, 0, 0),
(2, 16, 265, 0, 0),
(2, 16, 266, 0, 0),
(2, 16, 267, 0, 0),
(2, 16, 268, 0, 0),
(2, 16, 269, 0, 0),
(2, 16, 270, 0, 0),
(2, 16, 271, 0, 0),
(2, 16, 272, 0, 0),
(2, 16, 273, 0, 0),
(2, 16, 274, 0, 0),
(2, 16, 275, 0, 0),
(2, 16, 276, 0, 0),
(2, 16, 277, 0, 0),
(2, 16, 278, 0, 0),
(2, 15, 279, 0, 0),
(2, 15, 280, 0, 0),
(2, 15, 281, 0, 0),
(2, 15, 282, 0, 0),
(2, 15, 283, 0, 0),
(2, 15, 284, 0, 0),
(2, 15, 285, 0, 0),
(2, 15, 286, 0, 0),
(2, 15, 287, 0, 0),
(2, 15, 288, 0, 0),
(2, 18, 289, 0, 0),
(2, 18, 290, 0, 0),
(2, 18, 291, 0, 0),
(2, 18, 292, 0, 0),
(2, 18, 293, 0, 0),
(2, 18, 294, 0, 0),
(2, 18, 295, 0, 0),
(2, 18, 296, 0, 0),
(2, 18, 297, 0, 0),
(2, 18, 298, 0, 0),
(2, 18, 299, 0, 0),
(2, 18, 300, 0, 0),
(2, 18, 301, 0, 0),
(2, 18, 302, 0, 0),
(2, 18, 303, 0, 0),
(2, 18, 304, 0, 0),
(2, 18, 305, 0, 0),
(2, 19, 306, 0, 0),
(2, 19, 307, 0, 0),
(2, 19, 308, 0, 0),
(2, 19, 309, 0, 0),
(2, 19, 310, 0, 0),
(2, 19, 311, 0, 0),
(2, 19, 312, 0, 0),
(2, 19, 313, 0, 0),
(2, 20, 314, 0, 0),
(2, 20, 315, 0, 0),
(2, 20, 316, 0, 0),
(2, 20, 317, 0, 0),
(2, 20, 318, 0, 0),
(2, 20, 319, 0, 0),
(2, 20, 320, 0, 0),
(2, 20, 321, 0, 0),
(2, 20, 322, 0, 0),
(2, 20, 323, 0, 0),
(2, 20, 324, 0, 0),
(2, 20, 325, 0, 0),
(2, 20, 326, 0, 0),
(2, 20, 327, 0, 0),
(2, 20, 328, 0, 0),
(2, 20, 329, 0, 0),
(2, 20, 330, 0, 0),
(2, 20, 331, 0, 0),
(2, 20, 332, 0, 0),
(2, 20, 333, 0, 0),
(2, 20, 334, 0, 0),
(2, 20, 335, 0, 0),
(2, 20, 336, 0, 0),
(2, 20, 337, 0, 0),
(2, 20, 338, 0, 0),
(2, 20, 339, 0, 0),
(2, 20, 340, 0, 0),
(2, 20, 341, 0, 0),
(2, 20, 342, 0, 0),
(2, 20, 343, 0, 0),
(2, 20, 344, 0, 0),
(2, 20, 345, 0, 0),
(2, 20, 346, 0, 0),
(2, 20, 347, 0, 0),
(2, 20, 348, 0, 0),
(2, 20, 349, 0, 0),
(2, 20, 350, 0, 0),
(2, 21, 351, 0, 0),
(2, 21, 352, 0, 0),
(2, 21, 353, 0, 0),
(2, 21, 354, 0, 0),
(2, 21, 355, 0, 0),
(2, 21, 356, 0, 0),
(2, 21, 357, 0, 0),
(2, 21, 358, 0, 0),
(2, 21, 359, 0, 0),
(2, 21, 360, 0, 0),
(2, 21, 361, 0, 0),
(2, 21, 362, 0, 0),
(2, 21, 363, 0, 0),
(2, 21, 364, 0, 0),
(2, 21, 365, 0, 0),
(2, 21, 366, 0, 0),
(2, 21, 367, 0, 0),
(2, 21, 368, 0, 0),
(2, 21, 369, 0, 0),
(2, 21, 370, 0, 0),
(2, 21, 371, 0, 0),
(2, 21, 372, 0, 0),
(2, 21, 373, 0, 0),
(2, 21, 374, 0, 0),
(2, 21, 375, 0, 0),
(2, 21, 376, 0, 0),
(2, 21, 377, 0, 0),
(2, 21, 378, 0, 0),
(2, 21, 379, 0, 0),
(2, 21, 380, 0, 0),
(2, 21, 381, 0, 0),
(2, 21, 382, 0, 0),
(2, 21, 383, 0, 0),
(2, 21, 384, 0, 0),
(2, 21, 385, 0, 0),
(2, 21, 386, 0, 0),
(2, 21, 387, 0, 0),
(2, 21, 388, 0, 0),
(2, 22, 389, 0, 0),
(2, 22, 390, 0, 0),
(2, 22, 391, 0, 0),
(2, 22, 392, 0, 0),
(2, 22, 393, 0, 0),
(2, 22, 394, 0, 0),
(2, 22, 395, 0, 0),
(2, 22, 396, 0, 0),
(2, 22, 397, 0, 0),
(2, 22, 398, 0, 0),
(2, 22, 399, 0, 0),
(2, 22, 400, 0, 0),
(2, 22, 401, 0, 0),
(2, 22, 402, 0, 0),
(2, 22, 403, 0, 0),
(2, 22, 404, 0, 0),
(2, 22, 405, 0, 0),
(2, 22, 406, 0, 0),
(2, 22, 407, 0, 0),
(2, 22, 408, 0, 0),
(2, 22, 409, 0, 0),
(2, 22, 410, 0, 0),
(2, 22, 411, 0, 0),
(2, 22, 412, 0, 0),
(2, 22, 413, 0, 0),
(2, 22, 414, 0, 0),
(2, 22, 415, 0, 0),
(2, 22, 416, 0, 0),
(2, 22, 417, 0, 0),
(2, 22, 418, 0, 0),
(2, 22, 419, 0, 0),
(2, 22, 420, 0, 0),
(2, 22, 421, 0, 0),
(2, 22, 422, 0, 0),
(2, 22, 423, 0, 0),
(2, 22, 424, 0, 0),
(2, 22, 425, 0, 0),
(2, 22, 426, 0, 0),
(2, 22, 427, 0, 0),
(2, 22, 428, 0, 0),
(2, 22, 429, 0, 0),
(2, 22, 430, 0, 0),
(2, 22, 431, 0, 0),
(2, 22, 432, 0, 0),
(2, 22, 433, 0, 0),
(2, 22, 434, 0, 0),
(2, 22, 435, 0, 0),
(2, 23, 436, 0, 0),
(2, 23, 437, 0, 0),
(2, 23, 438, 0, 0),
(2, 23, 439, 0, 0),
(2, 23, 440, 0, 0),
(2, 23, 441, 0, 0),
(2, 23, 442, 0, 0),
(2, 23, 443, 0, 0),
(2, 23, 444, 0, 0),
(2, 23, 445, 0, 0),
(2, 23, 446, 0, 0),
(2, 23, 447, 0, 0),
(2, 23, 448, 0, 0),
(2, 23, 449, 0, 0),
(2, 23, 450, 0, 0),
(2, 23, 451, 0, 0),
(2, 23, 452, 0, 0),
(2, 23, 453, 0, 0),
(2, 23, 454, 0, 0),
(2, 23, 455, 0, 0),
(2, 23, 456, 0, 0),
(2, 23, 457, 0, 0),
(2, 23, 458, 0, 0),
(2, 23, 459, 0, 0),
(2, 23, 460, 0, 0),
(2, 23, 461, 0, 0),
(2, 23, 462, 0, 0),
(2, 23, 463, 0, 0),
(2, 23, 464, 0, 0),
(2, 23, 465, 0, 0),
(2, 23, 466, 0, 0),
(2, 23, 467, 0, 0),
(2, 23, 468, 0, 0),
(2, 23, 469, 0, 0),
(2, 23, 470, 0, 0),
(2, 23, 471, 0, 0),
(2, 23, 472, 0, 0),
(2, 23, 473, 0, 0),
(2, 23, 474, 0, 0),
(2, 29, 475, 0, 0),
(2, 29, 479, 0, 0),
(2, 29, 480, 0, 0),
(2, 29, 482, 0, 0),
(2, 29, 489, 0, 0),
(2, 29, 490, 0, 0),
(2, 29, 491, 0, 0),
(2, 29, 492, 0, 0),
(2, 29, 493, 0, 0),
(2, 29, 495, 0, 0),
(2, 29, 496, 0, 0),
(2, 29, 497, 0, 0),
(2, 29, 498, 0, 0),
(2, 29, 499, 0, 0),
(2, 29, 504, 0, 0),
(2, 29, 505, 0, 0),
(2, 29, 506, 0, 0),
(2, 29, 507, 0, 0),
(2, 29, 515, 0, 0),
(2, 10, 520, 0, 0),
(2, 10, 521, 0, 0),
(2, 10, 522, 0, 0),
(2, 10, 523, 0, 0),
(2, 10, 524, 0, 0),
(2, 10, 525, 0, 0),
(2, 34, 526, 0, 0),
(2, 34, 527, 0, 0),
(2, 34, 528, 0, 0),
(2, 34, 529, 0, 0),
(2, 34, 530, 0, 0),
(2, 34, 531, 0, 0),
(2, 34, 532, 0, 0),
(2, 34, 533, 0, 0),
(2, 34, 534, 0, 0),
(2, 34, 535, 0, 0),
(2, 34, 536, 0, 0),
(2, 34, 537, 0, 0),
(2, 34, 538, 0, 0),
(2, 34, 539, 0, 0),
(2, 34, 540, 0, 0),
(2, 34, 541, 0, 0),
(2, 34, 542, 0, 0),
(2, 29, 543, 0, 0),
(2, 35, 544, 0, 0),
(2, 35, 545, 0, 0),
(2, 35, 546, 0, 0),
(2, 35, 547, 0, 0),
(2, 35, 548, 0, 0),
(2, 35, 549, 0, 0),
(2, 35, 550, 0, 0),
(2, 35, 551, 0, 0),
(2, 35, 552, 0, 0),
(2, 35, 553, 0, 0),
(2, 35, 554, 0, 0),
(2, 35, 555, 0, 0),
(2, 35, 556, 0, 0),
(2, 35, 557, 0, 0),
(2, 35, 558, 0, 0),
(2, 35, 559, 0, 0),
(2, 35, 560, 0, 0),
(2, 35, 561, 0, 0),
(2, 35, 562, 0, 0),
(2, 35, 563, 0, 0),
(2, 35, 564, 0, 0),
(2, 35, 565, 0, 0),
(2, 36, 566, 0, 0),
(2, 36, 567, 0, 0),
(2, 36, 568, 0, 0),
(2, 36, 569, 0, 0),
(2, 36, 570, 0, 0),
(2, 36, 571, 0, 0),
(2, 36, 572, 0, 0),
(2, 36, 573, 0, 0),
(2, 36, 574, 0, 0),
(2, 36, 575, 0, 0),
(2, 36, 576, 0, 0),
(2, 36, 577, 0, 0),
(2, 36, 578, 0, 0),
(2, 36, 579, 0, 0),
(2, 36, 580, 0, 0),
(2, 36, 581, 0, 0),
(2, 36, 582, 0, 0),
(2, 36, 583, 0, 0),
(2, 36, 584, 0, 0),
(2, 36, 585, 0, 0),
(2, 36, 586, 0, 0),
(2, 36, 587, 0, 0),
(2, 38, 588, 0, 0),
(2, 38, 589, 0, 0),
(2, 38, 590, 0, 0),
(2, 38, 591, 0, 0),
(2, 38, 592, 0, 0),
(2, 38, 593, 0, 0),
(2, 38, 594, 0, 0),
(2, 38, 595, 0, 0),
(2, 38, 596, 0, 0),
(2, 38, 597, 0, 0),
(2, 38, 598, 0, 0),
(2, 38, 599, 0, 0),
(2, 38, 600, 0, 0),
(2, 38, 601, 0, 0),
(2, 38, 602, 0, 0),
(2, 38, 603, 0, 0),
(2, 38, 604, 0, 0),
(2, 38, 605, 0, 0),
(2, 38, 606, 0, 0),
(2, 38, 607, 0, 0),
(2, 38, 608, 0, 0),
(2, 42, 609, 0, 0),
(2, 42, 610, 0, 0),
(2, 42, 611, 0, 0),
(2, 42, 612, 0, 0),
(2, 42, 613, 0, 0),
(2, 42, 614, 0, 0),
(2, 42, 615, 0, 0),
(2, 42, 616, 0, 0),
(2, 43, 617, 0, 0),
(2, 43, 618, 0, 0),
(2, 43, 619, 0, 0),
(2, 43, 620, 0, 0),
(2, 43, 621, 0, 0),
(2, 43, 622, 0, 0),
(2, 43, 623, 0, 0),
(2, 43, 624, 0, 0),
(2, 43, 625, 0, 0),
(2, 43, 626, 0, 0),
(2, 43, 627, 0, 0),
(2, 43, 628, 0, 0),
(2, 43, 629, 0, 0),
(2, 44, 630, 0, 0),
(2, 44, 631, 0, 0),
(2, 44, 632, 0, 0),
(2, 44, 633, 0, 0),
(2, 44, 634, 0, 0),
(2, 44, 635, 0, 0),
(2, 44, 636, 0, 0),
(2, 44, 637, 0, 0),
(2, 44, 638, 0, 0),
(2, 44, 639, 0, 0),
(2, 44, 640, 0, 0),
(2, 44, 641, 0, 0),
(2, 44, 642, 0, 0),
(2, 44, 643, 0, 0),
(2, 44, 644, 0, 0),
(2, 44, 645, 0, 0),
(2, 44, 646, 0, 0),
(2, 44, 647, 0, 0),
(2, 45, 648, 0, 0),
(2, 45, 649, 0, 0),
(2, 45, 650, 0, 0),
(2, 45, 651, 0, 0),
(2, 45, 652, 0, 0),
(2, 45, 653, 0, 0),
(2, 45, 654, 0, 0),
(2, 45, 655, 0, 0),
(2, 45, 656, 0, 0),
(2, 45, 657, 0, 0),
(2, 45, 658, 0, 0),
(2, 45, 659, 0, 0),
(2, 45, 660, 0, 0),
(2, 45, 661, 0, 0),
(2, 45, 662, 0, 0),
(2, 45, 663, 0, 0),
(2, 45, 664, 0, 0),
(2, 45, 665, 0, 0),
(2, 45, 666, 0, 0),
(2, 45, 667, 0, 0),
(2, 47, 668, 0, 0),
(2, 47, 669, 0, 0),
(2, 47, 670, 0, 0),
(2, 47, 671, 0, 0),
(2, 47, 672, 0, 0),
(2, 47, 673, 0, 0),
(2, 2, 674, 0, 0),
(2, 29, 675, 0, 0),
(2, 23, 676, 0, 0),
(2, 23, 677, 0, 0),
(2, 23, 678, 0, 0),
(2, 23, 679, 0, 0),
(2, 23, 680, 0, 0),
(2, 23, 681, 0, 0),
(2, 23, 682, 0, 0),
(2, 23, 683, 0, 0),
(2, 23, 684, 0, 0),
(2, 22, 685, 0, 0),
(2, 22, 686, 0, 0),
(2, 22, 687, 0, 0),
(2, 22, 688, 0, 0),
(2, 22, 689, 0, 0),
(2, 22, 690, 0, 0),
(2, 22, 691, 0, 0),
(2, 22, 692, 0, 0),
(2, 22, 693, 0, 0),
(2, 21, 694, 0, 0),
(2, 21, 695, 0, 0),
(2, 21, 696, 0, 0),
(2, 21, 697, 0, 0),
(2, 21, 698, 0, 0),
(2, 21, 699, 0, 0),
(2, 21, 700, 0, 0),
(2, 21, 701, 0, 0),
(2, 21, 702, 0, 0),
(2, 20, 703, 0, 0),
(2, 20, 704, 0, 0),
(2, 20, 705, 0, 0),
(2, 20, 706, 0, 0),
(2, 20, 707, 0, 0),
(2, 20, 708, 0, 0),
(2, 20, 709, 0, 0),
(2, 20, 710, 0, 0),
(2, 20, 711, 0, 0),
(2, 29, 712, 0, 0),
(2, 44, 713, 0, 0),
(2, 42, 714, 0, 0),
(2, 29, 715, 0, 0),
(2, 29, 716, 0, 0),
(2, 29, 717, 0, 0),
(2, 23, 718, 0, 0),
(2, 22, 719, 0, 0),
(2, 21, 720, 0, 0),
(2, 20, 721, 0, 0),
(2, 29, 722, 0, 0),
(2, 6, 723, 0, 0),
(2, 4, 724, 0, 0),
(2, 2, 725, 0, 0),
(2, 29, 726, 0, 0),
(2, 23, 727, 0, 0),
(2, 23, 728, 0, 0),
(2, 21, 729, 0, 0),
(2, 21, 730, 0, 0),
(2, 18, 731, 0, 0),
(2, 7, 732, 0, 0),
(2, 42, 733, 0, 0),
(2, 42, 734, 0, 0),
(2, 23, 735, 0, 0),
(2, 20, 736, 0, 0),
(2, 21, 737, 0, 0),
(2, 22, 738, 0, 0),
(2, 29, 739, 0, 0),
(2, 2, 740, 0, 0),
(2, 13, 741, 0, 0),
(2, 29, 742, 0, 0),
(2, 29, 743, 0, 0),
(2, 29, 744, 0, 0),
(2, 29, 745, 0, 0),
(2, 14, 772, 0, 0),
(2, 36, 773, 0, 0),
(2, 23, 774, 0, 0),
(2, 29, 775, 0, 0),
(2, 23, 776, 0, 0),
(2, 23, 777, 0, 0),
(2, 23, 778, 0, 0),
(2, 20, 779, 0, 0),
(2, 20, 780, 0, 0),
(2, 20, 781, 0, 0),
(2, 21, 782, 0, 0),
(2, 22, 783, 0, 0),
(2, 22, 784, 0, 0),
(2, 22, 785, 0, 0),
(2, 42, 786, 0, 0),
(2, 42, 787, 0, 0),
(2, 42, 788, 0, 0),
(2, 2, 789, 0, 0),
(2, 4, 790, 0, 0),
(2, 6, 791, 0, 0),
(2, 7, 792, 0, 0),
(2, 8, 793, 0, 0),
(2, 9, 794, 0, 0),
(2, 10, 795, 0, 0),
(2, 13, 796, 0, 0),
(2, 14, 797, 0, 0),
(2, 15, 798, 0, 0),
(2, 16, 799, 0, 0),
(2, 18, 800, 0, 0),
(2, 19, 801, 0, 0),
(2, 20, 802, 0, 0),
(2, 21, 803, 0, 0),
(2, 22, 804, 0, 0),
(2, 23, 805, 0, 0),
(2, 26, 806, 0, 0),
(2, 10, 807, 0, 0),
(2, 2, 808, 0, 0),
(2, 4, 809, 0, 0),
(2, 6, 810, 0, 0),
(2, 7, 811, 0, 0),
(2, 8, 812, 0, 0),
(2, 9, 813, 0, 0),
(2, 10, 814, 0, 0),
(2, 13, 815, 0, 0),
(2, 14, 816, 0, 0),
(2, 15, 817, 0, 0),
(2, 16, 818, 0, 0),
(2, 18, 819, 0, 0),
(2, 19, 820, 0, 0),
(2, 20, 821, 0, 0),
(2, 21, 822, 0, 0),
(2, 22, 823, 0, 0),
(2, 23, 824, 0, 0),
(2, 26, 825, 0, 0),
(2, 2, 826, 0, 0),
(2, 4, 827, 0, 0),
(2, 6, 828, 0, 0),
(2, 7, 829, 0, 0),
(2, 8, 830, 0, 0),
(2, 9, 831, 0, 0),
(2, 10, 832, 0, 0),
(2, 13, 833, 0, 0),
(2, 14, 834, 0, 0),
(2, 15, 835, 0, 0),
(2, 16, 836, 0, 0),
(2, 18, 837, 0, 0),
(2, 19, 838, 0, 0),
(2, 20, 839, 0, 0),
(2, 21, 840, 0, 0),
(2, 22, 841, 0, 0),
(2, 23, 842, 0, 0),
(2, 26, 843, 0, 0),
(2, 20, 844, 0, 0),
(2, 21, 845, 0, 0),
(2, 22, 846, 0, 0),
(2, 23, 847, 0, 0),
(2, 45, 848, 0, 0),
(2, 45, 849, 0, 0),
(2, 50, 850, 0, 0),
(2, 50, 851, 0, 0),
(2, 50, 852, 0, 0),
(2, 50, 853, 0, 0),
(2, 50, 854, 0, 0),
(2, 50, 855, 0, 0),
(2, 50, 856, 0, 0),
(2, 51, 857, 0, 0),
(2, 51, 858, 0, 0),
(2, 51, 859, 0, 0),
(2, 51, 860, 0, 0),
(2, 51, 861, 0, 0),
(2, 51, 862, 0, 0),
(2, 51, 863, 0, 0),
(2, 52, 864, 0, 0),
(2, 52, 865, 0, 0),
(2, 52, 866, 0, 0),
(2, 52, 867, 0, 0),
(2, 52, 868, 0, 0),
(2, 52, 869, 0, 0),
(2, 53, 870, 0, 0),
(2, 53, 871, 0, 0),
(2, 53, 872, 0, 0),
(2, 53, 873, 0, 0),
(2, 53, 874, 0, 0),
(2, 53, 875, 0, 0),
(2, 53, 876, 0, 0),
(2, 54, 877, 0, 0),
(2, 54, 878, 0, 0),
(2, 54, 879, 0, 0),
(2, 54, 880, 0, 0),
(2, 54, 881, 0, 0),
(2, 54, 882, 0, 0),
(2, 54, 883, 0, 0),
(2, 54, 884, 0, 0),
(2, 54, 885, 0, 0),
(2, 54, 886, 0, 0),
(2, 54, 887, 0, 0),
(2, 54, 888, 0, 0),
(2, 54, 889, 0, 0),
(2, 54, 890, 0, 0),
(2, 55, 891, 0, 0),
(2, 55, 892, 0, 0),
(2, 55, 893, 0, 0),
(2, 55, 894, 0, 0),
(2, 55, 895, 0, 0),
(2, 55, 896, 0, 0),
(2, 55, 897, 0, 0),
(2, 55, 898, 0, 0),
(2, 55, 899, 0, 0),
(2, 55, 900, 0, 0),
(2, 55, 901, 0, 0),
(2, 55, 902, 0, 0),
(2, 56, 903, 0, 0),
(2, 56, 904, 0, 0),
(2, 56, 905, 0, 0),
(2, 56, 906, 0, 0),
(2, 56, 907, 0, 0),
(2, 56, 908, 0, 0),
(2, 56, 909, 0, 0),
(2, 56, 910, 0, 0),
(2, 56, 911, 0, 0),
(2, 56, 912, 0, 0),
(2, 56, 913, 0, 0),
(2, 56, 914, 0, 0),
(2, 57, 915, 0, 0),
(2, 57, 916, 0, 0),
(2, 57, 917, 0, 0),
(2, 57, 918, 0, 0),
(2, 57, 919, 0, 0),
(2, 57, 920, 0, 0),
(2, 57, 921, 0, 0),
(2, 57, 922, 0, 0),
(2, 57, 923, 0, 0),
(2, 57, 924, 0, 0),
(2, 57, 925, 0, 0),
(2, 57, 926, 0, 0),
(2, 57, 927, 0, 0),
(2, 57, 928, 0, 0),
(2, 57, 929, 0, 0),
(2, 58, 930, 0, 0),
(2, 58, 931, 0, 0),
(2, 58, 932, 0, 0),
(2, 58, 933, 0, 0),
(2, 58, 934, 0, 0),
(2, 58, 935, 0, 0),
(2, 58, 936, 0, 0),
(2, 58, 937, 0, 0),
(2, 58, 938, 0, 0),
(2, 58, 939, 0, 0),
(2, 58, 940, 0, 0),
(2, 58, 941, 0, 0),
(2, 58, 942, 0, 0),
(2, 58, 943, 0, 0),
(2, 58, 944, 0, 0),
(2, 58, 945, 0, 0),
(2, 58, 946, 0, 0),
(2, 58, 947, 0, 0),
(2, 58, 948, 0, 0),
(2, 58, 949, 0, 0),
(2, 58, 950, 0, 0),
(2, 58, 951, 0, 0),
(2, 59, 952, 0, 0),
(2, 59, 953, 0, 0),
(2, 59, 954, 0, 0),
(2, 59, 955, 0, 0),
(2, 59, 956, 0, 0),
(2, 59, 957, 0, 0),
(2, 59, 958, 0, 0),
(2, 59, 959, 0, 0),
(2, 59, 960, 0, 0),
(2, 59, 961, 0, 0),
(2, 59, 962, 0, 0),
(2, 59, 963, 0, 0),
(2, 59, 964, 0, 0),
(2, 59, 965, 0, 0),
(2, 59, 966, 0, 0),
(2, 59, 967, 0, 0),
(2, 59, 968, 0, 0),
(2, 59, 969, 0, 0),
(2, 59, 970, 0, 0),
(2, 59, 971, 0, 0),
(2, 59, 972, 0, 0),
(2, 59, 973, 0, 0),
(2, 59, 974, 0, 0),
(2, 59, 975, 0, 0),
(2, 59, 976, 0, 0),
(2, 59, 977, 0, 0),
(2, 59, 978, 0, 0),
(2, 59, 979, 0, 0),
(2, 59, 980, 0, 0),
(2, 59, 981, 0, 0),
(2, 60, 982, 0, 0),
(2, 60, 983, 0, 0),
(2, 60, 984, 0, 0),
(2, 60, 985, 0, 0),
(2, 60, 986, 0, 0),
(2, 60, 987, 0, 0),
(2, 60, 988, 0, 0),
(2, 60, 989, 0, 0),
(2, 60, 990, 0, 0),
(2, 60, 991, 0, 0),
(2, 60, 992, 0, 0),
(2, 60, 993, 0, 0),
(2, 60, 994, 0, 0),
(2, 60, 995, 0, 0),
(2, 61, 996, 0, 0),
(2, 61, 997, 0, 0),
(2, 61, 998, 0, 0),
(2, 61, 999, 0, 0),
(2, 61, 1000, 0, 0),
(2, 61, 1001, 0, 0),
(2, 61, 1002, 0, 0),
(2, 61, 1003, 0, 0),
(2, 61, 1004, 0, 0),
(2, 61, 1005, 0, 0),
(2, 61, 1006, 0, 0),
(2, 61, 1007, 0, 0),
(2, 61, 1008, 0, 0),
(2, 61, 1009, 0, 0),
(2, 61, 1010, 0, 0),
(2, 61, 1011, 0, 0),
(2, 61, 1012, 0, 0),
(2, 61, 1013, 0, 0),
(2, 61, 1014, 0, 0),
(2, 61, 1015, 0, 0),
(2, 61, 1016, 0, 0),
(2, 61, 1017, 0, 0),
(2, 61, 1018, 0, 0),
(2, 61, 1019, 0, 0),
(2, 61, 1020, 0, 0),
(2, 61, 1021, 0, 0),
(2, 61, 1022, 0, 0),
(2, 61, 1023, 0, 0),
(2, 61, 1024, 0, 0),
(2, 62, 1025, 0, 0),
(2, 62, 1026, 0, 0),
(2, 62, 1027, 0, 0),
(2, 62, 1028, 0, 0),
(2, 62, 1029, 0, 0),
(2, 62, 1030, 0, 0),
(2, 62, 1031, 0, 0),
(2, 62, 1032, 0, 0),
(2, 62, 1033, 0, 0),
(2, 62, 1034, 0, 0),
(2, 62, 1035, 0, 0),
(2, 62, 1036, 0, 0),
(2, 62, 1037, 0, 0),
(2, 62, 1038, 0, 0),
(2, 62, 1039, 0, 0),
(2, 62, 1040, 0, 0),
(2, 62, 1041, 0, 0),
(2, 62, 1042, 0, 0),
(2, 62, 1043, 0, 0),
(2, 62, 1044, 0, 0),
(2, 62, 1045, 0, 0),
(2, 62, 1046, 0, 0),
(2, 62, 1047, 0, 0),
(2, 62, 1048, 0, 0),
(2, 62, 1049, 0, 0),
(2, 62, 1050, 0, 0),
(2, 62, 1051, 0, 0),
(2, 62, 1052, 0, 0),
(2, 62, 1053, 0, 0),
(2, 62, 1054, 0, 0),
(2, 63, 1055, 0, 0),
(2, 63, 1056, 0, 0),
(2, 63, 1057, 0, 0),
(2, 63, 1058, 0, 0),
(2, 62, 1059, 0, 0),
(2, 62, 1060, 0, 0),
(2, 62, 1061, 0, 0),
(2, 62, 1062, 0, 0),
(2, 62, 1063, 0, 0),
(2, 62, 1064, 0, 0),
(2, 62, 1065, 0, 0),
(2, 62, 1066, 0, 0),
(2, 62, 1067, 0, 0),
(2, 62, 1068, 0, 0),
(2, 62, 1071, 0, 0),
(2, 62, 1072, 0, 0),
(2, 62, 1073, 0, 0),
(2, 62, 1074, 0, 0),
(2, 62, 1075, 0, 0),
(2, 62, 1076, 0, 0),
(2, 62, 1078, 0, 0),
(2, 62, 1082, 0, 0),
(2, 62, 1084, 0, 0),
(2, 63, 1085, 0, 0),
(2, 63, 1086, 0, 0),
(2, 63, 1087, 0, 0),
(2, 63, 1088, 0, 0),
(2, 63, 1089, 0, 0),
(2, 63, 1090, 0, 0),
(2, 63, 1091, 0, 0),
(2, 63, 1092, 0, 0),
(2, 63, 1093, 0, 0),
(2, 63, 1094, 0, 0),
(2, 63, 1095, 0, 0),
(2, 63, 1096, 0, 0),
(2, 63, 1097, 0, 0),
(2, 63, 1098, 0, 0),
(2, 63, 1099, 0, 0),
(2, 63, 1100, 0, 0),
(2, 63, 1101, 0, 0),
(2, 63, 1102, 0, 0),
(2, 63, 1104, 0, 0),
(2, 63, 1106, 0, 0),
(2, 63, 1108, 0, 0),
(2, 63, 1110, 0, 0),
(2, 63, 1112, 0, 0),
(2, 63, 1114, 0, 0),
(2, 63, 1116, 0, 0),
(2, 63, 1120, 0, 0),
(2, 63, 1122, 0, 0),
(2, 63, 1124, 0, 0),
(2, 63, 1136, 0, 0),
(2, 63, 1138, 0, 0),
(2, 63, 1142, 0, 0),
(2, 63, 1144, 0, 0),
(2, 63, 1146, 0, 0),
(2, 63, 1148, 0, 0),
(2, 63, 1150, 0, 0),
(2, 63, 1152, 0, 0),
(2, 63, 1154, 0, 0),
(2, 63, 1156, 0, 0),
(2, 63, 1158, 0, 0),
(2, 63, 1160, 0, 0),
(2, 63, 1162, 0, 0),
(2, 64, 1163, 0, 0),
(2, 64, 1164, 0, 0),
(2, 64, 1165, 0, 0),
(2, 64, 1166, 0, 0),
(2, 64, 1167, 0, 0),
(2, 64, 1168, 0, 0),
(2, 64, 1169, 0, 0),
(2, 64, 1170, 0, 0),
(2, 64, 1171, 0, 0),
(2, 64, 1172, 0, 0),
(2, 64, 1173, 0, 0),
(2, 64, 1174, 0, 0),
(2, 64, 1175, 0, 0),
(2, 64, 1176, 0, 0),
(2, 64, 1177, 0, 0),
(2, 64, 1178, 0, 0),
(2, 64, 1179, 0, 0),
(2, 64, 1180, 0, 0),
(2, 64, 1182, 0, 0),
(2, 64, 1184, 0, 0),
(2, 64, 1186, 0, 0),
(2, 64, 1187, 0, 0),
(2, 64, 1188, 0, 0),
(2, 64, 1189, 0, 0),
(2, 64, 1190, 0, 0),
(2, 64, 1191, 0, 0),
(2, 64, 1192, 0, 0),
(2, 64, 1194, 0, 0),
(2, 64, 1196, 0, 0),
(2, 64, 1198, 0, 0),
(2, 64, 1200, 0, 0),
(2, 65, 1201, 0, 0),
(2, 65, 1202, 0, 0),
(2, 65, 1203, 0, 0),
(2, 65, 1204, 0, 0),
(2, 65, 1205, 0, 0),
(2, 65, 1206, 0, 0),
(2, 65, 1208, 0, 0),
(2, 66, 1209, 0, 0),
(2, 66, 1210, 0, 0),
(2, 66, 1211, 0, 0),
(2, 66, 1212, 0, 0),
(2, 66, 1213, 0, 0),
(2, 66, 1214, 0, 0),
(2, 66, 1216, 0, 0),
(2, 63, 1218, 0, 0),
(2, 63, 1220, 0, 0),
(2, 63, 1222, 0, 0),
(2, 63, 1226, 0, 0),
(2, 67, 1227, 0, 0),
(2, 67, 1228, 0, 0),
(2, 67, 1229, 0, 0),
(2, 67, 1230, 0, 0),
(2, 67, 1231, 0, 0),
(2, 67, 1232, 0, 0),
(2, 67, 1233, 0, 0),
(2, 67, 1234, 0, 0),
(2, 67, 1235, 0, 0),
(2, 67, 1236, 0, 0),
(2, 67, 1237, 0, 0),
(2, 67, 1238, 0, 0),
(2, 67, 1239, 0, 0),
(2, 67, 1240, 0, 0),
(2, 67, 1241, 0, 0),
(2, 67, 1242, 0, 0),
(2, 67, 1243, 0, 0),
(2, 68, 1244, 0, 0),
(2, 68, 1245, 0, 0),
(2, 68, 1246, 0, 0),
(2, 68, 1247, 0, 0),
(2, 68, 1248, 0, 0),
(2, 68, 1249, 0, 0),
(2, 68, 1250, 0, 0),
(2, 26, 1251, 0, 0),
(2, 70, 1255, 0, 0),
(2, 70, 1256, 0, 0),
(2, 70, 1257, 0, 0),
(2, 70, 1258, 0, 0),
(2, 70, 1259, 0, 0),
(2, 70, 1260, 0, 0),
(2, 70, 1261, 0, 0),
(2, 26, 1262, 0, 0),
(2, 71, 1263, 0, 0),
(2, 71, 1264, 0, 0),
(2, 71, 1265, 0, 0),
(2, 71, 1266, 0, 0),
(2, 71, 1267, 0, 0),
(2, 71, 1268, 0, 0),
(2, 71, 1269, 0, 0),
(2, 26, 1270, 0, 0),
(2, 72, 1271, 0, 0),
(2, 72, 1272, 0, 0),
(2, 72, 1273, 0, 0),
(2, 72, 1274, 0, 0),
(2, 72, 1275, 0, 0),
(2, 72, 1276, 0, 0),
(2, 72, 1277, 0, 0),
(2, 72, 1279, 0, 0),
(2, 72, 1281, 0, 0),
(2, 72, 1285, 0, 0),
(2, 72, 1287, 0, 0),
(3, 6, 1, 0, 0),
(3, 6, 2, 0, 0),
(3, 6, 3, 0, 0),
(3, 6, 4, 0, 0),
(3, 6, 5, 0, 0),
(3, 6, 6, 0, 0),
(3, 6, 7, 0, 0),
(3, 6, 8, 0, 0),
(3, 6, 9, 0, 0),
(3, 6, 10, 0, 0),
(3, 6, 11, 0, 0),
(3, 6, 12, 0, 0),
(3, 6, 13, 0, 0),
(3, 6, 14, 0, 0),
(3, 6, 15, 0, 0),
(3, 6, 16, 0, 0),
(3, 6, 17, 0, 0),
(3, 6, 18, 0, 0),
(3, 6, 19, 0, 0),
(3, 6, 20, 0, 0),
(3, 6, 21, 0, 0),
(3, 6, 22, 0, 0),
(3, 6, 23, 0, 0),
(3, 6, 24, 0, 0),
(3, 6, 25, 0, 0),
(3, 6, 26, 0, 0),
(3, 6, 27, 0, 0),
(3, 6, 28, 0, 0),
(3, 6, 29, 0, 0),
(3, 6, 30, 0, 0),
(3, 6, 31, 0, 0),
(3, 6, 32, 0, 0),
(3, 6, 33, 0, 0),
(3, 6, 34, 0, 0),
(3, 6, 35, 0, 0),
(3, 6, 36, 0, 0),
(3, 7, 37, 0, 0),
(3, 7, 38, 0, 0),
(3, 7, 39, 0, 0),
(3, 7, 40, 0, 0),
(3, 7, 41, 0, 0),
(3, 7, 42, 0, 0),
(3, 7, 43, 0, 0),
(3, 7, 44, 0, 0),
(3, 7, 45, 0, 0),
(3, 7, 46, 0, 0),
(3, 7, 47, 0, 0),
(3, 7, 48, 0, 0),
(3, 7, 49, 0, 0),
(3, 7, 50, 0, 0),
(3, 7, 51, 0, 0),
(3, 7, 52, 0, 0),
(3, 7, 53, 0, 0),
(3, 7, 54, 0, 0),
(3, 7, 55, 0, 0),
(3, 7, 56, 0, 0),
(3, 7, 57, 0, 0),
(3, 7, 58, 0, 0),
(3, 7, 59, 0, 0),
(3, 7, 60, 0, 0),
(3, 7, 61, 0, 0),
(3, 7, 62, 0, 0),
(3, 7, 63, 0, 0),
(3, 7, 64, 0, 0),
(3, 7, 65, 0, 0),
(3, 4, 66, 0, 0),
(3, 4, 67, 0, 0),
(3, 4, 68, 0, 0),
(3, 4, 69, 0, 0),
(3, 4, 70, 0, 0),
(3, 4, 71, 0, 0),
(3, 4, 72, 0, 0),
(3, 4, 73, 0, 0),
(3, 4, 74, 0, 0),
(3, 4, 75, 0, 0),
(3, 4, 76, 0, 0),
(3, 4, 77, 0, 0),
(3, 4, 78, 0, 0),
(3, 4, 79, 0, 0),
(3, 4, 80, 0, 0),
(3, 4, 81, 0, 0),
(3, 4, 82, 0, 0),
(3, 4, 83, 0, 0),
(3, 4, 84, 0, 0),
(3, 4, 85, 0, 0),
(3, 4, 86, 0, 0),
(3, 4, 87, 0, 0),
(3, 4, 88, 0, 0),
(3, 4, 89, 0, 0),
(3, 4, 90, 0, 0),
(3, 4, 91, 0, 0),
(3, 4, 92, 0, 0),
(3, 4, 93, 0, 0),
(3, 4, 94, 0, 0),
(3, 4, 95, 0, 0),
(3, 4, 96, 0, 0),
(3, 4, 97, 0, 0),
(3, 4, 98, 0, 0),
(3, 4, 99, 0, 0),
(3, 4, 100, 0, 0),
(3, 4, 101, 0, 0),
(3, 4, 102, 0, 0),
(3, 4, 103, 0, 0),
(3, 4, 104, 0, 0),
(3, 4, 105, 0, 0),
(3, 4, 106, 0, 0),
(3, 4, 107, 0, 0),
(3, 4, 108, 0, 0),
(3, 4, 109, 0, 0),
(3, 2, 110, 0, 0),
(3, 2, 111, 0, 0),
(3, 2, 112, 0, 0),
(3, 2, 113, 0, 0),
(3, 2, 114, 0, 0),
(3, 2, 115, 0, 0),
(3, 2, 116, 0, 0),
(3, 2, 117, 0, 0),
(3, 2, 118, 0, 0),
(3, 2, 119, 0, 0),
(3, 2, 120, 0, 0),
(3, 2, 121, 0, 0),
(3, 2, 122, 0, 0),
(3, 2, 123, 0, 0),
(3, 2, 124, 0, 0),
(3, 2, 125, 0, 0),
(3, 26, 126, 0, 0),
(3, 26, 127, 0, 0),
(3, 26, 128, 0, 0),
(3, 26, 129, 0, 0),
(3, 26, 130, 0, 0),
(3, 26, 131, 0, 0),
(3, 26, 132, 0, 0),
(3, 26, 133, 0, 0),
(3, 26, 134, 0, 0),
(3, 26, 135, 0, 0),
(3, 26, 136, 0, 0),
(3, 26, 137, 0, 0),
(3, 26, 138, 0, 0),
(3, 26, 139, 0, 0),
(3, 26, 140, 0, 0),
(3, 26, 141, 0, 0),
(3, 26, 142, 0, 0),
(3, 26, 143, 0, 0),
(3, 26, 144, 0, 0),
(3, 26, 145, 0, 0),
(3, 26, 146, 0, 0),
(3, 26, 147, 0, 0),
(3, 26, 148, 0, 0),
(3, 26, 149, 0, 0),
(3, 26, 150, 0, 0),
(3, 4, 151, 0, 0),
(3, 6, 152, 0, 0),
(3, 7, 153, 0, 0),
(3, 26, 154, 0, 0),
(3, 13, 155, 0, 0),
(3, 13, 156, 0, 0),
(3, 13, 157, 0, 0),
(3, 13, 158, 0, 0),
(3, 13, 159, 0, 0),
(3, 13, 160, 0, 0),
(3, 13, 161, 0, 0),
(3, 13, 162, 0, 0),
(3, 13, 163, 0, 0),
(3, 13, 164, 0, 0),
(3, 13, 165, 0, 0),
(3, 13, 166, 0, 0),
(3, 13, 167, 0, 0),
(3, 13, 168, 0, 0),
(3, 13, 169, 0, 0),
(3, 13, 170, 0, 0),
(3, 13, 171, 0, 0),
(3, 13, 172, 0, 0),
(3, 13, 173, 0, 0),
(3, 14, 174, 0, 0),
(3, 14, 175, 0, 0),
(3, 14, 176, 0, 0),
(3, 14, 177, 0, 0),
(3, 14, 178, 0, 0),
(3, 14, 179, 0, 0),
(3, 14, 180, 0, 0),
(3, 14, 181, 0, 0),
(3, 14, 182, 0, 0),
(3, 14, 183, 0, 0),
(3, 14, 184, 0, 0),
(3, 14, 185, 0, 0),
(3, 14, 186, 0, 0),
(3, 14, 187, 0, 0),
(3, 14, 188, 0, 0),
(3, 14, 189, 0, 0),
(3, 14, 190, 0, 0),
(3, 14, 191, 0, 0),
(3, 14, 192, 0, 0),
(3, 14, 193, 0, 0),
(3, 14, 194, 0, 0),
(3, 14, 195, 0, 0),
(3, 14, 196, 0, 0),
(3, 14, 197, 0, 0),
(3, 14, 198, 0, 0),
(3, 14, 199, 0, 0),
(3, 14, 200, 0, 0),
(3, 14, 201, 0, 0),
(3, 14, 202, 0, 0),
(3, 14, 203, 0, 0),
(3, 14, 204, 0, 0),
(3, 8, 205, 0, 0),
(3, 8, 206, 0, 0),
(3, 8, 207, 0, 0),
(3, 8, 208, 0, 0),
(3, 8, 209, 0, 0),
(3, 8, 210, 0, 0),
(3, 8, 211, 0, 0),
(3, 8, 212, 0, 0),
(3, 8, 213, 0, 0),
(3, 8, 214, 0, 0),
(3, 8, 215, 0, 0),
(3, 8, 216, 0, 0),
(3, 8, 217, 0, 0),
(3, 8, 218, 0, 0),
(3, 8, 219, 0, 0),
(3, 10, 220, 0, 0),
(3, 10, 221, 0, 0),
(3, 10, 222, 0, 0),
(3, 10, 223, 0, 0),
(3, 10, 224, 0, 0),
(3, 10, 225, 0, 0),
(3, 10, 226, 0, 0),
(3, 10, 227, 0, 0),
(3, 10, 228, 0, 0),
(3, 10, 229, 0, 0),
(3, 10, 230, 0, 0),
(3, 10, 231, 0, 0),
(3, 9, 232, 0, 0),
(3, 9, 233, 0, 0),
(3, 9, 234, 0, 0),
(3, 9, 235, 0, 0),
(3, 9, 236, 0, 0),
(3, 9, 237, 0, 0),
(3, 9, 238, 0, 0),
(3, 9, 239, 0, 0),
(3, 9, 240, 0, 0),
(3, 9, 241, 0, 0),
(3, 9, 242, 0, 0),
(3, 9, 243, 0, 0),
(3, 9, 244, 0, 0),
(3, 9, 245, 0, 0),
(3, 9, 246, 0, 0),
(3, 9, 247, 0, 0),
(3, 9, 248, 0, 0),
(3, 9, 249, 0, 0),
(3, 9, 250, 0, 0),
(3, 9, 251, 0, 0),
(3, 9, 252, 0, 0),
(3, 9, 253, 0, 0),
(3, 9, 254, 0, 0),
(3, 9, 255, 0, 0),
(3, 16, 256, 0, 0),
(3, 16, 257, 0, 0),
(3, 16, 258, 0, 0),
(3, 16, 259, 0, 0),
(3, 16, 260, 0, 0),
(3, 16, 261, 0, 0),
(3, 16, 262, 0, 0),
(3, 16, 263, 0, 0),
(3, 16, 264, 0, 0),
(3, 16, 265, 0, 0),
(3, 16, 266, 0, 0),
(3, 16, 267, 0, 0),
(3, 16, 268, 0, 0),
(3, 16, 269, 0, 0),
(3, 16, 270, 0, 0),
(3, 16, 271, 0, 0),
(3, 16, 272, 0, 0),
(3, 16, 273, 0, 0),
(3, 16, 274, 0, 0),
(3, 16, 275, 0, 0),
(3, 16, 276, 0, 0),
(3, 16, 277, 0, 0),
(3, 16, 278, 0, 0),
(3, 15, 279, 0, 0),
(3, 15, 280, 0, 0),
(3, 15, 281, 0, 0),
(3, 15, 282, 0, 0),
(3, 15, 283, 0, 0),
(3, 15, 284, 0, 0),
(3, 15, 285, 0, 0),
(3, 15, 286, 0, 0),
(3, 15, 287, 0, 0),
(3, 15, 288, 0, 0),
(3, 18, 289, 0, 0),
(3, 18, 290, 0, 0),
(3, 18, 291, 0, 0),
(3, 18, 292, 0, 0),
(3, 18, 293, 0, 0),
(3, 18, 294, 0, 0),
(3, 18, 295, 0, 0),
(3, 18, 296, 0, 0),
(3, 18, 297, 0, 0),
(3, 18, 298, 0, 0),
(3, 18, 299, 0, 0),
(3, 18, 300, 0, 0),
(3, 18, 301, 0, 0),
(3, 18, 302, 0, 0),
(3, 18, 303, 0, 0),
(3, 18, 304, 0, 0),
(3, 18, 305, 0, 0),
(3, 19, 306, 0, 0),
(3, 19, 307, 0, 0),
(3, 19, 308, 0, 0),
(3, 19, 309, 0, 0),
(3, 19, 310, 0, 0),
(3, 19, 311, 0, 0),
(3, 19, 312, 0, 0),
(3, 19, 313, 0, 0),
(3, 20, 314, 0, 0),
(3, 20, 315, 0, 0),
(3, 20, 316, 0, 0),
(3, 20, 317, 0, 0),
(3, 20, 318, 0, 0),
(3, 20, 319, 0, 0),
(3, 20, 320, 0, 0),
(3, 20, 321, 0, 0),
(3, 20, 322, 0, 0),
(3, 20, 323, 0, 0),
(3, 20, 324, 0, 0),
(3, 20, 325, 0, 0),
(3, 20, 326, 0, 0),
(3, 20, 327, 0, 0),
(3, 20, 328, 0, 0),
(3, 20, 329, 0, 0),
(3, 20, 330, 0, 0),
(3, 20, 331, 0, 0),
(3, 20, 332, 0, 0),
(3, 20, 333, 0, 0),
(3, 20, 334, 0, 0),
(3, 20, 335, 0, 0),
(3, 20, 336, 0, 0),
(3, 20, 337, 0, 0),
(3, 20, 338, 0, 0),
(3, 20, 339, 0, 0),
(3, 20, 340, 0, 0),
(3, 20, 341, 0, 0),
(3, 20, 342, 0, 0),
(3, 20, 343, 0, 0),
(3, 20, 344, 0, 0),
(3, 20, 345, 0, 0),
(3, 20, 346, 0, 0),
(3, 20, 347, 0, 0),
(3, 20, 348, 0, 0),
(3, 20, 349, 0, 0),
(3, 20, 350, 0, 0),
(3, 21, 351, 0, 0),
(3, 21, 352, 0, 0),
(3, 21, 353, 0, 0),
(3, 21, 354, 0, 0),
(3, 21, 355, 0, 0),
(3, 21, 356, 0, 0),
(3, 21, 357, 0, 0),
(3, 21, 358, 0, 0),
(3, 21, 359, 0, 0),
(3, 21, 360, 0, 0),
(3, 21, 361, 0, 0),
(3, 21, 362, 0, 0),
(3, 21, 363, 0, 0),
(3, 21, 364, 0, 0),
(3, 21, 365, 0, 0),
(3, 21, 366, 0, 0),
(3, 21, 367, 0, 0),
(3, 21, 368, 0, 0),
(3, 21, 369, 0, 0),
(3, 21, 370, 0, 0),
(3, 21, 371, 0, 0),
(3, 21, 372, 0, 0),
(3, 21, 373, 0, 0),
(3, 21, 374, 0, 0),
(3, 21, 375, 0, 0),
(3, 21, 376, 0, 0),
(3, 21, 377, 0, 0),
(3, 21, 378, 0, 0),
(3, 21, 379, 0, 0),
(3, 21, 380, 0, 0),
(3, 21, 381, 0, 0),
(3, 21, 382, 0, 0),
(3, 21, 383, 0, 0),
(3, 21, 384, 0, 0),
(3, 21, 385, 0, 0),
(3, 21, 386, 0, 0),
(3, 21, 387, 0, 0),
(3, 21, 388, 0, 0),
(3, 22, 389, 0, 0),
(3, 22, 390, 0, 0),
(3, 22, 391, 0, 0),
(3, 22, 392, 0, 0),
(3, 22, 393, 0, 0),
(3, 22, 394, 0, 0),
(3, 22, 395, 0, 0),
(3, 22, 396, 0, 0),
(3, 22, 397, 0, 0),
(3, 22, 398, 0, 0),
(3, 22, 399, 0, 0),
(3, 22, 400, 0, 0),
(3, 22, 401, 0, 0),
(3, 22, 402, 0, 0),
(3, 22, 403, 0, 0),
(3, 22, 404, 0, 0),
(3, 22, 405, 0, 0),
(3, 22, 406, 0, 0),
(3, 22, 407, 0, 0),
(3, 22, 408, 0, 0),
(3, 22, 409, 0, 0),
(3, 22, 410, 0, 0),
(3, 22, 411, 0, 0),
(3, 22, 412, 0, 0),
(3, 22, 413, 0, 0),
(3, 22, 414, 0, 0),
(3, 22, 415, 0, 0),
(3, 22, 416, 0, 0),
(3, 22, 417, 0, 0),
(3, 22, 418, 0, 0),
(3, 22, 419, 0, 0),
(3, 22, 420, 0, 0),
(3, 22, 421, 0, 0),
(3, 22, 422, 0, 0),
(3, 22, 423, 0, 0),
(3, 22, 424, 0, 0),
(3, 22, 425, 0, 0),
(3, 22, 426, 0, 0),
(3, 22, 427, 0, 0),
(3, 22, 428, 0, 0),
(3, 22, 429, 0, 0),
(3, 22, 430, 0, 0),
(3, 22, 431, 0, 0),
(3, 22, 432, 0, 0),
(3, 22, 433, 0, 0),
(3, 22, 434, 0, 0),
(3, 22, 435, 0, 0),
(3, 23, 436, 0, 0),
(3, 23, 437, 0, 0),
(3, 23, 438, 0, 0),
(3, 23, 439, 0, 0),
(3, 23, 440, 0, 0),
(3, 23, 441, 0, 0),
(3, 23, 442, 0, 0),
(3, 23, 443, 0, 0),
(3, 23, 444, 0, 0),
(3, 23, 445, 0, 0),
(3, 23, 446, 0, 0),
(3, 23, 447, 0, 0),
(3, 23, 448, 0, 0),
(3, 23, 449, 0, 0),
(3, 23, 450, 0, 0),
(3, 23, 451, 0, 0),
(3, 23, 452, 0, 0),
(3, 23, 453, 0, 0),
(3, 23, 454, 0, 0),
(3, 23, 455, 0, 0),
(3, 23, 456, 0, 0),
(3, 23, 457, 0, 0),
(3, 23, 458, 0, 0),
(3, 23, 459, 0, 0),
(3, 23, 460, 0, 0),
(3, 23, 461, 0, 0),
(3, 23, 462, 0, 0);
INSERT INTO `vtiger_profile2field` (`profileid`, `tabid`, `fieldid`, `visible`, `readonly`) VALUES
(3, 23, 463, 0, 0),
(3, 23, 464, 0, 0),
(3, 23, 465, 0, 0),
(3, 23, 466, 0, 0),
(3, 23, 467, 0, 0),
(3, 23, 468, 0, 0),
(3, 23, 469, 0, 0),
(3, 23, 470, 0, 0),
(3, 23, 471, 0, 0),
(3, 23, 472, 0, 0),
(3, 23, 473, 0, 0),
(3, 23, 474, 0, 0),
(3, 29, 475, 0, 0),
(3, 29, 479, 0, 0),
(3, 29, 480, 0, 0),
(3, 29, 482, 0, 0),
(3, 29, 489, 0, 0),
(3, 29, 490, 0, 0),
(3, 29, 491, 0, 0),
(3, 29, 492, 0, 0),
(3, 29, 493, 0, 0),
(3, 29, 495, 0, 0),
(3, 29, 496, 0, 0),
(3, 29, 497, 0, 0),
(3, 29, 498, 0, 0),
(3, 29, 499, 0, 0),
(3, 29, 504, 0, 0),
(3, 29, 505, 0, 0),
(3, 29, 506, 0, 0),
(3, 29, 507, 0, 0),
(3, 29, 515, 0, 0),
(3, 10, 520, 0, 0),
(3, 10, 521, 0, 0),
(3, 10, 522, 0, 0),
(3, 10, 523, 0, 0),
(3, 10, 524, 0, 0),
(3, 10, 525, 0, 0),
(3, 34, 526, 0, 0),
(3, 34, 527, 0, 0),
(3, 34, 528, 0, 0),
(3, 34, 529, 0, 0),
(3, 34, 530, 0, 0),
(3, 34, 531, 0, 0),
(3, 34, 532, 0, 0),
(3, 34, 533, 0, 0),
(3, 34, 534, 0, 0),
(3, 34, 535, 0, 0),
(3, 34, 536, 0, 0),
(3, 34, 537, 0, 0),
(3, 34, 538, 0, 0),
(3, 34, 539, 0, 0),
(3, 34, 540, 0, 0),
(3, 34, 541, 0, 0),
(3, 34, 542, 0, 0),
(3, 29, 543, 0, 0),
(3, 35, 544, 0, 0),
(3, 35, 545, 0, 0),
(3, 35, 546, 0, 0),
(3, 35, 547, 0, 0),
(3, 35, 548, 0, 0),
(3, 35, 549, 0, 0),
(3, 35, 550, 0, 0),
(3, 35, 551, 0, 0),
(3, 35, 552, 0, 0),
(3, 35, 553, 0, 0),
(3, 35, 554, 0, 0),
(3, 35, 555, 0, 0),
(3, 35, 556, 0, 0),
(3, 35, 557, 0, 0),
(3, 35, 558, 0, 0),
(3, 35, 559, 0, 0),
(3, 35, 560, 0, 0),
(3, 35, 561, 0, 0),
(3, 35, 562, 0, 0),
(3, 35, 563, 0, 0),
(3, 35, 564, 0, 0),
(3, 35, 565, 0, 0),
(3, 36, 566, 0, 0),
(3, 36, 567, 0, 0),
(3, 36, 568, 0, 0),
(3, 36, 569, 0, 0),
(3, 36, 570, 0, 0),
(3, 36, 571, 0, 0),
(3, 36, 572, 0, 0),
(3, 36, 573, 0, 0),
(3, 36, 574, 0, 0),
(3, 36, 575, 0, 0),
(3, 36, 576, 0, 0),
(3, 36, 577, 0, 0),
(3, 36, 578, 0, 0),
(3, 36, 579, 0, 0),
(3, 36, 580, 0, 0),
(3, 36, 581, 0, 0),
(3, 36, 582, 0, 0),
(3, 36, 583, 0, 0),
(3, 36, 584, 0, 0),
(3, 36, 585, 0, 0),
(3, 36, 586, 0, 0),
(3, 36, 587, 0, 0),
(3, 38, 588, 0, 0),
(3, 38, 589, 0, 0),
(3, 38, 590, 0, 0),
(3, 38, 591, 0, 0),
(3, 38, 592, 0, 0),
(3, 38, 593, 0, 0),
(3, 38, 594, 0, 0),
(3, 38, 595, 0, 0),
(3, 38, 596, 0, 0),
(3, 38, 597, 0, 0),
(3, 38, 598, 0, 0),
(3, 38, 599, 0, 0),
(3, 38, 600, 0, 0),
(3, 38, 601, 0, 0),
(3, 38, 602, 0, 0),
(3, 38, 603, 0, 0),
(3, 38, 604, 0, 0),
(3, 38, 605, 0, 0),
(3, 38, 606, 0, 0),
(3, 38, 607, 0, 0),
(3, 38, 608, 0, 0),
(3, 42, 609, 0, 0),
(3, 42, 610, 0, 0),
(3, 42, 611, 0, 0),
(3, 42, 612, 0, 0),
(3, 42, 613, 0, 0),
(3, 42, 614, 0, 0),
(3, 42, 615, 0, 0),
(3, 42, 616, 0, 0),
(3, 43, 617, 0, 0),
(3, 43, 618, 0, 0),
(3, 43, 619, 0, 0),
(3, 43, 620, 0, 0),
(3, 43, 621, 0, 0),
(3, 43, 622, 0, 0),
(3, 43, 623, 0, 0),
(3, 43, 624, 0, 0),
(3, 43, 625, 0, 0),
(3, 43, 626, 0, 0),
(3, 43, 627, 0, 0),
(3, 43, 628, 0, 0),
(3, 43, 629, 0, 0),
(3, 44, 630, 0, 0),
(3, 44, 631, 0, 0),
(3, 44, 632, 0, 0),
(3, 44, 633, 0, 0),
(3, 44, 634, 0, 0),
(3, 44, 635, 0, 0),
(3, 44, 636, 0, 0),
(3, 44, 637, 0, 0),
(3, 44, 638, 0, 0),
(3, 44, 639, 0, 0),
(3, 44, 640, 0, 0),
(3, 44, 641, 0, 0),
(3, 44, 642, 0, 0),
(3, 44, 643, 0, 0),
(3, 44, 644, 0, 0),
(3, 44, 645, 0, 0),
(3, 44, 646, 0, 0),
(3, 44, 647, 0, 0),
(3, 45, 648, 0, 0),
(3, 45, 649, 0, 0),
(3, 45, 650, 0, 0),
(3, 45, 651, 0, 0),
(3, 45, 652, 0, 0),
(3, 45, 653, 0, 0),
(3, 45, 654, 0, 0),
(3, 45, 655, 0, 0),
(3, 45, 656, 0, 0),
(3, 45, 657, 0, 0),
(3, 45, 658, 0, 0),
(3, 45, 659, 0, 0),
(3, 45, 660, 0, 0),
(3, 45, 661, 0, 0),
(3, 45, 662, 0, 0),
(3, 45, 663, 0, 0),
(3, 45, 664, 0, 0),
(3, 45, 665, 0, 0),
(3, 45, 666, 0, 0),
(3, 45, 667, 0, 0),
(3, 47, 668, 0, 0),
(3, 47, 669, 0, 0),
(3, 47, 670, 0, 0),
(3, 47, 671, 0, 0),
(3, 47, 672, 0, 0),
(3, 47, 673, 0, 0),
(3, 2, 674, 0, 0),
(3, 29, 675, 0, 0),
(3, 23, 676, 0, 0),
(3, 23, 677, 0, 0),
(3, 23, 678, 0, 0),
(3, 23, 679, 0, 0),
(3, 23, 680, 0, 0),
(3, 23, 681, 0, 0),
(3, 23, 682, 0, 0),
(3, 23, 683, 0, 0),
(3, 23, 684, 0, 0),
(3, 22, 685, 0, 0),
(3, 22, 686, 0, 0),
(3, 22, 687, 0, 0),
(3, 22, 688, 0, 0),
(3, 22, 689, 0, 0),
(3, 22, 690, 0, 0),
(3, 22, 691, 0, 0),
(3, 22, 692, 0, 0),
(3, 22, 693, 0, 0),
(3, 21, 694, 0, 0),
(3, 21, 695, 0, 0),
(3, 21, 696, 0, 0),
(3, 21, 697, 0, 0),
(3, 21, 698, 0, 0),
(3, 21, 699, 0, 0),
(3, 21, 700, 0, 0),
(3, 21, 701, 0, 0),
(3, 21, 702, 0, 0),
(3, 20, 703, 0, 0),
(3, 20, 704, 0, 0),
(3, 20, 705, 0, 0),
(3, 20, 706, 0, 0),
(3, 20, 707, 0, 0),
(3, 20, 708, 0, 0),
(3, 20, 709, 0, 0),
(3, 20, 710, 0, 0),
(3, 20, 711, 0, 0),
(3, 29, 712, 0, 0),
(3, 44, 713, 0, 0),
(3, 42, 714, 0, 0),
(3, 29, 715, 0, 0),
(3, 29, 716, 0, 0),
(3, 29, 717, 0, 0),
(3, 23, 718, 0, 0),
(3, 22, 719, 0, 0),
(3, 21, 720, 0, 0),
(3, 20, 721, 0, 0),
(3, 29, 722, 0, 0),
(3, 6, 723, 0, 0),
(3, 4, 724, 0, 0),
(3, 2, 725, 0, 0),
(3, 29, 726, 0, 0),
(3, 23, 727, 0, 0),
(3, 23, 728, 0, 0),
(3, 21, 729, 0, 0),
(3, 21, 730, 0, 0),
(3, 18, 731, 0, 0),
(3, 7, 732, 0, 0),
(3, 42, 733, 0, 0),
(3, 42, 734, 0, 0),
(3, 23, 735, 0, 0),
(3, 20, 736, 0, 0),
(3, 21, 737, 0, 0),
(3, 22, 738, 0, 0),
(3, 29, 739, 0, 0),
(3, 2, 740, 0, 0),
(3, 13, 741, 0, 0),
(3, 29, 742, 0, 0),
(3, 29, 743, 0, 0),
(3, 29, 744, 0, 0),
(3, 29, 745, 0, 0),
(3, 14, 772, 0, 0),
(3, 36, 773, 0, 0),
(3, 23, 774, 0, 0),
(3, 29, 775, 0, 0),
(3, 23, 776, 0, 0),
(3, 23, 777, 0, 0),
(3, 23, 778, 0, 0),
(3, 20, 779, 0, 0),
(3, 20, 780, 0, 0),
(3, 20, 781, 0, 0),
(3, 21, 782, 0, 0),
(3, 22, 783, 0, 0),
(3, 22, 784, 0, 0),
(3, 22, 785, 0, 0),
(3, 42, 786, 0, 0),
(3, 42, 787, 0, 0),
(3, 42, 788, 0, 0),
(3, 2, 789, 0, 0),
(3, 4, 790, 0, 0),
(3, 6, 791, 0, 0),
(3, 7, 792, 0, 0),
(3, 8, 793, 0, 0),
(3, 9, 794, 0, 0),
(3, 10, 795, 0, 0),
(3, 13, 796, 0, 0),
(3, 14, 797, 0, 0),
(3, 15, 798, 0, 0),
(3, 16, 799, 0, 0),
(3, 18, 800, 0, 0),
(3, 19, 801, 0, 0),
(3, 20, 802, 0, 0),
(3, 21, 803, 0, 0),
(3, 22, 804, 0, 0),
(3, 23, 805, 0, 0),
(3, 26, 806, 0, 0),
(3, 10, 807, 0, 0),
(3, 2, 808, 0, 0),
(3, 4, 809, 0, 0),
(3, 6, 810, 0, 0),
(3, 7, 811, 0, 0),
(3, 8, 812, 0, 0),
(3, 9, 813, 0, 0),
(3, 10, 814, 0, 0),
(3, 13, 815, 0, 0),
(3, 14, 816, 0, 0),
(3, 15, 817, 0, 0),
(3, 16, 818, 0, 0),
(3, 18, 819, 0, 0),
(3, 19, 820, 0, 0),
(3, 20, 821, 0, 0),
(3, 21, 822, 0, 0),
(3, 22, 823, 0, 0),
(3, 23, 824, 0, 0),
(3, 26, 825, 0, 0),
(3, 2, 826, 0, 0),
(3, 4, 827, 0, 0),
(3, 6, 828, 0, 0),
(3, 7, 829, 0, 0),
(3, 8, 830, 0, 0),
(3, 9, 831, 0, 0),
(3, 10, 832, 0, 0),
(3, 13, 833, 0, 0),
(3, 14, 834, 0, 0),
(3, 15, 835, 0, 0),
(3, 16, 836, 0, 0),
(3, 18, 837, 0, 0),
(3, 19, 838, 0, 0),
(3, 20, 839, 0, 0),
(3, 21, 840, 0, 0),
(3, 22, 841, 0, 0),
(3, 23, 842, 0, 0),
(3, 26, 843, 0, 0),
(3, 20, 844, 0, 0),
(3, 21, 845, 0, 0),
(3, 22, 846, 0, 0),
(3, 23, 847, 0, 0),
(3, 45, 848, 0, 0),
(3, 45, 849, 0, 0),
(3, 50, 850, 0, 0),
(3, 50, 851, 0, 0),
(3, 50, 852, 0, 0),
(3, 50, 853, 0, 0),
(3, 50, 854, 0, 0),
(3, 50, 855, 0, 0),
(3, 50, 856, 0, 0),
(3, 51, 857, 0, 0),
(3, 51, 858, 0, 0),
(3, 51, 859, 0, 0),
(3, 51, 860, 0, 0),
(3, 51, 861, 0, 0),
(3, 51, 862, 0, 0),
(3, 51, 863, 0, 0),
(3, 52, 864, 0, 0),
(3, 52, 865, 0, 0),
(3, 52, 866, 0, 0),
(3, 52, 867, 0, 0),
(3, 52, 868, 0, 0),
(3, 52, 869, 0, 0),
(3, 53, 870, 0, 0),
(3, 53, 871, 0, 0),
(3, 53, 872, 0, 0),
(3, 53, 873, 0, 0),
(3, 53, 874, 0, 0),
(3, 53, 875, 0, 0),
(3, 53, 876, 0, 0),
(3, 54, 877, 0, 0),
(3, 54, 878, 0, 0),
(3, 54, 879, 0, 0),
(3, 54, 880, 0, 0),
(3, 54, 881, 0, 0),
(3, 54, 882, 0, 0),
(3, 54, 883, 0, 0),
(3, 54, 884, 0, 0),
(3, 54, 885, 0, 0),
(3, 54, 886, 0, 0),
(3, 54, 887, 0, 0),
(3, 54, 888, 0, 0),
(3, 54, 889, 0, 0),
(3, 54, 890, 0, 0),
(3, 55, 891, 0, 0),
(3, 55, 892, 0, 0),
(3, 55, 893, 0, 0),
(3, 55, 894, 0, 0),
(3, 55, 895, 0, 0),
(3, 55, 896, 0, 0),
(3, 55, 897, 0, 0),
(3, 55, 898, 0, 0),
(3, 55, 899, 0, 0),
(3, 55, 900, 0, 0),
(3, 55, 901, 0, 0),
(3, 55, 902, 0, 0),
(3, 56, 903, 0, 0),
(3, 56, 904, 0, 0),
(3, 56, 905, 0, 0),
(3, 56, 906, 0, 0),
(3, 56, 907, 0, 0),
(3, 56, 908, 0, 0),
(3, 56, 909, 0, 0),
(3, 56, 910, 0, 0),
(3, 56, 911, 0, 0),
(3, 56, 912, 0, 0),
(3, 56, 913, 0, 0),
(3, 56, 914, 0, 0),
(3, 57, 915, 0, 0),
(3, 57, 916, 0, 0),
(3, 57, 917, 0, 0),
(3, 57, 918, 0, 0),
(3, 57, 919, 0, 0),
(3, 57, 920, 0, 0),
(3, 57, 921, 0, 0),
(3, 57, 922, 0, 0),
(3, 57, 923, 0, 0),
(3, 57, 924, 0, 0),
(3, 57, 925, 0, 0),
(3, 57, 926, 0, 0),
(3, 57, 927, 0, 0),
(3, 57, 928, 0, 0),
(3, 57, 929, 0, 0),
(3, 58, 930, 0, 0),
(3, 58, 931, 0, 0),
(3, 58, 932, 0, 0),
(3, 58, 933, 0, 0),
(3, 58, 934, 0, 0),
(3, 58, 935, 0, 0),
(3, 58, 936, 0, 0),
(3, 58, 937, 0, 0),
(3, 58, 938, 0, 0),
(3, 58, 939, 0, 0),
(3, 58, 940, 0, 0),
(3, 58, 941, 0, 0),
(3, 58, 942, 0, 0),
(3, 58, 943, 0, 0),
(3, 58, 944, 0, 0),
(3, 58, 945, 0, 0),
(3, 58, 946, 0, 0),
(3, 58, 947, 0, 0),
(3, 58, 948, 0, 0),
(3, 58, 949, 0, 0),
(3, 58, 950, 0, 0),
(3, 58, 951, 0, 0),
(3, 59, 952, 0, 0),
(3, 59, 953, 0, 0),
(3, 59, 954, 0, 0),
(3, 59, 955, 0, 0),
(3, 59, 956, 0, 0),
(3, 59, 957, 0, 0),
(3, 59, 958, 0, 0),
(3, 59, 959, 0, 0),
(3, 59, 960, 0, 0),
(3, 59, 961, 0, 0),
(3, 59, 962, 0, 0),
(3, 59, 963, 0, 0),
(3, 59, 964, 0, 0),
(3, 59, 965, 0, 0),
(3, 59, 966, 0, 0),
(3, 59, 967, 0, 0),
(3, 59, 968, 0, 0),
(3, 59, 969, 0, 0),
(3, 59, 970, 0, 0),
(3, 59, 971, 0, 0),
(3, 59, 972, 0, 0),
(3, 59, 973, 0, 0),
(3, 59, 974, 0, 0),
(3, 59, 975, 0, 0),
(3, 59, 976, 0, 0),
(3, 59, 977, 0, 0),
(3, 59, 978, 0, 0),
(3, 59, 979, 0, 0),
(3, 59, 980, 0, 0),
(3, 59, 981, 0, 0),
(3, 60, 982, 0, 0),
(3, 60, 983, 0, 0),
(3, 60, 984, 0, 0),
(3, 60, 985, 0, 0),
(3, 60, 986, 0, 0),
(3, 60, 987, 0, 0),
(3, 60, 988, 0, 0),
(3, 60, 989, 0, 0),
(3, 60, 990, 0, 0),
(3, 60, 991, 0, 0),
(3, 60, 992, 0, 0),
(3, 60, 993, 0, 0),
(3, 60, 994, 0, 0),
(3, 60, 995, 0, 0),
(3, 61, 996, 0, 0),
(3, 61, 997, 0, 0),
(3, 61, 998, 0, 0),
(3, 61, 999, 0, 0),
(3, 61, 1000, 0, 0),
(3, 61, 1001, 0, 0),
(3, 61, 1002, 0, 0),
(3, 61, 1003, 0, 0),
(3, 61, 1004, 0, 0),
(3, 61, 1005, 0, 0),
(3, 61, 1006, 0, 0),
(3, 61, 1007, 0, 0),
(3, 61, 1008, 0, 0),
(3, 61, 1009, 0, 0),
(3, 61, 1010, 0, 0),
(3, 61, 1011, 0, 0),
(3, 61, 1012, 0, 0),
(3, 61, 1013, 0, 0),
(3, 61, 1014, 0, 0),
(3, 61, 1015, 0, 0),
(3, 61, 1016, 0, 0),
(3, 61, 1017, 0, 0),
(3, 61, 1018, 0, 0),
(3, 61, 1019, 0, 0),
(3, 61, 1020, 0, 0),
(3, 61, 1021, 0, 0),
(3, 61, 1022, 0, 0),
(3, 61, 1023, 0, 0),
(3, 61, 1024, 0, 0),
(3, 62, 1025, 0, 0),
(3, 62, 1026, 0, 0),
(3, 62, 1027, 0, 0),
(3, 62, 1028, 0, 0),
(3, 62, 1029, 0, 0),
(3, 62, 1030, 0, 0),
(3, 62, 1031, 0, 0),
(3, 62, 1032, 0, 0),
(3, 62, 1033, 0, 0),
(3, 62, 1034, 0, 0),
(3, 62, 1035, 0, 0),
(3, 62, 1036, 0, 0),
(3, 62, 1037, 0, 0),
(3, 62, 1038, 0, 0),
(3, 62, 1039, 0, 0),
(3, 62, 1040, 0, 0),
(3, 62, 1041, 0, 0),
(3, 62, 1042, 0, 0),
(3, 62, 1043, 0, 0),
(3, 62, 1044, 0, 0),
(3, 62, 1045, 0, 0),
(3, 62, 1046, 0, 0),
(3, 62, 1047, 0, 0),
(3, 62, 1048, 0, 0),
(3, 62, 1049, 0, 0),
(3, 62, 1050, 0, 0),
(3, 62, 1051, 0, 0),
(3, 62, 1052, 0, 0),
(3, 62, 1053, 0, 0),
(3, 62, 1054, 0, 0),
(3, 63, 1055, 0, 0),
(3, 63, 1056, 0, 0),
(3, 63, 1057, 0, 0),
(3, 63, 1058, 0, 0),
(3, 62, 1059, 0, 0),
(3, 62, 1060, 0, 0),
(3, 62, 1061, 0, 0),
(3, 62, 1062, 0, 0),
(3, 62, 1063, 0, 0),
(3, 62, 1064, 0, 0),
(3, 62, 1065, 0, 0),
(3, 62, 1066, 0, 0),
(3, 62, 1067, 0, 0),
(3, 62, 1068, 0, 0),
(3, 62, 1071, 0, 0),
(3, 62, 1072, 0, 0),
(3, 62, 1073, 0, 0),
(3, 62, 1074, 0, 0),
(3, 62, 1075, 0, 0),
(3, 62, 1076, 0, 0),
(3, 62, 1078, 0, 0),
(3, 62, 1082, 0, 0),
(3, 62, 1084, 0, 0),
(3, 63, 1085, 0, 0),
(3, 63, 1086, 0, 0),
(3, 63, 1087, 0, 0),
(3, 63, 1088, 0, 0),
(3, 63, 1089, 0, 0),
(3, 63, 1090, 0, 0),
(3, 63, 1091, 0, 0),
(3, 63, 1092, 0, 0),
(3, 63, 1093, 0, 0),
(3, 63, 1094, 0, 0),
(3, 63, 1095, 0, 0),
(3, 63, 1096, 0, 0),
(3, 63, 1097, 0, 0),
(3, 63, 1098, 0, 0),
(3, 63, 1099, 0, 0),
(3, 63, 1100, 0, 0),
(3, 63, 1101, 0, 0),
(3, 63, 1102, 0, 0),
(3, 63, 1104, 0, 0),
(3, 63, 1106, 0, 0),
(3, 63, 1108, 0, 0),
(3, 63, 1110, 0, 0),
(3, 63, 1112, 0, 0),
(3, 63, 1114, 0, 0),
(3, 63, 1116, 0, 0),
(3, 63, 1120, 0, 0),
(3, 63, 1122, 0, 0),
(3, 63, 1124, 0, 0),
(3, 63, 1136, 0, 0),
(3, 63, 1138, 0, 0),
(3, 63, 1142, 0, 0),
(3, 63, 1144, 0, 0),
(3, 63, 1146, 0, 0),
(3, 63, 1148, 0, 0),
(3, 63, 1150, 0, 0),
(3, 63, 1152, 0, 0),
(3, 63, 1154, 0, 0),
(3, 63, 1156, 0, 0),
(3, 63, 1158, 0, 0),
(3, 63, 1160, 0, 0),
(3, 63, 1162, 0, 0),
(3, 64, 1163, 0, 0),
(3, 64, 1164, 0, 0),
(3, 64, 1165, 0, 0),
(3, 64, 1166, 0, 0),
(3, 64, 1167, 0, 0),
(3, 64, 1168, 0, 0),
(3, 64, 1169, 0, 0),
(3, 64, 1170, 0, 0),
(3, 64, 1171, 0, 0),
(3, 64, 1172, 0, 0),
(3, 64, 1173, 0, 0),
(3, 64, 1174, 0, 0),
(3, 64, 1175, 0, 0),
(3, 64, 1176, 0, 0),
(3, 64, 1177, 0, 0),
(3, 64, 1178, 0, 0),
(3, 64, 1179, 0, 0),
(3, 64, 1180, 0, 0),
(3, 64, 1182, 0, 0),
(3, 64, 1184, 0, 0),
(3, 64, 1186, 0, 0),
(3, 64, 1187, 0, 0),
(3, 64, 1188, 0, 0),
(3, 64, 1189, 0, 0),
(3, 64, 1190, 0, 0),
(3, 64, 1191, 0, 0),
(3, 64, 1192, 0, 0),
(3, 64, 1194, 0, 0),
(3, 64, 1196, 0, 0),
(3, 64, 1198, 0, 0),
(3, 64, 1200, 0, 0),
(3, 65, 1201, 0, 0),
(3, 65, 1202, 0, 0),
(3, 65, 1203, 0, 0),
(3, 65, 1204, 0, 0),
(3, 65, 1205, 0, 0),
(3, 65, 1206, 0, 0),
(3, 65, 1208, 0, 0),
(3, 66, 1209, 0, 0),
(3, 66, 1210, 0, 0),
(3, 66, 1211, 0, 0),
(3, 66, 1212, 0, 0),
(3, 66, 1213, 0, 0),
(3, 66, 1214, 0, 0),
(3, 66, 1216, 0, 0),
(3, 63, 1218, 0, 0),
(3, 63, 1220, 0, 0),
(3, 63, 1222, 0, 0),
(3, 63, 1226, 0, 0),
(3, 67, 1227, 0, 0),
(3, 67, 1228, 0, 0),
(3, 67, 1229, 0, 0),
(3, 67, 1230, 0, 0),
(3, 67, 1231, 0, 0),
(3, 67, 1232, 0, 0),
(3, 67, 1233, 0, 0),
(3, 67, 1234, 0, 0),
(3, 67, 1235, 0, 0),
(3, 67, 1236, 0, 0),
(3, 67, 1237, 0, 0),
(3, 67, 1238, 0, 0),
(3, 67, 1239, 0, 0),
(3, 67, 1240, 0, 0),
(3, 67, 1241, 0, 0),
(3, 67, 1242, 0, 0),
(3, 67, 1243, 0, 0),
(3, 68, 1244, 0, 0),
(3, 68, 1245, 0, 0),
(3, 68, 1246, 0, 0),
(3, 68, 1247, 0, 0),
(3, 68, 1248, 0, 0),
(3, 68, 1249, 0, 0),
(3, 68, 1250, 0, 0),
(3, 26, 1251, 0, 0),
(3, 70, 1255, 0, 0),
(3, 70, 1256, 0, 0),
(3, 70, 1257, 0, 0),
(3, 70, 1258, 0, 0),
(3, 70, 1259, 0, 0),
(3, 70, 1260, 0, 0),
(3, 70, 1261, 0, 0),
(3, 26, 1262, 0, 0),
(3, 71, 1263, 0, 0),
(3, 71, 1264, 0, 0),
(3, 71, 1265, 0, 0),
(3, 71, 1266, 0, 0),
(3, 71, 1267, 0, 0),
(3, 71, 1268, 0, 0),
(3, 71, 1269, 0, 0),
(3, 26, 1270, 0, 0),
(3, 72, 1271, 0, 0),
(3, 72, 1272, 0, 0),
(3, 72, 1273, 0, 0),
(3, 72, 1274, 0, 0),
(3, 72, 1275, 0, 0),
(3, 72, 1276, 0, 0),
(3, 72, 1277, 0, 0),
(3, 72, 1279, 0, 0),
(3, 72, 1281, 0, 0),
(3, 72, 1285, 0, 0),
(3, 72, 1287, 0, 0),
(4, 6, 1, 0, 0),
(4, 6, 2, 0, 0),
(4, 6, 3, 0, 0),
(4, 6, 4, 0, 0),
(4, 6, 5, 0, 0),
(4, 6, 6, 0, 0),
(4, 6, 7, 0, 0),
(4, 6, 8, 0, 0),
(4, 6, 9, 0, 0),
(4, 6, 10, 0, 0),
(4, 6, 11, 0, 0),
(4, 6, 12, 0, 0),
(4, 6, 13, 0, 0),
(4, 6, 14, 0, 0),
(4, 6, 15, 0, 0),
(4, 6, 16, 0, 0),
(4, 6, 17, 0, 0),
(4, 6, 18, 0, 0),
(4, 6, 19, 0, 0),
(4, 6, 20, 0, 0),
(4, 6, 21, 0, 0),
(4, 6, 22, 0, 0),
(4, 6, 23, 0, 0),
(4, 6, 24, 0, 0),
(4, 6, 25, 0, 0),
(4, 6, 26, 0, 0),
(4, 6, 27, 0, 0),
(4, 6, 28, 0, 0),
(4, 6, 29, 0, 0),
(4, 6, 30, 0, 0),
(4, 6, 31, 0, 0),
(4, 6, 32, 0, 0),
(4, 6, 33, 0, 0),
(4, 6, 34, 0, 0),
(4, 6, 35, 0, 0),
(4, 6, 36, 0, 0),
(4, 7, 37, 0, 0),
(4, 7, 38, 0, 0),
(4, 7, 39, 0, 0),
(4, 7, 40, 0, 0),
(4, 7, 41, 0, 0),
(4, 7, 42, 0, 0),
(4, 7, 43, 0, 0),
(4, 7, 44, 0, 0),
(4, 7, 45, 0, 0),
(4, 7, 46, 0, 0),
(4, 7, 47, 0, 0),
(4, 7, 48, 0, 0),
(4, 7, 49, 0, 0),
(4, 7, 50, 0, 0),
(4, 7, 51, 0, 0),
(4, 7, 52, 0, 0),
(4, 7, 53, 0, 0),
(4, 7, 54, 0, 0),
(4, 7, 55, 0, 0),
(4, 7, 56, 0, 0),
(4, 7, 57, 0, 0),
(4, 7, 58, 0, 0),
(4, 7, 59, 0, 0),
(4, 7, 60, 0, 0),
(4, 7, 61, 0, 0),
(4, 7, 62, 0, 0),
(4, 7, 63, 0, 0),
(4, 7, 64, 0, 0),
(4, 7, 65, 0, 0),
(4, 4, 66, 0, 0),
(4, 4, 67, 0, 0),
(4, 4, 68, 0, 0),
(4, 4, 69, 0, 0),
(4, 4, 70, 0, 0),
(4, 4, 71, 0, 0),
(4, 4, 72, 0, 0),
(4, 4, 73, 0, 0),
(4, 4, 74, 0, 0),
(4, 4, 75, 0, 0),
(4, 4, 76, 0, 0),
(4, 4, 77, 0, 0),
(4, 4, 78, 0, 0),
(4, 4, 79, 0, 0),
(4, 4, 80, 0, 0),
(4, 4, 81, 0, 0),
(4, 4, 82, 0, 0),
(4, 4, 83, 0, 0),
(4, 4, 84, 0, 0),
(4, 4, 85, 0, 0),
(4, 4, 86, 0, 0),
(4, 4, 87, 0, 0),
(4, 4, 88, 0, 0),
(4, 4, 89, 0, 0),
(4, 4, 90, 0, 0),
(4, 4, 91, 0, 0),
(4, 4, 92, 0, 0),
(4, 4, 93, 0, 0),
(4, 4, 94, 0, 0),
(4, 4, 95, 0, 0),
(4, 4, 96, 0, 0),
(4, 4, 97, 0, 0),
(4, 4, 98, 0, 0),
(4, 4, 99, 0, 0),
(4, 4, 100, 0, 0),
(4, 4, 101, 0, 0),
(4, 4, 102, 0, 0),
(4, 4, 103, 0, 0),
(4, 4, 104, 0, 0),
(4, 4, 105, 0, 0),
(4, 4, 106, 0, 0),
(4, 4, 107, 0, 0),
(4, 4, 108, 0, 0),
(4, 4, 109, 0, 0),
(4, 2, 110, 0, 0),
(4, 2, 111, 0, 0),
(4, 2, 112, 0, 0),
(4, 2, 113, 0, 0),
(4, 2, 114, 0, 0),
(4, 2, 115, 0, 0),
(4, 2, 116, 0, 0),
(4, 2, 117, 0, 0),
(4, 2, 118, 0, 0),
(4, 2, 119, 0, 0),
(4, 2, 120, 0, 0),
(4, 2, 121, 0, 0),
(4, 2, 122, 0, 0),
(4, 2, 123, 0, 0),
(4, 2, 124, 0, 0),
(4, 2, 125, 0, 0),
(4, 26, 126, 0, 0),
(4, 26, 127, 0, 0),
(4, 26, 128, 0, 0),
(4, 26, 129, 0, 0),
(4, 26, 130, 0, 0),
(4, 26, 131, 0, 0),
(4, 26, 132, 0, 0),
(4, 26, 133, 0, 0),
(4, 26, 134, 0, 0),
(4, 26, 135, 0, 0),
(4, 26, 136, 0, 0),
(4, 26, 137, 0, 0),
(4, 26, 138, 0, 0),
(4, 26, 139, 0, 0),
(4, 26, 140, 0, 0),
(4, 26, 141, 0, 0),
(4, 26, 142, 0, 0),
(4, 26, 143, 0, 0),
(4, 26, 144, 0, 0),
(4, 26, 145, 0, 0),
(4, 26, 146, 0, 0),
(4, 26, 147, 0, 0),
(4, 26, 148, 0, 0),
(4, 26, 149, 0, 0),
(4, 26, 150, 0, 0),
(4, 4, 151, 0, 0),
(4, 6, 152, 0, 0),
(4, 7, 153, 0, 0),
(4, 26, 154, 0, 0),
(4, 13, 155, 0, 0),
(4, 13, 156, 0, 0),
(4, 13, 157, 0, 0),
(4, 13, 158, 0, 0),
(4, 13, 159, 0, 0),
(4, 13, 160, 0, 0),
(4, 13, 161, 0, 0),
(4, 13, 162, 0, 0),
(4, 13, 163, 0, 0),
(4, 13, 164, 0, 0),
(4, 13, 165, 0, 0),
(4, 13, 166, 0, 0),
(4, 13, 167, 0, 0),
(4, 13, 168, 0, 0),
(4, 13, 169, 0, 0),
(4, 13, 170, 0, 0),
(4, 13, 171, 0, 0),
(4, 13, 172, 0, 0),
(4, 13, 173, 0, 0),
(4, 14, 174, 0, 0),
(4, 14, 175, 0, 0),
(4, 14, 176, 0, 0),
(4, 14, 177, 0, 0),
(4, 14, 178, 0, 0),
(4, 14, 179, 0, 0),
(4, 14, 180, 0, 0),
(4, 14, 181, 0, 0),
(4, 14, 182, 0, 0),
(4, 14, 183, 0, 0),
(4, 14, 184, 0, 0),
(4, 14, 185, 0, 0),
(4, 14, 186, 0, 0),
(4, 14, 187, 0, 0),
(4, 14, 188, 0, 0),
(4, 14, 189, 0, 0),
(4, 14, 190, 0, 0),
(4, 14, 191, 0, 0),
(4, 14, 192, 0, 0),
(4, 14, 193, 0, 0),
(4, 14, 194, 0, 0),
(4, 14, 195, 0, 0),
(4, 14, 196, 0, 0),
(4, 14, 197, 0, 0),
(4, 14, 198, 0, 0),
(4, 14, 199, 0, 0),
(4, 14, 200, 0, 0),
(4, 14, 201, 0, 0),
(4, 14, 202, 0, 0),
(4, 14, 203, 0, 0),
(4, 14, 204, 0, 0),
(4, 8, 205, 0, 0),
(4, 8, 206, 0, 0),
(4, 8, 207, 0, 0),
(4, 8, 208, 0, 0),
(4, 8, 209, 0, 0),
(4, 8, 210, 0, 0),
(4, 8, 211, 0, 0),
(4, 8, 212, 0, 0),
(4, 8, 213, 0, 0),
(4, 8, 214, 0, 0),
(4, 8, 215, 0, 0),
(4, 8, 216, 0, 0),
(4, 8, 217, 0, 0),
(4, 8, 218, 0, 0),
(4, 8, 219, 0, 0),
(4, 10, 220, 0, 0),
(4, 10, 221, 0, 0),
(4, 10, 222, 0, 0),
(4, 10, 223, 0, 0),
(4, 10, 224, 0, 0),
(4, 10, 225, 0, 0),
(4, 10, 226, 0, 0),
(4, 10, 227, 0, 0),
(4, 10, 228, 0, 0),
(4, 10, 229, 0, 0),
(4, 10, 230, 0, 0),
(4, 10, 231, 0, 0),
(4, 9, 232, 0, 0),
(4, 9, 233, 0, 0),
(4, 9, 234, 0, 0),
(4, 9, 235, 0, 0),
(4, 9, 236, 0, 0),
(4, 9, 237, 0, 0),
(4, 9, 238, 0, 0),
(4, 9, 239, 0, 0),
(4, 9, 240, 0, 0),
(4, 9, 241, 0, 0),
(4, 9, 242, 0, 0),
(4, 9, 243, 0, 0),
(4, 9, 244, 0, 0),
(4, 9, 245, 0, 0),
(4, 9, 246, 0, 0),
(4, 9, 247, 0, 0),
(4, 9, 248, 0, 0),
(4, 9, 249, 0, 0),
(4, 9, 250, 0, 0),
(4, 9, 251, 0, 0),
(4, 9, 252, 0, 0),
(4, 9, 253, 0, 0),
(4, 9, 254, 0, 0),
(4, 9, 255, 0, 0),
(4, 16, 256, 0, 0),
(4, 16, 257, 0, 0),
(4, 16, 258, 0, 0),
(4, 16, 259, 0, 0),
(4, 16, 260, 0, 0),
(4, 16, 261, 0, 0),
(4, 16, 262, 0, 0),
(4, 16, 263, 0, 0),
(4, 16, 264, 0, 0),
(4, 16, 265, 0, 0),
(4, 16, 266, 0, 0),
(4, 16, 267, 0, 0),
(4, 16, 268, 0, 0),
(4, 16, 269, 0, 0),
(4, 16, 270, 0, 0),
(4, 16, 271, 0, 0),
(4, 16, 272, 0, 0),
(4, 16, 273, 0, 0),
(4, 16, 274, 0, 0),
(4, 16, 275, 0, 0),
(4, 16, 276, 0, 0),
(4, 16, 277, 0, 0),
(4, 16, 278, 0, 0),
(4, 15, 279, 0, 0),
(4, 15, 280, 0, 0),
(4, 15, 281, 0, 0),
(4, 15, 282, 0, 0),
(4, 15, 283, 0, 0),
(4, 15, 284, 0, 0),
(4, 15, 285, 0, 0),
(4, 15, 286, 0, 0),
(4, 15, 287, 0, 0),
(4, 15, 288, 0, 0),
(4, 18, 289, 0, 0),
(4, 18, 290, 0, 0),
(4, 18, 291, 0, 0),
(4, 18, 292, 0, 0),
(4, 18, 293, 0, 0),
(4, 18, 294, 0, 0),
(4, 18, 295, 0, 0),
(4, 18, 296, 0, 0),
(4, 18, 297, 0, 0),
(4, 18, 298, 0, 0),
(4, 18, 299, 0, 0),
(4, 18, 300, 0, 0),
(4, 18, 301, 0, 0),
(4, 18, 302, 0, 0),
(4, 18, 303, 0, 0),
(4, 18, 304, 0, 0),
(4, 18, 305, 0, 0),
(4, 19, 306, 0, 0),
(4, 19, 307, 0, 0),
(4, 19, 308, 0, 0),
(4, 19, 309, 0, 0),
(4, 19, 310, 0, 0),
(4, 19, 311, 0, 0),
(4, 19, 312, 0, 0),
(4, 19, 313, 0, 0),
(4, 20, 314, 0, 0),
(4, 20, 315, 0, 0),
(4, 20, 316, 0, 0),
(4, 20, 317, 0, 0),
(4, 20, 318, 0, 0),
(4, 20, 319, 0, 0),
(4, 20, 320, 0, 0),
(4, 20, 321, 0, 0),
(4, 20, 322, 0, 0),
(4, 20, 323, 0, 0),
(4, 20, 324, 0, 0),
(4, 20, 325, 0, 0),
(4, 20, 326, 0, 0),
(4, 20, 327, 0, 0),
(4, 20, 328, 0, 0),
(4, 20, 329, 0, 0),
(4, 20, 330, 0, 0),
(4, 20, 331, 0, 0),
(4, 20, 332, 0, 0),
(4, 20, 333, 0, 0),
(4, 20, 334, 0, 0),
(4, 20, 335, 0, 0),
(4, 20, 336, 0, 0),
(4, 20, 337, 0, 0),
(4, 20, 338, 0, 0),
(4, 20, 339, 0, 0),
(4, 20, 340, 0, 0),
(4, 20, 341, 0, 0),
(4, 20, 342, 0, 0),
(4, 20, 343, 0, 0),
(4, 20, 344, 0, 0),
(4, 20, 345, 0, 0),
(4, 20, 346, 0, 0),
(4, 20, 347, 0, 0),
(4, 20, 348, 0, 0),
(4, 20, 349, 0, 0),
(4, 20, 350, 0, 0),
(4, 21, 351, 0, 0),
(4, 21, 352, 0, 0),
(4, 21, 353, 0, 0),
(4, 21, 354, 0, 0),
(4, 21, 355, 0, 0),
(4, 21, 356, 0, 0),
(4, 21, 357, 0, 0),
(4, 21, 358, 0, 0),
(4, 21, 359, 0, 0),
(4, 21, 360, 0, 0),
(4, 21, 361, 0, 0),
(4, 21, 362, 0, 0),
(4, 21, 363, 0, 0),
(4, 21, 364, 0, 0),
(4, 21, 365, 0, 0),
(4, 21, 366, 0, 0),
(4, 21, 367, 0, 0),
(4, 21, 368, 0, 0),
(4, 21, 369, 0, 0),
(4, 21, 370, 0, 0),
(4, 21, 371, 0, 0),
(4, 21, 372, 0, 0),
(4, 21, 373, 0, 0),
(4, 21, 374, 0, 0),
(4, 21, 375, 0, 0),
(4, 21, 376, 0, 0),
(4, 21, 377, 0, 0),
(4, 21, 378, 0, 0),
(4, 21, 379, 0, 0),
(4, 21, 380, 0, 0),
(4, 21, 381, 0, 0),
(4, 21, 382, 0, 0),
(4, 21, 383, 0, 0),
(4, 21, 384, 0, 0),
(4, 21, 385, 0, 0),
(4, 21, 386, 0, 0),
(4, 21, 387, 0, 0),
(4, 21, 388, 0, 0),
(4, 22, 389, 0, 0),
(4, 22, 390, 0, 0),
(4, 22, 391, 0, 0),
(4, 22, 392, 0, 0),
(4, 22, 393, 0, 0),
(4, 22, 394, 0, 0),
(4, 22, 395, 0, 0),
(4, 22, 396, 0, 0),
(4, 22, 397, 0, 0),
(4, 22, 398, 0, 0),
(4, 22, 399, 0, 0),
(4, 22, 400, 0, 0),
(4, 22, 401, 0, 0),
(4, 22, 402, 0, 0),
(4, 22, 403, 0, 0),
(4, 22, 404, 0, 0),
(4, 22, 405, 0, 0),
(4, 22, 406, 0, 0),
(4, 22, 407, 0, 0),
(4, 22, 408, 0, 0),
(4, 22, 409, 0, 0),
(4, 22, 410, 0, 0),
(4, 22, 411, 0, 0),
(4, 22, 412, 0, 0),
(4, 22, 413, 0, 0),
(4, 22, 414, 0, 0),
(4, 22, 415, 0, 0),
(4, 22, 416, 0, 0),
(4, 22, 417, 0, 0),
(4, 22, 418, 0, 0),
(4, 22, 419, 0, 0),
(4, 22, 420, 0, 0),
(4, 22, 421, 0, 0),
(4, 22, 422, 0, 0),
(4, 22, 423, 0, 0),
(4, 22, 424, 0, 0),
(4, 22, 425, 0, 0),
(4, 22, 426, 0, 0),
(4, 22, 427, 0, 0),
(4, 22, 428, 0, 0),
(4, 22, 429, 0, 0),
(4, 22, 430, 0, 0),
(4, 22, 431, 0, 0),
(4, 22, 432, 0, 0),
(4, 22, 433, 0, 0),
(4, 22, 434, 0, 0),
(4, 22, 435, 0, 0),
(4, 23, 436, 0, 0),
(4, 23, 437, 0, 0),
(4, 23, 438, 0, 0),
(4, 23, 439, 0, 0),
(4, 23, 440, 0, 0),
(4, 23, 441, 0, 0),
(4, 23, 442, 0, 0),
(4, 23, 443, 0, 0),
(4, 23, 444, 0, 0),
(4, 23, 445, 0, 0),
(4, 23, 446, 0, 0),
(4, 23, 447, 0, 0),
(4, 23, 448, 0, 0),
(4, 23, 449, 0, 0),
(4, 23, 450, 0, 0),
(4, 23, 451, 0, 0),
(4, 23, 452, 0, 0),
(4, 23, 453, 0, 0),
(4, 23, 454, 0, 0),
(4, 23, 455, 0, 0),
(4, 23, 456, 0, 0),
(4, 23, 457, 0, 0),
(4, 23, 458, 0, 0),
(4, 23, 459, 0, 0),
(4, 23, 460, 0, 0),
(4, 23, 461, 0, 0),
(4, 23, 462, 0, 0),
(4, 23, 463, 0, 0),
(4, 23, 464, 0, 0),
(4, 23, 465, 0, 0),
(4, 23, 466, 0, 0),
(4, 23, 467, 0, 0),
(4, 23, 468, 0, 0),
(4, 23, 469, 0, 0),
(4, 23, 470, 0, 0),
(4, 23, 471, 0, 0),
(4, 23, 472, 0, 0),
(4, 23, 473, 0, 0),
(4, 23, 474, 0, 0),
(4, 29, 475, 0, 0),
(4, 29, 479, 0, 0),
(4, 29, 480, 0, 0),
(4, 29, 482, 0, 0),
(4, 29, 489, 0, 0),
(4, 29, 490, 0, 0),
(4, 29, 491, 0, 0),
(4, 29, 492, 0, 0),
(4, 29, 493, 0, 0),
(4, 29, 495, 0, 0),
(4, 29, 496, 0, 0),
(4, 29, 497, 0, 0),
(4, 29, 498, 0, 0),
(4, 29, 499, 0, 0),
(4, 29, 504, 0, 0),
(4, 29, 505, 0, 0),
(4, 29, 506, 0, 0),
(4, 29, 507, 0, 0),
(4, 29, 515, 0, 0),
(4, 10, 520, 0, 0),
(4, 10, 521, 0, 0),
(4, 10, 522, 0, 0),
(4, 10, 523, 0, 0),
(4, 10, 524, 0, 0),
(4, 10, 525, 0, 0),
(4, 34, 526, 0, 0),
(4, 34, 527, 0, 0),
(4, 34, 528, 0, 0),
(4, 34, 529, 0, 0),
(4, 34, 530, 0, 0),
(4, 34, 531, 0, 0),
(4, 34, 532, 0, 0),
(4, 34, 533, 0, 0),
(4, 34, 534, 0, 0),
(4, 34, 535, 0, 0),
(4, 34, 536, 0, 0),
(4, 34, 537, 0, 0),
(4, 34, 538, 0, 0),
(4, 34, 539, 0, 0),
(4, 34, 540, 0, 0),
(4, 34, 541, 0, 0),
(4, 34, 542, 0, 0),
(4, 29, 543, 0, 0),
(4, 35, 544, 0, 0),
(4, 35, 545, 0, 0),
(4, 35, 546, 0, 0),
(4, 35, 547, 0, 0),
(4, 35, 548, 0, 0),
(4, 35, 549, 0, 0),
(4, 35, 550, 0, 0),
(4, 35, 551, 0, 0),
(4, 35, 552, 0, 0),
(4, 35, 553, 0, 0),
(4, 35, 554, 0, 0),
(4, 35, 555, 0, 0),
(4, 35, 556, 0, 0),
(4, 35, 557, 0, 0),
(4, 35, 558, 0, 0),
(4, 35, 559, 0, 0),
(4, 35, 560, 0, 0),
(4, 35, 561, 0, 0),
(4, 35, 562, 0, 0),
(4, 35, 563, 0, 0),
(4, 35, 564, 0, 0),
(4, 35, 565, 0, 0),
(4, 36, 566, 0, 0),
(4, 36, 567, 0, 0),
(4, 36, 568, 0, 0),
(4, 36, 569, 0, 0),
(4, 36, 570, 0, 0),
(4, 36, 571, 0, 0),
(4, 36, 572, 0, 0),
(4, 36, 573, 0, 0),
(4, 36, 574, 0, 0),
(4, 36, 575, 0, 0),
(4, 36, 576, 0, 0),
(4, 36, 577, 0, 0),
(4, 36, 578, 0, 0),
(4, 36, 579, 0, 0),
(4, 36, 580, 0, 0),
(4, 36, 581, 0, 0),
(4, 36, 582, 0, 0),
(4, 36, 583, 0, 0),
(4, 36, 584, 0, 0),
(4, 36, 585, 0, 0),
(4, 36, 586, 0, 0),
(4, 36, 587, 0, 0),
(4, 38, 588, 0, 0),
(4, 38, 589, 0, 0),
(4, 38, 590, 0, 0),
(4, 38, 591, 0, 0),
(4, 38, 592, 0, 0),
(4, 38, 593, 0, 0),
(4, 38, 594, 0, 0),
(4, 38, 595, 0, 0),
(4, 38, 596, 0, 0),
(4, 38, 597, 0, 0),
(4, 38, 598, 0, 0),
(4, 38, 599, 0, 0),
(4, 38, 600, 0, 0),
(4, 38, 601, 0, 0),
(4, 38, 602, 0, 0),
(4, 38, 603, 0, 0),
(4, 38, 604, 0, 0),
(4, 38, 605, 0, 0),
(4, 38, 606, 0, 0),
(4, 38, 607, 0, 0),
(4, 38, 608, 0, 0),
(4, 42, 609, 0, 0),
(4, 42, 610, 0, 0),
(4, 42, 611, 0, 0),
(4, 42, 612, 0, 0),
(4, 42, 613, 0, 0),
(4, 42, 614, 0, 0),
(4, 42, 615, 0, 0),
(4, 42, 616, 0, 0),
(4, 43, 617, 0, 0),
(4, 43, 618, 0, 0),
(4, 43, 619, 0, 0),
(4, 43, 620, 0, 0),
(4, 43, 621, 0, 0),
(4, 43, 622, 0, 0),
(4, 43, 623, 0, 0),
(4, 43, 624, 0, 0),
(4, 43, 625, 0, 0),
(4, 43, 626, 0, 0),
(4, 43, 627, 0, 0),
(4, 43, 628, 0, 0),
(4, 43, 629, 0, 0),
(4, 44, 630, 0, 0),
(4, 44, 631, 0, 0),
(4, 44, 632, 0, 0),
(4, 44, 633, 0, 0),
(4, 44, 634, 0, 0),
(4, 44, 635, 0, 0),
(4, 44, 636, 0, 0),
(4, 44, 637, 0, 0),
(4, 44, 638, 0, 0),
(4, 44, 639, 0, 0),
(4, 44, 640, 0, 0),
(4, 44, 641, 0, 0),
(4, 44, 642, 0, 0),
(4, 44, 643, 0, 0),
(4, 44, 644, 0, 0),
(4, 44, 645, 0, 0),
(4, 44, 646, 0, 0),
(4, 44, 647, 0, 0),
(4, 45, 648, 0, 0),
(4, 45, 649, 0, 0),
(4, 45, 650, 0, 0),
(4, 45, 651, 0, 0),
(4, 45, 652, 0, 0),
(4, 45, 653, 0, 0),
(4, 45, 654, 0, 0),
(4, 45, 655, 0, 0),
(4, 45, 656, 0, 0),
(4, 45, 657, 0, 0),
(4, 45, 658, 0, 0),
(4, 45, 659, 0, 0),
(4, 45, 660, 0, 0),
(4, 45, 661, 0, 0),
(4, 45, 662, 0, 0),
(4, 45, 663, 0, 0),
(4, 45, 664, 0, 0),
(4, 45, 665, 0, 0),
(4, 45, 666, 0, 0),
(4, 45, 667, 0, 0),
(4, 47, 668, 0, 0),
(4, 47, 669, 0, 0),
(4, 47, 670, 0, 0),
(4, 47, 671, 0, 0),
(4, 47, 672, 0, 0),
(4, 47, 673, 0, 0),
(4, 2, 674, 0, 0),
(4, 29, 675, 0, 0),
(4, 23, 676, 0, 0),
(4, 23, 677, 0, 0),
(4, 23, 678, 0, 0),
(4, 23, 679, 0, 0),
(4, 23, 680, 0, 0),
(4, 23, 681, 0, 0),
(4, 23, 682, 0, 0),
(4, 23, 683, 0, 0),
(4, 23, 684, 0, 0),
(4, 22, 685, 0, 0),
(4, 22, 686, 0, 0),
(4, 22, 687, 0, 0),
(4, 22, 688, 0, 0),
(4, 22, 689, 0, 0),
(4, 22, 690, 0, 0),
(4, 22, 691, 0, 0),
(4, 22, 692, 0, 0),
(4, 22, 693, 0, 0),
(4, 21, 694, 0, 0),
(4, 21, 695, 0, 0),
(4, 21, 696, 0, 0),
(4, 21, 697, 0, 0),
(4, 21, 698, 0, 0),
(4, 21, 699, 0, 0),
(4, 21, 700, 0, 0),
(4, 21, 701, 0, 0),
(4, 21, 702, 0, 0),
(4, 20, 703, 0, 0),
(4, 20, 704, 0, 0),
(4, 20, 705, 0, 0),
(4, 20, 706, 0, 0),
(4, 20, 707, 0, 0),
(4, 20, 708, 0, 0),
(4, 20, 709, 0, 0),
(4, 20, 710, 0, 0),
(4, 20, 711, 0, 0),
(4, 29, 712, 0, 0),
(4, 44, 713, 0, 0),
(4, 42, 714, 0, 0),
(4, 29, 715, 0, 0),
(4, 29, 716, 0, 0),
(4, 29, 717, 0, 0),
(4, 23, 718, 0, 0),
(4, 22, 719, 0, 0),
(4, 21, 720, 0, 0),
(4, 20, 721, 0, 0),
(4, 29, 722, 0, 0),
(4, 6, 723, 0, 0),
(4, 4, 724, 0, 0),
(4, 2, 725, 0, 0),
(4, 29, 726, 0, 0),
(4, 23, 727, 0, 0),
(4, 23, 728, 0, 0),
(4, 21, 729, 0, 0),
(4, 21, 730, 0, 0),
(4, 18, 731, 0, 0),
(4, 7, 732, 0, 0),
(4, 42, 733, 0, 0),
(4, 42, 734, 0, 0),
(4, 23, 735, 0, 0),
(4, 20, 736, 0, 0),
(4, 21, 737, 0, 0),
(4, 22, 738, 0, 0),
(4, 29, 739, 0, 0),
(4, 2, 740, 0, 0),
(4, 13, 741, 0, 0),
(4, 29, 742, 0, 0),
(4, 29, 743, 0, 0),
(4, 29, 744, 0, 0),
(4, 29, 745, 0, 0),
(4, 14, 772, 0, 0),
(4, 36, 773, 0, 0),
(4, 23, 774, 0, 0),
(4, 29, 775, 0, 0),
(4, 23, 776, 0, 0),
(4, 23, 777, 0, 0),
(4, 23, 778, 0, 0),
(4, 20, 779, 0, 0),
(4, 20, 780, 0, 0),
(4, 20, 781, 0, 0),
(4, 21, 782, 0, 0),
(4, 22, 783, 0, 0),
(4, 22, 784, 0, 0),
(4, 22, 785, 0, 0),
(4, 42, 786, 0, 0),
(4, 42, 787, 0, 0),
(4, 42, 788, 0, 0),
(4, 2, 789, 0, 0),
(4, 4, 790, 0, 0),
(4, 6, 791, 0, 0),
(4, 7, 792, 0, 0),
(4, 8, 793, 0, 0),
(4, 9, 794, 0, 0),
(4, 10, 795, 0, 0),
(4, 13, 796, 0, 0),
(4, 14, 797, 0, 0),
(4, 15, 798, 0, 0),
(4, 16, 799, 0, 0),
(4, 18, 800, 0, 0),
(4, 19, 801, 0, 0),
(4, 20, 802, 0, 0),
(4, 21, 803, 0, 0),
(4, 22, 804, 0, 0),
(4, 23, 805, 0, 0),
(4, 26, 806, 0, 0),
(4, 10, 807, 0, 0),
(4, 2, 808, 0, 0),
(4, 4, 809, 0, 0),
(4, 6, 810, 0, 0),
(4, 7, 811, 0, 0),
(4, 8, 812, 0, 0),
(4, 9, 813, 0, 0),
(4, 10, 814, 0, 0),
(4, 13, 815, 0, 0),
(4, 14, 816, 0, 0),
(4, 15, 817, 0, 0),
(4, 16, 818, 0, 0),
(4, 18, 819, 0, 0),
(4, 19, 820, 0, 0),
(4, 20, 821, 0, 0),
(4, 21, 822, 0, 0),
(4, 22, 823, 0, 0),
(4, 23, 824, 0, 0),
(4, 26, 825, 0, 0),
(4, 2, 826, 0, 0),
(4, 4, 827, 0, 0),
(4, 6, 828, 0, 0),
(4, 7, 829, 0, 0),
(4, 8, 830, 0, 0),
(4, 9, 831, 0, 0),
(4, 10, 832, 0, 0),
(4, 13, 833, 0, 0),
(4, 14, 834, 0, 0),
(4, 15, 835, 0, 0),
(4, 16, 836, 0, 0),
(4, 18, 837, 0, 0),
(4, 19, 838, 0, 0),
(4, 20, 839, 0, 0),
(4, 21, 840, 0, 0),
(4, 22, 841, 0, 0),
(4, 23, 842, 0, 0),
(4, 26, 843, 0, 0),
(4, 20, 844, 0, 0),
(4, 21, 845, 0, 0),
(4, 22, 846, 0, 0),
(4, 23, 847, 0, 0),
(4, 45, 848, 0, 0),
(4, 45, 849, 0, 0),
(4, 50, 850, 0, 0),
(4, 50, 851, 0, 0),
(4, 50, 852, 0, 0),
(4, 50, 853, 0, 0),
(4, 50, 854, 0, 0),
(4, 50, 855, 0, 0),
(4, 50, 856, 0, 0),
(4, 51, 857, 0, 0),
(4, 51, 858, 0, 0),
(4, 51, 859, 0, 0),
(4, 51, 860, 0, 0),
(4, 51, 861, 0, 0),
(4, 51, 862, 0, 0),
(4, 51, 863, 0, 0),
(4, 52, 864, 0, 0),
(4, 52, 865, 0, 0),
(4, 52, 866, 0, 0),
(4, 52, 867, 0, 0),
(4, 52, 868, 0, 0),
(4, 52, 869, 0, 0),
(4, 53, 870, 0, 0),
(4, 53, 871, 0, 0),
(4, 53, 872, 0, 0),
(4, 53, 873, 0, 0),
(4, 53, 874, 0, 0),
(4, 53, 875, 0, 0),
(4, 53, 876, 0, 0),
(4, 54, 877, 0, 0),
(4, 54, 878, 0, 0),
(4, 54, 879, 0, 0),
(4, 54, 880, 0, 0),
(4, 54, 881, 0, 0),
(4, 54, 882, 0, 0),
(4, 54, 883, 0, 0),
(4, 54, 884, 0, 0),
(4, 54, 885, 0, 0),
(4, 54, 886, 0, 0),
(4, 54, 887, 0, 0),
(4, 54, 888, 0, 0),
(4, 54, 889, 0, 0),
(4, 54, 890, 0, 0),
(4, 55, 891, 0, 0),
(4, 55, 892, 0, 0),
(4, 55, 893, 0, 0),
(4, 55, 894, 0, 0),
(4, 55, 895, 0, 0),
(4, 55, 896, 0, 0),
(4, 55, 897, 0, 0),
(4, 55, 898, 0, 0),
(4, 55, 899, 0, 0),
(4, 55, 900, 0, 0),
(4, 55, 901, 0, 0),
(4, 55, 902, 0, 0),
(4, 56, 903, 0, 0),
(4, 56, 904, 0, 0),
(4, 56, 905, 0, 0),
(4, 56, 906, 0, 0),
(4, 56, 907, 0, 0),
(4, 56, 908, 0, 0),
(4, 56, 909, 0, 0),
(4, 56, 910, 0, 0),
(4, 56, 911, 0, 0),
(4, 56, 912, 0, 0),
(4, 56, 913, 0, 0),
(4, 56, 914, 0, 0),
(4, 57, 915, 0, 0),
(4, 57, 916, 0, 0),
(4, 57, 917, 0, 0),
(4, 57, 918, 0, 0),
(4, 57, 919, 0, 0),
(4, 57, 920, 0, 0),
(4, 57, 921, 0, 0),
(4, 57, 922, 0, 0),
(4, 57, 923, 0, 0),
(4, 57, 924, 0, 0),
(4, 57, 925, 0, 0),
(4, 57, 926, 0, 0),
(4, 57, 927, 0, 0),
(4, 57, 928, 0, 0),
(4, 57, 929, 0, 0),
(4, 58, 930, 0, 0),
(4, 58, 931, 0, 0),
(4, 58, 932, 0, 0),
(4, 58, 933, 0, 0),
(4, 58, 934, 0, 0),
(4, 58, 935, 0, 0),
(4, 58, 936, 0, 0),
(4, 58, 937, 0, 0),
(4, 58, 938, 0, 0),
(4, 58, 939, 0, 0),
(4, 58, 940, 0, 0),
(4, 58, 941, 0, 0),
(4, 58, 942, 0, 0),
(4, 58, 943, 0, 0),
(4, 58, 944, 0, 0),
(4, 58, 945, 0, 0),
(4, 58, 946, 0, 0),
(4, 58, 947, 0, 0),
(4, 58, 948, 0, 0),
(4, 58, 949, 0, 0),
(4, 58, 950, 0, 0),
(4, 58, 951, 0, 0),
(4, 59, 952, 0, 0),
(4, 59, 953, 0, 0),
(4, 59, 954, 0, 0),
(4, 59, 955, 0, 0),
(4, 59, 956, 0, 0),
(4, 59, 957, 0, 0),
(4, 59, 958, 0, 0),
(4, 59, 959, 0, 0),
(4, 59, 960, 0, 0),
(4, 59, 961, 0, 0),
(4, 59, 962, 0, 0),
(4, 59, 963, 0, 0),
(4, 59, 964, 0, 0),
(4, 59, 965, 0, 0),
(4, 59, 966, 0, 0),
(4, 59, 967, 0, 0),
(4, 59, 968, 0, 0),
(4, 59, 969, 0, 0),
(4, 59, 970, 0, 0),
(4, 59, 971, 0, 0),
(4, 59, 972, 0, 0),
(4, 59, 973, 0, 0),
(4, 59, 974, 0, 0),
(4, 59, 975, 0, 0),
(4, 59, 976, 0, 0),
(4, 59, 977, 0, 0),
(4, 59, 978, 0, 0),
(4, 59, 979, 0, 0),
(4, 59, 980, 0, 0),
(4, 59, 981, 0, 0),
(4, 60, 982, 0, 0),
(4, 60, 983, 0, 0),
(4, 60, 984, 0, 0),
(4, 60, 985, 0, 0),
(4, 60, 986, 0, 0),
(4, 60, 987, 0, 0),
(4, 60, 988, 0, 0),
(4, 60, 989, 0, 0),
(4, 60, 990, 0, 0),
(4, 60, 991, 0, 0),
(4, 60, 992, 0, 0),
(4, 60, 993, 0, 0),
(4, 60, 994, 0, 0),
(4, 60, 995, 0, 0),
(4, 61, 996, 0, 0),
(4, 61, 997, 0, 0),
(4, 61, 998, 0, 0),
(4, 61, 999, 0, 0),
(4, 61, 1000, 0, 0),
(4, 61, 1001, 0, 0),
(4, 61, 1002, 0, 0),
(4, 61, 1003, 0, 0),
(4, 61, 1004, 0, 0),
(4, 61, 1005, 0, 0),
(4, 61, 1006, 0, 0),
(4, 61, 1007, 0, 0),
(4, 61, 1008, 0, 0),
(4, 61, 1009, 0, 0),
(4, 61, 1010, 0, 0),
(4, 61, 1011, 0, 0),
(4, 61, 1012, 0, 0),
(4, 61, 1013, 0, 0),
(4, 61, 1014, 0, 0),
(4, 61, 1015, 0, 0),
(4, 61, 1016, 0, 0),
(4, 61, 1017, 0, 0),
(4, 61, 1018, 0, 0),
(4, 61, 1019, 0, 0),
(4, 61, 1020, 0, 0),
(4, 61, 1021, 0, 0),
(4, 61, 1022, 0, 0),
(4, 61, 1023, 0, 0),
(4, 61, 1024, 0, 0),
(4, 62, 1025, 0, 0),
(4, 62, 1026, 0, 0),
(4, 62, 1027, 0, 0),
(4, 62, 1028, 0, 0),
(4, 62, 1029, 0, 0),
(4, 62, 1030, 0, 0),
(4, 62, 1031, 0, 0),
(4, 62, 1032, 0, 0),
(4, 62, 1033, 0, 0),
(4, 62, 1034, 0, 0),
(4, 62, 1035, 0, 0),
(4, 62, 1036, 0, 0),
(4, 62, 1037, 0, 0),
(4, 62, 1038, 0, 0),
(4, 62, 1039, 0, 0),
(4, 62, 1040, 0, 0),
(4, 62, 1041, 0, 0),
(4, 62, 1042, 0, 0),
(4, 62, 1043, 0, 0),
(4, 62, 1044, 0, 0),
(4, 62, 1045, 0, 0),
(4, 62, 1046, 0, 0),
(4, 62, 1047, 0, 0),
(4, 62, 1048, 0, 0),
(4, 62, 1049, 0, 0),
(4, 62, 1050, 0, 0),
(4, 62, 1051, 0, 0),
(4, 62, 1052, 0, 0),
(4, 62, 1053, 0, 0),
(4, 62, 1054, 0, 0),
(4, 63, 1055, 0, 0),
(4, 63, 1056, 0, 0),
(4, 63, 1057, 0, 0),
(4, 63, 1058, 0, 0),
(4, 62, 1059, 0, 0),
(4, 62, 1060, 0, 0),
(4, 62, 1061, 0, 0),
(4, 62, 1062, 0, 0),
(4, 62, 1063, 0, 0),
(4, 62, 1064, 0, 0),
(4, 62, 1065, 0, 0),
(4, 62, 1066, 0, 0),
(4, 62, 1067, 0, 0),
(4, 62, 1068, 0, 0),
(4, 62, 1071, 0, 0),
(4, 62, 1072, 0, 0),
(4, 62, 1073, 0, 0),
(4, 62, 1074, 0, 0),
(4, 62, 1075, 0, 0),
(4, 62, 1076, 0, 0),
(4, 62, 1078, 0, 0),
(4, 62, 1082, 0, 0),
(4, 62, 1084, 0, 0),
(4, 63, 1085, 0, 0),
(4, 63, 1086, 0, 0),
(4, 63, 1087, 0, 0),
(4, 63, 1088, 0, 0),
(4, 63, 1089, 0, 0),
(4, 63, 1090, 0, 0),
(4, 63, 1091, 0, 0),
(4, 63, 1092, 0, 0),
(4, 63, 1093, 0, 0),
(4, 63, 1094, 0, 0),
(4, 63, 1095, 0, 0),
(4, 63, 1096, 0, 0),
(4, 63, 1097, 0, 0),
(4, 63, 1098, 0, 0),
(4, 63, 1099, 0, 0),
(4, 63, 1100, 0, 0),
(4, 63, 1101, 0, 0),
(4, 63, 1102, 0, 0),
(4, 63, 1104, 0, 0),
(4, 63, 1106, 0, 0),
(4, 63, 1108, 0, 0),
(4, 63, 1110, 0, 0),
(4, 63, 1112, 0, 0),
(4, 63, 1114, 0, 0),
(4, 63, 1116, 0, 0),
(4, 63, 1120, 0, 0),
(4, 63, 1122, 0, 0),
(4, 63, 1124, 0, 0),
(4, 63, 1136, 0, 0),
(4, 63, 1138, 0, 0),
(4, 63, 1142, 0, 0),
(4, 63, 1144, 0, 0),
(4, 63, 1146, 0, 0),
(4, 63, 1148, 0, 0),
(4, 63, 1150, 0, 0),
(4, 63, 1152, 0, 0),
(4, 63, 1154, 0, 0),
(4, 63, 1156, 0, 0),
(4, 63, 1158, 0, 0),
(4, 63, 1160, 0, 0),
(4, 63, 1162, 0, 0),
(4, 64, 1163, 0, 0),
(4, 64, 1164, 0, 0),
(4, 64, 1165, 0, 0),
(4, 64, 1166, 0, 0),
(4, 64, 1167, 0, 0),
(4, 64, 1168, 0, 0),
(4, 64, 1169, 0, 0),
(4, 64, 1170, 0, 0),
(4, 64, 1171, 0, 0),
(4, 64, 1172, 0, 0),
(4, 64, 1173, 0, 0),
(4, 64, 1174, 0, 0),
(4, 64, 1175, 0, 0),
(4, 64, 1176, 0, 0),
(4, 64, 1177, 0, 0),
(4, 64, 1178, 0, 0),
(4, 64, 1179, 0, 0),
(4, 64, 1180, 0, 0),
(4, 64, 1182, 0, 0),
(4, 64, 1184, 0, 0),
(4, 64, 1186, 0, 0),
(4, 64, 1187, 0, 0),
(4, 64, 1188, 0, 0),
(4, 64, 1189, 0, 0),
(4, 64, 1190, 0, 0),
(4, 64, 1191, 0, 0),
(4, 64, 1192, 0, 0),
(4, 64, 1194, 0, 0),
(4, 64, 1196, 0, 0),
(4, 64, 1198, 0, 0),
(4, 64, 1200, 0, 0),
(4, 65, 1201, 0, 0),
(4, 65, 1202, 0, 0),
(4, 65, 1203, 0, 0),
(4, 65, 1204, 0, 0),
(4, 65, 1205, 0, 0),
(4, 65, 1206, 0, 0),
(4, 65, 1208, 0, 0),
(4, 66, 1209, 0, 0),
(4, 66, 1210, 0, 0),
(4, 66, 1211, 0, 0),
(4, 66, 1212, 0, 0),
(4, 66, 1213, 0, 0),
(4, 66, 1214, 0, 0),
(4, 66, 1216, 0, 0),
(4, 63, 1218, 0, 0),
(4, 63, 1220, 0, 0),
(4, 63, 1222, 0, 0),
(4, 63, 1226, 0, 0),
(4, 67, 1227, 0, 0),
(4, 67, 1228, 0, 0),
(4, 67, 1229, 0, 0),
(4, 67, 1230, 0, 0),
(4, 67, 1231, 0, 0),
(4, 67, 1232, 0, 0),
(4, 67, 1233, 0, 0),
(4, 67, 1234, 0, 0),
(4, 67, 1235, 0, 0),
(4, 67, 1236, 0, 0),
(4, 67, 1237, 0, 0),
(4, 67, 1238, 0, 0),
(4, 67, 1239, 0, 0),
(4, 67, 1240, 0, 0),
(4, 67, 1241, 0, 0),
(4, 67, 1242, 0, 0),
(4, 67, 1243, 0, 0),
(4, 68, 1244, 0, 0),
(4, 68, 1245, 0, 0),
(4, 68, 1246, 0, 0),
(4, 68, 1247, 0, 0),
(4, 68, 1248, 0, 0),
(4, 68, 1249, 0, 0),
(4, 68, 1250, 0, 0),
(4, 26, 1251, 0, 0),
(4, 70, 1255, 0, 0),
(4, 70, 1256, 0, 0),
(4, 70, 1257, 0, 0),
(4, 70, 1258, 0, 0),
(4, 70, 1259, 0, 0),
(4, 70, 1260, 0, 0),
(4, 70, 1261, 0, 0),
(4, 26, 1262, 0, 0),
(4, 71, 1263, 0, 0),
(4, 71, 1264, 0, 0),
(4, 71, 1265, 0, 0),
(4, 71, 1266, 0, 0),
(4, 71, 1267, 0, 0),
(4, 71, 1268, 0, 0),
(4, 71, 1269, 0, 0),
(4, 26, 1270, 0, 0),
(4, 72, 1271, 0, 0),
(4, 72, 1272, 0, 0),
(4, 72, 1273, 0, 0),
(4, 72, 1274, 0, 0),
(4, 72, 1275, 0, 0),
(4, 72, 1276, 0, 0),
(4, 72, 1277, 0, 0),
(4, 72, 1279, 0, 0),
(4, 72, 1281, 0, 0),
(4, 72, 1285, 0, 0),
(4, 72, 1287, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2globalpermissions`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2globalpermissions` (
  `profileid` int(19) NOT NULL,
  `globalactionid` int(19) NOT NULL,
  `globalactionpermission` int(19) DEFAULT NULL,
  PRIMARY KEY (`profileid`,`globalactionid`),
  KEY `idx_profile2globalpermissions` (`profileid`,`globalactionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2globalpermissions`
--

INSERT INTO `vtiger_profile2globalpermissions` (`profileid`, `globalactionid`, `globalactionpermission`) VALUES
(1, 1, 0),
(1, 2, 0),
(2, 1, 1),
(2, 2, 1),
(3, 1, 1),
(3, 2, 1),
(4, 1, 1),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2standardpermissions`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2standardpermissions` (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) NOT NULL,
  `operation` int(10) NOT NULL,
  `permissions` int(1) DEFAULT NULL,
  PRIMARY KEY (`profileid`,`tabid`,`operation`),
  KEY `profile2standardpermissions_profileid_tabid_operation_idx` (`profileid`,`tabid`,`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2standardpermissions`
--

INSERT INTO `vtiger_profile2standardpermissions` (`profileid`, `tabid`, `operation`, `permissions`) VALUES
(1, 2, 0, 0),
(1, 2, 1, 0),
(1, 2, 2, 0),
(1, 2, 3, 0),
(1, 2, 4, 0),
(1, 2, 7, 0),
(1, 4, 0, 0),
(1, 4, 1, 0),
(1, 4, 2, 0),
(1, 4, 3, 0),
(1, 4, 4, 0),
(1, 4, 7, 0),
(1, 6, 0, 0),
(1, 6, 1, 0),
(1, 6, 2, 0),
(1, 6, 3, 0),
(1, 6, 4, 0),
(1, 6, 7, 0),
(1, 7, 0, 0),
(1, 7, 1, 0),
(1, 7, 2, 0),
(1, 7, 3, 0),
(1, 7, 4, 0),
(1, 7, 7, 0),
(1, 8, 0, 0),
(1, 8, 1, 0),
(1, 8, 2, 0),
(1, 8, 3, 0),
(1, 8, 4, 0),
(1, 8, 7, 0),
(1, 9, 0, 0),
(1, 9, 1, 0),
(1, 9, 2, 0),
(1, 9, 3, 0),
(1, 9, 4, 0),
(1, 9, 7, 0),
(1, 13, 0, 0),
(1, 13, 1, 0),
(1, 13, 2, 0),
(1, 13, 3, 0),
(1, 13, 4, 0),
(1, 13, 7, 0),
(1, 14, 0, 0),
(1, 14, 1, 0),
(1, 14, 2, 0),
(1, 14, 3, 0),
(1, 14, 4, 0),
(1, 14, 7, 0),
(1, 15, 0, 0),
(1, 15, 1, 0),
(1, 15, 2, 0),
(1, 15, 3, 0),
(1, 15, 4, 0),
(1, 15, 7, 0),
(1, 16, 0, 0),
(1, 16, 1, 0),
(1, 16, 2, 0),
(1, 16, 3, 0),
(1, 16, 4, 0),
(1, 16, 7, 0),
(1, 18, 0, 0),
(1, 18, 1, 0),
(1, 18, 2, 0),
(1, 18, 3, 0),
(1, 18, 4, 0),
(1, 18, 7, 0),
(1, 19, 0, 0),
(1, 19, 1, 0),
(1, 19, 2, 0),
(1, 19, 3, 0),
(1, 19, 4, 0),
(1, 19, 7, 0),
(1, 20, 0, 0),
(1, 20, 1, 0),
(1, 20, 2, 0),
(1, 20, 3, 0),
(1, 20, 4, 0),
(1, 20, 7, 0),
(1, 21, 0, 0),
(1, 21, 1, 0),
(1, 21, 2, 0),
(1, 21, 3, 0),
(1, 21, 4, 0),
(1, 21, 7, 0),
(1, 22, 0, 0),
(1, 22, 1, 0),
(1, 22, 2, 0),
(1, 22, 3, 0),
(1, 22, 4, 0),
(1, 22, 7, 0),
(1, 23, 0, 0),
(1, 23, 1, 0),
(1, 23, 2, 0),
(1, 23, 3, 0),
(1, 23, 4, 0),
(1, 23, 7, 0),
(1, 25, 0, 1),
(1, 25, 1, 1),
(1, 25, 2, 1),
(1, 25, 3, 0),
(1, 25, 4, 0),
(1, 25, 7, 1),
(1, 26, 0, 0),
(1, 26, 1, 0),
(1, 26, 2, 0),
(1, 26, 3, 0),
(1, 26, 4, 0),
(1, 26, 7, 0),
(1, 34, 0, 0),
(1, 34, 1, 0),
(1, 34, 2, 0),
(1, 34, 3, 0),
(1, 34, 4, 0),
(1, 34, 7, 0),
(1, 35, 0, 0),
(1, 35, 1, 0),
(1, 35, 2, 0),
(1, 35, 3, 0),
(1, 35, 4, 0),
(1, 35, 7, 0),
(1, 36, 0, 0),
(1, 36, 1, 0),
(1, 36, 2, 0),
(1, 36, 3, 0),
(1, 36, 4, 0),
(1, 36, 7, 0),
(1, 38, 0, 0),
(1, 38, 1, 0),
(1, 38, 2, 0),
(1, 38, 3, 0),
(1, 38, 4, 0),
(1, 38, 7, 0),
(1, 42, 0, 0),
(1, 42, 1, 0),
(1, 42, 2, 0),
(1, 42, 3, 0),
(1, 42, 4, 0),
(1, 42, 7, 0),
(1, 43, 0, 0),
(1, 43, 1, 0),
(1, 43, 2, 0),
(1, 43, 3, 0),
(1, 43, 4, 0),
(1, 43, 7, 0),
(1, 44, 0, 0),
(1, 44, 1, 0),
(1, 44, 2, 0),
(1, 44, 3, 0),
(1, 44, 4, 0),
(1, 44, 7, 0),
(1, 45, 0, 0),
(1, 45, 1, 0),
(1, 45, 2, 0),
(1, 45, 3, 0),
(1, 45, 4, 0),
(1, 45, 7, 0),
(1, 47, 0, 0),
(1, 47, 1, 0),
(1, 47, 2, 0),
(1, 47, 3, 0),
(1, 47, 4, 0),
(1, 47, 7, 0),
(1, 50, 0, 0),
(1, 50, 1, 0),
(1, 50, 2, 0),
(1, 50, 3, 0),
(1, 50, 4, 0),
(1, 50, 7, 0),
(1, 51, 0, 0),
(1, 51, 1, 0),
(1, 51, 2, 0),
(1, 51, 3, 0),
(1, 51, 4, 0),
(1, 51, 7, 0),
(1, 52, 0, 0),
(1, 52, 1, 0),
(1, 52, 2, 0),
(1, 52, 3, 0),
(1, 52, 4, 0),
(1, 52, 7, 0),
(1, 53, 0, 0),
(1, 53, 1, 0),
(1, 53, 2, 0),
(1, 53, 3, 0),
(1, 53, 4, 0),
(1, 53, 7, 0),
(1, 54, 0, 0),
(1, 54, 1, 0),
(1, 54, 2, 0),
(1, 54, 3, 0),
(1, 54, 4, 0),
(1, 54, 7, 0),
(1, 55, 0, 0),
(1, 55, 1, 0),
(1, 55, 2, 0),
(1, 55, 3, 0),
(1, 55, 4, 0),
(1, 55, 7, 0),
(1, 56, 0, 0),
(1, 56, 1, 0),
(1, 56, 2, 0),
(1, 56, 3, 0),
(1, 56, 4, 0),
(1, 56, 7, 0),
(1, 57, 0, 0),
(1, 57, 1, 0),
(1, 57, 2, 0),
(1, 57, 3, 0),
(1, 57, 4, 0),
(1, 57, 7, 0),
(1, 58, 0, 0),
(1, 58, 1, 0),
(1, 58, 2, 0),
(1, 58, 3, 0),
(1, 58, 4, 0),
(1, 58, 7, 0),
(1, 59, 0, 0),
(1, 59, 1, 0),
(1, 59, 2, 0),
(1, 59, 3, 0),
(1, 59, 4, 0),
(1, 59, 7, 0),
(1, 60, 0, 0),
(1, 60, 1, 0),
(1, 60, 2, 0),
(1, 60, 3, 0),
(1, 60, 4, 0),
(1, 60, 7, 0),
(1, 61, 0, 0),
(1, 61, 1, 0),
(1, 61, 2, 0),
(1, 61, 3, 0),
(1, 61, 4, 0),
(1, 61, 7, 0),
(1, 63, 0, 0),
(1, 63, 1, 0),
(1, 63, 2, 0),
(1, 63, 3, 0),
(1, 63, 4, 0),
(1, 63, 7, 0),
(1, 64, 0, 0),
(1, 64, 1, 0),
(1, 64, 2, 0),
(1, 64, 3, 0),
(1, 64, 4, 0),
(1, 64, 7, 0),
(1, 65, 0, 0),
(1, 65, 1, 0),
(1, 65, 2, 0),
(1, 65, 3, 0),
(1, 65, 4, 0),
(1, 65, 7, 0),
(1, 66, 0, 0),
(1, 66, 1, 0),
(1, 66, 2, 0),
(1, 66, 3, 0),
(1, 66, 4, 0),
(1, 66, 7, 0),
(1, 70, 0, 0),
(1, 70, 1, 0),
(1, 70, 2, 0),
(1, 70, 3, 0),
(1, 70, 4, 0),
(1, 70, 7, 0),
(1, 71, 0, 0),
(1, 71, 1, 0),
(1, 71, 2, 0),
(1, 71, 3, 0),
(1, 71, 4, 0),
(1, 71, 7, 0),
(1, 72, 0, 0),
(1, 72, 1, 0),
(1, 72, 2, 0),
(1, 72, 3, 0),
(1, 72, 4, 0),
(1, 72, 7, 0),
(2, 2, 0, 0),
(2, 2, 1, 0),
(2, 2, 2, 0),
(2, 2, 3, 0),
(2, 2, 4, 0),
(2, 2, 7, 0),
(2, 4, 0, 0),
(2, 4, 1, 0),
(2, 4, 2, 0),
(2, 4, 3, 0),
(2, 4, 4, 0),
(2, 4, 7, 0),
(2, 6, 0, 0),
(2, 6, 1, 0),
(2, 6, 2, 0),
(2, 6, 3, 0),
(2, 6, 4, 0),
(2, 6, 7, 0),
(2, 7, 0, 0),
(2, 7, 1, 0),
(2, 7, 2, 0),
(2, 7, 3, 0),
(2, 7, 4, 0),
(2, 7, 7, 0),
(2, 8, 0, 0),
(2, 8, 1, 0),
(2, 8, 2, 0),
(2, 8, 3, 0),
(2, 8, 4, 0),
(2, 8, 7, 0),
(2, 9, 0, 0),
(2, 9, 1, 0),
(2, 9, 2, 0),
(2, 9, 3, 0),
(2, 9, 4, 0),
(2, 9, 7, 0),
(2, 13, 0, 1),
(2, 13, 1, 1),
(2, 13, 2, 1),
(2, 13, 3, 0),
(2, 13, 4, 0),
(2, 13, 7, 1),
(2, 14, 0, 0),
(2, 14, 1, 0),
(2, 14, 2, 0),
(2, 14, 3, 0),
(2, 14, 4, 0),
(2, 14, 7, 0),
(2, 15, 0, 0),
(2, 15, 1, 0),
(2, 15, 2, 0),
(2, 15, 3, 0),
(2, 15, 4, 0),
(2, 15, 7, 0),
(2, 16, 0, 0),
(2, 16, 1, 0),
(2, 16, 2, 0),
(2, 16, 3, 0),
(2, 16, 4, 0),
(2, 16, 7, 0),
(2, 18, 0, 0),
(2, 18, 1, 0),
(2, 18, 2, 0),
(2, 18, 3, 0),
(2, 18, 4, 0),
(2, 18, 7, 0),
(2, 19, 0, 0),
(2, 19, 1, 0),
(2, 19, 2, 0),
(2, 19, 3, 0),
(2, 19, 4, 0),
(2, 19, 7, 0),
(2, 20, 0, 0),
(2, 20, 1, 0),
(2, 20, 2, 0),
(2, 20, 3, 0),
(2, 20, 4, 0),
(2, 20, 7, 0),
(2, 21, 0, 0),
(2, 21, 1, 0),
(2, 21, 2, 0),
(2, 21, 3, 0),
(2, 21, 4, 0),
(2, 21, 7, 0),
(2, 22, 0, 0),
(2, 22, 1, 0),
(2, 22, 2, 0),
(2, 22, 3, 0),
(2, 22, 4, 0),
(2, 22, 7, 0),
(2, 23, 0, 0),
(2, 23, 1, 0),
(2, 23, 2, 0),
(2, 23, 3, 0),
(2, 23, 4, 0),
(2, 23, 7, 0),
(2, 25, 0, 1),
(2, 25, 1, 1),
(2, 25, 2, 1),
(2, 25, 3, 0),
(2, 25, 4, 0),
(2, 25, 7, 1),
(2, 26, 0, 0),
(2, 26, 1, 0),
(2, 26, 2, 0),
(2, 26, 3, 0),
(2, 26, 4, 0),
(2, 26, 7, 0),
(2, 34, 0, 0),
(2, 34, 1, 0),
(2, 34, 2, 0),
(2, 34, 3, 0),
(2, 34, 4, 0),
(2, 34, 7, 0),
(2, 35, 0, 0),
(2, 35, 1, 0),
(2, 35, 2, 0),
(2, 35, 3, 0),
(2, 35, 4, 0),
(2, 35, 7, 0),
(2, 36, 0, 0),
(2, 36, 1, 0),
(2, 36, 2, 0),
(2, 36, 3, 0),
(2, 36, 4, 0),
(2, 36, 7, 0),
(2, 38, 0, 0),
(2, 38, 1, 0),
(2, 38, 2, 0),
(2, 38, 3, 0),
(2, 38, 4, 0),
(2, 38, 7, 0),
(2, 42, 0, 0),
(2, 42, 1, 0),
(2, 42, 2, 0),
(2, 42, 3, 0),
(2, 42, 4, 0),
(2, 42, 7, 0),
(2, 43, 0, 0),
(2, 43, 1, 0),
(2, 43, 2, 0),
(2, 43, 3, 0),
(2, 43, 4, 0),
(2, 43, 7, 0),
(2, 44, 0, 0),
(2, 44, 1, 0),
(2, 44, 2, 0),
(2, 44, 3, 0),
(2, 44, 4, 0),
(2, 44, 7, 0),
(2, 45, 0, 0),
(2, 45, 1, 0),
(2, 45, 2, 0),
(2, 45, 3, 0),
(2, 45, 4, 0),
(2, 45, 7, 0),
(2, 47, 0, 0),
(2, 47, 1, 0),
(2, 47, 2, 0),
(2, 47, 3, 0),
(2, 47, 4, 0),
(2, 47, 7, 0),
(2, 50, 0, 0),
(2, 50, 1, 0),
(2, 50, 2, 0),
(2, 50, 3, 0),
(2, 50, 4, 0),
(2, 50, 7, 0),
(2, 51, 0, 0),
(2, 51, 1, 0),
(2, 51, 2, 0),
(2, 51, 3, 0),
(2, 51, 4, 0),
(2, 51, 7, 0),
(2, 52, 0, 0),
(2, 52, 1, 0),
(2, 52, 2, 0),
(2, 52, 3, 0),
(2, 52, 4, 0),
(2, 52, 7, 0),
(2, 53, 0, 0),
(2, 53, 1, 0),
(2, 53, 2, 0),
(2, 53, 3, 0),
(2, 53, 4, 0),
(2, 53, 7, 0),
(2, 54, 0, 0),
(2, 54, 1, 0),
(2, 54, 2, 0),
(2, 54, 3, 0),
(2, 54, 4, 0),
(2, 54, 7, 0),
(2, 55, 0, 0),
(2, 55, 1, 0),
(2, 55, 2, 0),
(2, 55, 3, 0),
(2, 55, 4, 0),
(2, 55, 7, 0),
(2, 56, 0, 0),
(2, 56, 1, 0),
(2, 56, 2, 0),
(2, 56, 3, 0),
(2, 56, 4, 0),
(2, 56, 7, 0),
(2, 57, 0, 0),
(2, 57, 1, 0),
(2, 57, 2, 0),
(2, 57, 3, 0),
(2, 57, 4, 0),
(2, 57, 7, 0),
(2, 58, 0, 0),
(2, 58, 1, 0),
(2, 58, 2, 0),
(2, 58, 3, 0),
(2, 58, 4, 0),
(2, 58, 7, 0),
(2, 59, 0, 0),
(2, 59, 1, 0),
(2, 59, 2, 0),
(2, 59, 3, 0),
(2, 59, 4, 0),
(2, 59, 7, 0),
(2, 60, 0, 0),
(2, 60, 1, 0),
(2, 60, 2, 0),
(2, 60, 3, 0),
(2, 60, 4, 0),
(2, 60, 7, 0),
(2, 61, 0, 0),
(2, 61, 1, 0),
(2, 61, 2, 0),
(2, 61, 3, 0),
(2, 61, 4, 0),
(2, 61, 7, 0),
(2, 63, 0, 0),
(2, 63, 1, 0),
(2, 63, 2, 0),
(2, 63, 3, 0),
(2, 63, 4, 0),
(2, 63, 7, 0),
(2, 64, 0, 0),
(2, 64, 1, 0),
(2, 64, 2, 0),
(2, 64, 3, 0),
(2, 64, 4, 0),
(2, 64, 7, 0),
(2, 65, 0, 0),
(2, 65, 1, 0),
(2, 65, 2, 0),
(2, 65, 3, 0),
(2, 65, 4, 0),
(2, 65, 7, 0),
(2, 66, 0, 0),
(2, 66, 1, 0),
(2, 66, 2, 0),
(2, 66, 3, 0),
(2, 66, 4, 0),
(2, 66, 7, 0),
(2, 70, 0, 0),
(2, 70, 1, 0),
(2, 70, 2, 0),
(2, 70, 3, 0),
(2, 70, 4, 0),
(2, 70, 7, 0),
(2, 71, 0, 0),
(2, 71, 1, 0),
(2, 71, 2, 0),
(2, 71, 3, 0),
(2, 71, 4, 0),
(2, 71, 7, 0),
(2, 72, 0, 0),
(2, 72, 1, 0),
(2, 72, 2, 0),
(2, 72, 3, 0),
(2, 72, 4, 0),
(2, 72, 7, 0),
(3, 2, 0, 1),
(3, 2, 1, 1),
(3, 2, 2, 1),
(3, 2, 3, 0),
(3, 2, 4, 0),
(3, 2, 7, 1),
(3, 4, 0, 0),
(3, 4, 1, 0),
(3, 4, 2, 0),
(3, 4, 3, 0),
(3, 4, 4, 0),
(3, 4, 7, 0),
(3, 6, 0, 0),
(3, 6, 1, 0),
(3, 6, 2, 0),
(3, 6, 3, 0),
(3, 6, 4, 0),
(3, 6, 7, 0),
(3, 7, 0, 0),
(3, 7, 1, 0),
(3, 7, 2, 0),
(3, 7, 3, 0),
(3, 7, 4, 0),
(3, 7, 7, 0),
(3, 8, 0, 0),
(3, 8, 1, 0),
(3, 8, 2, 0),
(3, 8, 3, 0),
(3, 8, 4, 0),
(3, 8, 7, 0),
(3, 9, 0, 0),
(3, 9, 1, 0),
(3, 9, 2, 0),
(3, 9, 3, 0),
(3, 9, 4, 0),
(3, 9, 7, 0),
(3, 13, 0, 0),
(3, 13, 1, 0),
(3, 13, 2, 0),
(3, 13, 3, 0),
(3, 13, 4, 0),
(3, 13, 7, 0),
(3, 14, 0, 0),
(3, 14, 1, 0),
(3, 14, 2, 0),
(3, 14, 3, 0),
(3, 14, 4, 0),
(3, 14, 7, 0),
(3, 15, 0, 0),
(3, 15, 1, 0),
(3, 15, 2, 0),
(3, 15, 3, 0),
(3, 15, 4, 0),
(3, 15, 7, 0),
(3, 16, 0, 0),
(3, 16, 1, 0),
(3, 16, 2, 0),
(3, 16, 3, 0),
(3, 16, 4, 0),
(3, 16, 7, 0),
(3, 18, 0, 0),
(3, 18, 1, 0),
(3, 18, 2, 0),
(3, 18, 3, 0),
(3, 18, 4, 0),
(3, 18, 7, 0),
(3, 19, 0, 0),
(3, 19, 1, 0),
(3, 19, 2, 0),
(3, 19, 3, 0),
(3, 19, 4, 0),
(3, 19, 7, 0),
(3, 20, 0, 0),
(3, 20, 1, 0),
(3, 20, 2, 0),
(3, 20, 3, 0),
(3, 20, 4, 0),
(3, 20, 7, 0),
(3, 21, 0, 0),
(3, 21, 1, 0),
(3, 21, 2, 0),
(3, 21, 3, 0),
(3, 21, 4, 0),
(3, 21, 7, 0),
(3, 22, 0, 0),
(3, 22, 1, 0),
(3, 22, 2, 0),
(3, 22, 3, 0),
(3, 22, 4, 0),
(3, 22, 7, 0),
(3, 23, 0, 0),
(3, 23, 1, 0),
(3, 23, 2, 0),
(3, 23, 3, 0),
(3, 23, 4, 0),
(3, 23, 7, 0),
(3, 25, 0, 1),
(3, 25, 1, 1),
(3, 25, 2, 1),
(3, 25, 3, 0),
(3, 25, 4, 0),
(3, 25, 7, 1),
(3, 26, 0, 0),
(3, 26, 1, 0),
(3, 26, 2, 0),
(3, 26, 3, 0),
(3, 26, 4, 0),
(3, 26, 7, 0),
(3, 34, 0, 0),
(3, 34, 1, 0),
(3, 34, 2, 0),
(3, 34, 3, 0),
(3, 34, 4, 0),
(3, 34, 7, 0),
(3, 35, 0, 0),
(3, 35, 1, 0),
(3, 35, 2, 0),
(3, 35, 3, 0),
(3, 35, 4, 0),
(3, 35, 7, 0),
(3, 36, 0, 0),
(3, 36, 1, 0),
(3, 36, 2, 0),
(3, 36, 3, 0),
(3, 36, 4, 0),
(3, 36, 7, 0),
(3, 38, 0, 0),
(3, 38, 1, 0),
(3, 38, 2, 0),
(3, 38, 3, 0),
(3, 38, 4, 0),
(3, 38, 7, 0),
(3, 42, 0, 0),
(3, 42, 1, 0),
(3, 42, 2, 0),
(3, 42, 3, 0),
(3, 42, 4, 0),
(3, 42, 7, 0),
(3, 43, 0, 0),
(3, 43, 1, 0),
(3, 43, 2, 0),
(3, 43, 3, 0),
(3, 43, 4, 0),
(3, 43, 7, 0),
(3, 44, 0, 0),
(3, 44, 1, 0),
(3, 44, 2, 0),
(3, 44, 3, 0),
(3, 44, 4, 0),
(3, 44, 7, 0),
(3, 45, 0, 0),
(3, 45, 1, 0),
(3, 45, 2, 0),
(3, 45, 3, 0),
(3, 45, 4, 0),
(3, 45, 7, 0),
(3, 47, 0, 0),
(3, 47, 1, 0),
(3, 47, 2, 0),
(3, 47, 3, 0),
(3, 47, 4, 0),
(3, 47, 7, 0),
(3, 50, 0, 0),
(3, 50, 1, 0),
(3, 50, 2, 0),
(3, 50, 3, 0),
(3, 50, 4, 0),
(3, 50, 7, 0),
(3, 51, 0, 0),
(3, 51, 1, 0),
(3, 51, 2, 0),
(3, 51, 3, 0),
(3, 51, 4, 0),
(3, 51, 7, 0),
(3, 52, 0, 0),
(3, 52, 1, 0),
(3, 52, 2, 0),
(3, 52, 3, 0),
(3, 52, 4, 0),
(3, 52, 7, 0),
(3, 53, 0, 0),
(3, 53, 1, 0),
(3, 53, 2, 0),
(3, 53, 3, 0),
(3, 53, 4, 0),
(3, 53, 7, 0),
(3, 54, 0, 0),
(3, 54, 1, 0),
(3, 54, 2, 0),
(3, 54, 3, 0),
(3, 54, 4, 0),
(3, 54, 7, 0),
(3, 55, 0, 0),
(3, 55, 1, 0),
(3, 55, 2, 0),
(3, 55, 3, 0),
(3, 55, 4, 0),
(3, 55, 7, 0),
(3, 56, 0, 0),
(3, 56, 1, 0),
(3, 56, 2, 0),
(3, 56, 3, 0),
(3, 56, 4, 0),
(3, 56, 7, 0),
(3, 57, 0, 0),
(3, 57, 1, 0),
(3, 57, 2, 0),
(3, 57, 3, 0),
(3, 57, 4, 0),
(3, 57, 7, 0),
(3, 58, 0, 0),
(3, 58, 1, 0),
(3, 58, 2, 0),
(3, 58, 3, 0),
(3, 58, 4, 0),
(3, 58, 7, 0),
(3, 59, 0, 0),
(3, 59, 1, 0),
(3, 59, 2, 0),
(3, 59, 3, 0),
(3, 59, 4, 0),
(3, 59, 7, 0),
(3, 60, 0, 0),
(3, 60, 1, 0),
(3, 60, 2, 0),
(3, 60, 3, 0),
(3, 60, 4, 0),
(3, 60, 7, 0),
(3, 61, 0, 0),
(3, 61, 1, 0),
(3, 61, 2, 0),
(3, 61, 3, 0),
(3, 61, 4, 0),
(3, 61, 7, 0),
(3, 63, 0, 0),
(3, 63, 1, 0),
(3, 63, 2, 0),
(3, 63, 3, 0),
(3, 63, 4, 0),
(3, 63, 7, 0),
(3, 64, 0, 0),
(3, 64, 1, 0),
(3, 64, 2, 0),
(3, 64, 3, 0),
(3, 64, 4, 0),
(3, 64, 7, 0),
(3, 65, 0, 0),
(3, 65, 1, 0),
(3, 65, 2, 0),
(3, 65, 3, 0),
(3, 65, 4, 0),
(3, 65, 7, 0),
(3, 66, 0, 0),
(3, 66, 1, 0),
(3, 66, 2, 0),
(3, 66, 3, 0),
(3, 66, 4, 0),
(3, 66, 7, 0),
(3, 70, 0, 0),
(3, 70, 1, 0),
(3, 70, 2, 0),
(3, 70, 3, 0),
(3, 70, 4, 0),
(3, 70, 7, 0),
(3, 71, 0, 0),
(3, 71, 1, 0),
(3, 71, 2, 0),
(3, 71, 3, 0),
(3, 71, 4, 0),
(3, 71, 7, 0),
(3, 72, 0, 0),
(3, 72, 1, 0),
(3, 72, 2, 0),
(3, 72, 3, 0),
(3, 72, 4, 0),
(3, 72, 7, 0),
(4, 2, 0, 1),
(4, 2, 1, 1),
(4, 2, 2, 1),
(4, 2, 3, 0),
(4, 2, 4, 0),
(4, 2, 7, 1),
(4, 4, 0, 1),
(4, 4, 1, 1),
(4, 4, 2, 1),
(4, 4, 3, 0),
(4, 4, 4, 0),
(4, 4, 7, 1),
(4, 6, 0, 1),
(4, 6, 1, 1),
(4, 6, 2, 1),
(4, 6, 3, 0),
(4, 6, 4, 0),
(4, 6, 7, 1),
(4, 7, 0, 1),
(4, 7, 1, 1),
(4, 7, 2, 1),
(4, 7, 3, 0),
(4, 7, 4, 0),
(4, 7, 7, 1),
(4, 8, 0, 1),
(4, 8, 1, 1),
(4, 8, 2, 1),
(4, 8, 3, 0),
(4, 8, 4, 0),
(4, 8, 7, 1),
(4, 9, 0, 1),
(4, 9, 1, 1),
(4, 9, 2, 1),
(4, 9, 3, 0),
(4, 9, 4, 0),
(4, 9, 7, 1),
(4, 13, 0, 1),
(4, 13, 1, 1),
(4, 13, 2, 1),
(4, 13, 3, 0),
(4, 13, 4, 0),
(4, 13, 7, 1),
(4, 14, 0, 1),
(4, 14, 1, 1),
(4, 14, 2, 1),
(4, 14, 3, 0),
(4, 14, 4, 0),
(4, 14, 7, 1),
(4, 15, 0, 1),
(4, 15, 1, 1),
(4, 15, 2, 1),
(4, 15, 3, 0),
(4, 15, 4, 0),
(4, 15, 7, 1),
(4, 16, 0, 1),
(4, 16, 1, 1),
(4, 16, 2, 1),
(4, 16, 3, 0),
(4, 16, 4, 0),
(4, 16, 7, 1),
(4, 18, 0, 1),
(4, 18, 1, 1),
(4, 18, 2, 1),
(4, 18, 3, 0),
(4, 18, 4, 0),
(4, 18, 7, 1),
(4, 19, 0, 1),
(4, 19, 1, 1),
(4, 19, 2, 1),
(4, 19, 3, 0),
(4, 19, 4, 0),
(4, 19, 7, 1),
(4, 20, 0, 1),
(4, 20, 1, 1),
(4, 20, 2, 1),
(4, 20, 3, 0),
(4, 20, 4, 0),
(4, 20, 7, 1),
(4, 21, 0, 1),
(4, 21, 1, 1),
(4, 21, 2, 1),
(4, 21, 3, 0),
(4, 21, 4, 0),
(4, 21, 7, 1),
(4, 22, 0, 1),
(4, 22, 1, 1),
(4, 22, 2, 1),
(4, 22, 3, 0),
(4, 22, 4, 0),
(4, 22, 7, 1),
(4, 23, 0, 1),
(4, 23, 1, 1),
(4, 23, 2, 1),
(4, 23, 3, 0),
(4, 23, 4, 0),
(4, 23, 7, 1),
(4, 25, 0, 1),
(4, 25, 1, 1),
(4, 25, 2, 1),
(4, 25, 3, 0),
(4, 25, 4, 0),
(4, 25, 7, 1),
(4, 26, 0, 1),
(4, 26, 1, 1),
(4, 26, 2, 1),
(4, 26, 3, 0),
(4, 26, 4, 0),
(4, 26, 7, 1),
(4, 34, 0, 0),
(4, 34, 1, 0),
(4, 34, 2, 0),
(4, 34, 3, 0),
(4, 34, 4, 0),
(4, 34, 7, 0),
(4, 35, 0, 0),
(4, 35, 1, 0),
(4, 35, 2, 0),
(4, 35, 3, 0),
(4, 35, 4, 0),
(4, 35, 7, 0),
(4, 36, 0, 0),
(4, 36, 1, 0),
(4, 36, 2, 0),
(4, 36, 3, 0),
(4, 36, 4, 0),
(4, 36, 7, 0),
(4, 38, 0, 0),
(4, 38, 1, 0),
(4, 38, 2, 0),
(4, 38, 3, 0),
(4, 38, 4, 0),
(4, 38, 7, 0),
(4, 42, 0, 0),
(4, 42, 1, 0),
(4, 42, 2, 0),
(4, 42, 3, 0),
(4, 42, 4, 0),
(4, 42, 7, 0),
(4, 43, 0, 0),
(4, 43, 1, 0),
(4, 43, 2, 0),
(4, 43, 3, 0),
(4, 43, 4, 0),
(4, 43, 7, 0),
(4, 44, 0, 0),
(4, 44, 1, 0),
(4, 44, 2, 0),
(4, 44, 3, 0),
(4, 44, 4, 0),
(4, 44, 7, 0),
(4, 45, 0, 0),
(4, 45, 1, 0),
(4, 45, 2, 0),
(4, 45, 3, 0),
(4, 45, 4, 0),
(4, 45, 7, 0),
(4, 47, 0, 0),
(4, 47, 1, 0),
(4, 47, 2, 0),
(4, 47, 3, 0),
(4, 47, 4, 0),
(4, 47, 7, 0),
(4, 50, 0, 0),
(4, 50, 1, 0),
(4, 50, 2, 0),
(4, 50, 3, 0),
(4, 50, 4, 0),
(4, 50, 7, 0),
(4, 51, 0, 0),
(4, 51, 1, 0),
(4, 51, 2, 0),
(4, 51, 3, 0),
(4, 51, 4, 0),
(4, 51, 7, 0),
(4, 52, 0, 0),
(4, 52, 1, 0),
(4, 52, 2, 0),
(4, 52, 3, 0),
(4, 52, 4, 0),
(4, 52, 7, 0),
(4, 53, 0, 0),
(4, 53, 1, 0),
(4, 53, 2, 0),
(4, 53, 3, 0),
(4, 53, 4, 0),
(4, 53, 7, 0),
(4, 54, 0, 0),
(4, 54, 1, 0),
(4, 54, 2, 0),
(4, 54, 3, 0),
(4, 54, 4, 0),
(4, 54, 7, 0),
(4, 55, 0, 0),
(4, 55, 1, 0),
(4, 55, 2, 0),
(4, 55, 3, 0),
(4, 55, 4, 0),
(4, 55, 7, 0),
(4, 56, 0, 0),
(4, 56, 1, 0),
(4, 56, 2, 0),
(4, 56, 3, 0),
(4, 56, 4, 0),
(4, 56, 7, 0),
(4, 57, 0, 0),
(4, 57, 1, 0),
(4, 57, 2, 0),
(4, 57, 3, 0),
(4, 57, 4, 0),
(4, 57, 7, 0),
(4, 58, 0, 0),
(4, 58, 1, 0),
(4, 58, 2, 0),
(4, 58, 3, 0),
(4, 58, 4, 0),
(4, 58, 7, 0),
(4, 59, 0, 0),
(4, 59, 1, 0),
(4, 59, 2, 0),
(4, 59, 3, 0),
(4, 59, 4, 0),
(4, 59, 7, 0),
(4, 60, 0, 0),
(4, 60, 1, 0),
(4, 60, 2, 0),
(4, 60, 3, 0),
(4, 60, 4, 0),
(4, 60, 7, 0),
(4, 61, 0, 0),
(4, 61, 1, 0),
(4, 61, 2, 0),
(4, 61, 3, 0),
(4, 61, 4, 0),
(4, 61, 7, 0),
(4, 63, 0, 0),
(4, 63, 1, 0),
(4, 63, 2, 0),
(4, 63, 3, 0),
(4, 63, 4, 0),
(4, 63, 7, 0),
(4, 64, 0, 0),
(4, 64, 1, 0),
(4, 64, 2, 0),
(4, 64, 3, 0),
(4, 64, 4, 0),
(4, 64, 7, 0),
(4, 65, 0, 0),
(4, 65, 1, 0),
(4, 65, 2, 0),
(4, 65, 3, 0),
(4, 65, 4, 0),
(4, 65, 7, 0),
(4, 66, 0, 0),
(4, 66, 1, 0),
(4, 66, 2, 0),
(4, 66, 3, 0),
(4, 66, 4, 0),
(4, 66, 7, 0),
(4, 70, 0, 0),
(4, 70, 1, 0),
(4, 70, 2, 0),
(4, 70, 3, 0),
(4, 70, 4, 0),
(4, 70, 7, 0),
(4, 71, 0, 0),
(4, 71, 1, 0),
(4, 71, 2, 0),
(4, 71, 3, 0),
(4, 71, 4, 0),
(4, 71, 7, 0),
(4, 72, 0, 0),
(4, 72, 1, 0),
(4, 72, 2, 0),
(4, 72, 3, 0),
(4, 72, 4, 0),
(4, 72, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2tab` (
  `profileid` int(11) DEFAULT NULL,
  `tabid` int(10) DEFAULT NULL,
  `permissions` int(10) NOT NULL DEFAULT 0,
  KEY `profile2tab_profileid_tabid_idx` (`profileid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2tab`
--

INSERT INTO `vtiger_profile2tab` (`profileid`, `tabid`, `permissions`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 6, 0),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 10, 0),
(1, 13, 0),
(1, 14, 0),
(1, 15, 0),
(1, 16, 0),
(1, 18, 0),
(1, 19, 0),
(1, 20, 0),
(1, 21, 0),
(1, 22, 0),
(1, 23, 0),
(1, 24, 0),
(1, 25, 0),
(1, 26, 0),
(1, 27, 0),
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 6, 0),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(2, 13, 0),
(2, 14, 0),
(2, 15, 0),
(2, 16, 0),
(2, 18, 0),
(2, 19, 0),
(2, 20, 0),
(2, 21, 0),
(2, 22, 0),
(2, 23, 0),
(2, 24, 0),
(2, 25, 0),
(2, 26, 0),
(2, 27, 0),
(3, 1, 0),
(3, 2, 0),
(3, 3, 0),
(3, 4, 0),
(3, 6, 0),
(3, 7, 0),
(3, 8, 0),
(3, 9, 0),
(3, 10, 0),
(3, 13, 0),
(3, 14, 0),
(3, 15, 0),
(3, 16, 0),
(3, 18, 0),
(3, 19, 0),
(3, 20, 0),
(3, 21, 0),
(3, 22, 0),
(3, 23, 0),
(3, 24, 0),
(3, 25, 0),
(3, 26, 0),
(3, 27, 0),
(4, 1, 0),
(4, 2, 0),
(4, 3, 0),
(4, 4, 0),
(4, 6, 0),
(4, 7, 0),
(4, 8, 0),
(4, 9, 0),
(4, 10, 0),
(4, 13, 0),
(4, 14, 0),
(4, 15, 0),
(4, 16, 0),
(4, 18, 0),
(4, 19, 0),
(4, 20, 0),
(4, 21, 0),
(4, 22, 0),
(4, 23, 0),
(4, 24, 0),
(4, 25, 0),
(4, 26, 0),
(4, 27, 0),
(1, 30, 0),
(2, 30, 0),
(3, 30, 0),
(4, 30, 0),
(1, 31, 0),
(2, 31, 0),
(3, 31, 0),
(4, 31, 0),
(1, 32, 0),
(2, 32, 0),
(3, 32, 0),
(4, 32, 0),
(1, 33, 0),
(2, 33, 0),
(3, 33, 0),
(4, 33, 0),
(1, 34, 0),
(2, 34, 0),
(3, 34, 0),
(4, 34, 0),
(1, 35, 0),
(2, 35, 0),
(3, 35, 0),
(4, 35, 0),
(1, 36, 0),
(2, 36, 0),
(3, 36, 0),
(4, 36, 0),
(1, 37, 0),
(2, 37, 0),
(3, 37, 0),
(4, 37, 0),
(1, 38, 0),
(2, 38, 0),
(3, 38, 0),
(4, 38, 0),
(1, 39, 0),
(2, 39, 0),
(3, 39, 0),
(4, 39, 0),
(1, 40, 0),
(2, 40, 0),
(3, 40, 0),
(4, 40, 0),
(1, 41, 0),
(2, 41, 0),
(3, 41, 0),
(4, 41, 0),
(1, 42, 0),
(2, 42, 0),
(3, 42, 0),
(4, 42, 0),
(1, 43, 0),
(2, 43, 0),
(3, 43, 0),
(4, 43, 0),
(1, 44, 0),
(2, 44, 0),
(3, 44, 0),
(4, 44, 0),
(1, 45, 0),
(2, 45, 0),
(3, 45, 0),
(4, 45, 0),
(1, 46, 0),
(2, 46, 0),
(3, 46, 0),
(4, 46, 0),
(1, 47, 0),
(2, 47, 0),
(3, 47, 0),
(4, 47, 0),
(1, 48, 0),
(2, 48, 0),
(3, 48, 0),
(4, 48, 0),
(1, 49, 0),
(2, 49, 0),
(3, 49, 0),
(4, 49, 0),
(1, 50, 0),
(2, 50, 0),
(3, 50, 0),
(4, 50, 0),
(1, 51, 0),
(2, 51, 0),
(3, 51, 0),
(4, 51, 0),
(1, 52, 0),
(2, 52, 0),
(3, 52, 0),
(4, 52, 0),
(1, 53, 0),
(2, 53, 0),
(3, 53, 0),
(4, 53, 0),
(1, 54, 0),
(2, 54, 0),
(3, 54, 0),
(4, 54, 0),
(1, 55, 0),
(2, 55, 0),
(3, 55, 0),
(4, 55, 0),
(1, 56, 0),
(2, 56, 0),
(3, 56, 0),
(4, 56, 0),
(1, 57, 0),
(2, 57, 0),
(3, 57, 0),
(4, 57, 0),
(1, 58, 0),
(2, 58, 0),
(3, 58, 0),
(4, 58, 0),
(1, 59, 0),
(2, 59, 0),
(3, 59, 0),
(4, 59, 0),
(1, 60, 0),
(2, 60, 0),
(3, 60, 0),
(4, 60, 0),
(1, 61, 0),
(2, 61, 0),
(3, 61, 0),
(4, 61, 0),
(1, 63, 0),
(2, 63, 0),
(3, 63, 0),
(4, 63, 0),
(1, 64, 0),
(2, 64, 0),
(3, 64, 0),
(4, 64, 0),
(1, 65, 0),
(2, 65, 0),
(3, 65, 0),
(4, 65, 0),
(1, 66, 0),
(2, 66, 0),
(3, 66, 0),
(4, 66, 0),
(1, 69, 0),
(2, 69, 0),
(3, 69, 0),
(4, 69, 0),
(1, 70, 0),
(2, 70, 0),
(3, 70, 0),
(4, 70, 0),
(1, 71, 0),
(2, 71, 0),
(3, 71, 0),
(4, 71, 0),
(1, 72, 0),
(2, 72, 0),
(3, 72, 0),
(4, 72, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile2utility`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile2utility` (
  `profileid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `permission` int(1) DEFAULT NULL,
  PRIMARY KEY (`profileid`,`tabid`,`activityid`),
  KEY `profile2utility_profileid_tabid_activityid_idx` (`profileid`,`tabid`,`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile2utility`
--

INSERT INTO `vtiger_profile2utility` (`profileid`, `tabid`, `activityid`, `permission`) VALUES
(1, 2, 5, 0),
(1, 2, 6, 0),
(1, 2, 10, 0),
(1, 4, 5, 0),
(1, 4, 6, 0),
(1, 4, 8, 0),
(1, 4, 10, 0),
(1, 6, 5, 0),
(1, 6, 6, 0),
(1, 6, 8, 0),
(1, 6, 10, 0),
(1, 7, 5, 0),
(1, 7, 6, 0),
(1, 7, 8, 0),
(1, 7, 9, 0),
(1, 7, 10, 0),
(1, 8, 6, 0),
(1, 9, 5, 0),
(1, 9, 6, 0),
(1, 13, 5, 0),
(1, 13, 6, 0),
(1, 13, 8, 0),
(1, 13, 10, 0),
(1, 14, 5, 0),
(1, 14, 6, 0),
(1, 14, 10, 0),
(1, 18, 5, 0),
(1, 18, 6, 0),
(1, 18, 10, 0),
(1, 19, 5, 1),
(1, 19, 6, 1),
(1, 19, 10, 1),
(1, 20, 5, 0),
(1, 20, 6, 0),
(1, 21, 5, 0),
(1, 21, 6, 0),
(1, 22, 5, 0),
(1, 22, 6, 0),
(1, 23, 5, 0),
(1, 23, 6, 0),
(1, 25, 6, 0),
(1, 25, 13, 0),
(1, 34, 11, 1),
(1, 34, 12, 1),
(1, 34, 14, 1),
(1, 34, 15, 1),
(1, 35, 5, 0),
(1, 35, 6, 0),
(1, 35, 10, 0),
(1, 36, 5, 0),
(1, 36, 6, 0),
(1, 36, 10, 0),
(1, 43, 5, 1),
(1, 43, 6, 1),
(1, 43, 10, 1),
(1, 44, 5, 0),
(1, 44, 6, 0),
(1, 44, 10, 0),
(1, 45, 5, 0),
(1, 45, 6, 0),
(1, 45, 10, 0),
(1, 53, 5, 0),
(1, 53, 6, 0),
(1, 53, 8, 0),
(1, 53, 10, 0),
(1, 55, 5, 0),
(1, 55, 6, 0),
(1, 55, 8, 0),
(1, 55, 10, 0),
(1, 56, 5, 0),
(1, 56, 6, 0),
(1, 56, 8, 0),
(1, 56, 10, 0),
(1, 57, 5, 0),
(1, 57, 6, 0),
(1, 57, 8, 0),
(1, 57, 10, 0),
(1, 58, 5, 0),
(1, 58, 6, 0),
(1, 58, 8, 0),
(1, 58, 10, 0),
(1, 59, 5, 0),
(1, 59, 6, 0),
(1, 59, 8, 0),
(1, 59, 10, 0),
(1, 61, 5, 0),
(1, 61, 6, 0),
(1, 61, 8, 0),
(1, 61, 10, 0),
(2, 2, 5, 1),
(2, 2, 6, 1),
(2, 2, 10, 0),
(2, 4, 5, 1),
(2, 4, 6, 1),
(2, 4, 8, 0),
(2, 4, 10, 0),
(2, 6, 5, 1),
(2, 6, 6, 1),
(2, 6, 8, 0),
(2, 6, 10, 0),
(2, 7, 5, 1),
(2, 7, 6, 1),
(2, 7, 8, 0),
(2, 7, 9, 0),
(2, 7, 10, 0),
(2, 8, 6, 1),
(2, 9, 5, 0),
(2, 9, 6, 0),
(2, 13, 5, 1),
(2, 13, 6, 1),
(2, 13, 8, 0),
(2, 13, 10, 0),
(2, 14, 5, 1),
(2, 14, 6, 1),
(2, 14, 10, 0),
(2, 18, 5, 1),
(2, 18, 6, 1),
(2, 18, 10, 0),
(2, 19, 5, 1),
(2, 19, 6, 1),
(2, 19, 10, 1),
(2, 20, 5, 0),
(2, 20, 6, 0),
(2, 21, 5, 0),
(2, 21, 6, 0),
(2, 22, 5, 0),
(2, 22, 6, 0),
(2, 23, 5, 0),
(2, 23, 6, 0),
(2, 25, 6, 0),
(2, 25, 13, 0),
(2, 34, 11, 1),
(2, 34, 12, 1),
(2, 34, 14, 1),
(2, 34, 15, 1),
(2, 35, 5, 0),
(2, 35, 6, 0),
(2, 35, 10, 0),
(2, 36, 5, 0),
(2, 36, 6, 0),
(2, 36, 10, 0),
(2, 43, 5, 1),
(2, 43, 6, 1),
(2, 43, 10, 1),
(2, 44, 5, 0),
(2, 44, 6, 0),
(2, 44, 10, 0),
(2, 45, 5, 0),
(2, 45, 6, 0),
(2, 45, 10, 0),
(2, 53, 5, 0),
(2, 53, 6, 0),
(2, 53, 8, 0),
(2, 53, 10, 0),
(2, 55, 5, 0),
(2, 55, 6, 0),
(2, 55, 8, 0),
(2, 55, 10, 0),
(2, 56, 5, 0),
(2, 56, 6, 0),
(2, 56, 8, 0),
(2, 56, 10, 0),
(2, 57, 5, 0),
(2, 57, 6, 0),
(2, 57, 8, 0),
(2, 57, 10, 0),
(2, 58, 5, 0),
(2, 58, 6, 0),
(2, 58, 8, 0),
(2, 58, 10, 0),
(2, 59, 5, 0),
(2, 59, 6, 0),
(2, 59, 8, 0),
(2, 59, 10, 0),
(2, 61, 5, 0),
(2, 61, 6, 0),
(2, 61, 8, 0),
(2, 61, 10, 0),
(3, 2, 5, 1),
(3, 2, 6, 1),
(3, 2, 10, 0),
(3, 4, 5, 1),
(3, 4, 6, 1),
(3, 4, 8, 0),
(3, 4, 10, 0),
(3, 6, 5, 1),
(3, 6, 6, 1),
(3, 6, 8, 0),
(3, 6, 10, 0),
(3, 7, 5, 1),
(3, 7, 6, 1),
(3, 7, 8, 0),
(3, 7, 9, 0),
(3, 7, 10, 0),
(3, 8, 6, 1),
(3, 9, 5, 0),
(3, 9, 6, 0),
(3, 13, 5, 1),
(3, 13, 6, 1),
(3, 13, 8, 0),
(3, 13, 10, 0),
(3, 14, 5, 1),
(3, 14, 6, 1),
(3, 14, 10, 0),
(3, 18, 5, 1),
(3, 18, 6, 1),
(3, 18, 10, 0),
(3, 19, 5, 1),
(3, 19, 6, 1),
(3, 19, 10, 1),
(3, 20, 5, 0),
(3, 20, 6, 0),
(3, 21, 5, 0),
(3, 21, 6, 0),
(3, 22, 5, 0),
(3, 22, 6, 0),
(3, 23, 5, 0),
(3, 23, 6, 0),
(3, 25, 6, 0),
(3, 25, 13, 0),
(3, 34, 11, 1),
(3, 34, 12, 1),
(3, 34, 14, 1),
(3, 34, 15, 1),
(3, 35, 5, 0),
(3, 35, 6, 0),
(3, 35, 10, 0),
(3, 36, 5, 0),
(3, 36, 6, 0),
(3, 36, 10, 0),
(3, 43, 5, 1),
(3, 43, 6, 1),
(3, 43, 10, 1),
(3, 44, 5, 0),
(3, 44, 6, 0),
(3, 44, 10, 0),
(3, 45, 5, 0),
(3, 45, 6, 0),
(3, 45, 10, 0),
(3, 53, 5, 0),
(3, 53, 6, 0),
(3, 53, 8, 0),
(3, 53, 10, 0),
(3, 55, 5, 0),
(3, 55, 6, 0),
(3, 55, 8, 0),
(3, 55, 10, 0),
(3, 56, 5, 0),
(3, 56, 6, 0),
(3, 56, 8, 0),
(3, 56, 10, 0),
(3, 57, 5, 0),
(3, 57, 6, 0),
(3, 57, 8, 0),
(3, 57, 10, 0),
(3, 58, 5, 0),
(3, 58, 6, 0),
(3, 58, 8, 0),
(3, 58, 10, 0),
(3, 59, 5, 0),
(3, 59, 6, 0),
(3, 59, 8, 0),
(3, 59, 10, 0),
(3, 61, 5, 0),
(3, 61, 6, 0),
(3, 61, 8, 0),
(3, 61, 10, 0),
(4, 2, 5, 1),
(4, 2, 6, 1),
(4, 2, 10, 0),
(4, 4, 5, 1),
(4, 4, 6, 1),
(4, 4, 8, 1),
(4, 4, 10, 0),
(4, 6, 5, 1),
(4, 6, 6, 1),
(4, 6, 8, 1),
(4, 6, 10, 0),
(4, 7, 5, 1),
(4, 7, 6, 1),
(4, 7, 8, 1),
(4, 7, 9, 0),
(4, 7, 10, 0),
(4, 8, 6, 1),
(4, 9, 5, 0),
(4, 9, 6, 0),
(4, 13, 5, 1),
(4, 13, 6, 1),
(4, 13, 8, 1),
(4, 13, 10, 0),
(4, 14, 5, 1),
(4, 14, 6, 1),
(4, 14, 10, 0),
(4, 18, 5, 1),
(4, 18, 6, 1),
(4, 18, 10, 0),
(4, 19, 5, 1),
(4, 19, 6, 1),
(4, 19, 10, 1),
(4, 20, 5, 0),
(4, 20, 6, 0),
(4, 21, 5, 0),
(4, 21, 6, 0),
(4, 22, 5, 0),
(4, 22, 6, 0),
(4, 23, 5, 0),
(4, 23, 6, 0),
(4, 25, 6, 0),
(4, 25, 13, 0),
(4, 34, 11, 1),
(4, 34, 12, 1),
(4, 34, 14, 1),
(4, 34, 15, 1),
(4, 35, 5, 0),
(4, 35, 6, 0),
(4, 35, 10, 0),
(4, 36, 5, 0),
(4, 36, 6, 0),
(4, 36, 10, 0),
(4, 43, 5, 1),
(4, 43, 6, 1),
(4, 43, 10, 1),
(4, 44, 5, 0),
(4, 44, 6, 0),
(4, 44, 10, 0),
(4, 45, 5, 0),
(4, 45, 6, 0),
(4, 45, 10, 0),
(4, 53, 5, 0),
(4, 53, 6, 0),
(4, 53, 8, 0),
(4, 53, 10, 0),
(4, 55, 5, 0),
(4, 55, 6, 0),
(4, 55, 8, 0),
(4, 55, 10, 0),
(4, 56, 5, 0),
(4, 56, 6, 0),
(4, 56, 8, 0),
(4, 56, 10, 0),
(4, 57, 5, 0),
(4, 57, 6, 0),
(4, 57, 8, 0),
(4, 57, 10, 0),
(4, 58, 5, 0),
(4, 58, 6, 0),
(4, 58, 8, 0),
(4, 58, 10, 0),
(4, 59, 5, 0),
(4, 59, 6, 0),
(4, 59, 8, 0),
(4, 59, 10, 0),
(4, 61, 5, 0),
(4, 61, 6, 0),
(4, 61, 8, 0),
(4, 61, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_profile_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_profile_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_profile_seq`
--

INSERT INTO `vtiger_profile_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_progress`
--

CREATE TABLE IF NOT EXISTS `vtiger_progress` (
  `progressid` int(11) NOT NULL,
  `progress` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`progressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_progress`
--

INSERT INTO `vtiger_progress` (`progressid`, `progress`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, '10%', 1, 278, 2, NULL),
(3, '20%', 1, 279, 3, NULL),
(4, '30%', 1, 280, 4, NULL),
(5, '40%', 1, 281, 5, NULL),
(6, '50%', 1, 282, 6, NULL),
(7, '60%', 1, 283, 7, NULL),
(8, '70%', 1, 284, 8, NULL),
(9, '80%', 1, 285, 9, NULL),
(10, '90%', 1, 286, 10, NULL),
(11, '100%', 1, 287, 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_progress_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_progress_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_progress_seq`
--

INSERT INTO `vtiger_progress_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_project`
--

CREATE TABLE IF NOT EXISTS `vtiger_project` (
  `projectid` int(19) NOT NULL,
  `projectname` varchar(255) DEFAULT NULL,
  `project_no` varchar(100) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `targetenddate` date DEFAULT NULL,
  `actualenddate` date DEFAULT NULL,
  `targetbudget` varchar(255) DEFAULT NULL,
  `projecturl` varchar(255) DEFAULT NULL,
  `projectstatus` varchar(100) DEFAULT NULL,
  `projectpriority` varchar(100) DEFAULT NULL,
  `projecttype` varchar(100) DEFAULT NULL,
  `progress` varchar(100) DEFAULT NULL,
  `linktoaccountscontacts` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `isconvertedfrompotential` int(1) NOT NULL DEFAULT 0,
  `potentialid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectcf` (
  `projectid` int(11) NOT NULL,
  PRIMARY KEY (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectmilestone`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestone` (
  `projectmilestoneid` int(11) NOT NULL,
  `projectmilestonename` varchar(255) DEFAULT NULL,
  `projectmilestone_no` varchar(100) DEFAULT NULL,
  `projectmilestonedate` varchar(255) DEFAULT NULL,
  `projectid` varchar(100) DEFAULT NULL,
  `projectmilestonetype` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`projectmilestoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectmilestonecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonecf` (
  `projectmilestoneid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projectmilestoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectmilestonetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonetype` (
  `projectmilestonetypeid` int(11) NOT NULL,
  `projectmilestonetype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projectmilestonetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectmilestonetype`
--

INSERT INTO `vtiger_projectmilestonetype` (`projectmilestonetypeid`, `projectmilestonetype`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'administrative', 1, 238, 2, NULL),
(3, 'operative', 1, 239, 3, NULL),
(4, 'other', 1, 240, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectmilestonetype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectmilestonetype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectmilestonetype_seq`
--

INSERT INTO `vtiger_projectmilestonetype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectpriority` (
  `projectpriorityid` int(11) NOT NULL,
  `projectpriority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projectpriorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectpriority`
--

INSERT INTO `vtiger_projectpriority` (`projectpriorityid`, `projectpriority`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'low', 1, 274, 2, NULL),
(3, 'normal', 1, 275, 3, NULL),
(4, 'high', 1, 276, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectpriority_seq`
--

INSERT INTO `vtiger_projectpriority_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectstatus` (
  `projectstatusid` int(11) NOT NULL,
  `projectstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projectstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectstatus`
--

INSERT INTO `vtiger_projectstatus` (`projectstatusid`, `projectstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'prospecting', 1, 261, 2, NULL),
(3, 'initiated', 1, 262, 3, NULL),
(4, 'in progress', 1, 263, 4, NULL),
(5, 'waiting for feedback', 1, 264, 5, NULL),
(6, 'on hold', 1, 265, 6, NULL),
(7, 'completed', 1, 266, 7, NULL),
(8, 'delivered', 1, 267, 8, NULL),
(9, 'archived', 1, 268, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projectstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projectstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projectstatus_seq`
--

INSERT INTO `vtiger_projectstatus_seq` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttask`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttask` (
  `projecttaskid` int(11) NOT NULL,
  `projecttaskname` varchar(255) DEFAULT NULL,
  `projecttask_no` varchar(100) DEFAULT NULL,
  `projecttasktype` varchar(100) DEFAULT NULL,
  `projecttaskpriority` varchar(100) DEFAULT NULL,
  `projecttaskprogress` varchar(100) DEFAULT NULL,
  `projecttaskhours` varchar(255) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `projectid` varchar(100) DEFAULT NULL,
  `projecttasknumber` int(11) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `projecttaskstatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`projecttaskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskcf` (
  `projecttaskid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projecttaskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskpriority` (
  `projecttaskpriorityid` int(11) NOT NULL,
  `projecttaskpriority` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projecttaskpriorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttaskpriority`
--

INSERT INTO `vtiger_projecttaskpriority` (`projecttaskpriorityid`, `projecttaskpriority`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'low', 1, 246, 2, NULL),
(3, 'normal', 1, 247, 3, NULL),
(4, 'high', 1, 248, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttaskpriority_seq`
--

INSERT INTO `vtiger_projecttaskpriority_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskprogress`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskprogress` (
  `projecttaskprogressid` int(11) NOT NULL,
  `projecttaskprogress` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projecttaskprogressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttaskprogress`
--

INSERT INTO `vtiger_projecttaskprogress` (`projecttaskprogressid`, `projecttaskprogress`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, '10%', 1, 250, 2, NULL),
(3, '20%', 1, 251, 3, NULL),
(4, '30%', 1, 252, 4, NULL),
(5, '40%', 1, 253, 5, NULL),
(6, '50%', 1, 254, 6, NULL),
(7, '60%', 1, 255, 7, NULL),
(8, '70%', 1, 256, 8, NULL),
(9, '80%', 1, 257, 9, NULL),
(10, '90%', 1, 258, 10, NULL),
(11, '100%', 1, 259, 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskprogress_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskprogress_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttaskprogress_seq`
--

INSERT INTO `vtiger_projecttaskprogress_seq` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskstatus` (
  `projecttaskstatusid` int(11) NOT NULL,
  `projecttaskstatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projecttaskstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttaskstatus`
--

INSERT INTO `vtiger_projecttaskstatus` (`projecttaskstatusid`, `projecttaskstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Open', 0, 290, 2, NULL),
(3, 'In Progress', 0, 291, 3, NULL),
(4, 'Completed', 0, 292, 4, NULL),
(5, 'Deferred', 0, 293, 5, NULL),
(6, 'Canceled ', 0, 294, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttaskstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttaskstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttaskstatus_seq`
--

INSERT INTO `vtiger_projecttaskstatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttasktype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttasktype` (
  `projecttasktypeid` int(11) NOT NULL,
  `projecttasktype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projecttasktypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttasktype`
--

INSERT INTO `vtiger_projecttasktype` (`projecttasktypeid`, `projecttasktype`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'administrative', 1, 242, 2, NULL),
(3, 'operative', 1, 243, 3, NULL),
(4, 'other', 1, 244, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttasktype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttasktype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttasktype_seq`
--

INSERT INTO `vtiger_projecttasktype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttask_status_color`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttask_status_color` (
  `status` varchar(255) DEFAULT NULL,
  `defaultcolor` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttask_status_color`
--

INSERT INTO `vtiger_projecttask_status_color` (`status`, `defaultcolor`, `color`) VALUES
('Open', '#0099ff', NULL),
('In Progress', '#fdff00', NULL),
('Completed', '#3BBF67', NULL),
('Deferred', '#fbb11e', NULL),
('Canceled', '#660066', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttype` (
  `projecttypeid` int(11) NOT NULL,
  `projecttype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projecttypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttype`
--

INSERT INTO `vtiger_projecttype` (`projecttypeid`, `projecttype`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'administrative', 1, 270, 2, NULL),
(3, 'operative', 1, 271, 3, NULL),
(4, 'other', 1, 272, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_projecttype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_projecttype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_projecttype_seq`
--

INSERT INTO `vtiger_projecttype_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_purchaseorder`
--

CREATE TABLE IF NOT EXISTS `vtiger_purchaseorder` (
  `purchaseorderid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) DEFAULT NULL,
  `quoteid` int(19) DEFAULT NULL,
  `vendorid` int(19) DEFAULT NULL,
  `requisition_no` varchar(100) DEFAULT NULL,
  `purchaseorder_no` varchar(100) DEFAULT NULL,
  `tracking_no` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,8) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `total` decimal(25,8) DEFAULT NULL,
  `subtotal` decimal(25,8) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,8) DEFAULT NULL,
  `s_h_amount` decimal(25,8) DEFAULT NULL,
  `terms_conditions` text DEFAULT NULL,
  `postatus` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT 1.000,
  `compound_taxes_info` text DEFAULT NULL,
  `pre_tax_total` decimal(25,8) DEFAULT NULL,
  `paid` decimal(25,8) DEFAULT NULL,
  `balance` decimal(25,8) DEFAULT NULL,
  `s_h_percent` int(11) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `region_id` int(19) DEFAULT NULL,
  PRIMARY KEY (`purchaseorderid`),
  KEY `purchaseorder_vendorid_idx` (`vendorid`),
  KEY `purchaseorder_quoteid_idx` (`quoteid`),
  KEY `purchaseorder_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_purchaseordercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_purchaseordercf` (
  `purchaseorderid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`purchaseorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_qcm_category`
--

CREATE TABLE IF NOT EXISTS `vtiger_qcm_category` (
  `qcm_categoryid` int(11) NOT NULL,
  `qcm_category` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`qcm_categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_qcm_category`
--

INSERT INTO `vtiger_qcm_category` (`qcm_categoryid`, `qcm_category`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'IT', 1, 318, 1, NULL),
(2, 'RD', 1, 319, 2, NULL),
(3, 'Sale Marketing', 1, 320, 3, NULL),
(4, 'Service', 1, 321, 4, NULL),
(5, 'System', 1, 322, 5, NULL),
(6, 'Manager', 1, 323, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_qcm_category_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_qcm_category_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_qcm_category_seq`
--

INSERT INTO `vtiger_qcm_category_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_qcm_classify`
--

CREATE TABLE IF NOT EXISTS `vtiger_qcm_classify` (
  `qcm_classifyid` int(11) NOT NULL,
  `qcm_classify` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`qcm_classifyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_qcm_classify`
--

INSERT INTO `vtiger_qcm_classify` (`qcm_classifyid`, `qcm_classify`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Role', 1, 324, 1, NULL),
(2, 'Responsibility', 1, 325, 2, NULL),
(3, 'Skill', 1, 326, 3, NULL),
(4, 'Knowledge', 1, 327, 4, NULL),
(5, 'Experience', 1, 328, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_qcm_classify_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_qcm_classify_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_qcm_classify_seq`
--

INSERT INTO `vtiger_qcm_classify_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_qcm_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_qcm_status` (
  `qcm_statusid` int(11) NOT NULL,
  `qcm_status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`qcm_statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_qcm_status`
--

INSERT INTO `vtiger_qcm_status` (`qcm_statusid`, `qcm_status`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Active', 1, 329, 1, NULL),
(2, 'Inactive', 1, 330, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_qcm_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_qcm_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_qcm_status_seq`
--

INSERT INTO `vtiger_qcm_status_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotes`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotes` (
  `quoteid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) DEFAULT NULL,
  `potentialid` int(19) DEFAULT NULL,
  `quotestage` varchar(200) DEFAULT NULL,
  `validtill` date DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `quote_no` varchar(100) DEFAULT NULL,
  `subtotal` decimal(25,8) DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `inventorymanager` int(19) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,8) DEFAULT NULL,
  `total` decimal(25,8) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,8) DEFAULT NULL,
  `s_h_amount` decimal(25,8) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT 1.000,
  `compound_taxes_info` text DEFAULT NULL,
  `pre_tax_total` decimal(25,8) DEFAULT NULL,
  `s_h_percent` int(11) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `region_id` int(19) DEFAULT NULL,
  PRIMARY KEY (`quoteid`),
  KEY `quote_quotestage_idx` (`quotestage`),
  KEY `quotes_potentialid_idx` (`potentialid`),
  KEY `quotes_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotesbillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotesbillads` (
  `quotebilladdressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`quotebilladdressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotescf`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotescf` (
  `quoteid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`quoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotesshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotesshipads` (
  `quoteshipaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`quoteshipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotestage`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestage` (
  `quotestageid` int(19) NOT NULL,
  `quotestage` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`quotestageid`),
  UNIQUE KEY `quotestage_quotestage_idx` (`quotestage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_quotestage`
--

INSERT INTO `vtiger_quotestage` (`quotestageid`, `quotestage`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Created', 0, 139, 0, NULL),
(2, 'Delivered', 0, 140, 1, NULL),
(3, 'Reviewed', 0, 141, 2, NULL),
(4, 'Accepted', 0, 142, 3, NULL),
(5, 'Rejected', 0, 143, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotestagehistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestagehistory` (
  `historyid` int(19) NOT NULL,
  `quoteid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `quotestage` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `quotestagehistory_quoteid_idx` (`quoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quotestage_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_quotestage_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_quotestage_seq`
--

INSERT INTO `vtiger_quotestage_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quytrinhbanhang`
--

CREATE TABLE IF NOT EXISTS `vtiger_quytrinhbanhang` (
  `quytrinhbanhangid` int(19) NOT NULL,
  `tenquytrinh` varchar(255) DEFAULT NULL,
  `motachitiet` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`quytrinhbanhangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_quytrinhbanhangcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_quytrinhbanhangcf` (
  `quytrinhbanhangid` int(19) NOT NULL,
  `cf_1278` varchar(255) DEFAULT '',
  `cf_1280` decimal(5,2) DEFAULT NULL,
  `cf_1284` text DEFAULT NULL,
  `cf_1286` varchar(255) DEFAULT '',
  PRIMARY KEY (`quytrinhbanhangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rating`
--

CREATE TABLE IF NOT EXISTS `vtiger_rating` (
  `rating_id` int(19) NOT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_rating`
--

INSERT INTO `vtiger_rating` (`rating_id`, `rating`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Acquired', 1, 145, 1, NULL),
(3, 'Active', 1, 146, 2, NULL),
(4, 'Market Failed', 1, 147, 3, NULL),
(5, 'Project Cancelled', 1, 148, 4, NULL),
(6, 'Shutdown', 1, 149, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rating_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_rating_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_rating_seq`
--

INSERT INTO `vtiger_rating_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurringevents`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringevents` (
  `recurringid` int(19) NOT NULL,
  `activityid` int(19) NOT NULL,
  `recurringdate` date DEFAULT NULL,
  `recurringtype` varchar(30) DEFAULT NULL,
  `recurringfreq` int(19) DEFAULT NULL,
  `recurringinfo` varchar(50) DEFAULT NULL,
  `recurringenddate` date DEFAULT NULL,
  PRIMARY KEY (`recurringid`),
  KEY `fk_1_vtiger_recurringevents` (`activityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurringtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringtype` (
  `recurringeventid` int(19) NOT NULL,
  `recurringtype` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`recurringeventid`),
  UNIQUE KEY `recurringtype_status_idx` (`recurringtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_recurringtype`
--

INSERT INTO `vtiger_recurringtype` (`recurringeventid`, `recurringtype`, `sortorderid`, `presence`, `color`) VALUES
(2, 'Daily', 1, 1, NULL),
(3, 'Weekly', 2, 1, NULL),
(4, 'Monthly', 3, 1, NULL),
(5, 'Yearly', 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurringtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurringtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_recurringtype_seq`
--

INSERT INTO `vtiger_recurringtype_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurring_frequency`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurring_frequency` (
  `recurring_frequency_id` int(11) DEFAULT NULL,
  `recurring_frequency` varchar(200) DEFAULT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_recurring_frequency`
--

INSERT INTO `vtiger_recurring_frequency` (`recurring_frequency_id`, `recurring_frequency`, `sortorderid`, `presence`, `color`) VALUES
(2, 'Daily', 1, 1, NULL),
(3, 'Weekly', 2, 1, NULL),
(4, 'Monthly', 3, 1, NULL),
(5, 'Quarterly', 4, 1, NULL),
(6, 'Yearly', 5, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_recurring_frequency_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_recurring_frequency_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_recurring_frequency_seq`
--

INSERT INTO `vtiger_recurring_frequency_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relatedlists`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists` (
  `relation_id` int(19) NOT NULL,
  `tabid` int(10) DEFAULT NULL,
  `related_tabid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sequence` int(10) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `presence` int(10) NOT NULL DEFAULT 0,
  `actions` varchar(50) NOT NULL DEFAULT '',
  `relationfieldid` int(19) DEFAULT NULL,
  `source` varchar(25) DEFAULT NULL,
  `relationtype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `relatedlists_relation_id_idx` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_relatedlists`
--

INSERT INTO `vtiger_relatedlists` (`relation_id`, `tabid`, `related_tabid`, `name`, `sequence`, `label`, `presence`, `actions`, `relationfieldid`, `source`, `relationtype`) VALUES
(1, 6, 4, 'get_contacts', 2, 'Contacts', 0, 'add', 72, '', '1:N'),
(2, 6, 2, 'get_opportunities', 3, 'Potentials', 0, 'add', 113, '', '1:N'),
(3, 6, 20, 'get_quotes', 4, 'Quotes', 0, 'add', 330, '', '1:N'),
(4, 6, 22, 'get_salesorder', 5, 'Sales Order', 0, 'add', 409, '', '1:N'),
(5, 6, 23, 'get_invoices', 6, 'Invoice', 0, 'add', 452, '', '1:N'),
(6, 6, 9, 'get_activities', 7, 'Activities', 0, 'add', 238, '', '1:N'),
(7, 6, 10, 'get_emails', 8, 'Emails', 0, 'add', NULL, '', 'N:N'),
(8, 6, 9, 'get_history', 9, 'Activity History', 0, 'add', 238, '', '1:N'),
(9, 6, 8, 'get_attachments', 10, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(10, 6, 13, 'get_tickets', 11, 'HelpDesk', 0, 'add', 157, '', '1:N'),
(11, 6, 14, 'get_products', 12, 'Products', 0, 'select', NULL, '', 'N:N'),
(12, 7, 9, 'get_activities', 2, 'Activities', 0, 'add', 238, '', '1:N'),
(13, 7, 10, 'get_emails', 3, 'Emails', 0, 'add', NULL, '', 'N:N'),
(14, 7, 9, 'get_history', 4, 'Activity History', 0, 'add', 238, '', '1:N'),
(15, 7, 8, 'get_attachments', 5, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(16, 7, 14, 'get_products', 6, 'Products', 0, 'select', NULL, '', 'N:N'),
(17, 7, 26, 'get_campaigns', 7, 'Campaigns', 0, 'select', NULL, '', 'N:N'),
(18, 4, 2, 'get_opportunities', 2, 'Potentials', 0, 'add', 740, '', '1:N'),
(19, 4, 9, 'get_activities', 3, 'Activities', 0, 'add', 239, '', '1:N'),
(20, 4, 10, 'get_emails', 4, 'Emails', 0, 'add', NULL, '', 'N:N'),
(21, 4, 13, 'get_tickets', 5, 'HelpDesk', 0, 'add', 741, '', '1:N'),
(22, 4, 20, 'get_quotes', 6, 'Quotes', 0, 'add', 319, '', '1:N'),
(23, 4, 21, 'get_purchase_orders', 7, 'Purchase Order', 0, 'add', 356, '', '1:N'),
(24, 4, 22, 'get_salesorder', 8, 'Sales Order', 0, 'add', 395, '', '1:N'),
(25, 4, 14, 'get_products', 9, 'Products', 0, 'select', NULL, '', 'N:N'),
(26, 4, 9, 'get_history', 10, 'Activity History', 0, 'add', 239, '', '1:N'),
(27, 4, 8, 'get_attachments', 11, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(28, 4, 26, 'get_campaigns', 12, 'Campaigns', 0, 'select', NULL, '', 'N:N'),
(29, 4, 23, 'get_invoices', 13, 'Invoice', 0, 'add', 439, '', '1:N'),
(30, 2, 9, 'get_activities', 2, 'Activities', 0, 'add', 238, '', '1:N'),
(31, 2, 4, 'get_contacts', 3, 'Contacts', 0, 'select', NULL, '', 'N:N'),
(32, 2, 14, 'get_products', 4, 'Products', 0, 'select', NULL, '', 'N:N'),
(33, 2, 0, 'get_stage_history', 5, 'Sales Stage History', 0, '', NULL, '', 'N:N'),
(34, 2, 8, 'get_attachments', 6, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(35, 2, 20, 'get_Quotes', 7, 'Quotes', 0, 'add', 316, '', '1:N'),
(36, 2, 22, 'get_salesorder', 8, 'Sales Order', 0, 'add', 391, '', '1:N'),
(37, 2, 9, 'get_history', 9, 'Activity History', 0, '', 238, '', '1:N'),
(38, 14, 13, 'get_tickets', 1, 'HelpDesk', 0, 'add', 159, '', '1:N'),
(39, 14, 8, 'get_attachments', 3, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(40, 14, 20, 'get_quotes', 4, 'Quotes', 0, 'add', 703, '', '1:N'),
(41, 14, 21, 'get_purchase_orders', 5, 'Purchase Order', 0, 'add', 694, '', '1:N'),
(42, 14, 22, 'get_salesorder', 6, 'Sales Order', 0, 'add', 685, '', '1:N'),
(43, 14, 23, 'get_invoices', 7, 'Invoice', 0, 'add', 676, '', '1:N'),
(44, 14, 19, 'get_product_pricebooks', 8, 'PriceBooks', 0, 'ADD,SELECT', NULL, '', 'N:N'),
(45, 14, 7, 'get_leads', 9, 'Leads', 0, 'select', NULL, '', 'N:N'),
(46, 14, 6, 'get_accounts', 10, 'Accounts', 0, 'select', NULL, '', 'N:N'),
(47, 14, 4, 'get_contacts', 11, 'Contacts', 0, 'select', NULL, '', 'N:N'),
(48, 14, 2, 'get_opportunities', 12, 'Potentials', 0, 'select', NULL, '', 'N:N'),
(49, 14, 14, 'get_products', 13, 'Product Bundles', 0, 'add,select', NULL, '', 'N:N'),
(50, 14, 14, 'get_parent_products', 14, 'Parent Product', 0, '', NULL, '', 'N:N'),
(51, 10, 4, 'get_contacts', 1, 'Contacts', 0, 'select,bulkmail', NULL, '', 'N:N'),
(52, 10, 0, 'get_users', 2, 'Users', 0, '', NULL, '', 'N:N'),
(53, 10, 8, 'get_attachments', 3, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(54, 13, 9, 'get_activities', 2, 'Activities', 0, 'add', 238, '', '1:N'),
(55, 13, 8, 'get_attachments', 3, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(56, 13, 0, 'get_ticket_history', 4, 'Ticket History', 0, '', NULL, '', 'N:N'),
(57, 13, 9, 'get_history', 5, 'Activity History', 0, 'add', 238, '', '1:N'),
(58, 19, 14, 'get_pricebook_products', 2, 'Products', 0, 'select', NULL, '', 'N:N'),
(59, 18, 14, 'get_products', 1, 'Products', 0, 'add,select', 185, '', '1:N'),
(60, 18, 21, 'get_purchase_orders', 2, 'Purchase Order', 0, 'add', 353, '', '1:N'),
(61, 18, 4, 'get_contacts', 3, 'Contacts', 0, 'select', NULL, '', 'N:N'),
(62, 18, 10, 'get_emails', 4, 'Emails', 0, 'add', NULL, '', 'N:N'),
(63, 20, 22, 'get_salesorder', 1, 'Sales Order', 0, '', 393, '', '1:N'),
(64, 20, 9, 'get_activities', 2, 'Activities', 0, 'add', NULL, '', 'N:N'),
(65, 20, 8, 'get_attachments', 3, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(66, 20, 9, 'get_history', 4, 'Activity History', 0, '', NULL, '', 'N:N'),
(67, 20, 0, 'get_quotestagehistory', 5, 'Quote Stage History', 0, '', NULL, '', 'N:N'),
(68, 21, 9, 'get_activities', 1, 'Activities', 0, 'add', NULL, '', 'N:N'),
(69, 21, 8, 'get_attachments', 2, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(70, 21, 9, 'get_history', 3, 'Activity History', 0, '', NULL, '', 'N:N'),
(71, 21, 0, 'get_postatushistory', 4, 'PurchaseOrder Status History', 0, '', NULL, '', 'N:N'),
(72, 22, 9, 'get_activities', 1, 'Activities', 0, 'add', NULL, '', 'N:N'),
(73, 22, 8, 'get_attachments', 2, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(74, 22, 23, 'get_invoices', 3, 'Invoice', 0, '', 437, '', '1:N'),
(75, 22, 9, 'get_history', 4, 'Activity History', 0, '', NULL, '', 'N:N'),
(76, 22, 0, 'get_sostatushistory', 5, 'SalesOrder Status History', 0, '', NULL, '', 'N:N'),
(77, 23, 9, 'get_activities', 1, 'Activities', 0, 'add', NULL, '', 'N:N'),
(78, 23, 8, 'get_attachments', 2, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(79, 23, 9, 'get_history', 3, 'Activity History', 0, '', NULL, '', 'N:N'),
(80, 23, 0, 'get_invoicestatushistory', 4, 'Invoice Status History', 0, '', NULL, '', 'N:N'),
(81, 9, 0, 'get_users', 1, 'Users', 0, '', NULL, '', 'N:N'),
(82, 9, 4, 'get_contacts', 2, 'Contacts', 0, '', NULL, '', 'N:N'),
(83, 26, 4, 'get_contacts', 1, 'Contacts', 0, 'add,select', NULL, '', 'N:N'),
(84, 26, 7, 'get_leads', 2, 'Leads', 0, 'add,select', NULL, '', 'N:N'),
(85, 26, 2, 'get_opportunities', 3, 'Potentials', 0, 'add', 121, '', '1:N'),
(86, 26, 9, 'get_activities', 4, 'Activities', 0, 'add', 238, '', '1:N'),
(87, 6, 26, 'get_campaigns', 14, 'Campaigns', 0, 'select', NULL, '', 'N:N'),
(88, 26, 6, 'get_accounts', 5, 'Accounts', 0, 'add,select', NULL, '', 'N:N'),
(89, 15, 8, 'get_attachments', 2, 'Documents', 0, 'add,select', NULL, '', 'N:N'),
(92, 6, 34, 'get_merged_list', 15, 'PBXManager', 0, '', 535, NULL, '1:N'),
(93, 35, 13, 'get_related_list', 1, 'Service Requests', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(94, 35, 8, 'get_attachments', 2, 'Documents', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(95, 6, 35, 'get_merged_list', 16, 'Service Contracts', 0, 'ADD', 549, NULL, '1:N'),
(96, 4, 35, 'get_dependents_list', 15, 'Service Contracts', 0, 'ADD', 549, NULL, '1:N'),
(97, 13, 35, 'get_related_list', 6, 'Service Contracts', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(98, 36, 13, 'get_related_list', 1, 'HelpDesk', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(99, 36, 20, 'get_quotes', 2, 'Quotes', 0, 'ADD', 703, NULL, '1:N'),
(100, 36, 21, 'get_purchase_orders', 3, 'Purchase Order', 0, 'ADD', 694, NULL, '1:N'),
(101, 36, 22, 'get_salesorder', 4, 'Sales Order', 0, 'ADD', 685, NULL, '1:N'),
(102, 36, 23, 'get_invoices', 5, 'Invoice', 0, 'ADD', 676, NULL, '1:N'),
(103, 36, 19, 'get_service_pricebooks', 6, 'PriceBooks', 0, 'ADD', NULL, NULL, 'N:N'),
(104, 36, 7, 'get_related_list', 7, 'Leads', 0, 'SELECT', NULL, NULL, 'N:N'),
(105, 36, 6, 'get_related_list', 8, 'Accounts', 0, 'SELECT', NULL, NULL, 'N:N'),
(106, 36, 4, 'get_related_list', 9, 'Contacts', 0, 'SELECT', NULL, NULL, 'N:N'),
(107, 36, 2, 'get_related_list', 10, 'Potentials', 0, 'SELECT', NULL, NULL, 'N:N'),
(108, 36, 8, 'get_attachments', 11, 'Documents', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(109, 13, 36, 'get_related_list', 7, 'Services', 0, 'SELECT', NULL, NULL, 'N:N'),
(110, 7, 36, 'get_related_list', 9, 'Services', 0, 'SELECT', NULL, NULL, 'N:N'),
(111, 6, 36, 'get_related_list', 17, 'Services', 0, 'SELECT', NULL, NULL, 'N:N'),
(112, 4, 36, 'get_related_list', 16, 'Services', 0, 'SELECT', NULL, NULL, 'N:N'),
(113, 2, 36, 'get_related_list', 10, 'Services', 0, 'SELECT', NULL, NULL, 'N:N'),
(114, 19, 36, 'get_pricebook_services', 3, 'Services', 0, 'SELECT', NULL, NULL, 'N:N'),
(115, 38, 13, 'get_related_list', 1, 'HelpDesk', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(116, 38, 8, 'get_attachments', 2, 'Documents', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(117, 6, 38, 'get_merged_list', 18, 'Assets', 0, 'ADD', 600, NULL, '1:N'),
(118, 14, 38, 'get_dependents_list', 15, 'Assets', 0, 'ADD', 589, NULL, '1:N'),
(119, 23, 38, 'get_dependents_list', 5, 'Assets', 0, 'ADD', 595, NULL, '1:N'),
(120, 7, 42, 'get_comments', 10, 'ModComments', 0, '', 613, NULL, '1:N'),
(121, 4, 42, 'get_comments', 17, 'ModComments', 0, '', 613, NULL, '1:N'),
(122, 6, 42, 'get_comments', 19, 'ModComments', 0, '', 613, NULL, '1:N'),
(123, 2, 42, 'get_comments', 11, 'ModComments', 0, '', 613, NULL, '1:N'),
(131, 6, 45, 'get_merged_list', 20, 'Projects', 0, 'add', 654, NULL, '1:N'),
(132, 4, 45, 'get_dependents_list', 18, 'Projects', 0, 'add', 654, NULL, '1:N'),
(133, 13, 45, 'get_related_list', 8, 'Projects', 0, 'SELECT', NULL, NULL, 'N:N'),
(135, 47, 6, 'get_related_list', 1, 'Accounts', 0, ' ', NULL, NULL, 'N:N'),
(136, 47, 4, 'get_related_list', 2, 'Contacts', 0, ' ', NULL, NULL, 'N:N'),
(137, 47, 7, 'get_related_list', 3, 'Leads', 0, ' ', NULL, NULL, 'N:N'),
(138, 44, 8, 'get_attachments', 2, 'Documents', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(139, 44, 42, 'get_comments', 3, 'ModComments', 0, '', 613, NULL, '1:N'),
(140, 45, 44, 'get_dependents_list', 2, 'Project Tasks', 0, 'ADD', 633, NULL, '1:N'),
(141, 45, 43, 'get_dependents_list', 3, 'Project Milestones', 0, 'ADD', 619, NULL, '1:N'),
(142, 45, 8, 'get_attachments', 4, 'Documents', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(143, 45, 13, 'get_related_list', 5, 'HelpDesk', 0, 'ADD,SELECT', NULL, NULL, 'N:N'),
(144, 45, 0, 'get_gantt_chart', 6, 'Charts', 0, '', NULL, NULL, 'N:N'),
(145, 45, 42, 'get_comments', 7, 'ModComments', 0, '', 613, NULL, '1:N'),
(146, 13, 42, 'get_comments', 9, 'ModComments', 0, '', 613, NULL, '1:N'),
(147, 15, 42, 'get_comments', 3, 'ModComments', 0, '', 613, NULL, '1:N'),
(148, 4, 38, 'get_dependents_list', 19, 'Assets', 0, 'ADD', 601, NULL, '1:N'),
(149, 4, 18, 'get_vendors', 20, 'Vendors', 0, 'SELECT', NULL, '', 'N:N'),
(150, 2, 23, 'get_dependents_list', 12, 'Invoice', 0, 'ADD', 774, NULL, '1:N'),
(151, 8, 4, 'get_related_list', 1, 'Contacts', 0, '1', NULL, NULL, 'N:N'),
(152, 8, 6, 'get_related_list', 2, 'Accounts', 0, '1', NULL, NULL, 'N:N'),
(153, 8, 2, 'get_related_list', 3, 'Potentials', 0, '1', NULL, NULL, 'N:N'),
(154, 8, 7, 'get_related_list', 4, 'Leads', 0, '1', NULL, NULL, 'N:N'),
(155, 8, 14, 'get_related_list', 5, 'Products', 0, '1', NULL, NULL, 'N:N'),
(156, 8, 36, 'get_related_list', 6, 'Services', 0, '1', NULL, NULL, 'N:N'),
(157, 8, 45, 'get_related_list', 7, 'Project', 0, '1', NULL, NULL, 'N:N'),
(158, 8, 38, 'get_related_list', 8, 'Assets', 0, '1', NULL, NULL, 'N:N'),
(159, 8, 35, 'get_related_list', 9, 'ServiceContracts', 0, '1', NULL, NULL, 'N:N'),
(160, 8, 20, 'get_related_list', 10, 'Quotes', 0, '1', NULL, NULL, 'N:N'),
(161, 8, 23, 'get_related_list', 11, 'Invoice', 0, '1', NULL, NULL, 'N:N'),
(162, 8, 22, 'get_related_list', 12, 'SalesOrder', 0, '1', NULL, NULL, 'N:N'),
(163, 8, 21, 'get_related_list', 13, 'PurchaseOrder', 0, '1', NULL, NULL, 'N:N'),
(164, 8, 13, 'get_related_list', 14, 'HelpDesk', 0, '1', NULL, NULL, 'N:N'),
(165, 8, 15, 'get_related_list', 15, 'Faq', 0, '1', NULL, NULL, 'N:N'),
(166, 45, 10, 'get_emails', 8, 'Emails', 0, 'ADD', NULL, NULL, 'N:N'),
(167, 44, 10, 'get_emails', 4, 'Emails', 0, 'ADD', NULL, NULL, 'N:N'),
(168, 45, 9, 'get_related_list', 9, 'Activities', 0, 'ADD', NULL, NULL, NULL),
(169, 45, 20, 'get_related_list', 10, 'Quotes', 0, 'SELECT', NULL, NULL, NULL),
(170, 14, 21, 'get_purchase_orders', 16, 'PurchaseOrder', 0, 'ADD', NULL, NULL, NULL),
(171, 59, 59, 'get_related_list', 1, 'History', 0, 'ADD', NULL, NULL, NULL),
(172, 59, 8, 'get_attachments', 2, 'Documents', 0, 'ADD,SELECT', NULL, NULL, NULL),
(173, 61, 8, 'get_attachments', 1, 'Documents', 0, 'SELECT,ADD', NULL, NULL, NULL),
(174, 61, 9, 'get_related_list', 2, 'Activities', 0, 'SELECT,ADD', NULL, NULL, NULL),
(175, 61, 10, 'get_emails', 3, 'Emails', 0, 'ADD', NULL, NULL, NULL),
(176, 61, 57, 'get_related_list', 4, 'QCM', 0, 'SELECT,ADD', NULL, NULL, NULL),
(177, 61, 56, 'get_related_list', 5, 'JD', 0, 'SELECT,ADD', NULL, NULL, NULL),
(178, 61, 58, 'get_related_list', 6, 'KPI', 0, 'ADD', NULL, NULL, NULL),
(179, 61, 60, 'get_related_list', 7, 'Leave', 0, '', NULL, NULL, NULL),
(180, 61, 54, 'get_related_list', 8, 'Salary', 0, 'ADD', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relatedlists_rb`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists_rb` (
  `entityid` int(19) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `rel_table` varchar(200) DEFAULT NULL,
  `rel_column` varchar(200) DEFAULT NULL,
  `ref_column` varchar(200) DEFAULT NULL,
  `related_crm_ids` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relatedlists_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_relatedlists_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_relatedlists_seq`
--

INSERT INTO `vtiger_relatedlists_seq` (`id`) VALUES
(185);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relcriteria`
--

CREATE TABLE IF NOT EXISTS `vtiger_relcriteria` (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `comparator` varchar(20) DEFAULT NULL,
  `value` varchar(512) DEFAULT NULL,
  `groupid` int(11) DEFAULT 1,
  `column_condition` varchar(256) DEFAULT 'and',
  PRIMARY KEY (`queryid`,`columnindex`),
  KEY `relcriteria_queryid_idx` (`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_relcriteria`
--

INSERT INTO `vtiger_relcriteria` (`queryid`, `columnindex`, `columnname`, `comparator`, `value`, `groupid`, `column_condition`) VALUES
(1, 0, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V', 'n', '', 1, 'and'),
(2, 0, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V', 'e', '', 1, 'and'),
(3, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V', 'n', '', 1, 'and'),
(7, 0, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V', 'e', 'Closed Won', 1, 'and'),
(12, 0, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V', 'n', 'Closed', 1, 'and'),
(15, 0, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V', 'n', 'Accepted', 1, 'and'),
(15, 1, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V', 'n', 'Rejected', 1, 'and'),
(22, 0, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V', 'n', '', 1, 'and'),
(23, 0, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V', 'n', '', 1, 'and'),
(24, 0, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V', 'n', '', 1, 'and'),
(25, 0, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V', 'n', '', 1, 'and');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_relcriteria_grouping`
--

CREATE TABLE IF NOT EXISTS `vtiger_relcriteria_grouping` (
  `groupid` int(11) NOT NULL,
  `queryid` int(19) NOT NULL,
  `group_condition` varchar(256) DEFAULT NULL,
  `condition_expression` text DEFAULT NULL,
  PRIMARY KEY (`groupid`,`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_relcriteria_grouping`
--

INSERT INTO `vtiger_relcriteria_grouping` (`groupid`, `queryid`, `group_condition`, `condition_expression`) VALUES
(1, 1, '', '0'),
(1, 2, '', '0'),
(1, 3, '', '0'),
(1, 7, '', '0'),
(1, 12, '', '0'),
(1, 15, '', '0 and 1'),
(1, 22, '', '0'),
(1, 23, '', '0'),
(1, 24, '', '0'),
(1, 25, '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reminder_interval`
--

CREATE TABLE IF NOT EXISTS `vtiger_reminder_interval` (
  `reminder_intervalid` int(19) NOT NULL,
  `reminder_interval` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL,
  `presence` int(1) NOT NULL,
  PRIMARY KEY (`reminder_intervalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reminder_interval`
--

INSERT INTO `vtiger_reminder_interval` (`reminder_intervalid`, `reminder_interval`, `sortorderid`, `presence`) VALUES
(2, '1 Minute', 1, 1),
(3, '5 Minutes', 2, 1),
(4, '15 Minutes', 3, 1),
(5, '30 Minutes', 4, 1),
(6, '45 Minutes', 5, 1),
(7, '1 Hour', 6, 1),
(8, '1 Day', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reminder_interval_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_reminder_interval_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reminder_interval_seq`
--

INSERT INTO `vtiger_reminder_interval_seq` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_report`
--

CREATE TABLE IF NOT EXISTS `vtiger_report` (
  `reportid` int(19) NOT NULL,
  `folderid` int(19) NOT NULL,
  `reportname` varchar(100) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `reporttype` varchar(50) DEFAULT '',
  `queryid` int(19) NOT NULL DEFAULT 0,
  `state` varchar(50) DEFAULT 'SAVED',
  `customizable` int(1) DEFAULT 1,
  `category` int(11) DEFAULT 1,
  `owner` int(11) DEFAULT 1,
  `sharingtype` varchar(200) DEFAULT 'Private',
  PRIMARY KEY (`reportid`),
  KEY `report_queryid_idx` (`queryid`),
  KEY `report_folderid_idx` (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_report`
--

INSERT INTO `vtiger_report` (`reportid`, `folderid`, `reportname`, `description`, `reporttype`, `queryid`, `state`, `customizable`, `category`, `owner`, `sharingtype`) VALUES
(1, 1, 'Contacts by Accounts', 'Contacts related to Accounts', 'tabular', 1, 'CUSTOM', 1, 1, 1, 'Public'),
(2, 1, 'Contacts without Accounts', 'Contacts not related to Accounts', 'tabular', 2, 'CUSTOM', 1, 1, 1, 'Public'),
(3, 1, 'Contacts by Potentials', 'Contacts related to Potentials', 'tabular', 3, 'CUSTOM', 1, 1, 1, 'Public'),
(4, 2, 'Lead by Source', 'Lead by Source', 'summary', 4, 'CUSTOM', 1, 1, 1, 'Public'),
(5, 2, 'Lead Status Report', 'Lead Status Report', 'summary', 5, 'CUSTOM', 1, 1, 1, 'Public'),
(6, 3, 'Potential Pipeline', 'Potential Pipeline', 'summary', 6, 'CUSTOM', 1, 1, 1, 'Public'),
(7, 3, 'Closed Potentials', 'Potential that have Won', 'tabular', 7, 'CUSTOM', 1, 1, 1, 'Public'),
(8, 4, 'Last Month Activities', 'Last Month Activities', 'tabular', 8, 'CUSTOM', 1, 1, 1, 'Public'),
(9, 4, 'This Month Activities', 'This Month Activities', 'tabular', 9, 'CUSTOM', 1, 1, 1, 'Public'),
(10, 5, 'Tickets by Products', 'Tickets related to Products', 'tabular', 10, 'CUSTOM', 1, 1, 1, 'Public'),
(11, 5, 'Tickets by Priority', 'Tickets by Priority', 'summary', 11, 'CUSTOM', 1, 1, 1, 'Public'),
(12, 5, 'Open Tickets', 'Tickets that are Open', 'tabular', 12, 'CUSTOM', 1, 1, 1, 'Public'),
(13, 6, 'Product Details', 'Product Detailed Report', 'tabular', 13, 'CUSTOM', 1, 1, 1, 'Public'),
(14, 6, 'Products by Contacts', 'Products related to Contacts', 'tabular', 14, 'CUSTOM', 1, 1, 1, 'Public'),
(15, 7, 'Open Quotes', 'Quotes that are Open', 'tabular', 15, 'CUSTOM', 1, 1, 1, 'Public'),
(16, 7, 'Quotes Detailed Report', 'Quotes Detailed Report', 'tabular', 16, 'CUSTOM', 1, 1, 1, 'Public'),
(17, 8, 'PurchaseOrder by Contacts', 'PurchaseOrder related to Contacts', 'tabular', 17, 'CUSTOM', 1, 1, 1, 'Public'),
(18, 8, 'PurchaseOrder Detailed Report', 'PurchaseOrder Detailed Report', 'tabular', 18, 'CUSTOM', 1, 1, 1, 'Public'),
(19, 9, 'Invoice Detailed Report', 'Invoice Detailed Report', 'tabular', 19, 'CUSTOM', 1, 1, 1, 'Public'),
(20, 10, 'SalesOrder Detailed Report', 'SalesOrder Detailed Report', 'tabular', 20, 'CUSTOM', 1, 1, 1, 'Public'),
(21, 11, 'Campaign Expectations and Actuals', 'Campaign Expectations and Actuals', 'tabular', 21, 'CUSTOM', 1, 1, 1, 'Public'),
(22, 12, 'Contacts Email Report', 'Emails sent to Contacts', 'tabular', 22, 'CUSTOM', 1, 1, 1, 'Public'),
(23, 12, 'Accounts Email Report', 'Emails sent to Organizations', 'tabular', 23, 'CUSTOM', 1, 1, 1, 'Public'),
(24, 12, 'Leads Email Report', 'Emails sent to Leads', 'tabular', 24, 'CUSTOM', 1, 1, 1, 'Public'),
(25, 12, 'Vendors Email Report', 'Emails sent to Vendors', 'tabular', 25, 'CUSTOM', 1, 1, 1, 'Public');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportdatefilter`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportdatefilter` (
  `datefilterid` int(19) NOT NULL,
  `datecolumnname` varchar(250) DEFAULT '',
  `datefilter` varchar(250) DEFAULT '',
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`datefilterid`),
  KEY `reportdatefilter_datefilterid_idx` (`datefilterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportdatefilter`
--

INSERT INTO `vtiger_reportdatefilter` (`datefilterid`, `datecolumnname`, `datefilter`, `startdate`, `enddate`) VALUES
(8, 'vtiger_crmentity:modifiedtime:modifiedtime:Calendar_Modified_Time', 'lastmonth', '2005-05-01', '2005-05-31'),
(9, 'vtiger_crmentity:modifiedtime:modifiedtime:Calendar_Modified_Time', 'thismonth', '2005-06-01', '2005-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportfilters`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportfilters` (
  `filterid` int(19) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportfilters`
--

INSERT INTO `vtiger_reportfilters` (`filterid`, `name`) VALUES
(1, 'Private'),
(2, 'Public'),
(3, 'Shared');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportfolder`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportfolder` (
  `folderid` int(19) NOT NULL,
  `foldername` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `state` varchar(50) DEFAULT 'SAVED',
  PRIMARY KEY (`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportfolder`
--

INSERT INTO `vtiger_reportfolder` (`folderid`, `foldername`, `description`, `state`) VALUES
(1, 'Organization and Contact Reports', 'Account and Contact Reports', 'SAVED'),
(2, 'Lead Reports', 'Lead Reports', 'SAVED'),
(3, 'Opportunity Reports', 'Potential Reports', 'SAVED'),
(4, 'Activity Reports', 'Activity Reports', 'SAVED'),
(5, 'Tickets Reports', 'HelpDesk Reports', 'SAVED'),
(6, 'Product Reports', 'Product Reports', 'SAVED'),
(7, 'Quote Reports', 'Quote Reports', 'SAVED'),
(8, 'Purchase Order Reports', 'PurchaseOrder Reports', 'SAVED'),
(9, 'Invoice Reports', 'Invoice Reports', 'SAVED'),
(10, 'Sales Order Reports', 'SalesOrder Reports', 'SAVED'),
(11, 'Campaign Reports', 'Campaign Reports', 'SAVED'),
(12, 'Email Reports', 'Email Reports', 'SAVED');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportgroupbycolumn`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportgroupbycolumn` (
  `reportid` int(19) DEFAULT NULL,
  `sortid` int(19) DEFAULT NULL,
  `sortcolname` varchar(250) DEFAULT NULL,
  `dategroupbycriteria` varchar(250) DEFAULT NULL,
  KEY `fk_1_vtiger_reportgroupbycolumn` (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportmodules`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportmodules` (
  `reportmodulesid` int(19) NOT NULL,
  `primarymodule` varchar(100) DEFAULT NULL,
  `secondarymodules` varchar(250) DEFAULT '',
  PRIMARY KEY (`reportmodulesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportmodules`
--

INSERT INTO `vtiger_reportmodules` (`reportmodulesid`, `primarymodule`, `secondarymodules`) VALUES
(1, 'Contacts', 'Accounts'),
(2, 'Contacts', 'Accounts'),
(3, 'Contacts', 'Potentials'),
(4, 'Leads', ''),
(5, 'Leads', ''),
(6, 'Potentials', ''),
(7, 'Potentials', ''),
(8, 'Calendar', ''),
(9, 'Calendar', ''),
(10, 'HelpDesk', 'Products'),
(11, 'HelpDesk', ''),
(12, 'HelpDesk', ''),
(13, 'Products', ''),
(14, 'Products', 'Contacts'),
(15, 'Quotes', ''),
(16, 'Quotes', ''),
(17, 'PurchaseOrder', 'Contacts'),
(18, 'PurchaseOrder', ''),
(19, 'Invoice', ''),
(20, 'SalesOrder', ''),
(21, 'Campaigns', ''),
(22, 'Contacts', 'Emails'),
(23, 'Accounts', 'Emails'),
(24, 'Leads', 'Emails'),
(25, 'Vendors', 'Emails');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportsharing`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsharing` (
  `reportid` int(19) NOT NULL,
  `shareid` int(19) NOT NULL,
  `setype` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportsortcol`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsortcol` (
  `sortcolid` int(19) NOT NULL,
  `reportid` int(19) NOT NULL,
  `columnname` varchar(250) DEFAULT '',
  `sortorder` varchar(250) DEFAULT 'Asc',
  PRIMARY KEY (`sortcolid`,`reportid`),
  KEY `fk_1_vtiger_reportsortcol` (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_reportsortcol`
--

INSERT INTO `vtiger_reportsortcol` (`sortcolid`, `reportid`, `columnname`, `sortorder`) VALUES
(1, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V', 'Ascending'),
(1, 5, 'vtiger_leaddetails:leadstatus:Leads_Lead_Status:leadstatus:V', 'Ascending'),
(1, 6, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V', 'Ascending'),
(1, 11, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V', 'Ascending');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reportsummary`
--

CREATE TABLE IF NOT EXISTS `vtiger_reportsummary` (
  `reportsummaryid` int(19) NOT NULL,
  `summarytype` int(19) NOT NULL,
  `columnname` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`reportsummaryid`,`summarytype`,`columnname`),
  KEY `reportsummary_reportsummaryid_idx` (`reportsummaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_reporttype`
--

CREATE TABLE IF NOT EXISTS `vtiger_reporttype` (
  `reportid` int(10) NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_report_sharegroups`
--

CREATE TABLE IF NOT EXISTS `vtiger_report_sharegroups` (
  `reportid` int(25) NOT NULL,
  `groupid` int(25) NOT NULL,
  KEY `vtiger_report_sharegroups_ibfk_1` (`reportid`),
  KEY `vtiger_groups_groupid_ibfk_1` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_report_sharerole`
--

CREATE TABLE IF NOT EXISTS `vtiger_report_sharerole` (
  `reportid` int(25) NOT NULL,
  `roleid` varchar(255) NOT NULL,
  KEY `vtiger_report_sharerole_ibfk_1` (`reportid`),
  KEY `vtiger_role_roleid_ibfk_1` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_report_sharers`
--

CREATE TABLE IF NOT EXISTS `vtiger_report_sharers` (
  `reportid` int(25) NOT NULL,
  `rsid` varchar(255) NOT NULL,
  KEY `vtiger_report_sharers_ibfk_1` (`reportid`),
  KEY `vtiger_rolesd_rsid_ibfk_1` (`rsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_report_shareusers`
--

CREATE TABLE IF NOT EXISTS `vtiger_report_shareusers` (
  `reportid` int(25) NOT NULL,
  `userid` int(25) NOT NULL,
  KEY `vtiger_report_shareusers_ibfk_1` (`reportid`),
  KEY `vtiger_users_userid_ibfk_1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_role`
--

CREATE TABLE IF NOT EXISTS `vtiger_role` (
  `roleid` varchar(255) NOT NULL,
  `rolename` varchar(200) DEFAULT NULL,
  `parentrole` varchar(255) DEFAULT NULL,
  `depth` int(19) DEFAULT NULL,
  `allowassignedrecordsto` int(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_role`
--

INSERT INTO `vtiger_role` (`roleid`, `rolename`, `parentrole`, `depth`, `allowassignedrecordsto`) VALUES
('H1', 'Organization', 'H1', 0, 1),
('H2', 'CEO', 'H1::H2', 1, 1),
('H3', 'Vice President', 'H1::H2::H3', 2, 1),
('H4', 'Sales Manager', 'H1::H2::H3::H4', 3, 1),
('H5', 'Sales Person', 'H1::H2::H3::H4::H5', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_role2picklist`
--

CREATE TABLE IF NOT EXISTS `vtiger_role2picklist` (
  `roleid` varchar(255) NOT NULL,
  `picklistvalueid` int(11) NOT NULL,
  `picklistid` int(11) NOT NULL,
  `sortid` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleid`,`picklistvalueid`,`picklistid`),
  KEY `role2picklist_roleid_picklistid_idx` (`roleid`,`picklistid`,`picklistvalueid`),
  KEY `fk_2_vtiger_role2picklist` (`picklistid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_role2picklist`
--

INSERT INTO `vtiger_role2picklist` (`roleid`, `picklistvalueid`, `picklistid`, `sortid`) VALUES
('H1', 1, 1, 0),
('H1', 2, 1, 1),
('H1', 3, 1, 2),
('H1', 4, 1, 3),
('H1', 5, 1, 4),
('H1', 6, 1, 5),
('H1', 7, 1, 6),
('H1', 8, 1, 7),
('H1', 9, 1, 8),
('H1', 10, 1, 9),
('H1', 11, 1, 10),
('H1', 12, 2, 0),
('H1', 13, 2, 1),
('H1', 14, 3, 0),
('H1', 15, 3, 1),
('H1', 16, 3, 2),
('H1', 17, 3, 3),
('H1', 18, 3, 4),
('H1', 19, 3, 5),
('H1', 20, 4, 0),
('H1', 21, 4, 1),
('H1', 22, 4, 2),
('H1', 23, 4, 3),
('H1', 24, 4, 4),
('H1', 25, 4, 5),
('H1', 26, 4, 6),
('H1', 27, 4, 7),
('H1', 28, 4, 8),
('H1', 29, 4, 9),
('H1', 30, 4, 10),
('H1', 31, 4, 11),
('H1', 32, 4, 12),
('H1', 33, 5, 0),
('H1', 34, 5, 1),
('H1', 35, 5, 2),
('H1', 36, 5, 3),
('H1', 37, 5, 4),
('H1', 38, 6, 0),
('H1', 39, 6, 1),
('H1', 40, 6, 2),
('H1', 41, 7, 0),
('H1', 42, 7, 1),
('H1', 43, 7, 2),
('H1', 44, 7, 3),
('H1', 45, 7, 4),
('H1', 46, 8, 0),
('H1', 47, 9, 0),
('H1', 48, 9, 1),
('H1', 49, 9, 2),
('H1', 50, 9, 3),
('H1', 51, 10, 0),
('H1', 52, 10, 1),
('H1', 53, 10, 2),
('H1', 54, 10, 3),
('H1', 55, 10, 4),
('H1', 56, 10, 5),
('H1', 57, 10, 6),
('H1', 58, 10, 7),
('H1', 59, 10, 8),
('H1', 60, 11, 0),
('H1', 61, 11, 1),
('H1', 62, 11, 2),
('H1', 63, 11, 3),
('H1', 64, 11, 4),
('H1', 65, 11, 5),
('H1', 66, 11, 6),
('H1', 67, 11, 7),
('H1', 68, 11, 8),
('H1', 69, 11, 9),
('H1', 70, 11, 10),
('H1', 71, 11, 11),
('H1', 72, 11, 12),
('H1', 73, 11, 13),
('H1', 74, 11, 14),
('H1', 75, 11, 15),
('H1', 76, 11, 16),
('H1', 77, 11, 17),
('H1', 78, 11, 18),
('H1', 79, 11, 19),
('H1', 80, 11, 20),
('H1', 81, 11, 21),
('H1', 82, 11, 22),
('H1', 83, 11, 23),
('H1', 84, 11, 24),
('H1', 85, 11, 25),
('H1', 86, 11, 26),
('H1', 87, 11, 27),
('H1', 88, 11, 28),
('H1', 89, 11, 29),
('H1', 90, 11, 30),
('H1', 91, 11, 31),
('H1', 92, 12, 0),
('H1', 93, 12, 1),
('H1', 94, 12, 2),
('H1', 95, 12, 3),
('H1', 96, 12, 4),
('H1', 97, 12, 5),
('H1', 98, 13, 0),
('H1', 99, 13, 1),
('H1', 100, 13, 2),
('H1', 101, 13, 3),
('H1', 102, 13, 4),
('H1', 103, 13, 5),
('H1', 104, 13, 6),
('H1', 105, 13, 7),
('H1', 106, 13, 8),
('H1', 107, 13, 9),
('H1', 108, 13, 10),
('H1', 109, 13, 11),
('H1', 110, 13, 12),
('H1', 111, 14, 0),
('H1', 112, 14, 1),
('H1', 113, 14, 2),
('H1', 114, 14, 3),
('H1', 115, 14, 4),
('H1', 116, 14, 5),
('H1', 117, 14, 6),
('H1', 118, 14, 7),
('H1', 119, 14, 8),
('H1', 120, 14, 9),
('H1', 121, 14, 10),
('H1', 122, 14, 11),
('H1', 123, 15, 0),
('H1', 124, 15, 1),
('H1', 125, 15, 2),
('H1', 126, 15, 3),
('H1', 127, 16, 0),
('H1', 128, 16, 1),
('H1', 129, 16, 2),
('H1', 130, 17, 0),
('H1', 131, 17, 1),
('H1', 132, 17, 2),
('H1', 133, 17, 3),
('H1', 134, 17, 4),
('H1', 135, 18, 0),
('H1', 136, 18, 1),
('H1', 137, 18, 2),
('H1', 138, 18, 3),
('H1', 139, 19, 0),
('H1', 140, 19, 1),
('H1', 141, 19, 2),
('H1', 142, 19, 3),
('H1', 143, 19, 4),
('H1', 144, 20, 0),
('H1', 145, 20, 1),
('H1', 146, 20, 2),
('H1', 147, 20, 3),
('H1', 148, 20, 4),
('H1', 149, 20, 5),
('H1', 150, 21, 0),
('H1', 151, 21, 1),
('H1', 152, 21, 2),
('H1', 153, 21, 3),
('H1', 154, 21, 4),
('H1', 155, 21, 5),
('H1', 156, 21, 6),
('H1', 157, 21, 7),
('H1', 158, 21, 8),
('H1', 159, 21, 9),
('H1', 160, 22, 0),
('H1', 161, 22, 1),
('H1', 162, 22, 2),
('H1', 163, 22, 3),
('H1', 164, 22, 4),
('H1', 165, 22, 5),
('H1', 166, 23, 0),
('H1', 167, 23, 1),
('H1', 168, 23, 2),
('H1', 169, 23, 3),
('H1', 170, 24, 0),
('H1', 171, 24, 1),
('H1', 172, 24, 2),
('H1', 173, 25, 0),
('H1', 174, 25, 1),
('H1', 175, 25, 2),
('H1', 176, 25, 3),
('H1', 177, 25, 4),
('H1', 178, 25, 5),
('H1', 179, 26, 0),
('H1', 180, 26, 1),
('H1', 181, 26, 2),
('H1', 182, 27, 0),
('H1', 183, 27, 1),
('H1', 184, 27, 2),
('H1', 185, 27, 3),
('H1', 186, 28, 0),
('H1', 187, 28, 1),
('H1', 188, 28, 2),
('H1', 189, 28, 3),
('H1', 190, 29, 0),
('H1', 191, 29, 1),
('H1', 192, 29, 2),
('H1', 193, 29, 3),
('H1', 194, 30, 0),
('H1', 195, 30, 1),
('H1', 196, 30, 2),
('H1', 197, 30, 3),
('H1', 198, 30, 4),
('H1', 199, 30, 5),
('H1', 200, 30, 6),
('H1', 201, 30, 7),
('H1', 202, 30, 8),
('H1', 203, 30, 9),
('H1', 204, 30, 10),
('H1', 205, 30, 11),
('H1', 206, 30, 12),
('H1', 207, 30, 13),
('H1', 208, 30, 14),
('H1', 209, 30, 15),
('H1', 210, 31, 1),
('H1', 211, 31, 2),
('H1', 212, 31, 3),
('H1', 213, 31, 4),
('H1', 214, 32, 1),
('H1', 215, 32, 2),
('H1', 216, 32, 3),
('H1', 217, 32, 4),
('H1', 218, 32, 5),
('H1', 219, 32, 6),
('H1', 220, 33, 1),
('H1', 221, 33, 2),
('H1', 222, 33, 3),
('H1', 223, 34, 1),
('H1', 224, 34, 2),
('H1', 225, 34, 3),
('H1', 226, 35, 1),
('H1', 227, 35, 2),
('H1', 228, 35, 3),
('H1', 229, 36, 1),
('H1', 230, 36, 2),
('H1', 231, 36, 3),
('H1', 232, 36, 4),
('H1', 233, 36, 5),
('H1', 234, 36, 6),
('H1', 235, 37, 1),
('H1', 236, 37, 2),
('H1', 237, 38, 1),
('H1', 238, 38, 2),
('H1', 239, 38, 3),
('H1', 240, 38, 4),
('H1', 241, 39, 1),
('H1', 242, 39, 2),
('H1', 243, 39, 3),
('H1', 244, 39, 4),
('H1', 245, 40, 1),
('H1', 246, 40, 2),
('H1', 247, 40, 3),
('H1', 248, 40, 4),
('H1', 249, 41, 1),
('H1', 250, 41, 2),
('H1', 251, 41, 3),
('H1', 252, 41, 4),
('H1', 253, 41, 5),
('H1', 254, 41, 6),
('H1', 255, 41, 7),
('H1', 256, 41, 8),
('H1', 257, 41, 9),
('H1', 258, 41, 10),
('H1', 259, 41, 11),
('H1', 260, 42, 1),
('H1', 261, 42, 2),
('H1', 262, 42, 3),
('H1', 263, 42, 4),
('H1', 264, 42, 5),
('H1', 265, 42, 6),
('H1', 266, 42, 7),
('H1', 267, 42, 8),
('H1', 268, 42, 9),
('H1', 269, 43, 1),
('H1', 270, 43, 2),
('H1', 271, 43, 3),
('H1', 272, 43, 4),
('H1', 273, 44, 1),
('H1', 274, 44, 2),
('H1', 275, 44, 3),
('H1', 276, 44, 4),
('H1', 277, 45, 1),
('H1', 278, 45, 2),
('H1', 279, 45, 3),
('H1', 280, 45, 4),
('H1', 281, 45, 5),
('H1', 282, 45, 6),
('H1', 283, 45, 7),
('H1', 284, 45, 8),
('H1', 285, 45, 9),
('H1', 286, 45, 10),
('H1', 287, 45, 11),
('H1', 288, 12, 1),
('H1', 289, 46, 1),
('H1', 290, 46, 2),
('H1', 291, 46, 3),
('H1', 292, 46, 4),
('H1', 293, 46, 5),
('H1', 294, 46, 6),
('H1', 295, 2, 1),
('H1', 296, 47, 1),
('H1', 297, 47, 2),
('H1', 298, 47, 3),
('H1', 299, 48, 1),
('H1', 300, 48, 2),
('H1', 303, 49, 1),
('H1', 304, 49, 2),
('H1', 305, 50, 1),
('H1', 306, 50, 2),
('H1', 307, 51, 1),
('H1', 308, 51, 2),
('H1', 309, 51, 3),
('H1', 310, 51, 4),
('H1', 311, 51, 5),
('H1', 312, 51, 6),
('H1', 313, 52, 1),
('H1', 314, 52, 2),
('H1', 315, 52, 3),
('H1', 316, 52, 4),
('H1', 317, 52, 5),
('H1', 318, 53, 1),
('H1', 319, 53, 2),
('H1', 320, 53, 3),
('H1', 321, 53, 4),
('H1', 322, 53, 5),
('H1', 323, 53, 6),
('H1', 324, 54, 1),
('H1', 325, 54, 2),
('H1', 326, 54, 3),
('H1', 327, 54, 4),
('H1', 328, 54, 5),
('H1', 329, 55, 1),
('H1', 330, 55, 2),
('H1', 331, 56, 1),
('H1', 332, 57, 1),
('H1', 333, 57, 2),
('H1', 334, 57, 3),
('H1', 335, 57, 4),
('H1', 336, 57, 5),
('H1', 337, 57, 6),
('H1', 338, 58, 1),
('H1', 339, 58, 2),
('H1', 340, 58, 3),
('H1', 341, 58, 4),
('H1', 342, 58, 5),
('H1', 343, 59, 1),
('H1', 344, 59, 2),
('H1', 345, 59, 3),
('H1', 346, 59, 4),
('H1', 347, 59, 5),
('H1', 348, 60, 1),
('H1', 349, 60, 2),
('H1', 350, 60, 3),
('H1', 351, 60, 4),
('H1', 352, 60, 5),
('H1', 353, 60, 6),
('H1', 354, 60, 7),
('H1', 355, 60, 8),
('H1', 356, 60, 9),
('H1', 357, 60, 10),
('H1', 358, 60, 11),
('H1', 359, 60, 12),
('H1', 360, 60, 13),
('H1', 361, 61, 1),
('H1', 362, 61, 2),
('H1', 363, 61, 3),
('H1', 364, 61, 4),
('H1', 365, 61, 5),
('H1', 366, 62, 1),
('H1', 367, 62, 2),
('H1', 368, 63, 1),
('H1', 369, 63, 2),
('H1', 370, 64, 1),
('H1', 371, 64, 2),
('H1', 372, 64, 3),
('H1', 373, 64, 4),
('H1', 374, 64, 5),
('H1', 375, 65, 1),
('H1', 376, 65, 2),
('H1', 377, 66, 1),
('H1', 378, 66, 2),
('H1', 379, 66, 3),
('H1', 380, 66, 4),
('H1', 381, 66, 5),
('H1', 382, 66, 6),
('H1', 383, 66, 7),
('H1', 384, 66, 8),
('H1', 385, 66, 9),
('H2', 1, 1, 0),
('H2', 2, 1, 1),
('H2', 3, 1, 2),
('H2', 4, 1, 3),
('H2', 5, 1, 4),
('H2', 6, 1, 5),
('H2', 7, 1, 6),
('H2', 8, 1, 7),
('H2', 9, 1, 8),
('H2', 10, 1, 9),
('H2', 11, 1, 10),
('H2', 12, 2, 0),
('H2', 13, 2, 1),
('H2', 14, 3, 0),
('H2', 15, 3, 1),
('H2', 16, 3, 2),
('H2', 17, 3, 3),
('H2', 18, 3, 4),
('H2', 19, 3, 5),
('H2', 20, 4, 0),
('H2', 21, 4, 1),
('H2', 22, 4, 2),
('H2', 23, 4, 3),
('H2', 24, 4, 4),
('H2', 25, 4, 5),
('H2', 26, 4, 6),
('H2', 27, 4, 7),
('H2', 28, 4, 8),
('H2', 29, 4, 9),
('H2', 30, 4, 10),
('H2', 31, 4, 11),
('H2', 32, 4, 12),
('H2', 33, 5, 0),
('H2', 34, 5, 1),
('H2', 35, 5, 2),
('H2', 36, 5, 3),
('H2', 37, 5, 4),
('H2', 38, 6, 0),
('H2', 39, 6, 1),
('H2', 40, 6, 2),
('H2', 41, 7, 0),
('H2', 42, 7, 1),
('H2', 43, 7, 2),
('H2', 44, 7, 3),
('H2', 45, 7, 4),
('H2', 46, 8, 0),
('H2', 47, 9, 0),
('H2', 48, 9, 1),
('H2', 49, 9, 2),
('H2', 50, 9, 3),
('H2', 51, 10, 0),
('H2', 52, 10, 1),
('H2', 53, 10, 2),
('H2', 54, 10, 3),
('H2', 55, 10, 4),
('H2', 56, 10, 5),
('H2', 57, 10, 6),
('H2', 58, 10, 7),
('H2', 59, 10, 8),
('H2', 60, 11, 0),
('H2', 61, 11, 1),
('H2', 62, 11, 2),
('H2', 63, 11, 3),
('H2', 64, 11, 4),
('H2', 65, 11, 5),
('H2', 66, 11, 6),
('H2', 67, 11, 7),
('H2', 68, 11, 8),
('H2', 69, 11, 9),
('H2', 70, 11, 10),
('H2', 71, 11, 11),
('H2', 72, 11, 12),
('H2', 73, 11, 13),
('H2', 74, 11, 14),
('H2', 75, 11, 15),
('H2', 76, 11, 16),
('H2', 77, 11, 17),
('H2', 78, 11, 18),
('H2', 79, 11, 19),
('H2', 80, 11, 20),
('H2', 81, 11, 21),
('H2', 82, 11, 22),
('H2', 83, 11, 23),
('H2', 84, 11, 24),
('H2', 85, 11, 25),
('H2', 86, 11, 26),
('H2', 87, 11, 27),
('H2', 88, 11, 28),
('H2', 89, 11, 29),
('H2', 90, 11, 30),
('H2', 91, 11, 31),
('H2', 92, 12, 0),
('H2', 93, 12, 1),
('H2', 94, 12, 2),
('H2', 95, 12, 3),
('H2', 96, 12, 4),
('H2', 97, 12, 5),
('H2', 98, 13, 0),
('H2', 99, 13, 1),
('H2', 100, 13, 2),
('H2', 101, 13, 3),
('H2', 102, 13, 4),
('H2', 103, 13, 5),
('H2', 104, 13, 6),
('H2', 105, 13, 7),
('H2', 106, 13, 8),
('H2', 107, 13, 9),
('H2', 108, 13, 10),
('H2', 109, 13, 11),
('H2', 110, 13, 12),
('H2', 111, 14, 0),
('H2', 112, 14, 1),
('H2', 113, 14, 2),
('H2', 114, 14, 3),
('H2', 115, 14, 4),
('H2', 116, 14, 5),
('H2', 117, 14, 6),
('H2', 118, 14, 7),
('H2', 119, 14, 8),
('H2', 120, 14, 9),
('H2', 121, 14, 10),
('H2', 122, 14, 11),
('H2', 123, 15, 0),
('H2', 124, 15, 1),
('H2', 125, 15, 2),
('H2', 126, 15, 3),
('H2', 127, 16, 0),
('H2', 128, 16, 1),
('H2', 129, 16, 2),
('H2', 130, 17, 0),
('H2', 131, 17, 1),
('H2', 132, 17, 2),
('H2', 133, 17, 3),
('H2', 134, 17, 4),
('H2', 135, 18, 0),
('H2', 136, 18, 1),
('H2', 137, 18, 2),
('H2', 138, 18, 3),
('H2', 139, 19, 0),
('H2', 140, 19, 1),
('H2', 141, 19, 2),
('H2', 142, 19, 3),
('H2', 143, 19, 4),
('H2', 144, 20, 0),
('H2', 145, 20, 1),
('H2', 146, 20, 2),
('H2', 147, 20, 3),
('H2', 148, 20, 4),
('H2', 149, 20, 5),
('H2', 150, 21, 0),
('H2', 151, 21, 1),
('H2', 152, 21, 2),
('H2', 153, 21, 3),
('H2', 154, 21, 4),
('H2', 155, 21, 5),
('H2', 156, 21, 6),
('H2', 157, 21, 7),
('H2', 158, 21, 8),
('H2', 159, 21, 9),
('H2', 160, 22, 0),
('H2', 161, 22, 1),
('H2', 162, 22, 2),
('H2', 163, 22, 3),
('H2', 164, 22, 4),
('H2', 165, 22, 5),
('H2', 166, 23, 0),
('H2', 167, 23, 1),
('H2', 168, 23, 2),
('H2', 169, 23, 3),
('H2', 170, 24, 0),
('H2', 171, 24, 1),
('H2', 172, 24, 2),
('H2', 173, 25, 0),
('H2', 174, 25, 1),
('H2', 175, 25, 2),
('H2', 176, 25, 3),
('H2', 177, 25, 4),
('H2', 178, 25, 5),
('H2', 179, 26, 0),
('H2', 180, 26, 1),
('H2', 181, 26, 2),
('H2', 182, 27, 0),
('H2', 183, 27, 1),
('H2', 184, 27, 2),
('H2', 185, 27, 3),
('H2', 186, 28, 0),
('H2', 187, 28, 1),
('H2', 188, 28, 2),
('H2', 189, 28, 3),
('H2', 190, 29, 0),
('H2', 191, 29, 1),
('H2', 192, 29, 2),
('H2', 193, 29, 3),
('H2', 194, 30, 0),
('H2', 195, 30, 1),
('H2', 196, 30, 2),
('H2', 197, 30, 3),
('H2', 198, 30, 4),
('H2', 199, 30, 5),
('H2', 200, 30, 6),
('H2', 201, 30, 7),
('H2', 202, 30, 8),
('H2', 203, 30, 9),
('H2', 204, 30, 10),
('H2', 205, 30, 11),
('H2', 206, 30, 12),
('H2', 207, 30, 13),
('H2', 208, 30, 14),
('H2', 209, 30, 15),
('H2', 210, 31, 1),
('H2', 211, 31, 2),
('H2', 212, 31, 3),
('H2', 213, 31, 4),
('H2', 214, 32, 1),
('H2', 215, 32, 2),
('H2', 216, 32, 3),
('H2', 217, 32, 4),
('H2', 218, 32, 5),
('H2', 219, 32, 6),
('H2', 220, 33, 1),
('H2', 221, 33, 2),
('H2', 222, 33, 3),
('H2', 223, 34, 1),
('H2', 224, 34, 2),
('H2', 225, 34, 3),
('H2', 226, 35, 1),
('H2', 227, 35, 2),
('H2', 228, 35, 3),
('H2', 229, 36, 1),
('H2', 230, 36, 2),
('H2', 231, 36, 3),
('H2', 232, 36, 4),
('H2', 233, 36, 5),
('H2', 234, 36, 6),
('H2', 235, 37, 1),
('H2', 236, 37, 2),
('H2', 237, 38, 1),
('H2', 238, 38, 2),
('H2', 239, 38, 3),
('H2', 240, 38, 4),
('H2', 241, 39, 1),
('H2', 242, 39, 2),
('H2', 243, 39, 3),
('H2', 244, 39, 4),
('H2', 245, 40, 1),
('H2', 246, 40, 2),
('H2', 247, 40, 3),
('H2', 248, 40, 4),
('H2', 249, 41, 1),
('H2', 250, 41, 2),
('H2', 251, 41, 3),
('H2', 252, 41, 4),
('H2', 253, 41, 5),
('H2', 254, 41, 6),
('H2', 255, 41, 7),
('H2', 256, 41, 8),
('H2', 257, 41, 9),
('H2', 258, 41, 10),
('H2', 259, 41, 11),
('H2', 260, 42, 1),
('H2', 261, 42, 2),
('H2', 262, 42, 3),
('H2', 263, 42, 4),
('H2', 264, 42, 5),
('H2', 265, 42, 6),
('H2', 266, 42, 7),
('H2', 267, 42, 8),
('H2', 268, 42, 9),
('H2', 269, 43, 1),
('H2', 270, 43, 2),
('H2', 271, 43, 3),
('H2', 272, 43, 4),
('H2', 273, 44, 1),
('H2', 274, 44, 2),
('H2', 275, 44, 3),
('H2', 276, 44, 4),
('H2', 277, 45, 1),
('H2', 278, 45, 2),
('H2', 279, 45, 3),
('H2', 280, 45, 4),
('H2', 281, 45, 5),
('H2', 282, 45, 6),
('H2', 283, 45, 7),
('H2', 284, 45, 8),
('H2', 285, 45, 9),
('H2', 286, 45, 10),
('H2', 287, 45, 11),
('H2', 288, 12, 1),
('H2', 289, 46, 1),
('H2', 290, 46, 2),
('H2', 291, 46, 3),
('H2', 292, 46, 4),
('H2', 293, 46, 5),
('H2', 294, 46, 6),
('H2', 295, 2, 1),
('H2', 296, 47, 1),
('H2', 297, 47, 2),
('H2', 298, 47, 3),
('H2', 299, 48, 1),
('H2', 300, 48, 2),
('H2', 303, 49, 1),
('H2', 304, 49, 2),
('H2', 305, 50, 1),
('H2', 306, 50, 2),
('H2', 307, 51, 1),
('H2', 308, 51, 2),
('H2', 309, 51, 3),
('H2', 310, 51, 4),
('H2', 311, 51, 5),
('H2', 312, 51, 6),
('H2', 313, 52, 1),
('H2', 314, 52, 2),
('H2', 315, 52, 3),
('H2', 316, 52, 4),
('H2', 317, 52, 5),
('H2', 318, 53, 1),
('H2', 319, 53, 2),
('H2', 320, 53, 3),
('H2', 321, 53, 4),
('H2', 322, 53, 5),
('H2', 323, 53, 6),
('H2', 324, 54, 1),
('H2', 325, 54, 2),
('H2', 326, 54, 3),
('H2', 327, 54, 4),
('H2', 328, 54, 5),
('H2', 329, 55, 1),
('H2', 330, 55, 2),
('H2', 331, 56, 1),
('H2', 332, 57, 1),
('H2', 333, 57, 2),
('H2', 334, 57, 3),
('H2', 335, 57, 4),
('H2', 336, 57, 5),
('H2', 337, 57, 6),
('H2', 338, 58, 1),
('H2', 339, 58, 2),
('H2', 340, 58, 3),
('H2', 341, 58, 4),
('H2', 342, 58, 5),
('H2', 343, 59, 1),
('H2', 344, 59, 2),
('H2', 345, 59, 3),
('H2', 346, 59, 4),
('H2', 347, 59, 5),
('H2', 348, 60, 1),
('H2', 349, 60, 2),
('H2', 350, 60, 3),
('H2', 351, 60, 4),
('H2', 352, 60, 5),
('H2', 353, 60, 6),
('H2', 354, 60, 7),
('H2', 355, 60, 8),
('H2', 356, 60, 9),
('H2', 357, 60, 10),
('H2', 358, 60, 11),
('H2', 359, 60, 12),
('H2', 360, 60, 13),
('H2', 361, 61, 1),
('H2', 362, 61, 2),
('H2', 363, 61, 3),
('H2', 364, 61, 4),
('H2', 365, 61, 5),
('H2', 366, 62, 1),
('H2', 367, 62, 2),
('H2', 368, 63, 1),
('H2', 369, 63, 2),
('H2', 370, 64, 1),
('H2', 371, 64, 2),
('H2', 372, 64, 3),
('H2', 373, 64, 4),
('H2', 374, 64, 5),
('H2', 375, 65, 1),
('H2', 376, 65, 2),
('H2', 377, 66, 1),
('H2', 378, 66, 2),
('H2', 379, 66, 3),
('H2', 380, 66, 4),
('H2', 381, 66, 5),
('H2', 382, 66, 6),
('H2', 383, 66, 7),
('H2', 384, 66, 8),
('H2', 385, 66, 9),
('H3', 1, 1, 0),
('H3', 2, 1, 1),
('H3', 3, 1, 2),
('H3', 4, 1, 3),
('H3', 5, 1, 4),
('H3', 6, 1, 5),
('H3', 7, 1, 6),
('H3', 8, 1, 7),
('H3', 9, 1, 8),
('H3', 10, 1, 9),
('H3', 11, 1, 10),
('H3', 12, 2, 0),
('H3', 13, 2, 1),
('H3', 14, 3, 0),
('H3', 15, 3, 1),
('H3', 16, 3, 2),
('H3', 17, 3, 3),
('H3', 18, 3, 4),
('H3', 19, 3, 5),
('H3', 20, 4, 0),
('H3', 21, 4, 1),
('H3', 22, 4, 2),
('H3', 23, 4, 3),
('H3', 24, 4, 4),
('H3', 25, 4, 5),
('H3', 26, 4, 6),
('H3', 27, 4, 7),
('H3', 28, 4, 8),
('H3', 29, 4, 9),
('H3', 30, 4, 10),
('H3', 31, 4, 11),
('H3', 32, 4, 12),
('H3', 33, 5, 0),
('H3', 34, 5, 1),
('H3', 35, 5, 2),
('H3', 36, 5, 3),
('H3', 37, 5, 4),
('H3', 38, 6, 0),
('H3', 39, 6, 1),
('H3', 40, 6, 2),
('H3', 41, 7, 0),
('H3', 42, 7, 1),
('H3', 43, 7, 2),
('H3', 44, 7, 3),
('H3', 45, 7, 4),
('H3', 46, 8, 0),
('H3', 47, 9, 0),
('H3', 48, 9, 1),
('H3', 49, 9, 2),
('H3', 50, 9, 3),
('H3', 51, 10, 0),
('H3', 52, 10, 1),
('H3', 53, 10, 2),
('H3', 54, 10, 3),
('H3', 55, 10, 4),
('H3', 56, 10, 5),
('H3', 57, 10, 6),
('H3', 58, 10, 7),
('H3', 59, 10, 8),
('H3', 60, 11, 0),
('H3', 61, 11, 1),
('H3', 62, 11, 2),
('H3', 63, 11, 3),
('H3', 64, 11, 4),
('H3', 65, 11, 5),
('H3', 66, 11, 6),
('H3', 67, 11, 7),
('H3', 68, 11, 8),
('H3', 69, 11, 9),
('H3', 70, 11, 10),
('H3', 71, 11, 11),
('H3', 72, 11, 12),
('H3', 73, 11, 13),
('H3', 74, 11, 14),
('H3', 75, 11, 15),
('H3', 76, 11, 16),
('H3', 77, 11, 17),
('H3', 78, 11, 18),
('H3', 79, 11, 19),
('H3', 80, 11, 20),
('H3', 81, 11, 21),
('H3', 82, 11, 22),
('H3', 83, 11, 23),
('H3', 84, 11, 24),
('H3', 85, 11, 25),
('H3', 86, 11, 26),
('H3', 87, 11, 27),
('H3', 88, 11, 28),
('H3', 89, 11, 29),
('H3', 90, 11, 30),
('H3', 91, 11, 31),
('H3', 92, 12, 0),
('H3', 93, 12, 1),
('H3', 94, 12, 2),
('H3', 95, 12, 3),
('H3', 96, 12, 4),
('H3', 97, 12, 5),
('H3', 98, 13, 0),
('H3', 99, 13, 1),
('H3', 100, 13, 2),
('H3', 101, 13, 3),
('H3', 102, 13, 4),
('H3', 103, 13, 5),
('H3', 104, 13, 6),
('H3', 105, 13, 7),
('H3', 106, 13, 8),
('H3', 107, 13, 9),
('H3', 108, 13, 10),
('H3', 109, 13, 11),
('H3', 110, 13, 12),
('H3', 111, 14, 0),
('H3', 112, 14, 1),
('H3', 113, 14, 2),
('H3', 114, 14, 3),
('H3', 115, 14, 4),
('H3', 116, 14, 5),
('H3', 117, 14, 6),
('H3', 118, 14, 7),
('H3', 119, 14, 8),
('H3', 120, 14, 9),
('H3', 121, 14, 10),
('H3', 122, 14, 11),
('H3', 123, 15, 0),
('H3', 124, 15, 1),
('H3', 125, 15, 2),
('H3', 126, 15, 3),
('H3', 127, 16, 0),
('H3', 128, 16, 1),
('H3', 129, 16, 2),
('H3', 130, 17, 0),
('H3', 131, 17, 1),
('H3', 132, 17, 2),
('H3', 133, 17, 3),
('H3', 134, 17, 4),
('H3', 135, 18, 0),
('H3', 136, 18, 1),
('H3', 137, 18, 2),
('H3', 138, 18, 3),
('H3', 139, 19, 0),
('H3', 140, 19, 1),
('H3', 141, 19, 2),
('H3', 142, 19, 3),
('H3', 143, 19, 4),
('H3', 144, 20, 0),
('H3', 145, 20, 1),
('H3', 146, 20, 2),
('H3', 147, 20, 3),
('H3', 148, 20, 4),
('H3', 149, 20, 5),
('H3', 150, 21, 0),
('H3', 151, 21, 1),
('H3', 152, 21, 2),
('H3', 153, 21, 3),
('H3', 154, 21, 4),
('H3', 155, 21, 5),
('H3', 156, 21, 6),
('H3', 157, 21, 7),
('H3', 158, 21, 8),
('H3', 159, 21, 9),
('H3', 160, 22, 0),
('H3', 161, 22, 1),
('H3', 162, 22, 2),
('H3', 163, 22, 3),
('H3', 164, 22, 4),
('H3', 165, 22, 5),
('H3', 166, 23, 0),
('H3', 167, 23, 1),
('H3', 168, 23, 2),
('H3', 169, 23, 3),
('H3', 170, 24, 0),
('H3', 171, 24, 1),
('H3', 172, 24, 2),
('H3', 173, 25, 0),
('H3', 174, 25, 1),
('H3', 175, 25, 2),
('H3', 176, 25, 3),
('H3', 177, 25, 4),
('H3', 178, 25, 5),
('H3', 179, 26, 0),
('H3', 180, 26, 1),
('H3', 181, 26, 2),
('H3', 182, 27, 0),
('H3', 183, 27, 1),
('H3', 184, 27, 2),
('H3', 185, 27, 3),
('H3', 186, 28, 0),
('H3', 187, 28, 1),
('H3', 188, 28, 2),
('H3', 189, 28, 3),
('H3', 190, 29, 0),
('H3', 191, 29, 1),
('H3', 192, 29, 2),
('H3', 193, 29, 3),
('H3', 194, 30, 0),
('H3', 195, 30, 1),
('H3', 196, 30, 2),
('H3', 197, 30, 3),
('H3', 198, 30, 4),
('H3', 199, 30, 5),
('H3', 200, 30, 6),
('H3', 201, 30, 7),
('H3', 202, 30, 8),
('H3', 203, 30, 9),
('H3', 204, 30, 10),
('H3', 205, 30, 11),
('H3', 206, 30, 12),
('H3', 207, 30, 13),
('H3', 208, 30, 14),
('H3', 209, 30, 15),
('H3', 210, 31, 1),
('H3', 211, 31, 2),
('H3', 212, 31, 3),
('H3', 213, 31, 4),
('H3', 214, 32, 1),
('H3', 215, 32, 2),
('H3', 216, 32, 3),
('H3', 217, 32, 4),
('H3', 218, 32, 5),
('H3', 219, 32, 6),
('H3', 220, 33, 1),
('H3', 221, 33, 2),
('H3', 222, 33, 3),
('H3', 223, 34, 1),
('H3', 224, 34, 2),
('H3', 225, 34, 3),
('H3', 226, 35, 1),
('H3', 227, 35, 2),
('H3', 228, 35, 3),
('H3', 229, 36, 1),
('H3', 230, 36, 2),
('H3', 231, 36, 3),
('H3', 232, 36, 4),
('H3', 233, 36, 5),
('H3', 234, 36, 6),
('H3', 235, 37, 1),
('H3', 236, 37, 2),
('H3', 237, 38, 1),
('H3', 238, 38, 2),
('H3', 239, 38, 3),
('H3', 240, 38, 4),
('H3', 241, 39, 1),
('H3', 242, 39, 2),
('H3', 243, 39, 3),
('H3', 244, 39, 4),
('H3', 245, 40, 1),
('H3', 246, 40, 2),
('H3', 247, 40, 3),
('H3', 248, 40, 4),
('H3', 249, 41, 1),
('H3', 250, 41, 2),
('H3', 251, 41, 3),
('H3', 252, 41, 4),
('H3', 253, 41, 5),
('H3', 254, 41, 6),
('H3', 255, 41, 7),
('H3', 256, 41, 8),
('H3', 257, 41, 9),
('H3', 258, 41, 10),
('H3', 259, 41, 11),
('H3', 260, 42, 1),
('H3', 261, 42, 2),
('H3', 262, 42, 3),
('H3', 263, 42, 4),
('H3', 264, 42, 5),
('H3', 265, 42, 6),
('H3', 266, 42, 7),
('H3', 267, 42, 8),
('H3', 268, 42, 9),
('H3', 269, 43, 1),
('H3', 270, 43, 2),
('H3', 271, 43, 3),
('H3', 272, 43, 4),
('H3', 273, 44, 1),
('H3', 274, 44, 2),
('H3', 275, 44, 3),
('H3', 276, 44, 4),
('H3', 277, 45, 1),
('H3', 278, 45, 2),
('H3', 279, 45, 3),
('H3', 280, 45, 4),
('H3', 281, 45, 5),
('H3', 282, 45, 6),
('H3', 283, 45, 7),
('H3', 284, 45, 8),
('H3', 285, 45, 9),
('H3', 286, 45, 10),
('H3', 287, 45, 11),
('H3', 288, 12, 1),
('H3', 289, 46, 1),
('H3', 290, 46, 2),
('H3', 291, 46, 3),
('H3', 292, 46, 4),
('H3', 293, 46, 5),
('H3', 294, 46, 6),
('H3', 295, 2, 1),
('H3', 296, 47, 1),
('H3', 297, 47, 2),
('H3', 298, 47, 3),
('H3', 299, 48, 1),
('H3', 300, 48, 2),
('H3', 303, 49, 1),
('H3', 304, 49, 2),
('H3', 305, 50, 1),
('H3', 306, 50, 2),
('H3', 307, 51, 1),
('H3', 308, 51, 2),
('H3', 309, 51, 3),
('H3', 310, 51, 4),
('H3', 311, 51, 5),
('H3', 312, 51, 6),
('H3', 313, 52, 1),
('H3', 314, 52, 2),
('H3', 315, 52, 3),
('H3', 316, 52, 4),
('H3', 317, 52, 5),
('H3', 318, 53, 1),
('H3', 319, 53, 2),
('H3', 320, 53, 3),
('H3', 321, 53, 4),
('H3', 322, 53, 5),
('H3', 323, 53, 6),
('H3', 324, 54, 1),
('H3', 325, 54, 2),
('H3', 326, 54, 3),
('H3', 327, 54, 4),
('H3', 328, 54, 5),
('H3', 329, 55, 1),
('H3', 330, 55, 2),
('H3', 331, 56, 1),
('H3', 332, 57, 1),
('H3', 333, 57, 2),
('H3', 334, 57, 3),
('H3', 335, 57, 4),
('H3', 336, 57, 5),
('H3', 337, 57, 6),
('H3', 338, 58, 1),
('H3', 339, 58, 2),
('H3', 340, 58, 3),
('H3', 341, 58, 4),
('H3', 342, 58, 5),
('H3', 343, 59, 1),
('H3', 344, 59, 2),
('H3', 345, 59, 3),
('H3', 346, 59, 4),
('H3', 347, 59, 5),
('H3', 348, 60, 1),
('H3', 349, 60, 2),
('H3', 350, 60, 3),
('H3', 351, 60, 4),
('H3', 352, 60, 5),
('H3', 353, 60, 6),
('H3', 354, 60, 7),
('H3', 355, 60, 8),
('H3', 356, 60, 9),
('H3', 357, 60, 10),
('H3', 358, 60, 11),
('H3', 359, 60, 12),
('H3', 360, 60, 13),
('H3', 361, 61, 1),
('H3', 362, 61, 2),
('H3', 363, 61, 3),
('H3', 364, 61, 4),
('H3', 365, 61, 5),
('H3', 366, 62, 1),
('H3', 367, 62, 2),
('H3', 368, 63, 1),
('H3', 369, 63, 2),
('H3', 370, 64, 1),
('H3', 371, 64, 2),
('H3', 372, 64, 3),
('H3', 373, 64, 4),
('H3', 374, 64, 5),
('H3', 375, 65, 1),
('H3', 376, 65, 2),
('H3', 377, 66, 1),
('H3', 378, 66, 2),
('H3', 379, 66, 3),
('H3', 380, 66, 4),
('H3', 381, 66, 5),
('H3', 382, 66, 6),
('H3', 383, 66, 7),
('H3', 384, 66, 8),
('H3', 385, 66, 9),
('H4', 1, 1, 0),
('H4', 2, 1, 1),
('H4', 3, 1, 2),
('H4', 4, 1, 3),
('H4', 5, 1, 4),
('H4', 6, 1, 5),
('H4', 7, 1, 6),
('H4', 8, 1, 7),
('H4', 9, 1, 8),
('H4', 10, 1, 9),
('H4', 11, 1, 10),
('H4', 12, 2, 0),
('H4', 13, 2, 1),
('H4', 14, 3, 0),
('H4', 15, 3, 1),
('H4', 16, 3, 2),
('H4', 17, 3, 3),
('H4', 18, 3, 4),
('H4', 19, 3, 5),
('H4', 20, 4, 0),
('H4', 21, 4, 1),
('H4', 22, 4, 2),
('H4', 23, 4, 3),
('H4', 24, 4, 4),
('H4', 25, 4, 5),
('H4', 26, 4, 6),
('H4', 27, 4, 7),
('H4', 28, 4, 8),
('H4', 29, 4, 9),
('H4', 30, 4, 10),
('H4', 31, 4, 11),
('H4', 32, 4, 12),
('H4', 33, 5, 0),
('H4', 34, 5, 1),
('H4', 35, 5, 2),
('H4', 36, 5, 3),
('H4', 37, 5, 4),
('H4', 38, 6, 0),
('H4', 39, 6, 1),
('H4', 40, 6, 2),
('H4', 41, 7, 0),
('H4', 42, 7, 1),
('H4', 43, 7, 2),
('H4', 44, 7, 3),
('H4', 45, 7, 4),
('H4', 46, 8, 0),
('H4', 47, 9, 0),
('H4', 48, 9, 1),
('H4', 49, 9, 2),
('H4', 50, 9, 3),
('H4', 51, 10, 0),
('H4', 52, 10, 1),
('H4', 53, 10, 2),
('H4', 54, 10, 3),
('H4', 55, 10, 4),
('H4', 56, 10, 5),
('H4', 57, 10, 6),
('H4', 58, 10, 7),
('H4', 59, 10, 8),
('H4', 60, 11, 0),
('H4', 61, 11, 1),
('H4', 62, 11, 2),
('H4', 63, 11, 3),
('H4', 64, 11, 4),
('H4', 65, 11, 5),
('H4', 66, 11, 6),
('H4', 67, 11, 7),
('H4', 68, 11, 8),
('H4', 69, 11, 9),
('H4', 70, 11, 10),
('H4', 71, 11, 11),
('H4', 72, 11, 12),
('H4', 73, 11, 13),
('H4', 74, 11, 14),
('H4', 75, 11, 15),
('H4', 76, 11, 16),
('H4', 77, 11, 17),
('H4', 78, 11, 18),
('H4', 79, 11, 19),
('H4', 80, 11, 20),
('H4', 81, 11, 21),
('H4', 82, 11, 22),
('H4', 83, 11, 23),
('H4', 84, 11, 24),
('H4', 85, 11, 25),
('H4', 86, 11, 26),
('H4', 87, 11, 27),
('H4', 88, 11, 28),
('H4', 89, 11, 29),
('H4', 90, 11, 30),
('H4', 91, 11, 31),
('H4', 92, 12, 0),
('H4', 93, 12, 1),
('H4', 94, 12, 2),
('H4', 95, 12, 3),
('H4', 96, 12, 4),
('H4', 97, 12, 5),
('H4', 98, 13, 0),
('H4', 99, 13, 1),
('H4', 100, 13, 2),
('H4', 101, 13, 3),
('H4', 102, 13, 4),
('H4', 103, 13, 5),
('H4', 104, 13, 6),
('H4', 105, 13, 7),
('H4', 106, 13, 8),
('H4', 107, 13, 9),
('H4', 108, 13, 10),
('H4', 109, 13, 11),
('H4', 110, 13, 12),
('H4', 111, 14, 0),
('H4', 112, 14, 1),
('H4', 113, 14, 2),
('H4', 114, 14, 3),
('H4', 115, 14, 4),
('H4', 116, 14, 5),
('H4', 117, 14, 6),
('H4', 118, 14, 7),
('H4', 119, 14, 8),
('H4', 120, 14, 9),
('H4', 121, 14, 10),
('H4', 122, 14, 11),
('H4', 123, 15, 0),
('H4', 124, 15, 1),
('H4', 125, 15, 2),
('H4', 126, 15, 3),
('H4', 127, 16, 0),
('H4', 128, 16, 1),
('H4', 129, 16, 2),
('H4', 130, 17, 0),
('H4', 131, 17, 1),
('H4', 132, 17, 2),
('H4', 133, 17, 3),
('H4', 134, 17, 4),
('H4', 135, 18, 0),
('H4', 136, 18, 1),
('H4', 137, 18, 2),
('H4', 138, 18, 3),
('H4', 139, 19, 0),
('H4', 140, 19, 1),
('H4', 141, 19, 2),
('H4', 142, 19, 3),
('H4', 143, 19, 4),
('H4', 144, 20, 0),
('H4', 145, 20, 1),
('H4', 146, 20, 2),
('H4', 147, 20, 3),
('H4', 148, 20, 4),
('H4', 149, 20, 5),
('H4', 150, 21, 0),
('H4', 151, 21, 1),
('H4', 152, 21, 2),
('H4', 153, 21, 3),
('H4', 154, 21, 4),
('H4', 155, 21, 5),
('H4', 156, 21, 6),
('H4', 157, 21, 7),
('H4', 158, 21, 8),
('H4', 159, 21, 9),
('H4', 160, 22, 0),
('H4', 161, 22, 1),
('H4', 162, 22, 2),
('H4', 163, 22, 3),
('H4', 164, 22, 4),
('H4', 165, 22, 5),
('H4', 166, 23, 0),
('H4', 167, 23, 1),
('H4', 168, 23, 2),
('H4', 169, 23, 3),
('H4', 170, 24, 0),
('H4', 171, 24, 1),
('H4', 172, 24, 2),
('H4', 173, 25, 0),
('H4', 174, 25, 1),
('H4', 175, 25, 2),
('H4', 176, 25, 3),
('H4', 177, 25, 4),
('H4', 178, 25, 5),
('H4', 179, 26, 0),
('H4', 180, 26, 1),
('H4', 181, 26, 2),
('H4', 182, 27, 0),
('H4', 183, 27, 1),
('H4', 184, 27, 2),
('H4', 185, 27, 3),
('H4', 186, 28, 0),
('H4', 187, 28, 1),
('H4', 188, 28, 2),
('H4', 189, 28, 3),
('H4', 190, 29, 0),
('H4', 191, 29, 1),
('H4', 192, 29, 2),
('H4', 193, 29, 3),
('H4', 194, 30, 0),
('H4', 195, 30, 1),
('H4', 196, 30, 2),
('H4', 197, 30, 3),
('H4', 198, 30, 4),
('H4', 199, 30, 5),
('H4', 200, 30, 6),
('H4', 201, 30, 7),
('H4', 202, 30, 8),
('H4', 203, 30, 9),
('H4', 204, 30, 10),
('H4', 205, 30, 11),
('H4', 206, 30, 12),
('H4', 207, 30, 13),
('H4', 208, 30, 14),
('H4', 209, 30, 15),
('H4', 210, 31, 1),
('H4', 211, 31, 2),
('H4', 212, 31, 3),
('H4', 213, 31, 4),
('H4', 214, 32, 1),
('H4', 215, 32, 2),
('H4', 216, 32, 3),
('H4', 217, 32, 4),
('H4', 218, 32, 5),
('H4', 219, 32, 6),
('H4', 220, 33, 1),
('H4', 221, 33, 2),
('H4', 222, 33, 3),
('H4', 223, 34, 1),
('H4', 224, 34, 2),
('H4', 225, 34, 3),
('H4', 226, 35, 1),
('H4', 227, 35, 2),
('H4', 228, 35, 3),
('H4', 229, 36, 1),
('H4', 230, 36, 2),
('H4', 231, 36, 3),
('H4', 232, 36, 4),
('H4', 233, 36, 5),
('H4', 234, 36, 6),
('H4', 235, 37, 1),
('H4', 236, 37, 2),
('H4', 237, 38, 1),
('H4', 238, 38, 2),
('H4', 239, 38, 3),
('H4', 240, 38, 4),
('H4', 241, 39, 1),
('H4', 242, 39, 2),
('H4', 243, 39, 3),
('H4', 244, 39, 4),
('H4', 245, 40, 1),
('H4', 246, 40, 2),
('H4', 247, 40, 3),
('H4', 248, 40, 4),
('H4', 249, 41, 1),
('H4', 250, 41, 2),
('H4', 251, 41, 3),
('H4', 252, 41, 4),
('H4', 253, 41, 5),
('H4', 254, 41, 6),
('H4', 255, 41, 7),
('H4', 256, 41, 8),
('H4', 257, 41, 9),
('H4', 258, 41, 10),
('H4', 259, 41, 11),
('H4', 260, 42, 1),
('H4', 261, 42, 2),
('H4', 262, 42, 3),
('H4', 263, 42, 4),
('H4', 264, 42, 5),
('H4', 265, 42, 6),
('H4', 266, 42, 7),
('H4', 267, 42, 8),
('H4', 268, 42, 9),
('H4', 269, 43, 1),
('H4', 270, 43, 2),
('H4', 271, 43, 3),
('H4', 272, 43, 4),
('H4', 273, 44, 1),
('H4', 274, 44, 2),
('H4', 275, 44, 3),
('H4', 276, 44, 4),
('H4', 277, 45, 1),
('H4', 278, 45, 2),
('H4', 279, 45, 3),
('H4', 280, 45, 4),
('H4', 281, 45, 5),
('H4', 282, 45, 6),
('H4', 283, 45, 7),
('H4', 284, 45, 8),
('H4', 285, 45, 9),
('H4', 286, 45, 10),
('H4', 287, 45, 11),
('H4', 288, 12, 1),
('H4', 289, 46, 1),
('H4', 290, 46, 2),
('H4', 291, 46, 3),
('H4', 292, 46, 4),
('H4', 293, 46, 5),
('H4', 294, 46, 6),
('H4', 295, 2, 1),
('H4', 296, 47, 1),
('H4', 297, 47, 2),
('H4', 298, 47, 3),
('H4', 299, 48, 1),
('H4', 300, 48, 2),
('H4', 303, 49, 1),
('H4', 304, 49, 2),
('H4', 305, 50, 1),
('H4', 306, 50, 2),
('H4', 307, 51, 1),
('H4', 308, 51, 2),
('H4', 309, 51, 3),
('H4', 310, 51, 4),
('H4', 311, 51, 5),
('H4', 312, 51, 6),
('H4', 313, 52, 1),
('H4', 314, 52, 2),
('H4', 315, 52, 3),
('H4', 316, 52, 4),
('H4', 317, 52, 5),
('H4', 318, 53, 1),
('H4', 319, 53, 2),
('H4', 320, 53, 3),
('H4', 321, 53, 4),
('H4', 322, 53, 5),
('H4', 323, 53, 6),
('H4', 324, 54, 1),
('H4', 325, 54, 2),
('H4', 326, 54, 3),
('H4', 327, 54, 4),
('H4', 328, 54, 5),
('H4', 329, 55, 1),
('H4', 330, 55, 2),
('H4', 331, 56, 1),
('H4', 332, 57, 1),
('H4', 333, 57, 2),
('H4', 334, 57, 3),
('H4', 335, 57, 4),
('H4', 336, 57, 5),
('H4', 337, 57, 6),
('H4', 338, 58, 1),
('H4', 339, 58, 2),
('H4', 340, 58, 3),
('H4', 341, 58, 4),
('H4', 342, 58, 5),
('H4', 343, 59, 1),
('H4', 344, 59, 2),
('H4', 345, 59, 3),
('H4', 346, 59, 4),
('H4', 347, 59, 5),
('H4', 348, 60, 1),
('H4', 349, 60, 2),
('H4', 350, 60, 3),
('H4', 351, 60, 4),
('H4', 352, 60, 5),
('H4', 353, 60, 6),
('H4', 354, 60, 7),
('H4', 355, 60, 8),
('H4', 356, 60, 9),
('H4', 357, 60, 10),
('H4', 358, 60, 11),
('H4', 359, 60, 12),
('H4', 360, 60, 13),
('H4', 361, 61, 1),
('H4', 362, 61, 2),
('H4', 363, 61, 3),
('H4', 364, 61, 4),
('H4', 365, 61, 5),
('H4', 366, 62, 1),
('H4', 367, 62, 2),
('H4', 368, 63, 1),
('H4', 369, 63, 2),
('H4', 370, 64, 1),
('H4', 371, 64, 2),
('H4', 372, 64, 3),
('H4', 373, 64, 4),
('H4', 374, 64, 5),
('H4', 375, 65, 1),
('H4', 376, 65, 2),
('H4', 377, 66, 1),
('H4', 378, 66, 2),
('H4', 379, 66, 3),
('H4', 380, 66, 4),
('H4', 381, 66, 5),
('H4', 382, 66, 6),
('H4', 383, 66, 7),
('H4', 384, 66, 8),
('H4', 385, 66, 9),
('H5', 1, 1, 0),
('H5', 2, 1, 1),
('H5', 3, 1, 2),
('H5', 4, 1, 3),
('H5', 5, 1, 4),
('H5', 6, 1, 5),
('H5', 7, 1, 6),
('H5', 8, 1, 7),
('H5', 9, 1, 8),
('H5', 10, 1, 9),
('H5', 11, 1, 10),
('H5', 12, 2, 0),
('H5', 13, 2, 1),
('H5', 14, 3, 0),
('H5', 15, 3, 1),
('H5', 16, 3, 2),
('H5', 17, 3, 3),
('H5', 18, 3, 4),
('H5', 19, 3, 5),
('H5', 20, 4, 0),
('H5', 21, 4, 1),
('H5', 22, 4, 2),
('H5', 23, 4, 3),
('H5', 24, 4, 4),
('H5', 25, 4, 5),
('H5', 26, 4, 6),
('H5', 27, 4, 7),
('H5', 28, 4, 8),
('H5', 29, 4, 9),
('H5', 30, 4, 10),
('H5', 31, 4, 11),
('H5', 32, 4, 12),
('H5', 33, 5, 0),
('H5', 34, 5, 1),
('H5', 35, 5, 2),
('H5', 36, 5, 3),
('H5', 37, 5, 4),
('H5', 38, 6, 0),
('H5', 39, 6, 1),
('H5', 40, 6, 2),
('H5', 41, 7, 0),
('H5', 42, 7, 1),
('H5', 43, 7, 2),
('H5', 44, 7, 3),
('H5', 45, 7, 4),
('H5', 46, 8, 0),
('H5', 47, 9, 0),
('H5', 48, 9, 1),
('H5', 49, 9, 2),
('H5', 50, 9, 3),
('H5', 51, 10, 0),
('H5', 52, 10, 1),
('H5', 53, 10, 2),
('H5', 54, 10, 3),
('H5', 55, 10, 4),
('H5', 56, 10, 5),
('H5', 57, 10, 6),
('H5', 58, 10, 7),
('H5', 59, 10, 8),
('H5', 60, 11, 0),
('H5', 61, 11, 1),
('H5', 62, 11, 2),
('H5', 63, 11, 3),
('H5', 64, 11, 4),
('H5', 65, 11, 5),
('H5', 66, 11, 6),
('H5', 67, 11, 7),
('H5', 68, 11, 8),
('H5', 69, 11, 9),
('H5', 70, 11, 10),
('H5', 71, 11, 11),
('H5', 72, 11, 12),
('H5', 73, 11, 13),
('H5', 74, 11, 14),
('H5', 75, 11, 15),
('H5', 76, 11, 16),
('H5', 77, 11, 17),
('H5', 78, 11, 18),
('H5', 79, 11, 19),
('H5', 80, 11, 20),
('H5', 81, 11, 21),
('H5', 82, 11, 22),
('H5', 83, 11, 23),
('H5', 84, 11, 24),
('H5', 85, 11, 25),
('H5', 86, 11, 26),
('H5', 87, 11, 27),
('H5', 88, 11, 28),
('H5', 89, 11, 29),
('H5', 90, 11, 30),
('H5', 91, 11, 31),
('H5', 92, 12, 0),
('H5', 93, 12, 1),
('H5', 94, 12, 2),
('H5', 95, 12, 3),
('H5', 96, 12, 4),
('H5', 97, 12, 5),
('H5', 98, 13, 0),
('H5', 99, 13, 1),
('H5', 100, 13, 2),
('H5', 101, 13, 3),
('H5', 102, 13, 4),
('H5', 103, 13, 5),
('H5', 104, 13, 6),
('H5', 105, 13, 7),
('H5', 106, 13, 8),
('H5', 107, 13, 9),
('H5', 108, 13, 10),
('H5', 109, 13, 11),
('H5', 110, 13, 12),
('H5', 111, 14, 0),
('H5', 112, 14, 1),
('H5', 113, 14, 2),
('H5', 114, 14, 3),
('H5', 115, 14, 4),
('H5', 116, 14, 5),
('H5', 117, 14, 6),
('H5', 118, 14, 7),
('H5', 119, 14, 8),
('H5', 120, 14, 9),
('H5', 121, 14, 10),
('H5', 122, 14, 11),
('H5', 123, 15, 0),
('H5', 124, 15, 1),
('H5', 125, 15, 2),
('H5', 126, 15, 3),
('H5', 127, 16, 0),
('H5', 128, 16, 1),
('H5', 129, 16, 2),
('H5', 130, 17, 0),
('H5', 131, 17, 1),
('H5', 132, 17, 2),
('H5', 133, 17, 3),
('H5', 134, 17, 4),
('H5', 135, 18, 0),
('H5', 136, 18, 1),
('H5', 137, 18, 2),
('H5', 138, 18, 3),
('H5', 139, 19, 0),
('H5', 140, 19, 1),
('H5', 141, 19, 2),
('H5', 142, 19, 3),
('H5', 143, 19, 4),
('H5', 144, 20, 0),
('H5', 145, 20, 1),
('H5', 146, 20, 2),
('H5', 147, 20, 3),
('H5', 148, 20, 4),
('H5', 149, 20, 5),
('H5', 150, 21, 0),
('H5', 151, 21, 1),
('H5', 152, 21, 2),
('H5', 153, 21, 3),
('H5', 154, 21, 4),
('H5', 155, 21, 5),
('H5', 156, 21, 6),
('H5', 157, 21, 7),
('H5', 158, 21, 8),
('H5', 159, 21, 9),
('H5', 160, 22, 0),
('H5', 161, 22, 1),
('H5', 162, 22, 2),
('H5', 163, 22, 3),
('H5', 164, 22, 4),
('H5', 165, 22, 5),
('H5', 166, 23, 0),
('H5', 167, 23, 1),
('H5', 168, 23, 2),
('H5', 169, 23, 3),
('H5', 170, 24, 0),
('H5', 171, 24, 1),
('H5', 172, 24, 2),
('H5', 173, 25, 0),
('H5', 174, 25, 1),
('H5', 175, 25, 2),
('H5', 176, 25, 3),
('H5', 177, 25, 4),
('H5', 178, 25, 5),
('H5', 179, 26, 0),
('H5', 180, 26, 1),
('H5', 181, 26, 2),
('H5', 182, 27, 0),
('H5', 183, 27, 1),
('H5', 184, 27, 2),
('H5', 185, 27, 3),
('H5', 186, 28, 0),
('H5', 187, 28, 1),
('H5', 188, 28, 2),
('H5', 189, 28, 3),
('H5', 190, 29, 0),
('H5', 191, 29, 1),
('H5', 192, 29, 2),
('H5', 193, 29, 3),
('H5', 194, 30, 0),
('H5', 195, 30, 1),
('H5', 196, 30, 2),
('H5', 197, 30, 3),
('H5', 198, 30, 4),
('H5', 199, 30, 5),
('H5', 200, 30, 6),
('H5', 201, 30, 7),
('H5', 202, 30, 8),
('H5', 203, 30, 9),
('H5', 204, 30, 10),
('H5', 205, 30, 11),
('H5', 206, 30, 12),
('H5', 207, 30, 13),
('H5', 208, 30, 14),
('H5', 209, 30, 15),
('H5', 210, 31, 1),
('H5', 211, 31, 2),
('H5', 212, 31, 3),
('H5', 213, 31, 4),
('H5', 214, 32, 1),
('H5', 215, 32, 2),
('H5', 216, 32, 3),
('H5', 217, 32, 4),
('H5', 218, 32, 5),
('H5', 219, 32, 6),
('H5', 220, 33, 1),
('H5', 221, 33, 2),
('H5', 222, 33, 3),
('H5', 223, 34, 1),
('H5', 224, 34, 2),
('H5', 225, 34, 3),
('H5', 226, 35, 1),
('H5', 227, 35, 2),
('H5', 228, 35, 3),
('H5', 229, 36, 1),
('H5', 230, 36, 2),
('H5', 231, 36, 3),
('H5', 232, 36, 4),
('H5', 233, 36, 5),
('H5', 234, 36, 6),
('H5', 235, 37, 1),
('H5', 236, 37, 2),
('H5', 237, 38, 1),
('H5', 238, 38, 2),
('H5', 239, 38, 3),
('H5', 240, 38, 4),
('H5', 241, 39, 1),
('H5', 242, 39, 2),
('H5', 243, 39, 3),
('H5', 244, 39, 4),
('H5', 245, 40, 1),
('H5', 246, 40, 2),
('H5', 247, 40, 3),
('H5', 248, 40, 4),
('H5', 249, 41, 1),
('H5', 250, 41, 2),
('H5', 251, 41, 3),
('H5', 252, 41, 4),
('H5', 253, 41, 5),
('H5', 254, 41, 6),
('H5', 255, 41, 7),
('H5', 256, 41, 8),
('H5', 257, 41, 9),
('H5', 258, 41, 10),
('H5', 259, 41, 11),
('H5', 260, 42, 1),
('H5', 261, 42, 2),
('H5', 262, 42, 3),
('H5', 263, 42, 4),
('H5', 264, 42, 5),
('H5', 265, 42, 6),
('H5', 266, 42, 7),
('H5', 267, 42, 8),
('H5', 268, 42, 9),
('H5', 269, 43, 1),
('H5', 270, 43, 2),
('H5', 271, 43, 3),
('H5', 272, 43, 4),
('H5', 273, 44, 1),
('H5', 274, 44, 2),
('H5', 275, 44, 3),
('H5', 276, 44, 4),
('H5', 277, 45, 1),
('H5', 278, 45, 2),
('H5', 279, 45, 3),
('H5', 280, 45, 4),
('H5', 281, 45, 5),
('H5', 282, 45, 6),
('H5', 283, 45, 7),
('H5', 284, 45, 8),
('H5', 285, 45, 9),
('H5', 286, 45, 10),
('H5', 287, 45, 11),
('H5', 288, 12, 1),
('H5', 289, 46, 1),
('H5', 290, 46, 2),
('H5', 291, 46, 3),
('H5', 292, 46, 4),
('H5', 293, 46, 5),
('H5', 294, 46, 6),
('H5', 295, 2, 1),
('H5', 296, 47, 1),
('H5', 297, 47, 2),
('H5', 298, 47, 3),
('H5', 299, 48, 1),
('H5', 300, 48, 2),
('H5', 303, 49, 1),
('H5', 304, 49, 2),
('H5', 305, 50, 1),
('H5', 306, 50, 2),
('H5', 307, 51, 1),
('H5', 308, 51, 2),
('H5', 309, 51, 3),
('H5', 310, 51, 4),
('H5', 311, 51, 5),
('H5', 312, 51, 6),
('H5', 313, 52, 1),
('H5', 314, 52, 2),
('H5', 315, 52, 3),
('H5', 316, 52, 4),
('H5', 317, 52, 5),
('H5', 318, 53, 1),
('H5', 319, 53, 2),
('H5', 320, 53, 3),
('H5', 321, 53, 4),
('H5', 322, 53, 5),
('H5', 323, 53, 6),
('H5', 324, 54, 1),
('H5', 325, 54, 2),
('H5', 326, 54, 3),
('H5', 327, 54, 4),
('H5', 328, 54, 5),
('H5', 329, 55, 1),
('H5', 330, 55, 2),
('H5', 331, 56, 1),
('H5', 332, 57, 1),
('H5', 333, 57, 2),
('H5', 334, 57, 3),
('H5', 335, 57, 4),
('H5', 336, 57, 5),
('H5', 337, 57, 6),
('H5', 338, 58, 1),
('H5', 339, 58, 2),
('H5', 340, 58, 3),
('H5', 341, 58, 4),
('H5', 342, 58, 5),
('H5', 343, 59, 1),
('H5', 344, 59, 2),
('H5', 345, 59, 3),
('H5', 346, 59, 4),
('H5', 347, 59, 5),
('H5', 348, 60, 1),
('H5', 349, 60, 2),
('H5', 350, 60, 3),
('H5', 351, 60, 4),
('H5', 352, 60, 5),
('H5', 353, 60, 6),
('H5', 354, 60, 7),
('H5', 355, 60, 8),
('H5', 356, 60, 9),
('H5', 357, 60, 10),
('H5', 358, 60, 11),
('H5', 359, 60, 12),
('H5', 360, 60, 13),
('H5', 361, 61, 1),
('H5', 362, 61, 2),
('H5', 363, 61, 3),
('H5', 364, 61, 4),
('H5', 365, 61, 5),
('H5', 366, 62, 1),
('H5', 367, 62, 2),
('H5', 368, 63, 1),
('H5', 369, 63, 2),
('H5', 370, 64, 1),
('H5', 371, 64, 2),
('H5', 372, 64, 3),
('H5', 373, 64, 4),
('H5', 374, 64, 5),
('H5', 375, 65, 1),
('H5', 376, 65, 2),
('H5', 377, 66, 1),
('H5', 378, 66, 2),
('H5', 379, 66, 3),
('H5', 380, 66, 4),
('H5', 381, 66, 5),
('H5', 382, 66, 6),
('H5', 383, 66, 7),
('H5', 384, 66, 8),
('H5', 385, 66, 9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_role2profile`
--

CREATE TABLE IF NOT EXISTS `vtiger_role2profile` (
  `roleid` varchar(255) NOT NULL,
  `profileid` int(11) NOT NULL,
  PRIMARY KEY (`roleid`,`profileid`),
  KEY `role2profile_roleid_profileid_idx` (`roleid`,`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_role2profile`
--

INSERT INTO `vtiger_role2profile` (`roleid`, `profileid`) VALUES
('H2', 1),
('H3', 2),
('H4', 2),
('H5', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_role_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_role_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_role_seq`
--

INSERT INTO `vtiger_role_seq` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rollupcomments_settings`
--

CREATE TABLE IF NOT EXISTS `vtiger_rollupcomments_settings` (
  `rollupid` int(19) NOT NULL,
  `userid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `rollup_status` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rollupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rowheight`
--

CREATE TABLE IF NOT EXISTS `vtiger_rowheight` (
  `rowheightid` int(11) NOT NULL,
  `rowheight` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowheightid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_rowheight`
--

INSERT INTO `vtiger_rowheight` (`rowheightid`, `rowheight`, `sortorderid`, `presence`) VALUES
(1, 'wide', 0, 1),
(2, 'medium', 1, 1),
(3, 'narrow', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rowheight_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_rowheight_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_rowheight_seq`
--

INSERT INTO `vtiger_rowheight_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_rss`
--

CREATE TABLE IF NOT EXISTS `vtiger_rss` (
  `rssid` int(19) NOT NULL,
  `rssurl` varchar(200) NOT NULL DEFAULT '',
  `rsstitle` varchar(200) DEFAULT NULL,
  `rsstype` int(10) DEFAULT 0,
  `starred` int(1) DEFAULT 0,
  PRIMARY KEY (`rssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesmanactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanactivityrel` (
  `smid` int(19) NOT NULL DEFAULT 0,
  `activityid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`smid`,`activityid`),
  KEY `salesmanactivityrel_activityid_idx` (`activityid`),
  KEY `salesmanactivityrel_smid_idx` (`smid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesmanattachmentsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanattachmentsrel` (
  `smid` int(19) NOT NULL DEFAULT 0,
  `attachmentsid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`smid`,`attachmentsid`),
  KEY `salesmanattachmentsrel_smid_idx` (`smid`),
  KEY `salesmanattachmentsrel_attachmentsid_idx` (`attachmentsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesmanticketrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesmanticketrel` (
  `smid` int(19) NOT NULL DEFAULT 0,
  `id` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`smid`,`id`),
  KEY `salesmanticketrel_smid_idx` (`smid`),
  KEY `salesmanticketrel_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesorder`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesorder` (
  `salesorderid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) DEFAULT NULL,
  `potentialid` int(19) DEFAULT NULL,
  `customerno` varchar(100) DEFAULT NULL,
  `salesorder_no` varchar(100) DEFAULT NULL,
  `quoteid` int(19) DEFAULT NULL,
  `vendorterms` varchar(100) DEFAULT NULL,
  `contactid` int(19) DEFAULT NULL,
  `vendorid` int(19) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `pending` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `adjustment` decimal(25,8) DEFAULT NULL,
  `salescommission` decimal(25,3) DEFAULT NULL,
  `exciseduty` decimal(25,3) DEFAULT NULL,
  `total` decimal(25,8) DEFAULT NULL,
  `subtotal` decimal(25,8) DEFAULT NULL,
  `taxtype` varchar(25) DEFAULT NULL,
  `discount_percent` decimal(25,3) DEFAULT NULL,
  `discount_amount` decimal(25,8) DEFAULT NULL,
  `s_h_amount` decimal(25,8) DEFAULT NULL,
  `accountid` int(19) DEFAULT NULL,
  `terms_conditions` text DEFAULT NULL,
  `purchaseorder` varchar(200) DEFAULT NULL,
  `sostatus` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `conversion_rate` decimal(10,3) NOT NULL DEFAULT 1.000,
  `enable_recurring` int(11) DEFAULT 0,
  `compound_taxes_info` text DEFAULT NULL,
  `pre_tax_total` decimal(25,8) DEFAULT NULL,
  `s_h_percent` int(11) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `region_id` int(19) DEFAULT NULL,
  PRIMARY KEY (`salesorderid`),
  KEY `salesorder_vendorid_idx` (`vendorid`),
  KEY `salesorder_contactid_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salesordercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_salesordercf` (
  `salesorderid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`salesorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sales_stage`
--

CREATE TABLE IF NOT EXISTS `vtiger_sales_stage` (
  `sales_stage_id` int(19) NOT NULL,
  `sales_stage` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sales_stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_sales_stage`
--

INSERT INTO `vtiger_sales_stage` (`sales_stage_id`, `sales_stage`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Prospecting', 1, 150, 0, NULL),
(2, 'Qualification', 1, 151, 1, NULL),
(3, 'Needs Analysis', 1, 152, 2, NULL),
(4, 'Value Proposition', 1, 153, 3, NULL),
(5, 'Id. Decision Makers', 1, 154, 4, NULL),
(6, 'Perception Analysis', 1, 155, 5, NULL),
(7, 'Proposal or Price Quote', 1, 156, 6, NULL),
(8, 'Negotiation or Review', 1, 157, 7, NULL),
(9, 'Closed Won', 0, 158, 8, NULL),
(10, 'Closed Lost', 0, 159, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sales_stage_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_sales_stage_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_sales_stage_seq`
--

INSERT INTO `vtiger_sales_stage_seq` (`id`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salutationtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_salutationtype` (
  `salutationid` int(19) NOT NULL,
  `salutationtype` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`salutationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_salutationtype`
--

INSERT INTO `vtiger_salutationtype` (`salutationid`, `salutationtype`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Mr.', 1, 161, 1, NULL),
(3, 'Ms.', 1, 162, 2, NULL),
(4, 'Mrs.', 1, 163, 3, NULL),
(5, 'Dr.', 1, 164, 4, NULL),
(6, 'Prof.', 1, 165, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_salutationtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_salutationtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_salutationtype_seq`
--

INSERT INTO `vtiger_salutationtype_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_scheduled_reports`
--

CREATE TABLE IF NOT EXISTS `vtiger_scheduled_reports` (
  `reportid` int(11) NOT NULL,
  `recipients` text DEFAULT NULL,
  `schedule` text DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `next_trigger_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_schedulereports`
--

CREATE TABLE IF NOT EXISTS `vtiger_schedulereports` (
  `reportid` int(10) DEFAULT NULL,
  `scheduleid` int(3) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `schdate` varchar(20) DEFAULT NULL,
  `schtime` time DEFAULT NULL,
  `schdayoftheweek` varchar(100) DEFAULT NULL,
  `schdayofthemonth` varchar(100) DEFAULT NULL,
  `schannualdates` varchar(500) DEFAULT NULL,
  `specificemails` varchar(500) DEFAULT NULL,
  `next_trigger_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `fileformat` varchar(10) DEFAULT 'CSV'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seactivityrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seactivityrel` (
  `crmid` int(19) NOT NULL,
  `activityid` int(19) NOT NULL,
  PRIMARY KEY (`crmid`,`activityid`),
  KEY `seactivityrel_activityid_idx` (`activityid`),
  KEY `seactivityrel_crmid_idx` (`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seactivityrel_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_seactivityrel_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_seactivityrel_seq`
--

INSERT INTO `vtiger_seactivityrel_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seattachmentsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seattachmentsrel` (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `attachmentsid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`,`attachmentsid`),
  KEY `seattachmentsrel_attachmentsid_idx` (`attachmentsid`),
  KEY `seattachmentsrel_crmid_idx` (`crmid`),
  KEY `seattachmentsrel_attachmentsid_crmid_idx` (`attachmentsid`,`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_selectcolumn`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectcolumn` (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL DEFAULT 0,
  `columnname` varchar(250) DEFAULT '',
  PRIMARY KEY (`queryid`,`columnindex`),
  KEY `selectcolumn_queryid_idx` (`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_selectcolumn`
--

INSERT INTO `vtiger_selectcolumn` (`queryid`, `columnindex`, `columnname`) VALUES
(1, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(1, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(1, 2, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(1, 3, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(1, 4, 'vtiger_account:industry:Accounts_industry:industry:V'),
(1, 5, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(2, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(2, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(2, 2, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(2, 3, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(2, 4, 'vtiger_account:industry:Accounts_industry:industry:V'),
(2, 5, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(3, 0, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(3, 1, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(3, 2, 'vtiger_contactdetails:accountid:Contacts_Account_Name:account_id:V'),
(3, 3, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(3, 4, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(3, 5, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(4, 0, 'vtiger_leaddetails:firstname:Leads_First_Name:firstname:V'),
(4, 1, 'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),
(4, 2, 'vtiger_leaddetails:company:Leads_Company:company:V'),
(4, 3, 'vtiger_leaddetails:email:Leads_Email:email:E'),
(4, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V'),
(5, 0, 'vtiger_leaddetails:firstname:Leads_First_Name:firstname:V'),
(5, 1, 'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),
(5, 2, 'vtiger_leaddetails:company:Leads_Company:company:V'),
(5, 3, 'vtiger_leaddetails:email:Leads_Email:email:E'),
(5, 4, 'vtiger_leaddetails:leadsource:Leads_Lead_Source:leadsource:V'),
(5, 5, 'vtiger_leaddetails:leadstatus:Leads_Lead_Status:leadstatus:V'),
(6, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(6, 1, 'vtiger_potential:amount:Potentials_Amount:amount:N'),
(6, 2, 'vtiger_potential:potentialtype:Potentials_Type:opportunity_type:V'),
(6, 3, 'vtiger_potential:leadsource:Potentials_Lead_Source:leadsource:V'),
(6, 4, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(7, 0, 'vtiger_potential:potentialname:Potentials_Potential_Name:potentialname:V'),
(7, 1, 'vtiger_potential:amount:Potentials_Amount:amount:N'),
(7, 2, 'vtiger_potential:potentialtype:Potentials_Type:opportunity_type:V'),
(7, 3, 'vtiger_potential:leadsource:Potentials_Lead_Source:leadsource:V'),
(7, 4, 'vtiger_potential:sales_stage:Potentials_Sales_Stage:sales_stage:V'),
(8, 0, 'vtiger_activity:subject:Calendar_Subject:subject:V'),
(8, 1, 'vtiger_contactdetailsCalendar:lastname:Calendar_Contact_Name:contact_id:I'),
(8, 2, 'vtiger_activity:status:Calendar_Status:taskstatus:V'),
(8, 3, 'vtiger_activity:priority:Calendar_Priority:taskpriority:V'),
(8, 4, 'vtiger_usersCalendar:user_name:Calendar_Assigned_To:assigned_user_id:V'),
(9, 0, 'vtiger_activity:subject:Calendar_Subject:subject:V'),
(9, 1, 'vtiger_contactdetailsCalendar:lastname:Calendar_Contact_Name:contact_id:I'),
(9, 2, 'vtiger_activity:status:Calendar_Status:taskstatus:V'),
(9, 3, 'vtiger_activity:priority:Calendar_Priority:taskpriority:V'),
(9, 4, 'vtiger_usersCalendar:user_name:Calendar_Assigned_To:assigned_user_id:V'),
(10, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(10, 1, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(10, 2, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(10, 3, 'vtiger_products:discontinued:Products_Product_Active:discontinued:V'),
(10, 4, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(10, 5, 'vtiger_products:manufacturer:Products_Manufacturer:manufacturer:V'),
(11, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(11, 1, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V'),
(11, 2, 'vtiger_troubletickets:severity:HelpDesk_Severity:ticketseverities:V'),
(11, 3, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(11, 4, 'vtiger_troubletickets:category:HelpDesk_Category:ticketcategories:V'),
(11, 5, 'vtiger_usersHelpDesk:user_name:HelpDesk_Assigned_To:assigned_user_id:V'),
(12, 0, 'vtiger_troubletickets:title:HelpDesk_Title:ticket_title:V'),
(12, 1, 'vtiger_troubletickets:priority:HelpDesk_Priority:ticketpriorities:V'),
(12, 2, 'vtiger_troubletickets:severity:HelpDesk_Severity:ticketseverities:V'),
(12, 3, 'vtiger_troubletickets:status:HelpDesk_Status:ticketstatus:V'),
(12, 4, 'vtiger_troubletickets:category:HelpDesk_Category:ticketcategories:V'),
(12, 5, 'vtiger_usersHelpDesk:user_name:HelpDesk_Assigned_To:assigned_user_id:V'),
(13, 0, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(13, 1, 'vtiger_products:productcode:Products_Product_Code:productcode:V'),
(13, 2, 'vtiger_products:discontinued:Products_Product_Active:discontinued:V'),
(13, 3, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(13, 4, 'vtiger_products:website:Products_Website:website:V'),
(13, 5, 'vtiger_vendorRelProducts:vendorname:Products_Vendor_Name:vendor_id:I'),
(13, 6, 'vtiger_products:mfr_part_no:Products_Mfr_PartNo:mfr_part_no:V'),
(14, 0, 'vtiger_products:productname:Products_Product_Name:productname:V'),
(14, 1, 'vtiger_products:manufacturer:Products_Manufacturer:manufacturer:V'),
(14, 2, 'vtiger_products:productcategory:Products_Product_Category:productcategory:V'),
(14, 3, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(14, 4, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(14, 5, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(15, 0, 'vtiger_quotes:subject:Quotes_Subject:subject:V'),
(15, 1, 'vtiger_potentialRelQuotes:potentialname:Quotes_Potential_Name:potential_id:I'),
(15, 2, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V'),
(15, 3, 'vtiger_quotes:contactid:Quotes_Contact_Name:contact_id:V'),
(15, 4, 'vtiger_usersRel1:user_name:Quotes_Inventory_Manager:assigned_user_id1:I'),
(15, 5, 'vtiger_accountQuotes:accountname:Quotes_Account_Name:account_id:I'),
(16, 0, 'vtiger_quotes:subject:Quotes_Subject:subject:V'),
(16, 1, 'vtiger_potentialRelQuotes:potentialname:Quotes_Potential_Name:potential_id:I'),
(16, 2, 'vtiger_quotes:quotestage:Quotes_Quote_Stage:quotestage:V'),
(16, 3, 'vtiger_quotes:contactid:Quotes_Contact_Name:contact_id:V'),
(16, 4, 'vtiger_usersRel1:user_name:Quotes_Inventory_Manager:assigned_user_id1:I'),
(16, 5, 'vtiger_accountQuotes:accountname:Quotes_Account_Name:account_id:I'),
(16, 6, 'vtiger_quotes:carrier:Quotes_Carrier:carrier:V'),
(16, 7, 'vtiger_quotes:shipping:Quotes_Shipping:shipping:V'),
(17, 0, 'vtiger_purchaseorder:subject:PurchaseOrder_Subject:subject:V'),
(17, 1, 'vtiger_vendorRelPurchaseOrder:vendorname:PurchaseOrder_Vendor_Name:vendor_id:I'),
(17, 2, 'vtiger_purchaseorder:tracking_no:PurchaseOrder_Tracking_Number:tracking_no:V'),
(17, 3, 'vtiger_contactdetails:firstname:Contacts_First_Name:firstname:V'),
(17, 4, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(17, 5, 'vtiger_contactsubdetails:leadsource:Contacts_Lead_Source:leadsource:V'),
(17, 6, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(18, 0, 'vtiger_purchaseorder:subject:PurchaseOrder_Subject:subject:V'),
(18, 1, 'vtiger_vendorRelPurchaseOrder:vendorname:PurchaseOrder_Vendor_Name:vendor_id:I'),
(18, 2, 'vtiger_purchaseorder:requisition_no:PurchaseOrder_Requisition_No:requisition_no:V'),
(18, 3, 'vtiger_purchaseorder:tracking_no:PurchaseOrder_Tracking_Number:tracking_no:V'),
(18, 4, 'vtiger_contactdetailsPurchaseOrder:lastname:PurchaseOrder_Contact_Name:contact_id:I'),
(18, 5, 'vtiger_purchaseorder:carrier:PurchaseOrder_Carrier:carrier:V'),
(18, 6, 'vtiger_purchaseorder:salescommission:PurchaseOrder_Sales_Commission:salescommission:N'),
(18, 7, 'vtiger_purchaseorder:exciseduty:PurchaseOrder_Excise_Duty:exciseduty:N'),
(18, 8, 'vtiger_usersPurchaseOrder:user_name:PurchaseOrder_Assigned_To:assigned_user_id:V'),
(19, 0, 'vtiger_invoice:subject:Invoice_Subject:subject:V'),
(19, 1, 'vtiger_invoice:salesorderid:Invoice_Sales_Order:salesorder_id:I'),
(19, 2, 'vtiger_invoice:customerno:Invoice_Customer_No:customerno:V'),
(19, 3, 'vtiger_invoice:exciseduty:Invoice_Excise_Duty:exciseduty:N'),
(19, 4, 'vtiger_invoice:salescommission:Invoice_Sales_Commission:salescommission:N'),
(19, 5, 'vtiger_accountInvoice:accountname:Invoice_Account_Name:account_id:I'),
(20, 0, 'vtiger_salesorder:subject:SalesOrder_Subject:subject:V'),
(20, 1, 'vtiger_quotesSalesOrder:subject:SalesOrder_Quote_Name:quote_id:I'),
(20, 2, 'vtiger_contactdetailsSalesOrder:lastname:SalesOrder_Contact_Name:contact_id:I'),
(20, 3, 'vtiger_salesorder:duedate:SalesOrder_Due_Date:duedate:D'),
(20, 4, 'vtiger_salesorder:carrier:SalesOrder_Carrier:carrier:V'),
(20, 5, 'vtiger_salesorder:sostatus:SalesOrder_Status:sostatus:V'),
(20, 6, 'vtiger_accountSalesOrder:accountname:SalesOrder_Account_Name:account_id:I'),
(20, 7, 'vtiger_salesorder:salescommission:SalesOrder_Sales_Commission:salescommission:N'),
(20, 8, 'vtiger_salesorder:exciseduty:SalesOrder_Excise_Duty:exciseduty:N'),
(20, 9, 'vtiger_usersSalesOrder:user_name:SalesOrder_Assigned_To:assigned_user_id:V'),
(21, 0, 'vtiger_campaign:campaignname:Campaigns_Campaign_Name:campaignname:V'),
(21, 1, 'vtiger_campaign:campaigntype:Campaigns_Campaign_Type:campaigntype:V'),
(21, 2, 'vtiger_campaign:targetaudience:Campaigns_Target_Audience:targetaudience:V'),
(21, 3, 'vtiger_campaign:budgetcost:Campaigns_Budget_Cost:budgetcost:I'),
(21, 4, 'vtiger_campaign:actualcost:Campaigns_Actual_Cost:actualcost:I'),
(21, 5, 'vtiger_campaign:expectedrevenue:Campaigns_Expected_Revenue:expectedrevenue:I'),
(21, 6, 'vtiger_campaign:expectedsalescount:Campaigns_Expected_Sales_Count:expectedsalescount:N'),
(21, 7, 'vtiger_campaign:actualsalescount:Campaigns_Actual_Sales_Count:actualsalescount:N'),
(21, 8, 'vtiger_usersCampaigns:user_name:Campaigns_Assigned_To:assigned_user_id:V'),
(22, 0, 'vtiger_contactdetails:lastname:Contacts_Last_Name:lastname:V'),
(22, 1, 'vtiger_contactdetails:email:Contacts_Email:email:E'),
(22, 2, 'vtiger_activity:subject:Emails_Subject:subject:V'),
(22, 3, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V'),
(23, 0, 'vtiger_account:accountname:Accounts_Account_Name:accountname:V'),
(23, 1, 'vtiger_account:phone:Accounts_Phone:phone:V'),
(23, 2, 'vtiger_account:email1:Accounts_Email:email1:E'),
(23, 3, 'vtiger_activity:subject:Emails_Subject:subject:V'),
(23, 4, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V'),
(24, 0, 'vtiger_leaddetails:lastname:Leads_Last_Name:lastname:V'),
(24, 1, 'vtiger_leaddetails:company:Leads_Company:company:V'),
(24, 2, 'vtiger_leaddetails:email:Leads_Email:email:E'),
(24, 3, 'vtiger_activity:subject:Emails_Subject:subject:V'),
(24, 4, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V'),
(25, 0, 'vtiger_vendor:vendorname:Vendors_Vendor_Name:vendorname:V'),
(25, 1, 'vtiger_vendor:glacct:Vendors_GL_Account:glacct:V'),
(25, 2, 'vtiger_vendor:email:Vendors_Email:email:E'),
(25, 3, 'vtiger_activity:subject:Emails_Subject:subject:V'),
(25, 4, 'vtiger_email_track:access_count:Emails_Access_Count:access_count:V');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_selectquery`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectquery` (
  `queryid` int(19) NOT NULL,
  `startindex` int(19) DEFAULT 0,
  `numofobjects` int(19) DEFAULT 0,
  PRIMARY KEY (`queryid`),
  KEY `selectquery_queryid_idx` (`queryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_selectquery`
--

INSERT INTO `vtiger_selectquery` (`queryid`, `startindex`, `numofobjects`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 0),
(17, 0, 0),
(18, 0, 0),
(19, 0, 0),
(20, 0, 0),
(21, 0, 0),
(22, 0, 0),
(23, 0, 0),
(24, 0, 0),
(25, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_selectquery_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_selectquery_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_selectquery_seq`
--

INSERT INTO `vtiger_selectquery_seq` (`id`) VALUES
(25);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_senotesrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_senotesrel` (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `notesid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`,`notesid`),
  KEY `senotesrel_notesid_idx` (`notesid`),
  KEY `senotesrel_crmid_idx` (`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seproductsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seproductsrel` (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `productid` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) NOT NULL,
  `quantity` int(19) DEFAULT 1,
  PRIMARY KEY (`crmid`,`productid`),
  KEY `seproductsrel_productid_idx` (`productid`),
  KEY `seproductrel_crmid_idx` (`crmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_service`
--

CREATE TABLE IF NOT EXISTS `vtiger_service` (
  `serviceid` int(11) NOT NULL,
  `service_no` varchar(100) NOT NULL,
  `servicename` varchar(50) NOT NULL,
  `servicecategory` varchar(200) DEFAULT NULL,
  `qty_per_unit` decimal(11,2) DEFAULT 0.00,
  `unit_price` decimal(25,8) DEFAULT NULL,
  `sales_start_date` date DEFAULT NULL,
  `sales_end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `discontinued` int(1) NOT NULL DEFAULT 0,
  `service_usageunit` varchar(200) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `taxclass` varchar(200) DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `commissionrate` decimal(7,3) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  `purchase_cost` decimal(27,8) DEFAULT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecategory`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecategory` (
  `servicecategoryid` int(11) NOT NULL,
  `servicecategory` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`servicecategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_servicecategory`
--

INSERT INTO `vtiger_servicecategory` (`servicecategoryid`, `servicecategory`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Support', 1, 230, 2, NULL),
(3, 'Installation', 1, 231, 3, NULL),
(4, 'Migration', 1, 232, 4, NULL),
(5, 'Customization', 1, 233, 5, NULL),
(6, 'Training', 1, 234, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecategory_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecategory_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_servicecategory_seq`
--

INSERT INTO `vtiger_servicecategory_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecf`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecf` (
  `serviceid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecontracts`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecontracts` (
  `servicecontractsid` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `sc_related_to` int(11) DEFAULT NULL,
  `tracking_unit` varchar(100) DEFAULT NULL,
  `total_units` decimal(5,2) DEFAULT NULL,
  `used_units` decimal(5,2) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `planned_duration` varchar(256) DEFAULT NULL,
  `actual_duration` varchar(256) DEFAULT NULL,
  `contract_status` varchar(200) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `contract_type` varchar(200) DEFAULT NULL,
  `progress` decimal(5,2) DEFAULT NULL,
  `contract_no` varchar(100) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  KEY `fk_crmid_vtiger_servicecontracts` (`servicecontractsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_servicecontractscf`
--

CREATE TABLE IF NOT EXISTS `vtiger_servicecontractscf` (
  `servicecontractsid` int(11) NOT NULL,
  PRIMARY KEY (`servicecontractsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_service_usageunit`
--

CREATE TABLE IF NOT EXISTS `vtiger_service_usageunit` (
  `service_usageunitid` int(11) NOT NULL,
  `service_usageunit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`service_usageunitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_service_usageunit`
--

INSERT INTO `vtiger_service_usageunit` (`service_usageunitid`, `service_usageunit`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Hours', 1, 226, 1, NULL),
(2, 'Days', 1, 227, 2, NULL),
(3, 'Incidents', 1, 228, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_service_usageunit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_service_usageunit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_service_usageunit_seq`
--

INSERT INTO `vtiger_service_usageunit_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_seticketsrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_seticketsrel` (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `ticketid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`,`ticketid`),
  KEY `seticketsrel_crmid_idx` (`crmid`),
  KEY `seticketsrel_ticketid_idx` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_settings_blocks`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_blocks` (
  `blockid` int(19) NOT NULL,
  `label` varchar(250) DEFAULT NULL,
  `sequence` int(19) DEFAULT NULL,
  PRIMARY KEY (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_settings_blocks`
--

INSERT INTO `vtiger_settings_blocks` (`blockid`, `label`, `sequence`) VALUES
(1, 'LBL_USER_MANAGEMENT', 1),
(4, 'LBL_OTHER_SETTINGS', 10),
(5, 'LBL_MODULE_MANAGER', 2),
(6, 'LBL_INTEGRATION', 8),
(7, 'LBL_AUTOMATION', 3),
(8, 'LBL_CONFIGURATION', 4),
(9, 'LBL_MARKETING_SALES', 5),
(10, 'LBL_INVENTORY', 6),
(11, 'LBL_MY_PREFERENCES', 7),
(12, 'LBL_EXTENSIONS', 9);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_settings_blocks_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_blocks_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_settings_blocks_seq`
--

INSERT INTO `vtiger_settings_blocks_seq` (`id`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_settings_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_field` (
  `fieldid` int(19) NOT NULL,
  `blockid` int(19) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `iconpath` varchar(300) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `linkto` text DEFAULT NULL,
  `sequence` int(19) DEFAULT NULL,
  `active` int(19) DEFAULT 0,
  `pinned` int(1) DEFAULT 0,
  PRIMARY KEY (`fieldid`),
  KEY `fk_1_vtiger_settings_field` (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_settings_field`
--

INSERT INTO `vtiger_settings_field` (`fieldid`, `blockid`, `name`, `iconpath`, `description`, `linkto`, `sequence`, `active`, `pinned`) VALUES
(1, 1, 'LBL_USERS', 'ico-users.gif', 'LBL_USER_DESCRIPTION', 'index.php?module=Users&parent=Settings&view=List', 1, 0, 1),
(2, 1, 'LBL_ROLES', 'ico-roles.gif', 'LBL_ROLE_DESCRIPTION', 'index.php?module=Roles&parent=Settings&view=Index', 2, 0, 0),
(3, 1, 'LBL_PROFILES', 'ico-profile.gif', 'LBL_PROFILE_DESCRIPTION', 'index.php?module=Profiles&parent=Settings&view=List', 3, 0, 0),
(4, 1, 'USERGROUPLIST', 'ico-groups.gif', 'LBL_GROUP_DESCRIPTION', 'index.php?module=Groups&parent=Settings&view=List', 5, 0, 0),
(5, 1, 'LBL_SHARING_ACCESS', 'shareaccess.gif', 'LBL_SHARING_ACCESS_DESCRIPTION', 'index.php?module=SharingAccess&parent=Settings&view=Index', 4, 0, 0),
(7, 1, 'LBL_LOGIN_HISTORY_DETAILS', 'set-IcoLoginHistory.gif', 'LBL_LOGIN_HISTORY_DESCRIPTION', 'index.php?module=LoginHistory&parent=Settings&view=List', 6, 0, 0),
(8, 5, 'VTLIB_LBL_MODULE_MANAGER', 'vtlib_modmng.gif', 'VTLIB_LBL_MODULE_MANAGER_DESCRIPTION', 'index.php?module=ModuleManager&parent=Settings&view=List', 1, 0, 1),
(9, 8, 'LBL_PICKLIST_EDITOR', 'picklist.gif', 'LBL_PICKLIST_DESCRIPTION', 'index.php?parent=Settings&module=Picklist&view=Index', 6, 0, 1),
(10, 8, 'LBL_PICKLIST_DEPENDENCY', 'picklistdependency.gif', 'LBL_PICKLIST_DEPENDENCY_DESCRIPTION', 'index.php?parent=Settings&module=PickListDependency&view=List', 7, 0, 0),
(11, 8, 'LBL_MENU_EDITOR', 'menueditor.png', 'LBL_MENU_DESC', 'index.php?module=MenuEditor&parent=Settings&view=Index', 8, 0, 0),
(14, 8, 'LBL_COMPANY_DETAILS', 'company.gif', 'LBL_COMPANY_DESCRIPTION', 'index.php?parent=Settings&module=Vtiger&view=CompanyDetails', 1, 0, 0),
(15, 8, 'LBL_MAIL_SERVER_SETTINGS', 'ogmailserver.gif', 'LBL_MAIL_SERVER_DESCRIPTION', 'index.php?parent=Settings&module=Vtiger&view=OutgoingServerDetail', 4, 0, 0),
(16, 8, 'LBL_CURRENCY_SETTINGS', 'currency.gif', 'LBL_CURRENCY_DESCRIPTION', 'index.php?parent=Settings&module=Currency&view=List', 3, 0, 0),
(17, 10, 'LBL_TAX_SETTINGS', 'taxConfiguration.gif', 'LBL_TAX_DESCRIPTION', 'index.php?module=Vtiger&parent=Settings&view=TaxIndex', 1, 0, 0),
(18, 4, 'LBL_SYSTEM_INFO', 'system.gif', 'LBL_SYSTEM_DESCRIPTION', 'index.php?module=Settings&submodule=Server&view=ProxyConfig', 6, 1, 0),
(20, 4, 'LBL_DEFAULT_MODULE_VIEW', 'set-IcoTwoTabConfig.gif', 'LBL_DEFAULT_MODULE_VIEW_DESC', 'index.php?module=Settings&action=DefModuleView&parenttab=Settings', 2, 0, 0),
(21, 10, 'INVENTORYTERMSANDCONDITIONS', 'terms.gif', 'LBL_INV_TANDC_DESCRIPTION', 'index.php?parent=Settings&module=Vtiger&view=TermsAndConditionsEdit', 2, 0, 0),
(22, 5, 'LBL_CUSTOMIZE_MODENT_NUMBER', 'settingsInvNumber.gif', 'LBL_CUSTOMIZE_MODENT_NUMBER_DESCRIPTION', 'index.php?module=Vtiger&parent=Settings&view=CustomRecordNumbering', 4, 0, 0),
(23, 4, 'LBL_MAIL_SCANNER', 'mailScanner.gif', 'LBL_MAIL_SCANNER_DESCRIPTION', 'index.php?parent=Settings&module=MailConverter&view=List', 5, 0, 0),
(24, 7, 'LBL_LIST_WORKFLOWS', 'settingsWorkflow.png', 'LBL_LIST_WORKFLOWS_DESCRIPTION', 'index.php?module=Workflows&parent=Settings&view=List', 3, 0, 1),
(25, 8, 'Configuration Editor', 'migrate.gif', 'LBL_CONFIG_EDITOR_DESCRIPTION', 'index.php?module=Vtiger&parent=Settings&view=ConfigEditorDetail', 5, 0, 0),
(26, 7, 'Scheduler', 'Cron.png', 'Allows you to Configure Cron Task', 'index.php?module=CronTasks&parent=Settings&view=List', 2, 0, 0),
(28, 4, 'ModTracker', 'set-IcoLoginHistory.gif', 'LBL_MODTRACKER_DESCRIPTION', 'index.php?module=ModTracker&action=BasicSettings&parenttab=Settings&formodule=ModTracker', 9, 0, 0),
(30, 8, 'LBL_CUSTOMER_PORTAL', 'portal_icon.png', 'PORTAL_EXTENSION_DESCRIPTION', 'index.php?module=CustomerPortal&parent=Settings&view=Index', 2, 0, 0),
(31, 7, 'Webforms', 'modules/Webforms/img/Webform.png', 'LBL_WEBFORMS_DESCRIPTION', 'index.php?module=Webforms&parent=Settings&view=List', 1, 1, 0),
(32, 5, 'LBL_EDIT_FIELDS', '', 'LBL_LAYOUT_EDITOR_DESCRIPTION', 'index.php?module=LayoutEditor&parent=Settings&view=Index', 2, 0, 0),
(33, 9, 'LBL_LEAD_MAPPING', 'NULL', 'NULL', 'index.php?parent=Settings&module=Leads&view=MappingDetail', 1, 0, 1),
(34, 9, 'LBL_OPPORTUNITY_MAPPING', 'NULL', 'NULL', 'index.php?parent=Settings&module=Potentials&view=MappingDetail', 2, 0, 1),
(35, 11, 'My Preferences', 'NULL', 'NULL', 'index.php?module=Users&view=PreferenceDetail&parent=Settings&record=1', 1, 0, 1),
(36, 11, 'Calendar Settings', 'NULL', 'NULL', 'index.php?module=Users&parent=Settings&view=Calendar&record=1', 2, 0, 1),
(37, 11, 'LBL_MY_TAGS', 'NULL', 'NULL', 'index.php?module=Tags&parent=Settings&view=List&record=1', 3, 0, 1),
(38, 12, 'LBL_EXTENSION_STORE', 'NULL', 'NULL', 'index.php?module=ExtensionStore&parent=Settings&view=ExtensionStore', 1, 0, 1),
(39, 12, 'LBL_GOOGLE', 'NULL', 'NULL', 'index.php?module=Contacts&parent=Settings&view=Extension&extensionModule=Google&extensionView=Index&mode=settings', 2, 1, 1),
(41, 4, 'VGS Related Field Generator', '', 'VGSRelatedFields Configuration', 'index.php?module=VGSRelatedFields&view=IndexVGSRelatedFields&parent=Settings', 10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_settings_field_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_settings_field_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_settings_field_seq`
--

INSERT INTO `vtiger_settings_field_seq` (`id`) VALUES
(41);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sharedcalendar`
--

CREATE TABLE IF NOT EXISTS `vtiger_sharedcalendar` (
  `userid` int(19) NOT NULL,
  `sharedid` int(19) NOT NULL,
  PRIMARY KEY (`userid`,`sharedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_shareduserinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_shareduserinfo` (
  `userid` int(19) NOT NULL DEFAULT 0,
  `shareduserid` int(19) NOT NULL DEFAULT 0,
  `color` varchar(50) DEFAULT NULL,
  `visible` int(19) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_shippingtaxinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_shippingtaxinfo` (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) DEFAULT NULL,
  `taxlabel` varchar(50) DEFAULT NULL,
  `percentage` decimal(7,3) DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `compoundon` varchar(400) DEFAULT NULL,
  `regions` text DEFAULT NULL,
  PRIMARY KEY (`taxid`),
  KEY `shippingtaxinfo_taxname_idx` (`taxname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_shippingtaxinfo`
--

INSERT INTO `vtiger_shippingtaxinfo` (`taxid`, `taxname`, `taxlabel`, `percentage`, `deleted`, `method`, `type`, `compoundon`, `regions`) VALUES
(1, 'shtax1', 'VAT', '4.500', 0, 'Simple', 'Fixed', '[]', '[]'),
(2, 'shtax2', 'Sales', '10.000', 0, 'Simple', 'Fixed', '[]', '[]'),
(3, 'shtax3', 'Service', '12.500', 0, 'Simple', 'Fixed', '[]', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_shippingtaxinfo_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_shippingtaxinfo_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_shippingtaxinfo_seq`
--

INSERT INTO `vtiger_shippingtaxinfo_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_shorturls`
--

CREATE TABLE IF NOT EXISTS `vtiger_shorturls` (
  `id` int(11) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `handler_path` varchar(400) DEFAULT NULL,
  `handler_class` varchar(100) DEFAULT NULL,
  `handler_function` varchar(100) DEFAULT NULL,
  `handler_data` varchar(255) DEFAULT NULL,
  `onetime` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_smsnotifier`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier` (
  `smsnotifierid` int(19) NOT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`smsnotifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_smsnotifiercf`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifiercf` (
  `smsnotifierid` int(19) NOT NULL,
  PRIMARY KEY (`smsnotifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_smsnotifier_servers`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier_servers` (
  `id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL,
  `providertype` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_smsnotifier_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_smsnotifier_status` (
  `smsnotifierid` int(19) DEFAULT NULL,
  `tonumber` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `smsmessageid` varchar(50) DEFAULT NULL,
  `needlookup` int(1) DEFAULT 1,
  `statusid` int(11) NOT NULL,
  `statusmessage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_soapservice`
--

CREATE TABLE IF NOT EXISTS `vtiger_soapservice` (
  `id` int(19) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `sessionid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sobillads`
--

CREATE TABLE IF NOT EXISTS `vtiger_sobillads` (
  `sobilladdressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) DEFAULT NULL,
  `bill_code` varchar(30) DEFAULT NULL,
  `bill_country` varchar(30) DEFAULT NULL,
  `bill_state` varchar(30) DEFAULT NULL,
  `bill_street` varchar(250) DEFAULT NULL,
  `bill_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sobilladdressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_soshipads`
--

CREATE TABLE IF NOT EXISTS `vtiger_soshipads` (
  `soshipaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) DEFAULT NULL,
  `ship_code` varchar(30) DEFAULT NULL,
  `ship_country` varchar(30) DEFAULT NULL,
  `ship_state` varchar(30) DEFAULT NULL,
  `ship_street` varchar(250) DEFAULT NULL,
  `ship_pobox` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`soshipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sostatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatus` (
  `sostatusid` int(19) NOT NULL,
  `sostatus` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sostatusid`),
  UNIQUE KEY `sostatus_sostatus_idx` (`sostatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_sostatus`
--

INSERT INTO `vtiger_sostatus` (`sostatusid`, `sostatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Created', 0, 166, 0, NULL),
(2, 'Approved', 0, 167, 1, NULL),
(3, 'Delivered', 0, 168, 2, NULL),
(4, 'Cancelled', 0, 169, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sostatushistory`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatushistory` (
  `historyid` int(19) NOT NULL,
  `salesorderid` int(19) NOT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `sostatus` varchar(200) DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL,
  PRIMARY KEY (`historyid`),
  KEY `sostatushistory_salesorderid_idx` (`salesorderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sostatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_sostatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_sostatus_seq`
--

INSERT INTO `vtiger_sostatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_sqltimelog`
--

CREATE TABLE IF NOT EXISTS `vtiger_sqltimelog` (
  `id` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `started` decimal(20,6) DEFAULT NULL,
  `ended` decimal(20,6) DEFAULT NULL,
  `loggedon` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_start_hour`
--

CREATE TABLE IF NOT EXISTS `vtiger_start_hour` (
  `start_hourid` int(11) NOT NULL,
  `start_hour` varchar(200) NOT NULL,
  `sortorderid` int(11) DEFAULT NULL,
  `presence` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`start_hourid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_start_hour`
--

INSERT INTO `vtiger_start_hour` (`start_hourid`, `start_hour`, `sortorderid`, `presence`) VALUES
(1, '00:00', 0, 1),
(2, '01:00', 1, 1),
(3, '02:00', 2, 1),
(4, '03:00', 3, 1),
(5, '04:00', 4, 1),
(6, '05:00', 5, 1),
(7, '06:00', 6, 1),
(8, '07:00', 7, 1),
(9, '08:00', 8, 1),
(10, '09:00', 9, 1),
(11, '10:00', 10, 1),
(12, '11:00', 11, 1),
(13, '12:00', 12, 1),
(14, '13:00', 13, 1),
(15, '14:00', 14, 1),
(16, '15:00', 15, 1),
(17, '16:00', 16, 1),
(18, '17:00', 17, 1),
(19, '18:00', 18, 1),
(20, '19:00', 19, 1),
(21, '20:00', 20, 1),
(22, '21:00', 21, 1),
(23, '22:00', 22, 1),
(24, '23:00', 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_start_hour_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_start_hour_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_start_hour_seq`
--

INSERT INTO `vtiger_start_hour_seq` (`id`) VALUES
(24);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_status`
--

CREATE TABLE IF NOT EXISTS `vtiger_status` (
  `statusid` int(19) NOT NULL,
  `status` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_status`
--

INSERT INTO `vtiger_status` (`statusid`, `status`, `presence`, `picklist_valueid`) VALUES
(1, 'Active', 0, 1),
(2, 'Inactive', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_status_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_status_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_status_seq`
--

INSERT INTO `vtiger_status_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_supportprotocol`
--

CREATE TABLE IF NOT EXISTS `vtiger_supportprotocol` (
  `supportprotocolid` int(19) NOT NULL,
  `hinhthuchotro` varchar(255) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`supportprotocolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_supportprotocolcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_supportprotocolcf` (
  `supportprotocolid` int(19) NOT NULL,
  `cf_1215` text DEFAULT NULL,
  PRIMARY KEY (`supportprotocolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_systems`
--

CREATE TABLE IF NOT EXISTS `vtiger_systems` (
  `id` int(19) NOT NULL,
  `server` varchar(100) DEFAULT NULL,
  `server_port` int(19) DEFAULT NULL,
  `server_username` varchar(100) DEFAULT NULL,
  `server_password` varchar(255) DEFAULT NULL,
  `server_type` varchar(20) DEFAULT NULL,
  `smtp_auth` varchar(5) DEFAULT NULL,
  `server_path` varchar(256) DEFAULT NULL,
  `from_email_field` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tab`
--

CREATE TABLE IF NOT EXISTS `vtiger_tab` (
  `tabid` int(19) NOT NULL DEFAULT 0,
  `name` varchar(25) NOT NULL,
  `presence` int(19) NOT NULL DEFAULT 1,
  `tabsequence` int(10) DEFAULT NULL,
  `tablabel` varchar(100) DEFAULT NULL,
  `modifiedby` int(19) DEFAULT NULL,
  `modifiedtime` int(19) DEFAULT NULL,
  `customized` int(19) DEFAULT NULL,
  `ownedby` int(19) DEFAULT NULL,
  `isentitytype` int(11) NOT NULL DEFAULT 1,
  `trial` int(1) NOT NULL DEFAULT 0,
  `version` varchar(10) DEFAULT NULL,
  `parent` varchar(30) DEFAULT NULL,
  `source` varchar(255) DEFAULT 'custom',
  `issyncable` tinyint(1) DEFAULT 0,
  `allowduplicates` tinyint(1) DEFAULT 1,
  `sync_action_for_duplicates` int(1) DEFAULT 1,
  PRIMARY KEY (`tabid`),
  UNIQUE KEY `tab_name_idx` (`name`),
  KEY `tab_modifiedby_idx` (`modifiedby`),
  KEY `tab_tabid_idx` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_tab`
--

INSERT INTO `vtiger_tab` (`tabid`, `name`, `presence`, `tabsequence`, `tablabel`, `modifiedby`, `modifiedtime`, `customized`, `ownedby`, `isentitytype`, `trial`, `version`, `parent`, `source`, `issyncable`, `allowduplicates`, `sync_action_for_duplicates`) VALUES
(1, 'Dashboard', 0, 12, 'Dashboards', NULL, NULL, 0, 1, 0, 0, NULL, 'Analytics', NULL, 1, 1, 1),
(2, 'Potentials', 0, 7, 'Potentials', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales', NULL, 1, 1, 1),
(3, 'Home', 0, 1, 'Home', NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, 1, 1, 1),
(4, 'Contacts', 1, 6, 'Contacts', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales', NULL, 1, 1, 1),
(6, 'Accounts', 1, 5, 'Accounts', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales', NULL, 1, 0, 1),
(7, 'Leads', 0, 4, 'Leads', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales', NULL, 1, 1, 1),
(8, 'Documents', 1, 9, 'Documents', NULL, NULL, 0, 0, 1, 0, NULL, 'Tools', NULL, 1, 1, 1),
(9, 'Calendar', 0, 3, 'Calendar', NULL, NULL, 0, 0, 1, 0, NULL, 'Tools', NULL, 1, 1, 1),
(10, 'Emails', 1, 10, 'Emails', NULL, NULL, 0, 1, 1, 0, NULL, 'Tools', NULL, 1, 1, 1),
(13, 'HelpDesk', 1, 11, 'HelpDesk', NULL, NULL, 0, 0, 1, 0, NULL, 'Support', NULL, 1, 1, 1),
(14, 'Products', 0, 8, 'Products', NULL, NULL, 0, 0, 1, 0, NULL, 'Inventory', NULL, 1, 1, 1),
(15, 'Faq', 1, -1, 'Faq', NULL, NULL, 0, 1, 1, 0, NULL, 'Support', NULL, 1, 1, 1),
(16, 'Events', 2, -1, 'Events', NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 1),
(18, 'Vendors', 0, -1, 'Vendors', NULL, NULL, 0, 0, 1, 0, NULL, 'Inventory', NULL, 1, 1, 1),
(19, 'PriceBooks', 1, -1, 'PriceBooks', NULL, NULL, 0, 1, 1, 0, NULL, 'Inventory', NULL, 1, 1, 1),
(20, 'Quotes', 0, -1, 'Quotes', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales', NULL, 1, 1, 1),
(21, 'PurchaseOrder', 1, -1, 'PurchaseOrder', NULL, NULL, 0, 0, 1, 0, NULL, 'Inventory', NULL, 1, 1, 1),
(22, 'SalesOrder', 0, -1, 'SalesOrder', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales', NULL, 1, 1, 1),
(23, 'Invoice', 0, -1, 'Invoice', NULL, NULL, 0, 0, 1, 0, NULL, 'Sales', NULL, 1, 1, 1),
(24, 'Rss', 1, -1, 'Rss', NULL, NULL, 0, 1, 0, 0, NULL, 'Tools', NULL, 1, 1, 1),
(25, 'Reports', 0, -1, 'Reports', NULL, NULL, 0, 1, 0, 0, NULL, 'Analytics', NULL, 1, 1, 1),
(26, 'Campaigns', 0, -1, 'Campaigns', NULL, NULL, 0, 0, 1, 0, NULL, 'Marketing', NULL, 1, 1, 1),
(27, 'Portal', 1, -1, 'Portal', NULL, NULL, 0, 1, 0, 0, NULL, 'Tools', NULL, 1, 1, 1),
(28, 'Webmails', 1, -1, 'Webmails', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, 1, 1, 1),
(29, 'Users', 0, -1, 'Users', NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, 1, 1, 1),
(30, 'Import', 0, -1, 'Import', NULL, NULL, 1, 0, 0, 0, '1.7', '', NULL, 1, 1, 1),
(31, 'MailManager', 1, -1, 'MailManager', NULL, NULL, 1, 0, 0, 0, '1.9', 'Tools', NULL, 1, 1, 1),
(32, 'Mobile', 0, -1, 'Mobile', NULL, NULL, 1, 0, 0, 0, '2.0', '', NULL, 1, 1, 1),
(33, 'ModTracker', 0, -1, 'ModTracker', NULL, NULL, 0, 0, 0, 0, '1.2', '', NULL, 1, 1, 1),
(34, 'PBXManager', 1, -1, 'PBXManager', NULL, NULL, 1, 0, 1, 0, '2.2', 'Tools', NULL, 1, 1, 1),
(35, 'ServiceContracts', 1, -1, 'Service Contracts', NULL, NULL, 0, 0, 1, 0, '2.4', 'Support', NULL, 1, 1, 1),
(36, 'Services', 1, -1, 'Services', NULL, NULL, 0, 0, 1, 0, '2.6', 'Inventory', NULL, 1, 1, 1),
(37, 'WSAPP', 0, -1, 'WSAPP', NULL, NULL, 1, 0, 0, 0, '3.4.4', '', NULL, 1, 1, 1),
(38, 'Assets', 1, -1, 'Assets', NULL, NULL, 0, 0, 1, 0, '2.0', 'Inventory', NULL, 1, 1, 1),
(39, 'CustomerPortal', 0, -1, 'CustomerPortal', NULL, NULL, 0, 0, 0, 0, '1.4', '', NULL, 1, 1, 1),
(40, 'EmailTemplates', 0, -1, 'Email Templates', NULL, NULL, 1, 0, 0, 0, '1.0', 'Tools', NULL, 1, 1, 1),
(41, 'Google', 1, -1, 'Google', NULL, NULL, 0, 0, 0, 0, '1.5', '', NULL, 1, 1, 1),
(42, 'ModComments', 0, -1, 'Comments', NULL, NULL, 0, 0, 1, 0, '2.1', '', NULL, 1, 1, 1),
(43, 'ProjectMilestone', 1, -1, 'ProjectMilestone', NULL, NULL, 0, 0, 1, 0, '3.0', 'Support', NULL, 1, 1, 1),
(44, 'ProjectTask', 1, -1, 'ProjectTask', NULL, NULL, 0, 0, 1, 0, '3.1', 'Support', NULL, 1, 1, 1),
(45, 'Project', 1, -1, 'Project', NULL, NULL, 0, 0, 1, 0, '3.3', 'Support', NULL, 1, 1, 1),
(46, 'RecycleBin', 0, -1, 'Recycle Bin', NULL, NULL, 0, 0, 0, 0, '1.5', 'Tools', NULL, 1, 1, 1),
(47, 'SMSNotifier', 1, -1, 'SMSNotifier', NULL, NULL, 0, 0, 1, 0, '2.1', 'Sales', NULL, 1, 1, 1),
(48, 'Webforms', 1, -1, 'Webforms', NULL, NULL, 0, 0, 0, 0, '1.6', '', NULL, 1, 1, 1),
(49, 'ExtensionStore', 0, -1, 'Extension Store', NULL, NULL, 1, 0, 0, 0, '1.2', NULL, NULL, 1, 1, 1),
(50, 'SettingHrm', 1, -1, 'Setting Hrm', NULL, NULL, 1, 0, 1, 0, '1.0', 'Tools', 'custom', 0, 1, 1),
(51, 'SettingPosition', 1, -1, 'Setting Position', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(52, 'SettingWeight', 1, -1, 'Setting Weight', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(53, 'SalaryComponent', 1, -1, 'Salary Components', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(54, 'Salary', 1, -1, 'Salary', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(55, 'Rating', 1, -1, 'Rating', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(56, 'JD', 0, -1, 'JD', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(57, 'QCM', 1, -1, 'QCM', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(58, 'KPI', 1, -1, 'KPI', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(59, 'Candidates', 1, -1, 'Candidates', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(60, 'Leave', 1, -1, 'Leave', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(61, 'Employee', 0, -1, 'Employee', NULL, NULL, 1, 0, 1, 0, '1.0', 'HRM', 'custom', 0, 1, 1),
(63, 'CustomerEnterprise', 0, -1, 'CustomerEnterprise', NULL, NULL, 1, 0, 1, 0, '0', 'Contacts', 'custom', 0, 1, 1),
(64, 'CustomerStandalone', 0, -1, 'CustomerStandalone', NULL, NULL, 1, 0, 1, 0, '0', 'Contacts', 'custom', 0, 1, 1),
(65, 'ProblemCategory', 0, -1, 'ProblemCategory', NULL, NULL, 1, 0, 1, 0, '0', 'Support', 'custom', 0, 1, 1),
(66, 'SupportProtocol', 0, -1, 'SupportProtocol', NULL, NULL, 1, 0, 1, 0, '0', 'Support', 'custom', 0, 1, 1),
(69, 'VGSRelatedFields', 0, -1, 'VGS Related Fields', NULL, NULL, 1, 0, 0, 0, '2.0', '', 'custom', 0, 1, 1),
(70, 'PhuongTienTruyenThong', 0, -1, 'PhuongTienTruyenThong', NULL, NULL, 1, 0, 1, 0, '0', 'Marketing', 'custom', 0, 1, 1),
(71, 'HinhThucTruyenThong', 0, -1, 'HinhThucTruyenThong', NULL, NULL, 1, 0, 1, 0, '0', 'Marketing', 'custom', 0, 1, 1),
(72, 'QuyTrinhBanHang', 0, -1, 'QuyTrinhBanHang', NULL, NULL, 1, 0, 1, 0, '0', 'Sales', 'custom', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tab_info`
--

CREATE TABLE IF NOT EXISTS `vtiger_tab_info` (
  `tabid` int(19) DEFAULT NULL,
  `prefname` varchar(256) DEFAULT NULL,
  `prefvalue` varchar(256) DEFAULT NULL,
  KEY `fk_1_vtiger_tab_info` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_tab_info`
--

INSERT INTO `vtiger_tab_info` (`tabid`, `prefname`, `prefvalue`) VALUES
(30, 'vtiger_min_version', '6.0.0rc'),
(30, 'vtiger_max_version', '7.*'),
(31, 'vtiger_min_version', '6.0.0RC'),
(32, 'vtiger_min_version', '6.0.0rc'),
(33, 'vtiger_min_version', '6.0.0rc'),
(34, 'vtiger_min_version', '6.0.0'),
(34, 'vtiger_max_version', '7.*'),
(35, 'vtiger_min_version', '6.0.0rc'),
(36, 'vtiger_min_version', '6.0.0rc'),
(36, 'vtiger_max_version', '7.*'),
(37, 'vtiger_min_version', '6.0.0rc'),
(38, 'vtiger_min_version', '6.0.0rc'),
(38, 'vtiger_max_version', '7.*'),
(39, 'vtiger_min_version', '6.0.0rc'),
(39, 'vtiger_max_version', '7.*'),
(40, 'vtiger_min_version', '6.0.0rc'),
(40, 'vtiger_max_version', '7.*'),
(41, 'vtiger_min_version', '6.0.0rc'),
(41, 'vtiger_max_version', '7.*'),
(42, 'vtiger_min_version', '6.0.0rc'),
(42, 'vtiger_max_version', '7.*'),
(43, 'vtiger_min_version', '6.0.0rc'),
(43, 'vtiger_max_version', '7.*'),
(44, 'vtiger_min_version', '6.0.0rc'),
(45, 'vtiger_min_version', '6.0.0rc'),
(46, 'vtiger_min_version', '6.0.0rc'),
(46, 'vtiger_max_version', '7.*'),
(47, 'vtiger_min_version', '6.0.0'),
(47, 'vtiger_max_version', '7.*'),
(48, 'vtiger_min_version', '6.0.0rc'),
(48, 'vtiger_max_version', '7.*'),
(49, 'vtiger_min_version', '6.0.0'),
(49, 'vtiger_max_version', '6.*'),
(50, 'vtiger_min_version', '7.1.0'),
(50, 'vtiger_max_version', '7.*'),
(51, 'vtiger_min_version', '7.1.0'),
(51, 'vtiger_max_version', '7.*'),
(52, 'vtiger_min_version', '7.1.0'),
(52, 'vtiger_max_version', '7.*'),
(53, 'vtiger_min_version', '7.1.0'),
(53, 'vtiger_max_version', '7.*'),
(54, 'vtiger_min_version', '7.1.0'),
(54, 'vtiger_max_version', '7.*'),
(55, 'vtiger_min_version', '7.1.0'),
(55, 'vtiger_max_version', '7.*'),
(56, 'vtiger_min_version', '7.1.0'),
(56, 'vtiger_max_version', '7.*'),
(57, 'vtiger_min_version', '7.1.0'),
(57, 'vtiger_max_version', '7.*'),
(58, 'vtiger_min_version', '7.1.0'),
(58, 'vtiger_max_version', '7.*'),
(59, 'vtiger_min_version', '7.1.0'),
(59, 'vtiger_max_version', '7.*'),
(60, 'vtiger_min_version', '7.1.0'),
(60, 'vtiger_max_version', '7.*'),
(61, 'vtiger_min_version', '7.1.0'),
(61, 'vtiger_max_version', '7.*'),
(69, 'vtiger_min_version', '6.0.0'),
(69, 'vtiger_max_version', '7.*');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taskpriority`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskpriority` (
  `taskpriorityid` int(19) NOT NULL,
  `taskpriority` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`taskpriorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taskpriority`
--

INSERT INTO `vtiger_taskpriority` (`taskpriorityid`, `taskpriority`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'High', 1, 170, 0, NULL),
(2, 'Medium', 1, 171, 1, NULL),
(3, 'Low', 1, 172, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taskpriority_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskpriority_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taskpriority_seq`
--

INSERT INTO `vtiger_taskpriority_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taskstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskstatus` (
  `taskstatusid` int(19) NOT NULL,
  `taskstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`taskstatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taskstatus`
--

INSERT INTO `vtiger_taskstatus` (`taskstatusid`, `taskstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Not Started', 0, 173, 0, NULL),
(2, 'In Progress', 0, 174, 1, NULL),
(3, 'Completed', 0, 175, 2, NULL),
(4, 'Pending Input', 0, 176, 3, NULL),
(5, 'Deferred', 0, 177, 4, NULL),
(6, 'Planned', 0, 178, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taskstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taskstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taskstatus_seq`
--

INSERT INTO `vtiger_taskstatus_seq` (`id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taxclass`
--

CREATE TABLE IF NOT EXISTS `vtiger_taxclass` (
  `taxclassid` int(19) NOT NULL,
  `taxclass` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`taxclassid`),
  UNIQUE KEY `taxclass_carrier_idx` (`taxclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taxclass`
--

INSERT INTO `vtiger_taxclass` (`taxclassid`, `taxclass`, `sortorderid`, `presence`) VALUES
(1, 'SalesTax', 0, 1),
(2, 'Vat', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taxclass_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_taxclass_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_taxclass_seq`
--

INSERT INTO `vtiger_taxclass_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_taxregions`
--

CREATE TABLE IF NOT EXISTS `vtiger_taxregions` (
  `regionid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`regionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketcategories`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcategories` (
  `ticketcategories_id` int(19) NOT NULL,
  `ticketcategories` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 0,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ticketcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketcategories`
--

INSERT INTO `vtiger_ticketcategories` (`ticketcategories_id`, `ticketcategories`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Big Problem', 1, 179, 0, NULL),
(2, 'Small Problem', 1, 180, 1, NULL),
(3, 'Other Problem', 1, 181, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketcategories_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcategories_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketcategories_seq`
--

INSERT INTO `vtiger_ticketcategories_seq` (`id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcf` (
  `ticketid` int(19) NOT NULL DEFAULT 0,
  `from_portal` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketcomments`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketcomments` (
  `commentid` int(19) NOT NULL,
  `ticketid` int(19) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `ownerid` int(19) NOT NULL DEFAULT 0,
  `ownertype` varchar(10) DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `ticketcomments_ticketid_idx` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketpriorities`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketpriorities` (
  `ticketpriorities_id` int(19) NOT NULL,
  `ticketpriorities` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 0,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ticketpriorities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketpriorities`
--

INSERT INTO `vtiger_ticketpriorities` (`ticketpriorities_id`, `ticketpriorities`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Low', 1, 182, 0, NULL),
(2, 'Normal', 1, 183, 1, NULL),
(3, 'High', 1, 184, 2, NULL),
(4, 'Urgent', 1, 185, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketpriorities_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketpriorities_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketpriorities_seq`
--

INSERT INTO `vtiger_ticketpriorities_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketseverities`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketseverities` (
  `ticketseverities_id` int(19) NOT NULL,
  `ticketseverities` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 0,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ticketseverities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketseverities`
--

INSERT INTO `vtiger_ticketseverities` (`ticketseverities_id`, `ticketseverities`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Minor', 1, 186, 0, NULL),
(2, 'Major', 1, 187, 1, NULL),
(3, 'Feature', 1, 188, 2, NULL),
(4, 'Critical', 1, 189, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketseverities_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketseverities_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketseverities_seq`
--

INSERT INTO `vtiger_ticketseverities_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketstatus`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketstatus` (
  `ticketstatus_id` int(19) NOT NULL,
  `ticketstatus` varchar(200) DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 0,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ticketstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketstatus`
--

INSERT INTO `vtiger_ticketstatus` (`ticketstatus_id`, `ticketstatus`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Open', 0, 190, 0, NULL),
(2, 'In Progress', 0, 191, 1, NULL),
(3, 'Wait For Response', 0, 192, 2, NULL),
(4, 'Closed', 0, 193, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ticketstatus_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ticketstatus_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ticketstatus_seq`
--

INSERT INTO `vtiger_ticketstatus_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_time_zone`
--

CREATE TABLE IF NOT EXISTS `vtiger_time_zone` (
  `time_zoneid` int(19) NOT NULL,
  `time_zone` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`time_zoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_time_zone`
--

INSERT INTO `vtiger_time_zone` (`time_zoneid`, `time_zone`, `sortorderid`, `presence`) VALUES
(1, 'Pacific/Midway', 1, 1),
(2, 'Pacific/Samoa', 0, 1),
(3, 'Pacific/Honolulu', 2, 1),
(4, 'America/Anchorage', 3, 1),
(5, 'America/Los_Angeles', 5, 1),
(6, 'America/Tijuana', 4, 1),
(7, 'America/Denver', 6, 1),
(8, 'America/Chihuahua', 8, 1),
(9, 'America/Mazatlan', 7, 1),
(10, 'America/Phoenix', 9, 1),
(11, 'America/Regina', 10, 1),
(12, 'America/Tegucigalpa', 14, 1),
(13, 'America/Chicago', 13, 1),
(14, 'America/Mexico_City', 12, 1),
(15, 'America/Monterrey', 11, 1),
(16, 'America/New_York', 18, 1),
(17, 'America/Bogota', 19, 1),
(18, 'America/Lima', 16, 1),
(19, 'America/Rio_Branco', 15, 1),
(20, 'America/Indiana/Indianapolis', 17, 1),
(21, 'America/Caracas', 20, 1),
(22, 'America/Halifax', 25, 1),
(23, 'America/Manaus', 22, 1),
(24, 'America/Santiago', 21, 1),
(25, 'America/La_Paz', 23, 1),
(26, 'America/Cuiaba', 24, 1),
(27, 'America/Asuncion', 26, 1),
(28, 'America/St_Johns', 27, 1),
(29, 'America/Argentina/Buenos_Aires', 30, 1),
(30, 'America/Sao_Paulo', 31, 1),
(31, 'America/Godthab', 29, 1),
(32, 'America/Montevideo', 28, 1),
(33, 'Atlantic/South_Georgia', 32, 1),
(34, 'Atlantic/Azores', 34, 1),
(35, 'Atlantic/Cape_Verde', 33, 1),
(36, 'Europe/London', 37, 1),
(37, 'UTC', 36, 1),
(38, 'Africa/Monrovia', 38, 1),
(39, 'Africa/Casablanca', 35, 1),
(40, 'Europe/Belgrade', 40, 1),
(41, 'Europe/Sarajevo', 42, 1),
(42, 'Europe/Brussels', 41, 1),
(43, 'Africa/Algiers', 43, 1),
(44, 'Europe/Amsterdam', 39, 1),
(45, 'Europe/Minsk', 52, 1),
(46, 'Africa/Cairo', 47, 1),
(47, 'Europe/Helsinki', 49, 1),
(48, 'Europe/Athens', 45, 1),
(49, 'Europe/Istanbul', 50, 1),
(50, 'Asia/Jerusalem', 51, 1),
(51, 'Asia/Amman', 44, 1),
(52, 'Asia/Beirut', 46, 1),
(53, 'Africa/Windhoek', 53, 1),
(54, 'Africa/Harare', 48, 1),
(55, 'Asia/Kuwait', 55, 1),
(56, 'Asia/Baghdad', 54, 1),
(57, 'Africa/Nairobi', 57, 1),
(58, 'Asia/Tehran', 58, 1),
(59, 'Asia/Tbilisi', 61, 1),
(60, 'Europe/Moscow', 56, 1),
(61, 'Asia/Muscat', 59, 1),
(62, 'Asia/Baku', 60, 1),
(63, 'Asia/Yerevan', 62, 1),
(64, 'Asia/Karachi', 63, 1),
(65, 'Asia/Tashkent', 64, 1),
(66, 'Asia/Kolkata', 65, 1),
(67, 'Asia/Colombo', 66, 1),
(68, 'Asia/Katmandu', 67, 1),
(69, 'Asia/Dhaka', 69, 1),
(70, 'Asia/Almaty', 68, 1),
(71, 'Asia/Yekaterinburg', 70, 1),
(72, 'Asia/Rangoon', 71, 1),
(73, 'Asia/Novosibirsk', 73, 1),
(74, 'Asia/Bangkok', 72, 1),
(75, 'Asia/Brunei', 74, 1),
(76, 'Asia/Krasnoyarsk', 75, 1),
(77, 'Asia/Ulaanbaatar', 79, 1),
(78, 'Asia/Kuala_Lumpur', 76, 1),
(79, 'Asia/Taipei', 78, 1),
(80, 'Australia/Perth', 77, 1),
(81, 'Asia/Irkutsk', 80, 1),
(82, 'Asia/Seoul', 81, 1),
(83, 'Asia/Tokyo', 82, 1),
(84, 'Australia/Darwin', 84, 1),
(85, 'Australia/Adelaide', 83, 1),
(86, 'Australia/Canberra', 86, 1),
(87, 'Australia/Brisbane', 85, 1),
(88, 'Australia/Hobart', 88, 1),
(89, 'Asia/Vladivostok', 89, 1),
(90, 'Pacific/Guam', 87, 1),
(91, 'Asia/Yakutsk', 90, 1),
(92, 'Pacific/Fiji', 93, 1),
(93, 'Asia/Kamchatka', 94, 1),
(94, 'Pacific/Auckland', 92, 1),
(95, 'Asia/Magadan', 95, 1),
(96, 'Pacific/Tongatapu', 96, 1),
(97, 'Etc/GMT-11', 91, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_time_zone_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_time_zone_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_time_zone_seq`
--

INSERT INTO `vtiger_time_zone_seq` (`id`) VALUES
(96);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_read_group_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_group_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`sharedgroupid`),
  KEY `tmp_read_group_rel_sharing_per_userid_sharedgroupid_tabid` (`userid`,`sharedgroupid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_read_group_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_group_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`sharedgroupid`),
  KEY `tmp_read_group_sharing_per_userid_sharedgroupid_idx` (`userid`,`sharedgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_read_user_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_user_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`shareduserid`),
  KEY `tmp_read_user_rel_sharing_per_userid_shared_reltabid_idx` (`userid`,`shareduserid`,`relatedtabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_read_user_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_read_user_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`shareduserid`),
  KEY `tmp_read_user_sharing_per_userid_shareduserid_idx` (`userid`,`shareduserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_write_group_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_group_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`sharedgroupid`),
  KEY `tmp_write_group_rel_sharing_per_userid_sharedgroupid_tabid_idx` (`userid`,`sharedgroupid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_write_group_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_group_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`sharedgroupid`),
  KEY `tmp_write_group_sharing_per_UK1` (`userid`,`sharedgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_write_user_rel_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_user_rel_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`relatedtabid`,`shareduserid`),
  KEY `tmp_write_user_rel_sharing_per_userid_sharduserid_tabid_idx` (`userid`,`shareduserid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tmp_write_user_sharing_per`
--

CREATE TABLE IF NOT EXISTS `vtiger_tmp_write_user_sharing_per` (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`,`shareduserid`),
  KEY `tmp_write_user_sharing_per_userid_shareduserid_idx` (`userid`,`shareduserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tracker`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracker` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(25) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tracking_unit`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracking_unit` (
  `tracking_unitid` int(11) NOT NULL,
  `tracking_unit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tracking_unitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_tracking_unit`
--

INSERT INTO `vtiger_tracking_unit` (`tracking_unitid`, `tracking_unit`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(2, 'Hours', 1, 211, 2, NULL),
(3, 'Days', 1, 212, 3, NULL),
(4, 'Incidents', 1, 213, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_tracking_unit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_tracking_unit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_tracking_unit_seq`
--

INSERT INTO `vtiger_tracking_unit_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_troubletickets`
--

CREATE TABLE IF NOT EXISTS `vtiger_troubletickets` (
  `ticketid` int(19) NOT NULL,
  `ticket_no` varchar(100) NOT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `severity` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `solution` text DEFAULT NULL,
  `update_log` text DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  `hours` decimal(25,8) DEFAULT NULL,
  `days` decimal(25,8) DEFAULT NULL,
  `contact_id` int(19) DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ticketid`),
  KEY `troubletickets_ticketid_idx` (`ticketid`),
  KEY `troubletickets_status_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_usageunit`
--

CREATE TABLE IF NOT EXISTS `vtiger_usageunit` (
  `usageunitid` int(19) NOT NULL,
  `usageunit` varchar(200) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  `sortorderid` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`usageunitid`),
  UNIQUE KEY `usageunit_usageunit_idx` (`usageunit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_usageunit`
--

INSERT INTO `vtiger_usageunit` (`usageunitid`, `usageunit`, `presence`, `picklist_valueid`, `sortorderid`, `color`) VALUES
(1, 'Box', 1, 194, 0, NULL),
(2, 'Carton', 1, 195, 1, NULL),
(3, 'Dozen', 1, 196, 2, NULL),
(4, 'Each', 1, 197, 3, NULL),
(5, 'Hours', 1, 198, 4, NULL),
(6, 'Impressions', 1, 199, 5, NULL),
(7, 'Lb', 1, 200, 6, NULL),
(8, 'M', 1, 201, 7, NULL),
(9, 'Pack', 1, 202, 8, NULL),
(10, 'Pages', 1, 203, 9, NULL),
(11, 'Pieces', 1, 204, 10, NULL),
(12, 'Quantity', 1, 205, 11, NULL),
(13, 'Reams', 1, 206, 12, NULL),
(14, 'Sheet', 1, 207, 13, NULL),
(15, 'Spiral Binder', 1, 208, 14, NULL),
(16, 'Sq Ft', 1, 209, 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_usageunit_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_usageunit_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_usageunit_seq`
--

INSERT INTO `vtiger_usageunit_seq` (`id`) VALUES
(16);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_user2mergefields`
--

CREATE TABLE IF NOT EXISTS `vtiger_user2mergefields` (
  `userid` int(11) DEFAULT NULL,
  `tabid` int(19) DEFAULT NULL,
  `fieldid` int(19) DEFAULT NULL,
  `visible` int(2) DEFAULT NULL,
  KEY `userid_tabid_idx` (`userid`,`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_user2role`
--

CREATE TABLE IF NOT EXISTS `vtiger_user2role` (
  `userid` int(11) NOT NULL,
  `roleid` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `user2role_roleid_idx` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_user2role`
--

INSERT INTO `vtiger_user2role` (`userid`, `roleid`) VALUES
(1, 'H2');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_users`
--

CREATE TABLE IF NOT EXISTS `vtiger_users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `cal_color` varchar(25) DEFAULT '#E6FAD8',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `reports_to_id` varchar(36) DEFAULT NULL,
  `is_admin` varchar(3) DEFAULT '0',
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `date_entered` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` varchar(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `secondaryemail` varchar(100) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(25) DEFAULT NULL,
  `address_postalcode` varchar(9) DEFAULT NULL,
  `user_preferences` text DEFAULT NULL,
  `tz` varchar(30) DEFAULT NULL,
  `holidays` varchar(60) DEFAULT NULL,
  `namedays` varchar(60) DEFAULT NULL,
  `workdays` varchar(30) DEFAULT NULL,
  `weekstart` int(11) DEFAULT NULL,
  `date_format` varchar(200) DEFAULT NULL,
  `hour_format` varchar(30) DEFAULT 'am/pm',
  `start_hour` varchar(30) DEFAULT '10:00',
  `end_hour` varchar(30) DEFAULT '23:00',
  `is_owner` varchar(100) DEFAULT '0',
  `activity_view` varchar(200) DEFAULT 'Today',
  `lead_view` varchar(200) DEFAULT 'Today',
  `imagename` varchar(250) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `confirm_password` varchar(300) DEFAULT NULL,
  `internal_mailer` varchar(3) NOT NULL DEFAULT '1',
  `reminder_interval` varchar(100) DEFAULT NULL,
  `reminder_next_time` varchar(100) DEFAULT NULL,
  `crypt_type` varchar(20) NOT NULL DEFAULT 'MD5',
  `accesskey` varchar(36) DEFAULT NULL,
  `theme` varchar(100) DEFAULT NULL,
  `language` varchar(36) DEFAULT NULL,
  `time_zone` varchar(200) DEFAULT NULL,
  `currency_grouping_pattern` varchar(100) DEFAULT NULL,
  `currency_decimal_separator` varchar(2) DEFAULT NULL,
  `currency_grouping_separator` varchar(2) DEFAULT NULL,
  `currency_symbol_placement` varchar(20) DEFAULT NULL,
  `phone_crm_extension` varchar(100) DEFAULT NULL,
  `no_of_currency_decimals` varchar(2) DEFAULT NULL,
  `truncate_trailing_zeros` varchar(3) DEFAULT NULL,
  `dayoftheweek` varchar(100) DEFAULT NULL,
  `callduration` varchar(100) DEFAULT NULL,
  `othereventduration` varchar(100) DEFAULT NULL,
  `calendarsharedtype` varchar(100) DEFAULT NULL,
  `default_record_view` varchar(10) DEFAULT NULL,
  `leftpanelhide` varchar(3) DEFAULT NULL,
  `rowheight` varchar(10) DEFAULT NULL,
  `defaulteventstatus` varchar(50) DEFAULT NULL,
  `defaultactivitytype` varchar(50) DEFAULT NULL,
  `hidecompletedevents` int(11) DEFAULT NULL,
  `defaultcalendarview` varchar(100) DEFAULT NULL,
  `candidate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_user_name_idx` (`user_name`),
  KEY `user_user_password_idx` (`user_password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_users`
--

INSERT INTO `vtiger_users` (`id`, `user_name`, `user_password`, `cal_color`, `first_name`, `last_name`, `reports_to_id`, `is_admin`, `currency_id`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `title`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `email1`, `email2`, `secondaryemail`, `status`, `signature`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `user_preferences`, `tz`, `holidays`, `namedays`, `workdays`, `weekstart`, `date_format`, `hour_format`, `start_hour`, `end_hour`, `is_owner`, `activity_view`, `lead_view`, `imagename`, `deleted`, `confirm_password`, `internal_mailer`, `reminder_interval`, `reminder_next_time`, `crypt_type`, `accesskey`, `theme`, `language`, `time_zone`, `currency_grouping_pattern`, `currency_decimal_separator`, `currency_grouping_separator`, `currency_symbol_placement`, `phone_crm_extension`, `no_of_currency_decimals`, `truncate_trailing_zeros`, `dayoftheweek`, `callduration`, `othereventduration`, `calendarsharedtype`, `default_record_view`, `leftpanelhide`, `rowheight`, `defaulteventstatus`, `defaultactivitytype`, `hidecompletedevents`, `defaultcalendarview`, `candidate`) VALUES
(1, 'admin', '$2y$10$PkfxKe/NIdgDNOGBoFlmZelbtZ6d1eLQchtfVMyHMEXxnDcf6Er1K', '#E6FAD8', 'Leonce', 'Wang', '', 'on', 1, '', '2020-04-08 05:38:54', NULL, NULL, '', '', '', '', '', '', '', 'ThienLang99999@gmail.com', '', '', 'Active', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 'dd-mm-yyyy', '12', '00:00', '23:00', '1', 'This Week', 'Today', '', 0, '$2y$10$JGKsxD9u2tKpopO6tI9Zr.1/Y8GVGSfzSjr1cy1KNqqJapljAa0Ci', '1', '1 Minute', NULL, 'PHASH', 'jNG2wZe7gv9Rk0fl', 'alphagrey', 'vn_vn', 'Asia/Bangkok', '123,456,789', '.', ',', '1.0$', '', '2', '1', 'Sunday', '5', '5', 'public', 'Summary', '0', '', 'Planned', 'Call', 0, 'MyCalendar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_users2group`
--

CREATE TABLE IF NOT EXISTS `vtiger_users2group` (
  `groupid` int(19) NOT NULL,
  `userid` int(19) NOT NULL,
  PRIMARY KEY (`groupid`,`userid`),
  KEY `users2group_groupname_uerid_idx` (`groupid`,`userid`),
  KEY `fk_2_vtiger_users2group` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_users2group`
--

INSERT INTO `vtiger_users2group` (`groupid`, `userid`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_users_last_import`
--

CREATE TABLE IF NOT EXISTS `vtiger_users_last_import` (
  `id` int(36) NOT NULL,
  `assigned_user_id` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_users_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_users_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_users_seq`
--

INSERT INTO `vtiger_users_seq` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_user_module_preferences`
--

CREATE TABLE IF NOT EXISTS `vtiger_user_module_preferences` (
  `userid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `default_cvid` int(19) NOT NULL,
  PRIMARY KEY (`userid`,`tabid`),
  KEY `fk_2_vtiger_user_module_preferences` (`tabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_user_module_preferences`
--

INSERT INTO `vtiger_user_module_preferences` (`userid`, `tabid`, `default_cvid`) VALUES
(1, 56, 64);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_vendor`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendor` (
  `vendorid` int(19) NOT NULL DEFAULT 0,
  `vendor_no` varchar(100) NOT NULL,
  `vendorname` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `glacct` varchar(200) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `street` text DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `pobox` varchar(30) DEFAULT NULL,
  `postalcode` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_vendorcf`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendorcf` (
  `vendorid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_vendorcontactrel`
--

CREATE TABLE IF NOT EXISTS `vtiger_vendorcontactrel` (
  `vendorid` int(19) NOT NULL DEFAULT 0,
  `contactid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`vendorid`,`contactid`),
  KEY `vendorcontactrel_vendorid_idx` (`vendorid`),
  KEY `vendorcontactrel_contact_idx` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_version`
--

CREATE TABLE IF NOT EXISTS `vtiger_version` (
  `id` int(11) NOT NULL,
  `old_version` varchar(30) DEFAULT NULL,
  `current_version` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_version`
--

INSERT INTO `vtiger_version` (`id`, `old_version`, `current_version`) VALUES
(1, '7.2.0', '7.2.0');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_version_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_version_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_version_seq`
--

INSERT INTO `vtiger_version_seq` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_visibility`
--

CREATE TABLE IF NOT EXISTS `vtiger_visibility` (
  `visibilityid` int(19) NOT NULL,
  `visibility` varchar(200) NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`visibilityid`),
  UNIQUE KEY `visibility_visibility_idx` (`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_visibility`
--

INSERT INTO `vtiger_visibility` (`visibilityid`, `visibility`, `sortorderid`, `presence`, `color`) VALUES
(1, 'Private', 0, 1, NULL),
(2, 'Public', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_visibility_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_visibility_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_visibility_seq`
--

INSERT INTO `vtiger_visibility_seq` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_webforms`
--

CREATE TABLE IF NOT EXISTS `vtiger_webforms` (
  `id` int(19) NOT NULL,
  `name` varchar(100) NOT NULL,
  `publicid` varchar(100) NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `targetmodule` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `ownerid` int(19) NOT NULL,
  `returnurl` varchar(250) DEFAULT NULL,
  `captcha` int(1) NOT NULL DEFAULT 0,
  `roundrobin` int(1) NOT NULL DEFAULT 0,
  `roundrobin_userid` varchar(256) DEFAULT NULL,
  `roundrobin_logic` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webformname` (`name`),
  UNIQUE KEY `publicid` (`id`),
  KEY `webforms_webforms_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_webforms_field`
--

CREATE TABLE IF NOT EXISTS `vtiger_webforms_field` (
  `id` int(19) NOT NULL,
  `webformid` int(19) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `neutralizedfield` varchar(50) NOT NULL,
  `defaultvalue` text DEFAULT NULL,
  `required` int(10) NOT NULL DEFAULT 0,
  `sequence` int(10) DEFAULT NULL,
  `hidden` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webforms_webforms_field_idx` (`id`),
  KEY `fk_1_vtiger_webforms_field` (`webformid`),
  KEY `fk_2_vtiger_webforms_field` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_webform_file_fields`
--

CREATE TABLE IF NOT EXISTS `vtiger_webform_file_fields` (
  `id` int(19) NOT NULL,
  `webformid` int(19) NOT NULL,
  `fieldname` varchar(100) NOT NULL,
  `fieldlabel` varchar(100) NOT NULL,
  `required` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_vtiger_webforms` (`webformid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wordtemplates`
--

CREATE TABLE IF NOT EXISTS `vtiger_wordtemplates` (
  `templateid` int(19) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `module` varchar(30) NOT NULL,
  `date_entered` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_type` varchar(50) NOT NULL,
  `data` longblob DEFAULT NULL,
  `description` text DEFAULT NULL,
  `filesize` varchar(50) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp` (
  `appid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `appkey` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_wsapp`
--

INSERT INTO `vtiger_wsapp` (`appid`, `name`, `appkey`, `type`) VALUES
(1, 'vtigerCRM', '5e875c4f379db', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_handlerdetails`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_handlerdetails` (
  `type` varchar(200) NOT NULL,
  `handlerclass` varchar(100) DEFAULT NULL,
  `handlerpath` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_wsapp_handlerdetails`
--

INSERT INTO `vtiger_wsapp_handlerdetails` (`type`, `handlerclass`, `handlerpath`) VALUES
('Outlook', 'OutlookHandler', 'modules/WSAPP/Handlers/OutlookHandler.php'),
('vtigerCRM', 'vtigerCRMHandler', 'modules/WSAPP/Handlers/vtigerCRMHandler.php'),
('vtigerSyncLib', 'WSAPP_VtigerSyncEventHandler', 'modules/WSAPP/synclib/handlers/VtigerSyncEventHandler.php'),
('Google_vtigerHandler', 'Google_Vtiger_Handler', 'modules/Google/handlers/Vtiger.php'),
('Google_vtigerSyncHandler', 'Google_VtigerSync_Handler', 'modules/Google/handlers/VtigerSync.php');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_logs_basic`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_logs_basic` (
  `id` int(25) NOT NULL,
  `extensiontabid` int(19) DEFAULT NULL,
  `module` varchar(50) NOT NULL,
  `sync_datetime` datetime NOT NULL,
  `app_create_count` int(11) DEFAULT NULL,
  `app_update_count` int(11) DEFAULT NULL,
  `app_delete_count` int(11) DEFAULT NULL,
  `app_skip_count` int(11) DEFAULT NULL,
  `vt_create_count` int(11) DEFAULT NULL,
  `vt_update_count` int(11) DEFAULT NULL,
  `vt_delete_count` int(11) DEFAULT NULL,
  `vt_skip_count` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_logs_details`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_logs_details` (
  `id` int(25) NOT NULL,
  `app_create_ids` mediumtext DEFAULT NULL,
  `app_update_ids` mediumtext DEFAULT NULL,
  `app_delete_ids` mediumtext DEFAULT NULL,
  `app_skip_info` mediumtext DEFAULT NULL,
  `vt_create_ids` mediumtext DEFAULT NULL,
  `vt_update_ids` mediumtext DEFAULT NULL,
  `vt_delete_ids` mediumtext DEFAULT NULL,
  `vt_skip_info` mediumtext DEFAULT NULL,
  KEY `vtiger_wsapp_logs_basic_ibfk_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_queuerecords`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_queuerecords` (
  `syncserverid` int(19) DEFAULT NULL,
  `details` varchar(300) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `appid` int(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_recordmapping`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_recordmapping` (
  `id` int(19) NOT NULL,
  `serverid` varchar(10) DEFAULT NULL,
  `clientid` varchar(255) DEFAULT NULL,
  `clientmodifiedtime` datetime DEFAULT NULL,
  `appid` int(11) DEFAULT NULL,
  `servermodifiedtime` datetime DEFAULT NULL,
  `serverappid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_wsapp_sync_state`
--

CREATE TABLE IF NOT EXISTS `vtiger_wsapp_sync_state` (
  `id` int(19) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `stateencodedvalues` varchar(300) NOT NULL,
  `userid` int(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `handler_path` varchar(255) NOT NULL,
  `handler_class` varchar(64) NOT NULL,
  `ismodule` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity`
--

INSERT INTO `vtiger_ws_entity` (`id`, `name`, `handler_path`, `handler_class`, `ismodule`) VALUES
(1, 'Campaigns', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(2, 'Vendors', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(3, 'Faq', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(4, 'Quotes', 'include/Webservices/LineItem/VtigerInventoryOperation.php', 'VtigerInventoryOperation', 1),
(5, 'PurchaseOrder', 'include/Webservices/LineItem/VtigerInventoryOperation.php', 'VtigerInventoryOperation', 1),
(6, 'SalesOrder', 'include/Webservices/LineItem/VtigerInventoryOperation.php', 'VtigerInventoryOperation', 1),
(7, 'Invoice', 'include/Webservices/LineItem/VtigerInventoryOperation.php', 'VtigerInventoryOperation', 1),
(8, 'PriceBooks', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(9, 'Calendar', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(10, 'Leads', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(11, 'Accounts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(12, 'Contacts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(13, 'Potentials', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(14, 'Products', 'include/Webservices/VtigerProductOperation.php', 'VtigerProductOperation', 1),
(15, 'Documents', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(16, 'Emails', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(17, 'HelpDesk', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(18, 'Events', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(19, 'Users', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(20, 'Groups', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(21, 'Currency', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(22, 'DocumentFolders', 'include/Webservices/VtigerActorOperation.php', 'VtigerActorOperation', 0),
(23, 'CompanyDetails', 'include/Webservices/VtigerCompanyDetails.php', 'VtigerCompanyDetails', 0),
(24, 'PBXManager', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(25, 'ServiceContracts', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(26, 'Services', 'include/Webservices/VtigerProductOperation.php', 'VtigerProductOperation', 1),
(27, 'Assets', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(28, 'ModComments', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(29, 'ProjectMilestone', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(30, 'ProjectTask', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(31, 'Project', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(32, 'SMSNotifier', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(33, 'LineItem', 'include/Webservices/LineItem/VtigerLineItemOperation.php', 'VtigerLineItemOperation', 0),
(34, 'Tax', 'include/Webservices/LineItem/VtigerTaxOperation.php', 'VtigerTaxOperation', 0),
(35, 'ProductTaxes', 'include/Webservices/LineItem/VtigerProductTaxesOperation.php', 'VtigerProductTaxesOperation', 0),
(36, 'SettingHrm', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(37, 'SettingPosition', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(38, 'SettingWeight', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(39, 'SalaryComponent', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(40, 'Salary', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(41, 'Rating', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(42, 'JD', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(43, 'QCM', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(44, 'KPI', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(45, 'Candidates', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(46, 'Leave', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(47, 'Employee', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(56, 'CustomerEnterprise', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(60, 'CustomerStandalone', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(61, 'ProblemCategory', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(62, 'SupportProtocol', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(67, 'PhuongTienTruyenThong', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(68, 'HinhThucTruyenThong', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1),
(69, 'QuyTrinhBanHang', 'include/Webservices/VtigerModuleOperation.php', 'VtigerModuleOperation', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_fieldtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_fieldtype` (
  `fieldtypeid` int(19) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `fieldtype` varchar(200) NOT NULL,
  PRIMARY KEY (`fieldtypeid`),
  UNIQUE KEY `vtiger_idx_1_tablename_fieldname` (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_fieldtype`
--

INSERT INTO `vtiger_ws_entity_fieldtype` (`fieldtypeid`, `table_name`, `field_name`, `fieldtype`) VALUES
(1, 'vtiger_attachmentsfolder', 'createdby', 'reference'),
(2, 'vtiger_organizationdetails', 'logoname', 'file'),
(3, 'vtiger_organizationdetails', 'phone', 'phone'),
(4, 'vtiger_organizationdetails', 'fax', 'phone'),
(5, 'vtiger_organizationdetails', 'website', 'url'),
(6, 'vtiger_inventoryproductrel', 'productid', 'reference'),
(7, 'vtiger_inventoryproductrel', 'id', 'reference'),
(8, 'vtiger_inventoryproductrel', 'incrementondel', 'autogenerated'),
(9, 'vtiger_producttaxrel', 'productid', 'reference'),
(10, 'vtiger_producttaxrel', 'taxid', 'reference');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_fieldtype_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_fieldtype_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_fieldtype_seq`
--

INSERT INTO `vtiger_ws_entity_fieldtype_seq` (`id`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_name`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_name` (
  `entity_id` int(11) NOT NULL,
  `name_fields` varchar(50) NOT NULL,
  `index_field` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_name`
--

INSERT INTO `vtiger_ws_entity_name` (`entity_id`, `name_fields`, `index_field`, `table_name`) VALUES
(20, 'groupname', 'groupid', 'vtiger_groups'),
(21, 'currency_name', 'id', 'vtiger_currency_info'),
(22, 'foldername', 'folderid', 'vtiger_attachmentsfolder'),
(23, 'organizationname', 'groupid', 'vtiger_organizationdetails'),
(34, 'taxlabel', 'taxid', 'vtiger_inventorytaxinfo');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_referencetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_referencetype` (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`fieldtypeid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_referencetype`
--

INSERT INTO `vtiger_ws_entity_referencetype` (`fieldtypeid`, `type`) VALUES
(5, 'Users'),
(6, 'Products'),
(7, 'Invoice'),
(7, 'PurchaseOrder'),
(7, 'Quotes'),
(7, 'SalesOrder'),
(9, 'Products'),
(10, 'Tax');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_seq`
--

INSERT INTO `vtiger_ws_entity_seq` (`id`) VALUES
(69);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_entity_tables`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_entity_tables` (
  `webservice_entity_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  PRIMARY KEY (`webservice_entity_id`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_entity_tables`
--

INSERT INTO `vtiger_ws_entity_tables` (`webservice_entity_id`, `table_name`) VALUES
(20, 'vtiger_groups'),
(21, 'vtiger_currency_info'),
(22, 'vtiger_attachmentsfolder'),
(23, 'vtiger_organizationdetails'),
(33, 'vtiger_inventoryproductrel'),
(34, 'vtiger_inventorytaxinfo'),
(35, 'vtiger_producttaxrel');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_fieldinfo`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_fieldinfo` (
  `id` varchar(64) NOT NULL,
  `property_name` varchar(32) DEFAULT NULL,
  `property_value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_fieldinfo`
--

INSERT INTO `vtiger_ws_fieldinfo` (`id`, `property_name`, `property_value`) VALUES
('vtiger_organizationdetails.organization_id', 'upload.path', '1');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_fieldtype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_fieldtype` (
  `fieldtypeid` int(19) NOT NULL,
  `uitype` varchar(30) NOT NULL,
  `fieldtype` varchar(200) NOT NULL,
  PRIMARY KEY (`fieldtypeid`),
  UNIQUE KEY `uitype_idx` (`uitype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_fieldtype`
--

INSERT INTO `vtiger_ws_fieldtype` (`fieldtypeid`, `uitype`, `fieldtype`) VALUES
(1, '15', 'picklist'),
(2, '16', 'picklist'),
(3, '19', 'text'),
(4, '20', 'text'),
(5, '21', 'text'),
(6, '24', 'text'),
(7, '3', 'autogenerated'),
(8, '11', 'phone'),
(9, '33', 'multipicklist'),
(10, '17', 'url'),
(11, '85', 'skype'),
(12, '56', 'boolean'),
(13, '156', 'boolean'),
(14, '53', 'owner'),
(15, '61', 'file'),
(16, '28', 'file'),
(17, '13', 'email'),
(18, '71', 'currency'),
(19, '72', 'currency'),
(20, '50', 'reference'),
(21, '51', 'reference'),
(22, '57', 'reference'),
(23, '58', 'reference'),
(24, '73', 'reference'),
(25, '75', 'reference'),
(26, '76', 'reference'),
(27, '78', 'reference'),
(28, '80', 'reference'),
(29, '81', 'reference'),
(30, '101', 'reference'),
(31, '52', 'reference'),
(32, '357', 'reference'),
(33, '59', 'reference'),
(34, '66', 'reference'),
(35, '77', 'reference'),
(36, '68', 'reference'),
(37, '117', 'reference'),
(38, '26', 'reference'),
(39, '10', 'reference'),
(40, '98', 'reference');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_operation`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation` (
  `operationid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `handler_path` varchar(255) NOT NULL,
  `handler_method` varchar(64) NOT NULL,
  `type` varchar(8) NOT NULL,
  `prelogin` int(3) NOT NULL,
  PRIMARY KEY (`operationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_operation`
--

INSERT INTO `vtiger_ws_operation` (`operationid`, `name`, `handler_path`, `handler_method`, `type`, `prelogin`) VALUES
(1, 'login', 'include/Webservices/Login.php', 'vtws_login', 'POST', 1),
(2, 'retrieve', 'include/Webservices/Retrieve.php', 'vtws_retrieve', 'GET', 0),
(3, 'create', 'include/Webservices/Create.php', 'vtws_create', 'POST', 0),
(4, 'update', 'include/Webservices/Update.php', 'vtws_update', 'POST', 0),
(5, 'delete', 'include/Webservices/Delete.php', 'vtws_delete', 'POST', 0),
(6, 'sync', 'include/Webservices/GetUpdates.php', 'vtws_sync', 'GET', 0),
(7, 'query', 'include/Webservices/Query.php', 'vtws_query', 'GET', 0),
(8, 'logout', 'include/Webservices/Logout.php', 'vtws_logout', 'POST', 0),
(9, 'listtypes', 'include/Webservices/ModuleTypes.php', 'vtws_listtypes', 'GET', 0),
(10, 'getchallenge', 'include/Webservices/AuthToken.php', 'vtws_getchallenge', 'GET', 1),
(11, 'describe', 'include/Webservices/DescribeObject.php', 'vtws_describe', 'GET', 0),
(12, 'extendsession', 'include/Webservices/ExtendSession.php', 'vtws_extendSession', 'POST', 1),
(13, 'convertlead', 'include/Webservices/ConvertLead.php', 'vtws_convertlead', 'POST', 0),
(14, 'revise', 'include/Webservices/Revise.php', 'vtws_revise', 'POST', 0),
(15, 'changePassword', 'include/Webservices/ChangePassword.php', 'vtws_changePassword', 'POST', 0),
(16, 'deleteUser', 'include/Webservices/DeleteUser.php', 'vtws_deleteUser', 'POST', 0),
(17, 'mobile.fetchallalerts', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchAllAlerts', 'POST', 0),
(18, 'mobile.alertdetailswithmessage', 'modules/Mobile/api/wsapi.php', 'mobile_ws_alertDetailsWithMessage', 'POST', 0),
(19, 'mobile.fetchmodulefilters', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchModuleFilters', 'POST', 0),
(20, 'mobile.fetchrecord', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchRecord', 'POST', 0),
(21, 'mobile.fetchrecordwithgrouping', 'modules/Mobile/api/wsapi.php', 'mobile_ws_fetchRecordWithGrouping', 'POST', 0),
(22, 'mobile.filterdetailswithcount', 'modules/Mobile/api/wsapi.php', 'mobile_ws_filterDetailsWithCount', 'POST', 0),
(23, 'mobile.listmodulerecords', 'modules/Mobile/api/wsapi.php', 'mobile_ws_listModuleRecords', 'POST', 0),
(24, 'mobile.saverecord', 'modules/Mobile/api/wsapi.php', 'mobile_ws_saveRecord', 'POST', 0),
(25, 'mobile.syncModuleRecords', 'modules/Mobile/api/wsapi.php', 'mobile_ws_syncModuleRecords', 'POST', 0),
(26, 'mobile.query', 'modules/Mobile/api/wsapi.php', 'mobile_ws_query', 'POST', 0),
(27, 'mobile.querywithgrouping', 'modules/Mobile/api/wsapi.php', 'mobile_ws_queryWithGrouping', 'POST', 0),
(28, 'wsapp_register', 'modules/WSAPP/api/ws/Register.php', 'wsapp_register', 'POST', 0),
(29, 'wsapp_deregister', 'modules/WSAPP/api/ws/DeRegister.php', 'wsapp_deregister', 'POST', 0),
(30, 'wsapp_get', 'modules/WSAPP/api/ws/Get.php', 'wsapp_get', 'POST', 0),
(31, 'wsapp_put', 'modules/WSAPP/api/ws/Put.php', 'wsapp_put', 'POST', 0),
(32, 'wsapp_map', 'modules/WSAPP/api/ws/Map.php', 'wsapp_map', 'POST', 0),
(33, 'retrieve_inventory', 'include/Webservices/LineItem/RetrieveInventory.php', 'vtws_retrieve_inventory', 'GET', 0),
(34, 'relatedtypes', 'include/Webservices/RelatedTypes.php', 'vtws_relatedtypes', 'GET', 0),
(35, 'retrieve_related', 'include/Webservices/RetrieveRelated.php', 'vtws_retrieve_related', 'GET', 0),
(36, 'query_related', 'include/Webservices/QueryRelated.php', 'vtws_query_related', 'GET', 0),
(37, 'add_related', 'include/Webservices/AddRelated.php', 'vtws_add_related', 'POST', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_operation_parameters`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation_parameters` (
  `operationid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`operationid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_operation_parameters`
--

INSERT INTO `vtiger_ws_operation_parameters` (`operationid`, `name`, `type`, `sequence`) VALUES
(1, 'accessKey', 'String', 2),
(1, 'username', 'String', 1),
(2, 'id', 'String', 1),
(3, 'element', 'encoded', 2),
(3, 'elementType', 'String', 1),
(4, 'element', 'encoded', 1),
(5, 'id', 'String', 1),
(6, 'elementType', 'String', 2),
(6, 'modifiedTime', 'DateTime', 1),
(7, 'query', 'String', 1),
(8, 'sessionName', 'String', 1),
(9, 'fieldTypeList', 'encoded', 1),
(10, 'username', 'String', 1),
(11, 'elementType', 'String', 1),
(13, 'accountName', 'String', 3),
(13, 'assignedTo', 'String', 2),
(13, 'avoidPotential', 'Boolean', 4),
(13, 'leadId', 'String', 1),
(13, 'potential', 'Encoded', 5),
(14, 'element', 'Encoded', 1),
(15, 'confirmPassword', 'String', 4),
(15, 'id', 'String', 1),
(15, 'newPassword', 'String', 3),
(15, 'oldPassword', 'String', 2),
(16, 'id', 'String', 1),
(16, 'newOwnerId', 'String', 2),
(18, 'alertid', 'string', 1),
(19, 'module', 'string', 1),
(20, 'record', 'string', 1),
(21, 'record', 'string', 1),
(22, 'filterid', 'string', 1),
(23, 'elements', 'encoded', 1),
(24, 'module', 'string', 1),
(24, 'record', 'string', 2),
(24, 'values', 'encoded', 3),
(25, 'module', 'string', 1),
(25, 'page', 'string', 3),
(25, 'syncToken', 'string', 2),
(26, 'module', 'string', 1),
(26, 'page', 'string', 3),
(26, 'query', 'string', 2),
(27, 'module', 'string', 1),
(27, 'page', 'string', 3),
(27, 'query', 'string', 2),
(28, 'synctype', 'string', 2),
(28, 'type', 'string', 1),
(29, 'key', 'string', 2),
(29, 'type', 'string', 1),
(30, 'key', 'string', 1),
(30, 'module', 'string', 2),
(30, 'token', 'string', 3),
(31, 'element', 'encoded', 2),
(31, 'key', 'string', 1),
(32, 'element', 'encoded', 2),
(32, 'key', 'string', 1),
(33, 'id', 'String', 1),
(34, 'elementType', 'string', 1),
(35, 'id', 'string', 1),
(35, 'relatedLabel', 'string', 3),
(35, 'relatedType', 'string', 2),
(36, 'id', 'string', 2),
(36, 'query', 'string', 1),
(36, 'relatedLabel', 'string', 3),
(37, 'relatedRecordId', 'string', 2),
(37, 'relationIdLabel', 'string', 3),
(37, 'sourceRecordId', 'string', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_operation_seq`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_operation_seq` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_operation_seq`
--

INSERT INTO `vtiger_ws_operation_seq` (`id`) VALUES
(37);

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_referencetype`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_referencetype` (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`fieldtypeid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vtiger_ws_referencetype`
--

INSERT INTO `vtiger_ws_referencetype` (`fieldtypeid`, `type`) VALUES
(20, 'Accounts'),
(21, 'Accounts'),
(22, 'Contacts'),
(23, 'Campaigns'),
(24, 'Accounts'),
(25, 'Vendors'),
(26, 'Potentials'),
(27, 'Quotes'),
(28, 'SalesOrder'),
(29, 'Vendors'),
(30, 'Users'),
(31, 'Users'),
(32, 'Accounts'),
(32, 'Contacts'),
(32, 'Leads'),
(32, 'Users'),
(32, 'Vendors'),
(33, 'Products'),
(34, 'Accounts'),
(34, 'Campaigns'),
(34, 'HelpDesk'),
(34, 'Leads'),
(34, 'Potentials'),
(35, 'Users'),
(36, 'Accounts'),
(36, 'Contacts'),
(37, 'Currency'),
(38, 'DocumentFolders');

-- --------------------------------------------------------

--
-- Table structure for table `vtiger_ws_userauthtoken`
--

CREATE TABLE IF NOT EXISTS `vtiger_ws_userauthtoken` (
  `userid` int(19) NOT NULL,
  `token` varchar(36) NOT NULL,
  `expiretime` int(19) NOT NULL,
  PRIMARY KEY (`userid`,`expiretime`),
  UNIQUE KEY `userid_idx` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
