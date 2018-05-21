package com.bit.nullnull.book.model;

public class Book {
	
	 private String title;
	    private String link;
	    private String imag;
	    private String author;
	    private String publisher;
	    private String pubdate;
	    private String isbn;
	    private String description;
	    public String getTitle() {
	        return title;
	    }
	    public void setTitle(String title) {
	        this.title = title;
	    }
	    public String getLink() {
	        return link;
	    }
	    public void setLink(String link) {
	        this.link = link;
	    }
	    public String getImag() {
	        return imag;
	    }
	    public void setImag(String imag) {
	        this.imag = imag;
	    }
	    public String getAuthor() {
	        return author;
	    }
	    public void setAuthor(String author) {
	        this.author = author;
	    }
	    public String getPublisher() {
	        return publisher;
	    }
	    public void setPublisher(String publisher) {
	        this.publisher = publisher;
	    }
	    public String getPubdate() {
	        return pubdate;
	    }
	    public void setPubdate(String pubdate) {
	        this.pubdate = pubdate;
	    }
	    public String getIsbn() {

			isbn = isbn.replaceAll("<b>", "");
			isbn = isbn.replaceAll("</b>", "");

			return isbn;
		}
	    public void setIsbn(String isbn) {
	        this.isbn = isbn;
	    }
	    public String getDescription() {
	        return description;
	    }
	    public void setDescription(String description) {
	        this.description = description;
	    }
	    @Override
	    public String toString() {
	        return "Book [title=" + title + ", link=" + link + ", imag=" + imag + ", author=" + author +", publisher=" + publisher + ", pubdate=" + pubdate + ", isbn=" + isbn
	                + ", description=" + description + "]";
	    }

}
