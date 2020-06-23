<?php
include_once "./modules/Emails/class.phpmailer.php";
include_once "./modules/Emails/class.smtp.php";

$mail = new PHPMailer();

if($mail !== null)
{
    echo "Ok<br/>";
}

$debug = '';
$mail->Debugoutput = function($str, $level) {
    $GLOBALS['debug'] .= "$level: $str<br/>";
};

$mail->SMTPDebug = 4;
$mail->SMTPOptions = array(
    'ssl' => array(
        'verify_peer' => false,
        'verify_peer_name' => false,
        'allow_self_signed' => true
    )
);
$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'minhmang456@gmail.com';                 // SMTP username
$mail->Password = 'ngutruoc12h';
$mail->SMTPSecure = 'tls';     // Enable TLS encryption, `ssl` also accepted
$mail->Port = 587;

echo "ok<br/>";

$mail->From = 'minhmang456@gmail.com';
$mail->FromName = 'Mailer';
$mail->addAddress('17521231@gm.uit.edu.vn', 'Tung');
$mail->isHTML(true);

echo "ok<br/>";

$mail->Subject = 'Here is the subject';
$mail->Body    = 'This is the HTML message body <b>in bold!</b>';
$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

echo "ok<br/>";

if(!$mail->send()) {
    echo "Message could not be sent.<br/>";
    echo "Mailer Error: " . $mail->ErrorInfo."<br/>";
} else {
    echo 'Message has been sent';
}

echo $debug;