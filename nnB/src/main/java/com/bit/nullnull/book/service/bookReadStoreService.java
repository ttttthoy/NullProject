package com.bit.nullnull.book.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.book.dao.bookReadDao;
import com.bit.nullnull.book.model.ReadBook;


public class bookReadStoreService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private bookReadDao dao;
	
	public List<ReadBook> getStoreBook(String isbn){
		
		dao = sqlSessionTemplate.getMapper(bookReadDao.class);
		List<ReadBook> ReadBooks = dao.selectStoreList(isbn);
		return ReadBooks;
		
	}
	
	public int bookStore(ReadBook readbook) {
		
		dao = sqlSessionTemplate.getMapper(bookReadDao.class);
		int resultCnt = dao.storeBooks(readbook);
		return resultCnt;
	}
	
	
}
