package kr.or.partner.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}