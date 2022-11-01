package kr.or.main.partner.model.dao;

import kr.or.partner.model.vo.Partner;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PartnerMainDao {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int insertPartner(Partner p) {

        int result = sqlSession.insert("partner.insertPartner", p);

        return result;
    }
}
