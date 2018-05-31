package com.bit.nullnull.book.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.book.model.Book;
import com.bit.nullnull.book.model.Review;
import com.bit.nullnull.book.service.bookReadStoreService;
import com.bit.nullnull.book.service.bookReviewService;
import com.bit.nullnull.book.service.bookSearchService;
import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteListService;
import com.bit.nullnull.member.model.Member;

@Controller
public class bookInfoController {
	
	@Autowired
	private bookReviewService brs;
	
	@Autowired
	private bookSearchService bss;
	
	@Autowired
	private noteListService nls;
	
	@Autowired
	private bookReadStoreService brss;
	
	@RequestMapping(value="/bookInfo/{isbn}", method = RequestMethod.GET)
	public String specificBookInfo(@PathVariable(name="isbn") String isbn, Model model, HttpSession session) throws Exception {

//		String isbn = "8972590630 9788972590637";

//		System.out.println("1. " + isbn);
		String data = bss.getBookAllData(isbn);
		
//		System.out.println("1. " + isbn);
//		System.out.println("2. " + data);

		Book book = bss.getABook(data);
//		System.out.println(book);
						
		model.addAttribute("book", book);

//		System.out.println(session.getAttribute("loginInfo"));
		
//		System.out.println("3. " + mem_id);
		
		Member member = (Member) session.getAttribute("loginInfo");
				
		System.out.println("3. " + member);
		
		model.addAttribute("member", member);
		
//		System.out.println("4. " + book.getIsbn());
		
		List<Review> r_list = brs.getBookReview(book.getIsbn());
		
		double avgStar = brs.avgStar(book.getIsbn());
		
		avgStar = Math.round(avgStar*100)/100.0;
		
		model.addAttribute("avgStar", avgStar);
		
		int cntReview = brs.cntReview(book.getIsbn());
		
		model.addAttribute("cntReview", cntReview);
		
//		System.out.println("5. " + r_list);
//		
//		System.out.println("6. " + r_list.toString());

		model.addAttribute("r_list", r_list);
		
		List<Note> n_list = nls.getNoteListbyIsbn(book.getIsbn());
		
		model.addAttribute("notes", n_list);
		
//		System.out.println(n_list);

		return "book/bookInfo";
	}

	
	
}
