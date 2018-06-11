package com.bit.nullnull.bookcase.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.nullnull.book.model.ReadBook;
import com.bit.nullnull.bookcase.service.bookcaseService;
import com.bit.nullnull.member.model.Member;

@Controller
public class bookCaseController {

	@Autowired
	private bookcaseService bcs;

	
	@RequestMapping("/bookcase")
	public String storeList(){
		
		return "bookcase/bookcase";
		
	}
	
	@RequestMapping("/bookcase/already")
	public String mystoreList0(Model model,HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		
		List<ReadBook> readbook = bcs.getStoreListPast(member.getMember_num());
		
		System.out.println(readbook);
		
		model.addAttribute("readbook", readbook);
		
		return "bookcase/already";
	}
	
	
	@RequestMapping("/bookcase/now")
	public String mystoreList1(Model model,HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		
		List<ReadBook> readbook = bcs.getStoreListCurrent(member.getMember_num());
		
		System.out.println(readbook);
		
		model.addAttribute("readbook", readbook);
		
		return "bookcase/now";
	}
	
	
	
	@RequestMapping("/bookcase/willread")
	public String mystoreList2(Model model,HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginInfo");		
		
		List<ReadBook> readbook = bcs.getStoreListFuture(member.getMember_num());
		
		System.out.println(readbook);
		
		model.addAttribute("readbook", readbook);
		
		return "bookcase/willread";
	}
	
	
}
