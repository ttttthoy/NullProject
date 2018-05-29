package com.bit.nullnull.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.LoginDao;
import com.bit.nullnull.member.model.Member;

public class MemberNumChkService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private LoginDao dao;
	
	public Member selectById(int member_num) {
		
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		Member member = dao.selectByNum(member_num);
		
		return member;
	}

}
