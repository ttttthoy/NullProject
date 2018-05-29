	package com.bit.nullnull.booknote.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.nullnull.booknote.model.Like;
import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteLikeService;
import com.bit.nullnull.member.model.Follow;
import com.bit.nullnull.member.model.Member;
import com.bit.nullnull.member.service.MemberFollowService;
import com.bit.nullnull.member.service.MemberNumChkService;

@Controller
public class AnoteController {
	
	@Autowired
	private noteLikeService nls;
	
	@Autowired
	private MemberNumChkService mncs;
	
	@Autowired
	private MemberFollowService mfs;
			
	@RequestMapping("/note/{note_id}/Anote")
	public String noteMain(@PathVariable("note_id") int note_id, Model model, HttpSession session) {
		
		Boolean l_status = true;
		Boolean f_status = true;
		
		System.out.println("Note id : " + note_id);
		
		Note note = nls.selectNoteById(note_id);
		
		Member member = (Member) session.getAttribute("loginInfo");
		
		Like like = new Like(note_id, member.getMember_num());
		
		if(nls.getLike(like) == null) {
			l_status = false;
		}
				
		Member noteMem = mncs.selectById(note.getMember_num());
		
		Follow follow = new Follow(member.getMember_num(), noteMem.getMember_num());
		
		if(mfs.getFollow(follow) == null) {
			f_status = false;
		}
		
		model.addAttribute("f_status", f_status);
		model.addAttribute("l_status", l_status);
		model.addAttribute("note", note);
		model.addAttribute("noteMem", noteMem);
		model.addAttribute("session", session.getAttribute("loginInfo"));
			
		return "note/Anote";
		
	}

}
