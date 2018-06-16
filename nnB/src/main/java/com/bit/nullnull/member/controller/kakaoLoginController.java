package com.bit.nullnull.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.member.model.Member;

@Controller
public class kakaoLoginController {
	
	@RequestMapping(value="/oauth/kakao", method=RequestMethod.POST)
	@ResponseBody
	public String kakao(@RequestParam(name="kakaoEmail")String kakaoEmail, 
						@RequestParam(name="profile_image")String profile_image,
						@RequestParam(name="nickname")String nickname) {
		
		Member member = new Member();
		
		member.setMember_id(kakaoEmail);
		member.setMember_name(nickname);
		member.setMember_photo(profile_image);
		
		return "mainPage";

		
	}

}
