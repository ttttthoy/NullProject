package com.bit.nullnull.booknote.model;

import java.util.Date;

public class Shelf {

	private int shelf_num;
	private String isbn;
	private int mem_num;
	private Date date;
	private int status;
	
	public Shelf() {}
	
	public Shelf(int shelf_num, String isbn, int mem_num, Date date, int status) {
		super();
		this.shelf_num = shelf_num;
		this.isbn = isbn;
		this.mem_num = mem_num;
		this.date = date;
		this.status = status;
	}

	public int getShelf_num() {
		return shelf_num;
	}

	public void setShelf_num(int shelf_num) {
		this.shelf_num = shelf_num;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Shelf [shelf_num=" + shelf_num + ", isbn=" + isbn + ", mem_num=" + mem_num + ", date=" + date
				+ ", status=" + status + "]";
	}
		
}
