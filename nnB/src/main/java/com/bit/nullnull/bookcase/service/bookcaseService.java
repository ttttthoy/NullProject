package com.bit.nullnull.bookcase.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.book.dao.bookReadDao;
import com.bit.nullnull.book.model.ReadBook;
import com.bit.nullnull.book.service.bookSearchService;
import com.bit.nullnull.booknote.dao.NoteDao;
import com.bit.nullnull.booknote.model.Note;


public class bookcaseService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private bookSearchService bss;
	
	private bookReadDao dao;

	public List<ReadBook> getStoreList(String isbn) {
		 
		dao = sqlSessionTemplate.getMapper(bookReadDao.class);
		
		List<ReadBook> storelist = dao.selectStoreList(isbn);
		
		return storelist;
	}
	
	public List<ReadBook> getStoreListPast(int member_num){
		
		dao = sqlSessionTemplate.getMapper(bookReadDao.class);
		
		List<ReadBook> storeList = dao.selectStoreBookListPast(member_num);
		
		return storeList;
	}
	
	public List<ReadBook> getStoreListCurrent(int member_num){
		
		dao = sqlSessionTemplate.getMapper(bookReadDao.class);
		
		List<ReadBook> storeList = dao.selectStoreBookListCurrent(member_num);
		
		return storeList;
	}


	public List<ReadBook> getStoreListFuture(int member_num){
	
		dao = sqlSessionTemplate.getMapper(bookReadDao.class);
	
		List<ReadBook> storeList = dao.selectStoreBookListFuture(member_num);
	
		return storeList;
}


}
