package com.bit.nullnull.book.model;

import java.util.Date;

public class ReadBook {
	
		private String isbn; 	//도서번호
		private int member_num;
		private Date date;
		private String state_num;
		private String imag;

		
		public ReadBook() {}


		public String getIsbn() {
			return isbn;
		}


		public void setIsbn(String isbn) {
			this.isbn = isbn;
		}


		public int getMember_num() {
			return member_num;
		}


		public void setMember_num(int member_num) {
			this.member_num = member_num;
		}


		public Date getDate() {
			return date;
		}


		public void setDate(Date date) {
			this.date = date;
		}


		public String getState_num() {
			return state_num;
		}


		public void setState_num(String state_num) {
			this.state_num = state_num;
		}


		public String getImag() {
			return imag;
		}


		public void setImag(String imag) {
			this.imag = imag;
		}


		public ReadBook(String isbn, int member_num, Date date, String state_num, String imag) {
			super();
			this.isbn = isbn;
			this.member_num = member_num;
			this.date = date;
			this.state_num = state_num;
			this.imag = imag;
		}


		@Override
		public String toString() {
			return "ReadBook [isbn=" + isbn + ", member_num=" + member_num + ", date=" + date + ", state_num="
					+ state_num + ", imag=" + imag + "]";
		}
		

		
		

}
		
		
		
		
		
		
		
		