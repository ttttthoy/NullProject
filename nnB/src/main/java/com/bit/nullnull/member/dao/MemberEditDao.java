package com.bit.nullnull.member.dao;

import com.bit.nullnull.member.model.Member;

public interface MemberEditDao {
	
	Member selectByNum(int member_num);

	int editMember(Member member);

}
