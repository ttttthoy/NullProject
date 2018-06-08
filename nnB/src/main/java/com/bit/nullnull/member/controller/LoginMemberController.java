package com.bit.nullnull.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.member.model.kakaoin;

@Controller 
@RequestMapping("/oauth/kakao")
public class LoginMemberController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String kakao() {
		return "member/kakaologin";
	}
	
	
	@RequestMapping(method= RequestMethod.POST)
	@ResponseBody
	public String home(@RequestParam(name ="kakaoEmail") String kakaoEmail,@RequestParam(name ="id") String id,@RequestParam(name ="kaccount_email_verified") String kaccount_email_verified,
						@RequestParam(name = "nickname") String nickname, @RequestParam(name ="profile_image") String profile_image, @RequestParam(name ="thumbnail_image") String thumbnail_image,
						HttpSession session) {
		
		System.out.println(kakaoEmail);
		
		kakaoin kakaoIn = new kakaoin();	
		
		kakaoIn.setKakaoEmail(kakaoEmail);
		kakaoIn.setId(id);
		kakaoIn.setKaccount_email_verified(kaccount_email_verified);
		kakaoIn.setNickname(nickname);
		kakaoIn.setProfile_image(profile_image);
		kakaoIn.setThumbnail_image(thumbnail_image);
		
		String msg = "로그인 되었습니당(ㅇㅅㅇ)/";
		
		return "home";
		


	}


	
}
