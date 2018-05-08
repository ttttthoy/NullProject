package com.bit.nullnull.member.dao;


import java.util.List;

import com.bit.nullnull.member.model.Member;

public interface LoginDao {
	
	public Member selectById(String id);
	public int insertMember(Member member);
	public List<Member> selectList();

}
