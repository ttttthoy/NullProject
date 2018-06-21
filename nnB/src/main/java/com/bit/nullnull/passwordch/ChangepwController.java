package com.bit.nullnull.passwordch;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.nullnull.member.model.Member;

@Controller
@RequestMapping("/member/pwchange")
public class ChangepwController {
	@Autowired
	private ChangepwService pwchangeservice;

	@RequestMapping(method = RequestMethod.GET)
	public String updatepw() {
		return "member/changepwform";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String changepwservice(Memberpw member)
			throws IllegalStateException, IOException {	
System.out.println("11111:::::"+member);
		String msg = "정상적으로 처리되었습니다.";

		int resultCnt = pwchangeservice.changePw(member);

		if (resultCnt == 0)
			msg = "변경처리가 되지 않았습니다. 다시 입력 바랍니다.";



		return "member/infopage";
	}
}
