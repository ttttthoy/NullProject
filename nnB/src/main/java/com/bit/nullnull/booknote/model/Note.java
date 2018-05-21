package com.bit.nullnull.booknote.model;

import java.util.Date;

public class Note {

	private int note_id;
	private int mem_id;
	private String isbn;
	private String b_title;
	private String b_imag;
	private String b_author;
	private String b_publisher;
	private String b_pubdate;
	private Date upload_date;
	private String note_contents;
	private int pub_priv;
	private int joayo;

	Note() {
	}

	public Note(int note_id, int mem_id, String isbn, String title, String imag, String author, String publisher,
			String pubdate, Date upload_date, String note_contents, int pub_priv, int like) {
		super();
		this.note_id = note_id;
		this.mem_id = mem_id;
		this.isbn = isbn;
		this.b_title = title;
		this.b_imag = imag;
		this.b_author = author;
		this.b_publisher = publisher;
		this.b_pubdate = pubdate;
		this.upload_date = upload_date;
		this.note_contents = note_contents;
		this.pub_priv = pub_priv;
		this.joayo = like;
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

	public int getMem_id() {
		return mem_id;
	}

	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
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

	public int getLike() {
		return joayo;
	}

	public void setLike(int like) {
		this.joayo = like;
	}

	@Override
	public String toString() {
		return "Note [note_id=" + note_id + ", mem_id=" + mem_id + ", isbn=" + isbn + ", b_title=" + b_title
				+ ", b_imag=" + b_imag + ", b_author=" + b_author + ", b_publisher=" + b_publisher + ", b_pubdate="
				+ b_pubdate + ", upload_date=" + upload_date + ", note_contents=" + note_contents + ", pub_priv="
				+ pub_priv + ", like=" + joayo + "]";
	}

	
	
}
