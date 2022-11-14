package kr.or.partner.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.partner.model.vo.Partner;
import kr.or.partner.model.vo.PartnerFileVO;
import kr.or.partner.model.vo.TrainerBoard;
import kr.or.pet.model.vo.Pet;

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

	public ArrayList<PartnerFileVO> selectFileList(String tBoardNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("partner.selectFileList",tBoardNo);
		return (ArrayList<PartnerFileVO>)list;
	}

	public TrainerBoard selectOneTrainerBoard(String tBoardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.selectOneTrainerBoard",tBoardNo);
	}

	public Partner selectOnePartner(String pNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("partner.selectOne",pNo);
	}


	public ArrayList<Pet> selectAllPets(Member m) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("pet.selectAllPets",m);
		return (ArrayList<Pet>)list;
	}

	public void updateTrainerImg(Partner p) {
		// TODO Auto-generated method stub
		sqlSession.update("partner.updateTrainerImg",p);
	}



	
	public Partner selectOnepartner(Partner partner) {
		Partner p = sqlSession.selectOne("partner.selectOnepartner",partner);
		System.out.println("파트너 로그인완료");
		System.out.println(partner.getPEmail());
		return p;
	}
	public Partner findIdPartner(Partner partner) {
		return sqlSession.selectOne("partner.findIdPartner",partner);

	}

	public Partner selectOnePartner(Partner partner) {
		return sqlSession.selectOne("partner.selectOnePartner",partner);
	}

	public int updatePwPartNer(Partner p) {
		return sqlSession.update("partner.updatePwP",p);
	}

	public String selectPartnerName(String pNo) {
		return sqlSession.selectOne("partner.selectPartnerName",pNo);
	}

}
