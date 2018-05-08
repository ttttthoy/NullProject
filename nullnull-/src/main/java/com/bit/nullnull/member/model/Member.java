package com.bit.nullnull.member.model;

import java.util.Date;

public class Member {
	private int idx;
	private String member_id;
	private String member_name;
	private String member_pw ;

	
	public Member(){}

	public Member(int idx, String member_id, String member_name, String member_pw , Date regdate) {
		this.idx = idx;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_pw = member_pw ;
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getmember_pw () {
		return member_pw ;
	}

	public void setPassword(String member_pw ) {
		this.member_pw  = member_pw ;
	}


	public boolean matchPassword(String pw){
		return member_pw .equals(pw);
	}


	@Override
	public String toString() {
		return "Member [idx=" + idx + ", member_id=" + member_id + ", member_name=" + member_name + ", member_pw ="
				+ member_pw  + "]";
	}
}
