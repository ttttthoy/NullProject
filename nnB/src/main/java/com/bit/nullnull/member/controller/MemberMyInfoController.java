package com.bit.nullnull.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.booknote.service.noteCountService;
import com.bit.nullnull.member.model.Member;
import com.bit.nullnull.member.service.MemberEditService;
import com.bit.nullnull.member.service.MemberFollowService;
import com.bit.nullnull.member.service.MemberNumChkService;

@Controller
public class MemberMyInfoController {
	
	@Autowired
	private MemberEditService mes;
	
	@Autowired
	private MemberFollowService mfs;
	
	@Autowired
	private MemberNumChkService mncs;
	
	@Autowired
	private noteCountService ncs;
	
	@RequestMapping(value="member/memberInfo", method=RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		
Member member = (Member) session.getAttribute("loginInfo");
		
		List<Integer> f_m_id = mfs.follower_id(member.getMember_num());
		
		for(int i = 0; i < f_m_id.size(); i++) {
			System.out.println(f_m_id.get(i).intValue() + " ");
		}
		
		List<Member> follower_l = new ArrayList<Member>();
		
		
		
		for(int i = 0; i < f_m_id.size(); i++) {
			follower_l.add(mncs.selectById(f_m_id.get(i).intValue()));
		}
		
		model.addAttribute("session", member);
		
		model.addAttribute("follower_l", follower_l);
		
		model.addAttribute("note_cnt", ncs.noteCountbyid(member.getMember_num()));
		
		return "member/memberInfoEdit";
	}
	
	@RequestMapping(value="member/memberInfo", method=RequestMethod.POST)
	public String returnMyPage(Member member, HttpSession session, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		
		System.out.println("확인 : "+ member);
		
		mes.editMember(member, request);
		
		session.setAttribute("loginInfo", member);
		
		model.addAttribute("session", session.getAttribute("loginInfo"));
		
		return "mainPage";
	}
	
	@RequestMapping(value="/member/memberInfo/edit", method=RequestMethod.GET)
	public String myInfoEdit(HttpSession session, Model model) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		
		List<Integer> f_m_id = mfs.follower_id(member.getMember_num());
		
		for(int i = 0; i < f_m_id.size(); i++) {
			System.out.println(f_m_id.get(i).intValue() + " ");
		}
		
		List<Member> follower_l = new ArrayList<Member>();
		
		System.out.println("확인!!!!!!!!!!!!!!!!!!!! " + follower_l);
		
		for(int i = 0; i < f_m_id.size(); i++) {
			follower_l.add(mncs.selectById(f_m_id.get(i).intValue()));
		}
		
		model.addAttribute("session", session.getAttribute("loginInfo"));
		
		model.addAttribute("follower_l", follower_l);
				
		return "member/memberInfoEdit";
	}
	
}
