package kr.or.review.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.review.model.vo.Review;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//후기평점 조회
	public int selectReviewRate(String bookingNo) {
		return sqlSession.selectOne("review.selectReviewRate",bookingNo);
	}
		
	//후기작성
	public int insertReview(Review r) {
		return sqlSession.insert("review.insertReview",r);
	}
	
	//후기작성 후 예약상태변경
	public int updateReviewState(Review r) {
		return sqlSession.update("booking.updateReviewState",r);
	}
	
}
