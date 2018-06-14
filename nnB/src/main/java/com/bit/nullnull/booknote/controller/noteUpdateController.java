package com.bit.nullnull.booknote.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteListService;
import com.bit.nullnull.booknote.service.noteUpdateService;
import com.bit.nullnull.member.model.Member;

@Controller
@RequestMapping("note/{id}/noteUpdate")
public class noteUpdateController {

	@Autowired
	private noteListService nls;
	
	@Autowired
	private noteUpdateService nus;
	
	@RequestMapping(method=RequestMethod.GET)
	public String noteUpdate(@PathVariable("id") int id, Model model, HttpSession session) {
		
		Note note = nus.updateChk(id);
		
		System.out.println(note);
		
		model.addAttribute("note", note);
		
		model.addAttribute("session", session.getAttribute("loginInfo"));
		
		return "note/noteUpdateForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String noteUpdate(Note note, Model model, HttpSession session) {
		String msg;
		
		int resultCnt = nus.noteUpdate(note);
		
		System.out.println(note);
		
		msg = "수정 완 투더 료우!";
		
		if(resultCnt == 0) {
			msg = "수정 에러 수정 에러 수정 에러!!!!!!!!!!!!";
		}
		
		System.out.println(msg);
		
		Member member = (Member) session.getAttribute("loginInfo");

		List<Note> notes = nls.getMyNoteList(member.getMember_num());

		System.out.println(notes);

		model.addAttribute("notes", notes);

		return "note/noteList";
	}
}
