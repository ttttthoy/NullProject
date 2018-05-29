package com.bit.nullnull.book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.book.model.Book;
import com.bit.nullnull.book.model.ReadBook;
import com.bit.nullnull.book.service.bookReadStoreService;
import com.bit.nullnull.book.service.bookSearchService;
import com.bit.nullnull.member.model.Member;

@Controller
public class bookReadController {
	
	@Autowired
	private bookReadStoreService brss;
	
	@Autowired
	private bookSearchService bss;
	
	
	@RequestMapping("/book")
	public String storeb() {
		return "book/bookStoreForm";
	}
	
	@RequestMapping(value = "/storeBook", method = RequestMethod.GET)
	public String storeForm(@PathVariable(name = "isbn") String isbn, Model model, HttpSession session) throws Exception
	{
		
		String data = bss.getBookAllData(isbn);
		Book book = bss.getABook(data);
		model.addAttribute("book", book);
		model.addAttribute("session", session.getAttribute("loginInfo"));
		return "book/bookStoreForm";
		
		
	}
	
	@RequestMapping(value = "/storeBook", method = RequestMethod.POST)
	public @ResponseBody String storebt(@RequestBody ReadBook readbook, Model model, HttpSession session) {
		System.out.println(readbook);
		
		int resultCnt = brss.bookStore(readbook);
		
		String msg = "도서가 담겼습니당(ㅇㅅㅇ)/";
		
		if(resultCnt == 0) {
			msg = "도서가 안담겼어요ㅠㅠ";
		}
		
		System.out.println(msg);
		Member member = (Member) session.getAttribute("loginInfo");

		return "book/bookStore";
		
		
	}
}
