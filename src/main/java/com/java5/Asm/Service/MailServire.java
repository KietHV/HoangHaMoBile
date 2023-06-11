package com.java5.Asm.Service;

import jakarta.mail.MessagingException;
import com.java5.Asm.Entity.MailInfo;

public interface MailServire {
	void send(MailInfo mail) throws MessagingException;
	void send(String to, String subejct , String body) throws MessagingException;
	void queue(MailInfo mail);
	void queue(String to, String subejct , String body);
}
