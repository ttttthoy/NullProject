package com.bit.nullnull.bookcase.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.book.model.ReadBook;
import com.bit.nullnull.book.service.bookReadStoreService;
import com.bit.nullnull.book.service.bookSearchService;

public class bookcaseController {

	@Autowired    
	private bookReadStoreService brss;
	
	@Autowired
	private bookSearchService bss;
	
/*	
	@RequestMapping("bookInfo")
	public String storeb() {
		return "/book/bookInfo";
	}
*/
	/*
	@RequestMapping(value ="/storeBook", method = RequestMethod.GET)
	public String storeForm(@PathVariable(name = "isbn") String isbn, Model model, HttpSession session) throws Exception
	{
		String data = bss.getBookAllData(isbn);
		Book book = bss.getABook(data);
		model.addAttribute("book", book);
		model.addAttribute("session", session.getAttribute("loginInfo"));
		return "book/bookInfo";	
	}*/
	
	@RequestMapping(value ="/storeBookList", method=RequestMethod.POST)
	@ResponseBody
	public String storebt(@RequestParam(name="isbn")String isbn, @RequestParam(name="member_num")String member_num, 
						@RequestParam(name="state_num")String state_num, @RequestParam(name="imag")String imag) {
		
		ReadBook readBook = new ReadBook();

		//System.out.println(imag);
		
		readBook.getIsbn();
		readBook.getMember_num();
		readBook.getState_num();
		readBook.getImag();
		
		//System.out.println(readBook);
		
/*		int resultCnt = brss.bookStore(readBook);*/
		
		String msg = "읽었어요 도서목록 뜬다!!";
		
/*		if(resultCnt == 0) {
			msg = "도서가 안담겼어요ㅠㅠ";
		}*/
		
		System.out.println(msg);

		return "bookcase/bookcase";
		
	}
	
	
}
