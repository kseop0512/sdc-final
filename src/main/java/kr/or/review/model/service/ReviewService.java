package kr.or.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.review.model.dao.ReviewDao;
import kr.or.review.model.vo.Review;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;
	
	public int insertReview(Review r) {
		return dao.insertReview(r);
	}
}
