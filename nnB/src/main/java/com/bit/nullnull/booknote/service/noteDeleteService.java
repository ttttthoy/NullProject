package com.bit.nullnull.booknote.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.booknote.dao.NoteDao;
import com.bit.nullnull.booknote.model.Note;

public class noteDeleteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private NoteDao dao;
	
	public Note deleteChk(int id) {
		
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		Note note = dao.selectNoteById(id);
		
		return note;
		
	}
	
	public int noteDelete(Note note) {
		
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		int resultCnt = dao.deleteNote(note);
		
		return resultCnt;
	}
	
}
