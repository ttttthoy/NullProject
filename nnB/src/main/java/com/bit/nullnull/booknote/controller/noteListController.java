package com.bit.nullnull.booknote.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.nullnull.book.model.Book;
import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteListService;

@Controller
public class noteListController {
	
	@Autowired
	private noteListService nls;
	
	@RequestMapping("/note/noteList")
	public String noteList(Model model) throws Exception {
		
		List<Note> notes = nls.getNoteList();
		
		model.addAttribute("notes", notes);
						
		return "note/noteList";
	}

}
