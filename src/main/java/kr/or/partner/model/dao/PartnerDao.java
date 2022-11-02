package kr.or.partner.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.partner.model.vo.Partner;
import kr.or.partner.model.vo.PartnerFileVO;
import kr.or.partner.model.vo.TrainerBoard;

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

	public int updateProfile(Partner p) {
		// TODO Auto-generated method stub
		return sqlSession.update("partner.updateProfile",p);
	}

	public int uploadTrainerBoard(TrainerBoard tb) {
		// TODO Auto-generated method stub
		return sqlSession.insert("partner.uploadTrainerBoard",tb);
	}

	public int insertPartnerFiles(PartnerFileVO pfv) {
		// TODO Auto-generated method stub
		return sqlSession.insert("partner.insertPartnerFiles",pfv);
	}

	public ArrayList<TrainerBoard> selectAllBoard() {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("partner.selectAllBoard");
		return (ArrayList<TrainerBoard>)list;
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
