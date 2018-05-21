package com.bit.nullnull.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.nullnull.book.service.bookSearchService;



@Controller
@RequestMapping("/bookSearch")
public class bookSearchController {

	@Autowired
	private bookSearchService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String searchForm(){
		return "book/searchForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String searchList(@RequestParam(name="keyword") String keyword, Model model) throws Exception {
		
		String data = service.getBookAllData(keyword);
		
		System.out.println(data);
		
		model.addAttribute("bookList", service.getBookList(data));
		
		return "book/searchList";
	}

}
