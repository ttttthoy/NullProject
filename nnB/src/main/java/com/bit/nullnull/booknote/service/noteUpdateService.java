package com.bit.nullnull.booknote.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.booknote.dao.NoteDao;
import com.bit.nullnull.booknote.model.Note;

public class noteUpdateService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	NoteDao dao;
	
	public Note updateChk(int id) {
		
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		Note note = dao.selectNoteById(id);
		
		return note;
	}
	
	public int noteUpdate(Note note) {
		
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		int resultCnt = dao.updateNote(note);
		
		return resultCnt;
	}

}
