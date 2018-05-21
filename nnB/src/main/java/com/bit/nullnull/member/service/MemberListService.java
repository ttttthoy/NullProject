package com.bit.nullnull.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.LoginDao;
import com.bit.nullnull.member.model.Member;

public class MemberListService {
	    
		@Autowired
		private SqlSessionTemplate sqlSessionTemplate;
		
		private LoginDao dao;
		
		public List<Member> getMemberList(){
			
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
			
			List<Member> list = dao.selectList();
			
			return list;		
			
		}
}
