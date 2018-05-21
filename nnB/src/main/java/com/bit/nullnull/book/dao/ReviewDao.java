package com.bit.nullnull.book.dao;

import java.util.List;

import com.bit.nullnull.book.model.Review;

public interface ReviewDao {
	
	List<Review> selectReviewList(String isbn);

	int insertReview(Review review);

	double avgStar(String isbn);

	int deleteReview(int r_id);

	int cntReview(String isbn);

}
