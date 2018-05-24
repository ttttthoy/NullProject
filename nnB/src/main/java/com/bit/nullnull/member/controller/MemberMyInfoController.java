package com.bit.nullnull.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.member.model.Member;
import com.bit.nullnull.member.service.MemberEditService;

@Controller
public class MemberMyInfoController {
	
	@Autowired
	private MemberEditService mes;
	
	@RequestMapping(value="member/memberInfo", method=RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		
		model.addAttribute("session", session.getAttribute("loginInfo"));
		
		return "member/memberInfo";
	}
	
	@RequestMapping(value="member/memberInfo", method=RequestMethod.POST)
	public String returnMyPage(Member member, HttpSession session, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		
		System.out.println("확인 : "+ member);
		
		mes.editMember(member, request);
		
		session.setAttribute("loginInfo", member);
		
		model.addAttribute("session", session.getAttribute("loginInfo"));
		
		return "member/memberInfo";
	}
	
	@RequestMapping(value="/member/memberInfo/edit", method=RequestMethod.GET)
	public String myInfoEdit(HttpSession session, Model model) {
		
		model.addAttribute("session", session.getAttribute("loginInfo"));
				
		return "member/memberInfoEdit";
	}
	
}
