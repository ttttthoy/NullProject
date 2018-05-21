package com.bit.nullnull.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.nullnull.member.service.MemberIdChkService;

@Controller
public class MemberRegIdChkController {
	
	@Autowired
	private MemberIdChkService idChkService;   
	
	@RequestMapping(value="/member/idchk", method=RequestMethod.POST)
	@ResponseBody
	public String idChk(@RequestParam("userid") String id) {
		
		return idChkService.idChk(id);
	}
}
