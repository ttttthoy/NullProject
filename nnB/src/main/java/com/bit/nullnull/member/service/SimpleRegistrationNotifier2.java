package com.bit.nullnull.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.bit.nullnull.member.model.Member;

public class SimpleRegistrationNotifier2 {

	@Autowired
	private JavaMailSender mailSender;

	public void sendMail(Member member) {
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			
			message.setSubject("회원가입 안내");
			
			String htmlMsg = "<strong>안녕하세요. " 
					+ member.getMember_name() +"님 </strong>, 반갑습니다.";
			message.setText(htmlMsg, "utf-8", "html");
		
			message.setFrom(new InternetAddress());
			
			message.addRecipient(RecipientType.TO, new InternetAddress(member.getMember_id()));
			
			mailSender.send(message);
			
			
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}		
	}

	public void sendMailAttach(Member member) {
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {

			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setSubject("회원가입");	
			
			String htmlContent = "<strong>안녕하세요</strong>, 반갑습니다.";
			helper.setText(htmlContent, true);
			
			helper.setFrom("bitnnull@gmail.com", "널널");
			
			helper.setTo(new InternetAddress(member.getMember_id(), member.getMember_name(), "UTF-8"));

			mailSender.send(message);	
			
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
