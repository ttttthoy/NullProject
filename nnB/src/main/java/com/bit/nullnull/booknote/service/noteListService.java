package com.bit.nullnull.booknote.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.book.model.Book;
import com.bit.nullnull.book.service.bookSearchService;
import com.bit.nullnull.booknote.dao.NoteDao;
import com.bit.nullnull.booknote.model.Note;

public class noteListService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private bookSearchService bss;
	
	private NoteDao dao;

	public List<Note> getNoteList() {
		 
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		List<Note> notelist = dao.selectNoteList();
		
		return notelist;
	}

	public List<Note> getNoteListbyIsbn(String isbn) {

		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		List<Note> notelist = dao.selectNoteListByIsbn(isbn);
		
		return notelist;
	}

	public List<Note> getMyNoteList(int member_num) {
		
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		List<Note> notelist = dao.selectNoteListByMem_num(member_num);
		
		return notelist;
	}

	public List<Note> getNoteListByDate() {
		
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		List<Note> notes = dao.selectNoteListByDate();
		
		return notes;
	}
	
}
