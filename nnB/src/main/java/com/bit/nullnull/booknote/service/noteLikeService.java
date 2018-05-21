package com.bit.nullnull.booknote.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.booknote.dao.LikeDao;
import com.bit.nullnull.booknote.dao.NoteDao;
import com.bit.nullnull.booknote.model.Like;
import com.bit.nullnull.booknote.model.Note;

public class noteLikeService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private NoteDao nDao;
	private LikeDao dao;
	
	public Note selectNoteById(int note_id) {
		nDao = sqlSessionTemplate.getMapper(NoteDao.class);
		return nDao.selectNoteById(note_id);
	}
	
	public void addLike(Like like) {
		dao = sqlSessionTemplate.getMapper(LikeDao.class);
		dao.addLike(like);
	}
	
	public List<Like> getLikes(){
		dao = sqlSessionTemplate.getMapper(LikeDao.class);
		return dao.getLikes();
	}
	
	public Like getLike(Like like) {
		dao = sqlSessionTemplate.getMapper(LikeDao.class);
		return dao.getLike(like);
	}
	
	public void removeLike(Like like) {
		dao = sqlSessionTemplate.getMapper(LikeDao.class);
		dao.removeLike(like);
	}
	
	public String countLike(int note_id) {
		dao = sqlSessionTemplate.getMapper(LikeDao.class);
		return dao.countLike(note_id);
	}

	public void plusLike(int note_id) {
		dao = sqlSessionTemplate.getMapper(LikeDao.class);
		dao.plusLike(note_id);
	}
	
	public void minusLike(int note_id) {
		dao = sqlSessionTemplate.getMapper(LikeDao.class);
		dao.minusLike(note_id);
	}

}
