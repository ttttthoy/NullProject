package com.bit.nullnull.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.LoginDao;
import com.bit.nullnull.member.model.Member;

public class MemberLoginService {
	    
		@Autowired
		private SqlSessionTemplate sqlSessionTemplate;  
				
		private LoginDao dao;
			
		public Member loginChk(String id, String pw) {
		
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
						
			Member member = dao.selectById(id);
			System.out.println("svc : " + member);
				
			if(member != null && !member.matchPassword(pw)) {
				member = null;
			}
			
			return member;
		}

		public Member selectById(String id) {
			
			return dao.selectById(id);
		}
		
}
