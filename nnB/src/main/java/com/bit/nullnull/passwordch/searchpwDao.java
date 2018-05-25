package com.bit.nullnull.passwordch;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.bit.nullnull.member.dao.MemberRowMapper;
import com.bit.nullnull.member.model.Member;

public class searchpwDao {
private JdbcTemplate jdbcTemplate;
public searchpwDao(DataSource dataSource) {
	jdbcTemplate = new JdbcTemplate(dataSource);
}
public int insertPw(Memberpw member) {
	String sql = "insert into member(member_pw)" + "values(?)";
	int resultCntpw =  jdbcTemplate.update(sql,
			member.getMember_pw());
		return resultCntpw;
}
public Member selectBypw(String pw) {
	String sql = "select* from member where member_pw = ?";
	List<Member> result = jdbcTemplate.query(sql, new MemberRowMapper(),pw);
	
	return result.isEmpty() ? null : result.get(0);
}

public List<Member> selectMembers() {
	
	String sql = "select * from member";
	List<Member> result = jdbcTemplate.query(sql, new MemberRowMapper());
	
	return result;
}
	
}

