package com.bit.nullnull.member.model;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private int member_num;
	private String member_id;
	private String member_name;
	private String member_pw ;
	private MultipartFile photofile;
	private String member_photo;

	
	public Member(){}

	
	public Member(int member_num, String member_id, String member_name, String member_pw, MultipartFile photofile,
			String member_photo) {
		super();
		this.member_num = member_num;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_pw = member_pw;
		this.photofile = photofile;
		this.member_photo = member_photo;
	}
	
	public int getMember_num() {
		return member_num;
	}


	public void setMember_num(int member_num) {
		this.member_num = member_num;
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


	public String getMember_pw() {
		return member_pw;
	}


	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}


	public MultipartFile getPhotofile() {
		return photofile;
	}


	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}


	public String getMember_photo() {
		return member_photo;
	}


	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}


	public boolean matchPassword(String pw){
		return member_pw .equals(pw);
	}


	@Override
	public String toString() {
		return "Member [member_num=" + member_num + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_pw=" + member_pw + ", photofile=" + photofile + ", member_photo=" + member_photo + "]";
	}
	
	


}
