package kr.or.partner.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.partner.model.dao.PartnerDao;
import kr.or.partner.model.vo.Partner;
import kr.or.partner.model.vo.PartnerFileVO;
import kr.or.partner.model.vo.TrainerBoard;

@Service
public class PartnerService {
	@Autowired
	private PartnerDao dao;

	public Partner selectOnePartNer(Partner p) {
		// TODO Auto-generated method stub
		return dao.selectOnePartNer(p);
	}

	public int changePwPartNer(Partner p) {
		// TODO Auto-generated method stub
		return dao.changePwPartNer(p);
	}
	@Transactional
	public int updateProfile(Partner p) {
		// TODO Auto-generated method stub
		return dao.updateProfile(p);
	}

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
		return dao.selectAllBoard();
	}


	/*
	public Partner selectOnepartner(Partner partner) {
		Partner p = dao.selectOnepartner(partner);
		return p;
	}
	*/

}
