package com.bit.nullnull.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.member.model.Follow;
import com.bit.nullnull.member.service.MemberFollowService;

@Controller
public class MemberFollowController {
	
	@Autowired
	private MemberFollowService mfs;
	
	@RequestMapping(value="/member/follow")
	@ResponseBody
	public void followChk(@RequestParam(name="follower") int follower, @RequestParam(name="following") int following, @RequestParam(name="f_status") boolean f_status) {
		
		System.out.println("넘어오나");
		
		Follow follow = new Follow(follower, following);
		
		if(f_status) 
			mfs.removeFollow(follow);
		else
			mfs.addFollow(follow);
		
	}
			

}
