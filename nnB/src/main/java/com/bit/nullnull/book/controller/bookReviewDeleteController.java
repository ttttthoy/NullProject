package com.bit.nullnull.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.book.service.bookReviewService;

@Controller
public class bookReviewDeleteController {
	
	@Autowired
	private bookReviewService brs;
	
	@RequestMapping(value = "/review/delchk", method = RequestMethod.POST)
	@ResponseBody
	public void reviewDelete(@RequestParam(name="r_id") int r_id) {
		
		String msg = "정상적으로 삭제되었습니다.";
		
		int resultCnt = brs.deleteReview(r_id);
		
		if(resultCnt == 0) {
			msg = "삭제 처리가 되지 않았습니다.";
		}
		
		System.out.println(msg);
		
	}
}
