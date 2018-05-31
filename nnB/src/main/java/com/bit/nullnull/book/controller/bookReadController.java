package com.bit.nullnull.book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
/*	@Autowired
	private bookSearchService bss;*/
	
/*	
	@RequestMapping("bookInfo")
	public String storeb() {
		return "/book/bookInfo";
	}
	
	@RequestMapping(value ="/storeBook", method = RequestMethod.GET)
	public String storeForm(@PathVariable(name = "isbn") String isbn, Model model, HttpSession session) throws Exception
	{
		
		String data = bss.getBookAllData(isbn);
		Book book = bss.getABook(data);
		model.addAttribute("book", book);
		model.addAttribute("session", session.getAttribute("loginInfo"));
		return "book/bookInfo";	
		
	}*/
	
	@RequestMapping(value ="/book/storeBook")
	@ResponseBody
	public void storebt(@RequestParam(name="isbn")String isbn, @RequestParam(name="member_num")int member_num, @RequestParam(name="state_num")int state_num,  ReadBook readbook, Model model) {
		System.out.println(readbook);
		
		ReadBook readBook = new ReadBook();

		readBook.setIsbn(isbn);
		readBook.setMember_num(member_num);
		readBook.setState_num(state_num);
		
		
		int resultCnt = brss.bookStore(readbook);
		
		String msg = "도서가 담겼습니당(ㅇㅅㅇ)/";
		
		if(resultCnt == 0) {
			msg = "도서가 안담겼어요ㅠㅠ";
		}
		
		System.out.println(msg);


		//return "book/bookInfo";
		
		
	}
}
