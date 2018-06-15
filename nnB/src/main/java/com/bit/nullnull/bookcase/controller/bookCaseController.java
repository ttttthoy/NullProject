package com.bit.nullnull.bookcase.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.nullnull.book.model.ReadBook;
import com.bit.nullnull.bookcase.service.bookcaseService;
import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteListService;

@Controller
public class bookCaseController {

	@Autowired
	private bookcaseService bcs;
	
	@Autowired
	private noteListService nls;

	
/*	@RequestMapping("/bookcase/{member_num}")
	public String storeList(){
		
		return "bookcase/bookcase";
		
	}*/
	
	@RequestMapping("/bookcase/{member_num}")
	public String mystoreList0(@PathVariable(name="member_num")int member_num,Model model,HttpSession session) {
		

		List<ReadBook> readbook0 = bcs.getStoreListPast(member_num);
		List<ReadBook> readbook1 = bcs.getStoreListCurrent(member_num);
		List<ReadBook> readbook2 = bcs.getStoreListFuture(member_num);
		List<Note> note = nls.getMyNoteList(member_num);
		
/*		for (ReadBook readBook2 : readbook) {
			System.out.println(readBook2.getImag());
		}*/
		
		System.out.println(readbook0);
		System.out.println(readbook1);
		System.out.println(readbook2);
		
		model.addAttribute("readbook0", readbook0);
		model.addAttribute("readbook1", readbook1);
		model.addAttribute("readbook2", readbook2);
		model.addAttribute("note", note);
		
		return "bookcase/bookcase";
	}
	
	

	
}
