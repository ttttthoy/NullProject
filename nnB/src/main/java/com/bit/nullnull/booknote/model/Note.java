package com.bit.nullnull.booknote.model;

import java.util.Date;

public class Note {

	private int note_id;
	private int member_num;
	private String member_name;
	private String member_photo;
	private String isbn;
	private String b_title;
	private String b_imag;
	private String b_author;
	private String b_publisher;
	private String b_pubdate;
	private String b_description;
	private Date upload_date;
	private String note_title;
	private String note_contents;
	private int pub_priv;
	private int joayo;

	Note() {
	}

	public Note(int note_id, int member_num, String member_name, String member_photo, String isbn, String b_title,
			String b_imag, String b_author, String b_publisher, String b_pubdate, String b_description,
			Date upload_date, String note_title, String note_contents, int pub_priv, int joayo) {
		super();
		this.note_id = note_id;
		this.member_num = member_num;
		this.member_name = member_name;
		this.member_photo = member_photo;
		this.isbn = isbn;
		this.b_title = b_title;
		this.b_imag = b_imag;
		this.b_author = b_author;
		this.b_publisher = b_publisher;
		this.b_pubdate = b_pubdate;
		this.b_description = b_description;
		this.upload_date = upload_date;
		this.note_title = note_title;
		this.note_contents = note_contents;
		this.pub_priv = pub_priv;
		this.joayo = joayo;
	}



	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_imag() {
		return b_imag;
	}

	public void setB_imag(String b_imag) {
		this.b_imag = b_imag;
	}

	public String getB_author() {
		return b_author;
	}

	public void setB_author(String b_author) {
		this.b_author = b_author;
	}

	public String getB_publisher() {
		return b_publisher;
	}

	public void setB_publisher(String b_publisher) {
		this.b_publisher = b_publisher;
	}

	public String getB_pubdate() {
		return b_pubdate;
	}

	public void setB_pubdate(String b_pubdate) {
		this.b_pubdate = b_pubdate;
	}

	public int getNote_id() {
		return note_id;
	}

	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
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

	public String getIsbn() {

		isbn = isbn.replaceAll("<b>", "");
		isbn = isbn.replaceAll("</b>", "");

		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public String getNote_contents() {
		return note_contents;
	}

	public void setNote_contents(String note_contents) {
		this.note_contents = note_contents;
	}

	public int getPub_priv() {
		return pub_priv;
	}

	public void setPub_priv(int pub_priv) {
		this.pub_priv = pub_priv;
	}

	public String getB_description() {
		return b_description;
	}

	public void setB_description(String b_description) {
		this.b_description = b_description;
	}

	public int getJoayo() {
		return joayo;
	}

	public void setJoayo(int joayo) {
		this.joayo = joayo;
	}
	
	public String getNote_title() {
		return note_title;
	}

	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}

	@Override
	public String toString() {
		return "Note [note_id=" + note_id + ", member_num=" + member_num + ", member_name=" + member_name
				+ ", member_photo=" + member_photo + ", isbn=" + isbn + ", b_title=" + b_title + ", b_imag=" + b_imag
				+ ", b_author=" + b_author + ", b_publisher=" + b_publisher + ", b_pubdate=" + b_pubdate
				+ ", b_description=" + b_description + ", upload_date=" + upload_date + ", note_title=" + note_title
				+ ", note_contents=" + note_contents + ", pub_priv=" + pub_priv + ", joayo=" + joayo + "]";
	}
	
}
