package com.bit.nullnull.passwordch;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.bit.nullnull.member.dao.MemberRowMapper;
import com.bit.nullnull.member.model.Member;

public class ChangepwDao {
	private JdbcTemplate jdbcTemplate;
	public ChangepwDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public int updatePassword(Memberpw member) {
		String sql = "update Member set member_pw = ? where member_id =?" ;
		int resultCnt = jdbcTemplate.update(
				sql, member.getMember_pw(), member.getMember_id());
				
		return resultCnt;
	}
public Member selectByPw(String pw) {
		
		String sql = "select * from member where member_pw = ?";		
		List<Member> result = jdbcTemplate.query(sql, new MemberRowMapper(),pw);
		
		return result.isEmpty() ? null : result.get(0);
	}

	public List<Member> selectMembers() {
		
		String sql = "select * from member";
		List<Member> result = jdbcTemplate.query(sql, new MemberRowMapper());
		
		return result;
	}
}
