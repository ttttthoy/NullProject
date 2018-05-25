package com.bit.nullnull.booknote.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.book.model.Book;
import com.bit.nullnull.book.service.bookSearchService;
import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteListService;
import com.bit.nullnull.booknote.service.noteUploadService;
import com.bit.nullnull.member.model.Member;

@Controller
public class noteUploadController {

	@Autowired
	private noteListService nls;
	
	@Autowired
	private noteUploadService nus;

	@Autowired
	private bookSearchService bss;

	@RequestMapping("/note")
	public String noteMain() {
		return "note/noteMenu";
	}

	@RequestMapping(value = "/bookNote/{isbn}", method = RequestMethod.GET)
	public String noteForm(@PathVariable(name = "isbn") String isbn, Model model, HttpSession session)
			throws Exception {

		// String isbn = "8972590630 9788972590637";

		String data = bss.getBookAllData(isbn);

		Book book = bss.getABook(data);

		model.addAttribute("book", book);

		model.addAttribute("session", session.getAttribute("loginInfo"));

		return "note/noteUploadForm";
	}

	@RequestMapping(value = "/bookNote/{isbn}", method = RequestMethod.POST)
	public String noteUpload(Note note, Model model, HttpSession session) {

		System.out.println(note);

		int resultCnt = nus.noteUpload(note);

		String msg = "정상적으로 등록되었습니다.";

		if (resultCnt == 0) {
			msg = "독서노트 등록이 되지 않았습니다. 담당자에게 문의해주세요.";
		}

		System.out.println(msg);
		
		Member member = (Member) session.getAttribute("loginInfo");

		List<Note> notes = nls.getMyNoteList(member.getMember_num());

		System.out.println(notes);

		model.addAttribute("notes", notes);

		return "note/noteList";
	}

}
