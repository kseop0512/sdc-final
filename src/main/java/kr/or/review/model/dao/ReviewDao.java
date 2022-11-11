package kr.or.review.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.review.model.vo.Review;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertReview(Review r) {
		return sqlSession.insert("review.insertReview",r);
	}
}
