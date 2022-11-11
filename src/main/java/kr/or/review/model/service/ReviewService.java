package kr.or.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.review.model.dao.ReviewDao;
import kr.or.review.model.vo.Review;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;
	
	public int getReviewRate(String bookingNo) {
		int reviewRate = dao.selectReviewRate(bookingNo);
		return reviewRate;
	}
	
	@Transactional
	public int writeReview(Review r) {
		int result = 0;
		int insertResult = dao.insertReview(r);
		if(insertResult>0) {
			result = dao.updateReviewState(r);
		}
		return result;
	}

}
