package kr.or.partner.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.partner.model.dao.PartnerDao;
import kr.or.partner.model.vo.Partner;

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

	public int updateProfile(Partner p) {
		// TODO Auto-generated method stub
		return dao.updateProfile(p);
	}

	public ArrayList<Partner> selectTrainers() {
		// TODO Auto-generated method stub
		return dao.selectTrainers();
	}

	/*
	public Partner selectOnepartner(Partner partner) {
		Partner p = dao.selectOnepartner(partner);
		return p;
	}
	*/

}
