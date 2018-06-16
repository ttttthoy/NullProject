package com.bit.nullnull.member.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.LoginDao;
import com.bit.nullnull.member.model.Member;

public class kakaoLoginService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private LoginDao dao;
	
	public Member emailChk(String member_id) {
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		Member member = dao.selectById(member_id);
		
		if(member.getMember_id().isEmpty()) {
			String upload = member.getMember_id() + member.getMember_name();
			member.setMember_id(upload);
			member.setMember_name(upload);
		}
		
		return member;
	}
	
	public int insertMem(Member member, HttpServletRequest request)throws IllegalStateException, IOException{
		
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		
		int resultCnt = dao.insertKakao(member);
		
		return resultCnt;
	}

}
