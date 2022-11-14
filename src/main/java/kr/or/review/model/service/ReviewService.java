package kr.or.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.partner.model.vo.Partner;
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
		//입력정보 r로 이용후기 생성
		int insertResult = dao.insertReview(r);
		if(insertResult>0) {
			//예약목록 후기 작성상태 1로 수정
			int updateResult = dao.updateReviewState(r);
			if(updateResult>0) {
				//후기 작성 후 파트너포인트 +30
				Partner p = new Partner();
				p.setPNo(r.getPNo());
				p.setPPoint(30);
				result = dao.updatePartnerPoint(p);
			}
		}
		return result;
	}

	public Review selectOneReview(String bookingNo) {
		return dao.selectOneReview(bookingNo);
	}
	
	@Transactional
	public int updateReview(Review r) {
		return dao.updateReview(r);
	}

}