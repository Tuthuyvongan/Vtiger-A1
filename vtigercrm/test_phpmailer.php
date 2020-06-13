<?php
include_once "./modules/Emails/class.phpmailer.php";

$mail = new PHPMailer();

if($mail !== null)
{
    echo "Ok\n";
}

$mail->SMTPDebug = 3;

$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'minhmang456@gmail.com';                 // SMTP username
$mail->Password = 'ngutruoc12h';
$mail->SMTPSecure = 'tls';     // Enable TLS encryption, `ssl` also accepted
$mail->Port = 456;

echo "ok\n";

$mail->From = 'minhmang456@gmail.com';
$mail->FromName = 'Mailer';
$mail->addAddress('17521231@gm.uit.edu.vn', 'Tung');
$mail->isHTML(true);

echo "ok\n";

$mail->Subject = 'Here is the subject';
$mail->Body    = 'This is the HTML message body <b>in bold!</b>';
$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

echo "ok\n";

if(!$mail->send()) {
    echo "Message could not be sent.\n";
    echo 'Mailer Error: ' . $mail->ErrorInfo."\n";
} else {
    echo 'Message has been sent';
}