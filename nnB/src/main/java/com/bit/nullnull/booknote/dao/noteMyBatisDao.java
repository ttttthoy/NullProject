package com.bit.nullnull.booknote.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.bit.nullnull.booknote.model.Note;

public class noteMyBatisDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String ns = "com.nullnull.book.mybatis.mapper.NoteDao";
	
	public int insertNote(Note note) {
		return sqlSessionTemplate.update(ns+".insertNote", note);
	}

}
