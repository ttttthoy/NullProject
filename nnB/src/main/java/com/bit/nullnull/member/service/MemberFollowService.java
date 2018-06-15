package com.bit.nullnull.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.dao.FollowDao;
import com.bit.nullnull.member.model.Follow;
import com.bit.nullnull.member.model.Member;

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

	public List<Integer> follower_id(int member_id) {
		
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
					
		return dao.getFollower_id(member_id);
	}

	public List<Member> follower_member(List<Integer> f_m_id) {
		
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		
		return null;
	}

}
