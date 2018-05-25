package com.bit.nullnull.passwordch;

import java.util.Date;

public class Memberpw {
	private int idx;
	private String member_id;
	private String member_pw;

	public Memberpw() {
	}

	public Memberpw(int idx, String member_id, String member_pw, Date regdate) {
		this.idx = idx;
		this.member_id = member_id;
		this.member_pw = member_pw;

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

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	@Override
	public String toString() {
		return "Member [idx=" + idx + ",member_id=" + member_id + ",  member_pw =" + member_pw + "]";
	}
}
