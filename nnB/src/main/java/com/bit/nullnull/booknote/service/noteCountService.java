package com.bit.nullnull.booknote.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.booknote.dao.NoteDao;

public class noteCountService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private NoteDao dao;
	
	public int noteCountbyid(int mem_num) {
		dao = sqlSessionTemplate.getMapper(NoteDao.class);
		
		return dao.noteCountByid(mem_num);
	}

}
