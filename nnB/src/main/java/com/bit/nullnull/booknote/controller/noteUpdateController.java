package com.bit.nullnull.booknote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteUpdateService;

@Controller
@RequestMapping("note/{id}/noteUpdate")
public class noteUpdateController {

	@Autowired
	private noteUpdateService nus;
	
	@RequestMapping(method=RequestMethod.GET)
	public String noteUpdate(@PathVariable("id") int id, Model model) {
		
		Note note = nus.updateChk(id);
		
		System.out.println(note);
		
		model.addAttribute("note", note);
		
		return "note/noteUpdateForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String noteUpdate(Note note, Model model) {
		String msg;
		
		int resultCnt = nus.noteUpdate(note);
		
		
		msg = "수정 완 투더 료우!";
		
		if(resultCnt == 0) {
			msg = "수정 에러 수정 에러 수정 에러!!!!!!!!!!!!";
		}
		
		model.addAttribute("msg", msg);
		
		return "note/noteUpdate";
	}
}
