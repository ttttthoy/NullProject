package com.bit.nullnull.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.member.model.Follow;
import com.bit.nullnull.member.model.Member;
import com.bit.nullnull.member.service.MemberFollowService;
import com.bit.nullnull.member.service.MemberNumChkService;

@Controller
public class MemberFollowController {
	
	@Autowired
	private MemberFollowService mfs;
	
	@Autowired
	private MemberNumChkService mncs;
	
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
	
	@RequestMapping(value="member/follow/{member_id}", method= RequestMethod.GET)
	public String followList(@PathVariable(name="member_id") int member_id, Model model, HttpSession session) {
				
		List<Integer> f_m_id = mfs.follower_id(member_id);
		
		for(int i = 0; i < f_m_id.size(); i++) {
			System.out.println(f_m_id.get(i).intValue() + " ");
		}
		
		List<Member> follower_l = new ArrayList<Member>();
		
		for(int i = 0; i < f_m_id.size(); i++) {
			follower_l.add(mncs.selectById(f_m_id.get(i).intValue()));
		}
		
		model.addAttribute("session", session);
		
		model.addAttribute("follower_l", follower_l);
		
		return "bookcase/followList";
	}
			

}
