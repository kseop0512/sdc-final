package kr.or.partner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.partner.model.vo.Partner;

@Repository
public class PartnerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Partner selectOnePartNer(Partner p) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.selectOnePartner",p);
	}
}
