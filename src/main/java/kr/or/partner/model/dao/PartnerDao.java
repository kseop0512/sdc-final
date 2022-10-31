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

	public int changePwPartNer(Partner p) {
		// TODO Auto-generated method stub
		return sqlSession.update("partner.changePw",p);
	}
	
	/*
	public Partner selectOnepartner(Partner partner) {
		Partner p = sqlSession.selectOne("partner.selectOnepartner",partner);
		System.out.println("파트너 로그인완료");
		System.out.println(partner.getPEmail());
		return p;
	}
	*/
}
