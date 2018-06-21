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
		System.out.println("sendMail(Member member)");
		MimeMessage message = mailSender.createMimeMessage();
		try {
			
			message.setSubject("비밀번호 변경 안내");
			System.out.println("메일보내기 :  " + member);
			String htmlMsg = "<strong>안녕하세요. " 
					+ member.getMember_name() +"님 </strong>, 반갑습니다.";
			htmlMsg += "비밀번호 변경 안내입니다.";
			htmlMsg += "입력하신" + member.getMember_id() + "님 보내드린 변경링크를 통하여 비밀번호를 변경하여 주세요.";
			htmlMsg += "<a href='http://localhost:8080/book/member/pwchange?id=" + member.getMember_id() +"'>비밀번호 변경</a>";
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
			
			helper.setSubject("비밀번호 변경");	
			
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
