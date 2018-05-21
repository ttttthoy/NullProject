package com.bit.nullnull.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.member.model.Member;
import com.bit.nullnull.member.service.MemberRegService;
import com.bit.nullnull.member.service.SimpleRegistrationNotifier;

@Controller
@RequestMapping("/member/memberReg")
public class MemberRegController {
	
	@Autowired
	private MemberRegService memberRegService ; 
	
	@Autowired
	private SimpleRegistrationNotifier notifier;
	
	@RequestMapping(method=RequestMethod.GET)
	public String memberRegForm() {
		return "member/memberRegForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String memberReg(Member member, Model model, HttpServletRequest request) 
			throws IllegalStateException, IOException {
		
		String msg = "정상적으로 처리되었습니다.";
				
		int resultCnt = memberRegService.memberReg(member, request);
		
		if(resultCnt == 0)
			msg = "가입 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";		
		else
			notifier.sendMail(member.getMember_id(), "회원가입 성공적으로 처리되었습니다.");
		
		model.addAttribute("msg", msg);
		
		
		return "member/memberReg";
	}
	
	@ExceptionHandler(IOException.class)
	public String ex1(IOException e) {
		return "error/ex1";
	}
	
	@ExceptionHandler(IllegalStateException.class)
	public String ex2(IllegalStateException e) {
		return "error/ex2";
	}

}