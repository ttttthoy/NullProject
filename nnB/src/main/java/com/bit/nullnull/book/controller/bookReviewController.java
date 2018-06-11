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

	@RequestMapping(value="/review/upload")
	@ResponseBody
	public void reviewUpload(@RequestParam(name="isbn")String isbn, @RequestParam(name="r_star")double r_star, @RequestParam(name="member_num")int member_num, @RequestParam(name="member_name")String member_name, @RequestParam(name="member_photo")String member_photo, @RequestParam(name="r_content")String r_content){

		Review review = new Review();
		
		System.out.println(isbn);
		review.setIsbn(isbn);
		System.out.println(r_content);
		System.out.println(r_star);
		System.out.println(member_num);
		review.setR_content(r_content);
		review.setR_like(0);
		review.setR_star(r_star);
		review.setMem_id(member_num);
		review.setMember_name(member_name);
		review.setMember_photo(member_photo);
		
		
		int rc = brs.uploadReview(review);
		
		if(rc == 0)
			System.out.println("리뷰가 저장되지 않았습니다.");
		else
			System.out.println("리뷰가 성공적으로 저장되었습니다.");
	}

}
