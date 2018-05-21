package com.bit.nullnull.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.member.model.Member;

public class MemberMyBatisDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String ns = "com.bit.nullnull.mybatis.mapper.MemberMapper";
		
	public int insertMember(Member member) {		
		return sqlSessionTemplate.update(ns+".insertMember", member);		
	}
	
	public Member selectById(String id) {
		return sqlSessionTemplate.selectOne(ns+".selectById", id);	
	}
	
	public List<Member> selectMembers(){
		
		return sqlSessionTemplate.selectList(ns+".selectList");
	}
}
