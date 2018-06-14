package com.bit.nullnull.member.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteListService;
import com.bit.nullnull.member.model.Member;
import com.bit.nullnull.member.service.MemberLoginService;


@Controller
public class MemberLoginController {

	@Autowired
	private MemberLoginService memberLoginService;
	
	@Autowired
	private noteListService nls;

	@RequestMapping(value="/member/login", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping(value="/damso", method=RequestMethod.GET)
	public String mainPage(Model model, HttpSession httpSession) {
			
		model.addAttribute("session", httpSession.getAttribute("loginInfo"));
		
		return "mainPage";
	}

	@RequestMapping(value="/damso", method = RequestMethod.POST)
	public String login(@RequestParam(value = "member_id", defaultValue = "0") String id,
			@RequestParam(value = "password", required = false) String pw, Model model, HttpSession session) {

		System.out.println(id);
		System.out.println(pw);

		Member member = memberLoginService.loginChk(id, pw);

		if (member == null) {
			return "member/loginFail";
		}

		session.setAttribute("loginInfo", member);
		
		model.addAttribute("session", session.getAttribute("loginInfo"));

		System.out.println(session.getAttribute("loginInfo"));
		
		List<Note> notes = nls.getNoteListByDate();
		
		model.addAttribute("notes", notes);

		return "mainPage";
	}

	// 로그아웃 처리

    @RequestMapping("/member/logout")
    public String logout(HttpSession session) {
        
    	session.setAttribute("LoginInfo", null);
        
    	return "redirect:loginForm";
    }
}

