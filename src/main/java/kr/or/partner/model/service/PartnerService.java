package kr.or.partner.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.vo.Member;
import kr.or.partner.model.dao.PartnerDao;
import kr.or.partner.model.vo.Partner;
import kr.or.partner.model.vo.PartnerFileVO;
import kr.or.partner.model.vo.TrainerBoard;
import kr.or.pet.model.vo.Pet;

@Service
public class PartnerService {
	@Autowired
	private PartnerDao dao;

	public Partner selectOnePartNer(Partner p) {
		// TODO Auto-generated method stub
		return dao.selectOnePartNer(p);
	}
	@Transactional
	public int changePwPartNer(Partner p) {
		// TODO Auto-generated method stub
		return dao.changePwPartNer(p);
	}
	@Transactional
	public int updateProfile(Partner p) {
		// TODO Auto-generated method stub
		return dao.updateProfile(p);
	}
	@Transactional
	public int uploadTrainerBoard(TrainerBoard tb) {
		// TODO Auto-generated method stub
		int result = dao.uploadTrainerBoard(tb);
		if(result>0) {
			if(!tb.getFileList().isEmpty()) {
				for(PartnerFileVO fv : tb.getFileList()) {
					fv.setTBoardNo(tb.getTBoardNo());
					result += dao.insertPartnerFiles(fv);
				}
			}
		}
		return result;
	}

	public ArrayList<TrainerBoard> selectAllBoard() {
		// TODO Auto-generated method stub
		
		ArrayList<TrainerBoard> boardList = dao.selectAllBoard();
		for(int i=0; i<boardList.size();i++) {
			String tBoardNo = boardList.get(i).getTBoardNo();
			ArrayList<PartnerFileVO> list = dao.selectFileList(tBoardNo);
			boardList.get(i).setFileList(list);
		}
		return boardList;
	}

	public TrainerBoard selectOneTrainerBoard(String tBoardNo) {
		// TODO Auto-generated method stub
		TrainerBoard tb = dao.selectOneTrainerBoard(tBoardNo);
		ArrayList<PartnerFileVO> files = dao.selectFileList(tBoardNo);
		tb.setFileList(files);
		return tb;
	}

	public Partner selectOnePartner(String pNo) {
		// TODO Auto-generated method stub
		return dao.selectOnePartner(pNo);
	}


	public ArrayList<Pet> selectAllPets(Member m) {
		// TODO Auto-generated method stub
		return dao.selectAllPets(m);
	}
	public void updateTrainerImg(Partner p) {
		// TODO Auto-generated method stub
		dao.updateTrainerImg(p);
	}


	
	public Partner selectOnepartner(Partner partner) {
		Partner p = dao.selectOnepartner(partner);
		return p;
	}
	public Partner findIdPartner(Partner partner) {
		return dao.findIdPartner(partner);

	}

	public Partner selectOnePartnerEnc(Partner partner) {
		return dao.selectOnePartner(partner);
	}

	public int updatePwEncPartNer(Partner p) {
		return dao.updatePwPartNer(p);
	}
	
	//유저 마이페이지 - 이용내역 - 파트너이름 출력
	public String selectPartnerName(String pNo) {
		return dao.selectPartnerName(pNo);
	}

}
