package com.bit.nullnull.booknote.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.book.model.Book;
import com.bit.nullnull.book.service.bookSearchService;
import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteUploadService;

@Controller
public class noteUploadController {
	
	@Autowired
	private noteUploadService nus;
	
	@Autowired
	private bookSearchService bss;
	
	@RequestMapping("/note")
	public String noteMain() {
		return "note/noteMenu";
	}
	
	@RequestMapping(value="/note/noteUpload", method=RequestMethod.GET)
	public String noteForm(Model model, HttpSession session) throws Exception {
		
		String isbn = "8972590630 9788972590637";
		
		String data = bss.getBookAllData(isbn);
		
		Book book = bss.getABook(data);
	
		model.addAttribute("book", book);
		
		model.addAttribute("session", session.getAttribute("loginInfo"));
		
		return "note/noteUploadForm";
	}
	
	@RequestMapping(value="/note/noteUpload", method=RequestMethod.POST)
	public String noteUpload(Note note, Model model) {
		
		System.out.println(note);
		
		int resultCnt = nus.noteUpload(note);
		
		String msg = "정상적으로 등록되었습니다.";
		
		if(resultCnt == 0) {
			msg = "독서노트 등록이 되지 않았습니다. 담당자에게 문의해주세요.";
		}
		
		model.addAttribute("msg", msg);
		
		return "note/noteUpload";
	}
	
}
