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
import com.bit.nullnull.member.model.Member;

@Controller
public class AnoteController {
	
	@Autowired
	private noteLikeService nls;
	
	@RequestMapping("/note/{note_id}/Anote")
	public String noteMain(@PathVariable("note_id") int note_id, Model model, HttpSession session) {
		
		Boolean status = true;
		
		System.out.println("Note id : " + note_id);
		
		Note note = nls.selectNoteById(note_id);
		
		Member member = (Member) session.getAttribute("loginInfo");
		
		Like like = new Like(note_id, member.getMember_num());
		
		if(nls.getLike(like) == null) {
			status = false;
		}
		
		model.addAttribute("status", status);
		model.addAttribute("note", note);
			
		return "note/Anote";
	}


}
