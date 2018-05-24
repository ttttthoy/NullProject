package com.bit.nullnull.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.MemberEditDao;
import com.bit.nullnull.member.model.Member;

public class MemberEditService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private MemberEditDao dao;

	public Member numChk(int member_num) {

		dao = sqlSessionTemplate.getMapper(MemberEditDao.class);

		Member member = dao.selectByNum(member_num);

		return member;
	}

	public int editMember(Member member, HttpServletRequest request) throws IllegalStateException, IOException {

		int resultCnt = 0;

		dao = sqlSessionTemplate.getMapper(MemberEditDao.class);

		String uploadURI = "resources/profileImg";
		String dir = request.getSession().getServletContext().getRealPath(uploadURI);
		System.out.println(dir);

		if (!member.getPhotofile().isEmpty()) {
			String fileName = member.getMember_num() + "_" + member.getPhotofile().getOriginalFilename();
			member.getPhotofile().transferTo(new File(dir, fileName));
			member.setMember_photo(fileName);
		}

		resultCnt = dao.editMember(member);

		return resultCnt;
	}

}
