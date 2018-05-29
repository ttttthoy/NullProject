package com.bit.nullnull.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.FollowDao;
import com.bit.nullnull.member.model.Follow;

public class MemberFollowService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private FollowDao dao;
	
	public Follow getFollow(Follow follow) {
		
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		
		return dao.getFollow(follow);
	}

	public void removeFollow(Follow follow) {
		 dao = sqlSessionTemplate.getMapper(FollowDao.class);
		dao.deleteFollow(follow);
	}

	public void addFollow(Follow follow) {
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		dao.addFollow(follow);
	}

}
