package com.bit.nullnull.book.dao;

import java.util.List;

import com.bit.nullnull.book.model.ReadBook;

public interface bookReadDao {
	
	List<ReadBook> selectStoreList(String isbn);
	
	int storeBooks(ReadBook readbook);

  
}
