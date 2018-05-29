package com.bit.nullnull.book.model;

import java.util.Date;

public class ReadBook {
	
		private int isbn; 	//도서번호
		private int member_num;
		private Date date;
		private int state_num;

		
		public ReadBook() {}
		

		public ReadBook(int isbn, int member_num, Date date, int state_num) {
			super();
			this.isbn = isbn;
			this.member_num = member_num;
			this.date = date;
			this.state_num = state_num;
		}



		public int getIsbn() {
			return isbn;
		}


		public void setIsbn(int isbn) {
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


		public int getState_num() {
			return state_num;
		}


		public void setState_num(int state_num) {
			this.state_num = state_num;
		}


		@Override
		public String toString() {
			return "readbook [isbn=" + isbn + ", member_num=" + member_num + ", Date=" + date + ", state_num=" + state_num
					+ "]";
		}
		
		

}
		
		
		
		
		
		
		
		