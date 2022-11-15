package kr.or.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.partner.model.vo.Partner;
import kr.or.review.model.vo.Review;
import kr.or.review.model.vo.ReviewFileVO;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//예약목록의 후기평점 조회
	public int selectReviewRate(String bookingNo) {
		return sqlSession.selectOne("review.selectReviewRate",bookingNo);
	}
		
	//후기작성
	public int insertReview(Review r) {
		return sqlSession.insert("review.insertReview",r);
	}
	//사진첨부
	public int insertReviewFiles(ReviewFileVO rv) {
		return sqlSession.insert("review.insertReviewFiles",rv);
	}
	//후기작성 후 예약상태변경
	public int updateReviewState(Review r) {
		return sqlSession.update("booking.updateReviewState",r);
	}
	//후기작성 후 파트너포인트 +30
	public int updatePartnerPoint(Partner p) {
		return sqlSession.update("review.updatePartnerPoint",p);
	}
	
	//작성한 후기 상세조회
	public Review selectOneReview(String bookingNo) {
		return sqlSession.selectOne("review.selectOneReview",bookingNo);
	}
	//작성한 후기 사진 불러오기
	public ArrayList<ReviewFileVO> selectOneReviewFiles(Review r) {
		List fileList = sqlSession.selectList("review.selectOneReviewFiles",r);
		return (ArrayList<ReviewFileVO>) fileList;
	}
	//작성한 후기 수정
	public int updateReview(Review r) {
		return sqlSession.update("review.updateReview",r);
	}
	//후기작성한 예약목록 번호 불러오기
	public String selectReviewNo(String bookingNo) {
		return sqlSession.selectOne("review.selectReviewNo", bookingNo);
	}
	
}
