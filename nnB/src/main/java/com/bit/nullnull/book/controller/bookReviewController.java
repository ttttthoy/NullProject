package com.bit.nullnull.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.book.model.Review;
import com.bit.nullnull.book.service.bookReviewService;

@Controller
public class bookReviewController {

	@Autowired
	private bookReviewService brs;

	@RequestMapping(value="/bookInfo/review", method = RequestMethod.POST)
	@ResponseBody
	public void reviewUpload(@RequestParam(name="isbn")String isbn, @RequestParam(name="r_star")double r_star, @RequestParam(name="mem_id")int mem_id, @RequestParam(name="r_content")String r_content){
		
		Review review = new Review();
		
		System.out.println(isbn);
		review.setIsbn(isbn);
		System.out.println(r_content);
		System.out.println(r_star);
		System.out.println(mem_id);
		review.setR_content(r_content);
		review.setR_like(0);
		review.setR_star(r_star);
		review.setMem_id(mem_id);
		
		int rc = brs.uploadReview(review);
		
		if(rc == 0)
			System.out.println("리뷰가 저장되지 않았습니다.");
		else
			System.out.println("리뷰가 성공적으로 저장되었습니다.");
	}

}
