package com.bit.nullnull.passwordch;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.model.Member;

public class ChangepwService {
	@Autowired
	private ChangepwDao dao;

	public int changePw(Memberpw member) throws IllegalStateException, IOException {
		System.out.println("실행전 : " + member.getMember_pw());

		int resultCnt = dao.updatePassword(member);

		System.out.println("실행후 : " + member.getMember_pw());

		return resultCnt;
	}
}


