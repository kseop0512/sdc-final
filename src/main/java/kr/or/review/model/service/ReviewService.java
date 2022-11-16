package kr.or.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.partner.model.vo.Partner;
import kr.or.partner.model.vo.PartnerFileVO;
import kr.or.review.model.dao.ReviewDao;
import kr.or.review.model.vo.Review;
import kr.or.review.model.vo.ReviewFileVO;

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
		int insertFileResult = 0;
		//입력정보 r로 이용후기 생성
		int insertResult = dao.insertReview(r);
		String reviewNo = dao.selectReviewNo(r.getBookingNo());
		if(insertResult>0) {
			//후기사진 인서트
			if(!r.getFileList().isEmpty()) {
				for(ReviewFileVO rv : r.getFileList()) {
					rv.setReviewNo(reviewNo);
					insertFileResult += dao.insertReviewFiles(rv);
				}
				if(insertFileResult == 0) {
					return 0;
				}
			}
			//예약목록 후기 작성상태 1로 수정
			int updateResult = dao.updateReviewState(r);
			if(updateResult>0) {
				//후기 작성 후 파트너포인트 +30
				Partner p = new Partner();
				p.setPNo(r.getPNo());
				p.setPPoint(30);
				result = dao.updatePartnerPoint(p);
				int pPoint = dao.selectPartnerPoint(r.getPNo());
				if(pPoint>300 && pPoint<=700) {
					p.setPGrade("B");
					result = dao.updatePartnerGrade(p);
				}else if(pPoint>700) {
					p.setPGrade("A");
					result = dao.updatePartnerGrade(p);
				}
			}
		}
		return result;
	}

	public Review selectOneReview(String bookingNo) {
		Review r = dao.selectOneReview(bookingNo);
		ArrayList<ReviewFileVO> fileList = dao.selectOneReviewFiles(r);
		r.setFileList(fileList);
		return r;
	}
	
	@Transactional
	public int updateReview(Review r) {
		return dao.updateReview(r);
	}

}
