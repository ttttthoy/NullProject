package com.bit.nullnull.booknote.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.booknote.dao.NoteDao;
import com.bit.nullnull.booknote.model.Note;

public class noteUploadService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private NoteDao dao;

	public List<String> getBookList(){
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		List<String> bookList = dao.selectBookList();
		
		return bookList;
	}
	
	public int noteUpload(Note note) {
		
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		int resultCnt = dao.insertNote(note);
		
		return resultCnt;
	}
	

}
