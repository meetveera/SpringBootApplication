package com.me.controllers;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

class SMTPAuthenticator extends Authenticator
{
public PasswordAuthentication getPasswordAuthentication()
{
    String username = "meetveera702@gmail.com";
    String password = "M33tVe*@";
    return new PasswordAuthentication(username, password);
}
}