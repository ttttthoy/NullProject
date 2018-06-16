package com.bit.nullnull.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
/*@RequestMapping("/member/login")*/
public class kakaoLoginController {
	
	
	@RequestMapping(value="/oauth/kakao", produces="application/json", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String home(@RequestParam("code")String code,HttpServletRequest request, HttpServletResponse httpservletresponse
					/*@RequestParam(name="kakaoEmail")String kakaoEmail, @RequestParam(name="profile_image")String profile_image,
					@RequestParam(name="nickname")String nickname, HttpSession session*/) {
		
/*		Member member = new Member();
		
		member.setMember_id(kakaoEmail);
		member.setMember_name(nickname);
		member.setMember_photo(profile_image);	*/
		
		System.out.println("code : " + code);
		System.out.println("로그인 되었습니당(ㅇㅅㅇ)/");

		return "mainPage";
		
	}
	
	
	
	
}
	

	

