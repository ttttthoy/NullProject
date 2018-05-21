package com.bit.nullnull.booknote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.booknote.model.Like;
import com.bit.nullnull.booknote.service.noteLikeService;

@Controller
public class noteLikeCheckController {
	
	@Autowired
	private noteLikeService nls;
	
	@RequestMapping(value="/note/like", method=RequestMethod.POST)
	@ResponseBody
	public void idChk(@RequestParam(name="note_id") int note_id, @RequestParam(name="mem_id") int mem_id, @RequestParam(name="status") boolean status) {
		
		Like like = new Like(note_id, mem_id);
		
		System.out.println("idCHK : " + like);
		
		if(status) {
			nls.removeLike(like);
			nls.minusLike(note_id);
		}
		else {
			nls.addLike(like);
			nls.plusLike(note_id);
		}
	}

}
