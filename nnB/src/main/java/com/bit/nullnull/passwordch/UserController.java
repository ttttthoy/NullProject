package com.bit.nullnull.passwordch;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.nullnull.member.model.Member;
import com.bit.nullnull.member.service.SimpleRegistrationNotifier2;

@Controller
@RequestMapping("/member/forgetpw")
public class UserController {
	@Autowired
	private SearchpwService searchpwservice;

	@Autowired
	private SimpleRegistrationNotifier2 notifier;

	@RequestMapping(method = RequestMethod.GET)
	public String searchpwform() {
		return "member/searchpw";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String searchpw(@RequestParam(value = "member_id",  
	defaultValue = "0") String id, HttpSession session,Model model)throws IllegalStateException, IOException {

		System.out.println("111111:  "+id);
		String msg = "변경 메일을 전송하였습니다.";
		Member member = searchpwservice.IdChk(id);
		System.out.println("22222:        "    +member);
		if (member == null) {
			msg = "다시 입력바랍니다.";
		}
		else { 
			notifier.sendMail(member);
		model.addAttribute("msg", msg);
		}
		return "member/infopage";
	};
}
