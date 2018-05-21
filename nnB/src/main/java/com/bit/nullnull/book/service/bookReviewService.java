package com.bit.nullnull.book.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.nullnull.book.dao.ReviewDao;
import com.bit.nullnull.book.model.Review;

public class bookReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ReviewDao dao;
	
	public List<Review> getBookReview(String isbn) {
		
		dao	= sqlSessionTemplate.getMapper(ReviewDao.class);
		
		List<Review> reviews = dao.selectReviewList(isbn);
		
		return reviews;
				
	}

	public int uploadReview(Review review) {
		
		dao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		int resultCnt = dao.insertReview(review);
		
		return resultCnt;
		
	}
	
	public double avgStar(String isbn) {
		
		dao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		double avgStar = dao.avgStar(isbn);
		
		return avgStar;
	}

	public int deleteReview(int r_id) {

		dao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		int resultCnt = dao.deleteReview(r_id);
		
		return resultCnt;
		
	}

	public int cntReview(String isbn) {

		dao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		int resultCnt = dao.cntReview(isbn);
		
		return resultCnt;
	}

}
