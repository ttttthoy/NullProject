package com.bit.nullnull.booknote.dao;

import java.util.List;

import com.bit.nullnull.booknote.model.Like;

public interface LikeDao {
	
	void addLike(Like like);

	List<Like> getLikes();
	
	void removeLike(Like like);
	
	Like getLike(Like like);

	String countLike(int note_id);

	void plusLike(int note_id);
	
	void minusLike(int note_id);
}
