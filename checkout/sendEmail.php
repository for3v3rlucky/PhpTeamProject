<?php
//set path for PHPMailer
set_include_path('C:\wamp64\www\book_apps\ch24_guitar_shop\model\PHPMailer');
require_once('PHPMailerAutoload.php');

//require_once('../util/main.php');
//require_once('util/secure_conn.php');
//require_once('util/validation.php');


define ('GUSER','summerphpclass@gmail.com');
define ('GPWD','Pa$$word');

//this was pulled and edited from 
//  https://stackoverflow.com/questions/22927634/smtp-connect-failed-phpmailer-php

// make a separate file and include this file in that. call this function in that file.

function smtpmailer($to, $from, $from_name, $subject, $body, $order_id) { 
    $mail = new PHPMailer();  // create a new object
    $mail->IsSMTP(); // enable SMTP
    //$mail->SMTPDebug = 2;  // debugging: 1 = errors and messages, 2 = messages only
    $mail->SMTPAuth = true;  // authentication enabled
    $mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for GMail
    $mail->SMTPAutoTLS = false;
    $mail->Host = 'smtp.gmail.com';
    $mail->Port = 465;
    $mail->Username = GUSER;  
    $mail->Password = GPWD;           
    $mail->SetFrom($from, $from_name);
    $mail->Subject = $subject;
    $mail->Body = $body;
    $mail->AddAddress($to);
    if(!$mail->Send()) {
        $error = 'Mail error: '.$mail->ErrorInfo; 
        display_error($error);
    } else {
        redirect('../account?action=view_order&order_id=' . $order_id);
    }
}     
?>
