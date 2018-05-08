package com.bit.nullnull.member.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.bit.nullnull.member.model.Member;
import com.bit.nullnull.member.service.MemberLoginService;


@Controller
@RequestMapping("/member/login")
public class MemberLoginController {

	@Autowired
	private MemberLoginService memberLoginService;

	@RequestMapping(method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String login(@RequestParam(value = "member_id", defaultValue = "0") String id,
			@RequestParam(value = "password", required = false) String pw, HttpSession session) {

		System.out.println(id);
		System.out.println(pw);

		String view = "redirect:mypage"; 

		Member member = memberLoginService.loginChk(id, pw);

		if (member == null) {
			return "member/loginFail";
		}

		member.setPassword("");

		session.setAttribute("loginInfo", member);

		System.out.println(session.getAttribute("loginInfo"));

		return view;
	}

	 
	// 로그아웃 처리

    @RequestMapping("/member/logout")
    public String logout(HttpSession session) {
        
    	session.setAttribute("LoginInfo", null);
        
    	return "redirect:loginForm";
    }
}

