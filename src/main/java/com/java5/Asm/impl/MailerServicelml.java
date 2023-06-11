package com.java5.Asm.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.java5.Asm.Entity.MailInfo;
import com.java5.Asm.Service.MailServire;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailerServicelml implements MailServire {
	@Autowired
	JavaMailSender sender;
	
	
	@Override
	public void send(MailInfo mail) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody());
		helper.setReplyTo(mail.getFrom());
		String[] cc = mail.getCc();
		if(cc!=null && cc.length>0) {
			helper.setCc(cc);
		}
		String[] bcc=mail.getBcc(); 
		if(bcc != null && bcc.length > 0)
		{ helper.setBcc(bcc);
		}
		String[] attachments= mail.getAttachments();
		if(attachments != null && attachments.length > 0) 
			{ for(String path: attachments) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
			}
		}
		sender.send(message);
		
	}

	@Override
	public void send(String to, String subejct, String body) throws MessagingException {
		this.send(new MailInfo(to,subejct,body));
		
	}
	List<MailInfo> list = new ArrayList<>();
	@Override
	public void queue(MailInfo mail) {
		list.add(mail);
		
	}

	@Override
	public void queue(String to, String subejct, String body) {
		queue(new MailInfo(to, subejct, body));
		
	}
	@Scheduled(fixedDelay = 5000)
	public void run() {
		while (!list.isEmpty()) {
			MailInfo mail = list.remove(0);
			try {
				this.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

}
