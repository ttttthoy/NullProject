package com.bit.nullnull.book.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.bit.nullnull.book.model.ReadBook;

public class bookReadMybatisDao {

private SqlSessionTemplate sqlSessionTemplate;
	
	private String ns = "com.bit.nullnull.book.mybatis.mapper.bookDao";
	
	public int insertBook(ReadBook readbook) {
		return sqlSessionTemplate.update(ns+".insertBooks", readbook);
	}
	
}
