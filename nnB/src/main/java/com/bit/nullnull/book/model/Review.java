package com.bit.nullnull.book.model;

import java.util.Date;

public class Review {
	
	private int r_id;
	private String isbn;
	private String r_content;
	private double r_star;
	private int r_like;
	private int mem_id;
	private String member_name;
	private String member_photo;
	private Date reg_date;
	private Date update_date;
	
	public Review(){}

	public Review(int r_id, String isbn, String r_content, double r_star, int r_like, int mem_id, String member_name,
			String member_photo, Date reg_date, Date update_date) {
		super();
		this.r_id = r_id;
		this.isbn = isbn;
		this.r_content = r_content;
		this.r_star = r_star;
		this.r_like = r_like;
		this.mem_id = mem_id;
		this.member_name = member_name;
		this.member_photo = member_photo;
		this.reg_date = reg_date;
		this.update_date = update_date;
	}



	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public String getIsbn() {

		isbn = isbn.replaceAll("<b>", "");
		isbn = isbn.replaceAll("</b>", "");

		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public double getR_star() {
		return r_star;
	}

	public void setR_star(double r_star) {
		this.r_star = r_star;
	}

	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	public int getMem_id() {
		return mem_id;
	}

	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}

	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_photo() {
		return member_photo;
	}

	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	@Override
	public String toString() {
		return "Review [r_id=" + r_id + ", isbn=" + isbn + ", r_content=" + r_content + ", r_star=" + r_star
				+ ", r_like=" + r_like + ", mem_id=" + mem_id + ", member_name=" + member_name + ", member_photo="
				+ member_photo + ", reg_date=" + reg_date + ", update_date=" + update_date + "]";
	}

	
}
