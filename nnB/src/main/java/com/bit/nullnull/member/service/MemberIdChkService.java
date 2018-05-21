package com.bit.nullnull.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.LoginDao;
import com.bit.nullnull.member.model.Member;

public class MemberIdChkService {

		@Autowired
		private SqlSessionTemplate sqlSessionTemplate;  

		private LoginDao dao;
		
		public String idChk(String id) {
			
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
			
			Member member = dao.selectById(id);
			
			return member == null ? "Y":"N";
		}
}
