package com.bit.nullnull.booknote.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.nullnull.booknote.model.Note;
import com.bit.nullnull.booknote.service.noteDeleteService;
import com.bit.nullnull.booknote.service.noteListService;
import com.bit.nullnull.member.model.Member;

@Controller
public class noteDeleteController {
	
	@Autowired
	private noteListService nls;
	
	@Autowired
	private noteDeleteService nds;
	
	@RequestMapping("/note/{id}/noteDelete")
	public String memberDelete(@PathVariable("id") int id, Model model, HttpSession session) {
		
		Note note = nds.deleteChk(id);
		
		int resultCnt = nds.noteDelete(note);
		
		String msg = "정상적으로 삭제되었습니다.";
		
		if(resultCnt == 0) {
			msg = "삭제 처리가 되지 않았습니다!";
		}
		Member member = (Member) session.getAttribute("loginInfo");

		return "redirect:/bookcase/"+member.getMember_num();		
	}

}
