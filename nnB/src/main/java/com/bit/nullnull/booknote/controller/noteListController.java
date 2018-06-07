package com.bit.nullnull.booknote.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteListService;
import com.bit.nullnull.booknote.service.noteUploadService;

@Controller
public class noteListController {
	
	@Autowired
	private noteUploadService nus;
	
	@Autowired
	private noteListService nls;
	
	@RequestMapping("/note/noteList")
	public String noteList(Model model) throws Exception {
		
		List<Note> notes = nls.getNoteList();
		
		model.addAttribute("notes", notes);
						
		return "note/noteList";
	}
	
	@RequestMapping("/note/noteList/{member_num}")
	public String myNoteList(@PathVariable(name="member_num") int member_num, Model model) {
		
		List<Note> notes = nls.getMyNoteList(member_num);
		
		System.out.println(notes);
		
		model.addAttribute("notes", notes);
		
		return "note/noteList";
	}

}


