package kr.or.main.partner.model.service;

import kr.or.main.partner.model.dao.PartnerMainDao;
import kr.or.partner.model.vo.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnerMainService {
    @Autowired
    private PartnerMainDao dao;

    public int insertPartner(Partner p) {

        return dao.insertPartner(p);
    }
}
