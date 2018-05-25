package com.bit.nullnull.passwordch;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.LoginDao;
import com.bit.nullnull.member.model.Member;

public class SearchpwService {
@Autowired
private SqlSessionTemplate sqlSessionTemplate;  
private LoginDao dao;

public Member IdChk(String id) {

	dao = sqlSessionTemplate.getMapper(LoginDao.class);
				
	Member member = dao.selectById(id);
	System.out.println("svc : " + member);
		
	if(member != null && !member.matchPassword(id)) {
	
	}
	
	return member;
}
}
