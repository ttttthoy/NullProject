package com.bit.nullnull.booknote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.nullnull.booknote.model.Like;
import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteLikeService;

@Controller
public class noteMainController {
	
	@Autowired
	private noteLikeService nls;
	
	@RequestMapping("/note/{note_id}/{mem_id}/Anote")
	public String noteMain(@PathVariable("note_id") int note_id, @PathVariable("mem_id") int mem_id, Model model) {
		
		Boolean status = true;
		
		System.out.println("Note id : " + note_id);
		System.out.println("Mem_id : " + mem_id);
		
		Note note = nls.selectNoteById(note_id);
		
		Like like = new Like(note_id, mem_id);
		
		if(nls.getLike(like) == null) {
			status = false;
		}
		
		model.addAttribute("status", status);
		model.addAttribute("note", note);
			
		return "note/Anote";
	}


}
