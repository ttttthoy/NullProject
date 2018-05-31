package com.bit.nullnull.book.model;

import java.util.Date;

public class ReadBook {
	
		private String isbn; 	//도서번호
		private String member_num;
		private Date date;
		private String state_num;

		
		public ReadBook() {}
		

		public ReadBook(String isbn, String member_num, Date date, String state_num) {
			super();
			this.isbn = isbn;
			this.member_num = member_num;
			this.date = date;
			this.state_num = state_num;
		}



		public String getIsbn() {
			return isbn;
		}


		public void setIsbn(String isbn) {
			this.isbn = isbn;
		}


		public String getMember_num() {
			return member_num;
		}


		public void setMember_num(String member_num) {
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


		@Override
		public String toString() {
			return "readbook [isbn=" + isbn + ", member_num=" + member_num + ", Date=" + date + ", state_num=" + state_num
					+ "]";
		}
		
		

}
		
		
		
		
		
		
		
		