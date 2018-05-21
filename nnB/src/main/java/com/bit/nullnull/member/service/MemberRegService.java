package com.bit.nullnull.member.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.LoginDao;
import com.bit.nullnull.member.model.Member;

public class MemberRegService {

		@Autowired
		private SqlSessionTemplate sqlSessionTemplate;

		private LoginDao dao; 

		public int memberReg(Member member,  HttpServletRequest request) throws IllegalStateException, IOException {
			
			dao = sqlSessionTemplate.getMapper(LoginDao.class);
						
			System.out.println("실행전 : " + member.getMember_num());
								
			int resultCnt = dao.insertMember(member);
											
			System.out.println("실행후 : " + member.getMember_num());
						
			return resultCnt;
		}
	}
