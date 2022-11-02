package kr.or.main.partner.model.service;

import kr.or.main.partner.model.dao.PartnerMainDao;
import kr.or.partner.model.vo.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PartnerMainService {
    @Autowired
    private PartnerMainDao dao;

    @Transactional
    public int insertPartner(Partner p) {
        //System.out.println(p.getPPw());
        return dao.insertPartner(p);
    }
}
