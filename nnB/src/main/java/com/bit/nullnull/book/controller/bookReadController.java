package com.bit.nullnull.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.book.model.ReadBook;
import com.bit.nullnull.book.service.bookReadStoreService;
import com.bit.nullnull.book.service.bookSearchService;

@Controller
public class bookReadController {
	
	@Autowired    
	private bookReadStoreService brss;
	
	@Autowired
	private bookSearchService bss; 
	

	
	@RequestMapping(value ="/storeBook", method=RequestMethod.POST)
	@ResponseBody
	public void storebt(@RequestParam(name="isbn")String isbn, @RequestParam(name="member_num")String member_num, 
						@RequestParam(name="state_num")String state_num, @RequestParam(name="imag")String imag) {
		//System.out.println(readbook);
		
		ReadBook readBook = new ReadBook();

		//System.out.println(imag);
		
		readBook.setIsbn(isbn);
		readBook.setMember_num(member_num);
		readBook.setState_num(state_num);
		readBook.setImag(imag);
		
		//System.out.println(readBook);
		
		int resultCnt = brss.bookStore(readBook);
		
		String msg = "도서가 담겼습니당(ㅇㅅㅇ)/";
		
		if(resultCnt == 0) {
			msg = "도서가 안담겼어요ㅠㅠ";
		}
		
		System.out.println(msg);

//		return "book/bookInfo";
		
	}
		
}