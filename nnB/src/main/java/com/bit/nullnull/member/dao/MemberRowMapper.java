package com.bit.nullnull.member.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bit.nullnull.member.model.Member;

public class MemberRowMapper implements RowMapper<Member> {

	@Override
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {

		Member member = new Member();
		member.setMember_num(rs.getInt("idx"));
		member.setMember_id(rs.getString("member_id"));
		member.setMember_name(rs.getString("member_name"));
		member.setMember_pw(rs.getString("password"));
		
		return member;
	}
}
