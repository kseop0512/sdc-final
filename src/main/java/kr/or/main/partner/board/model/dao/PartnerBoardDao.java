package kr.or.main.partner.board.model.dao;

import kr.or.main.partner.board.model.vo.PartnerBoard;
import kr.or.main.partner.board.model.vo.PartnerBoardFileVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class PartnerBoardDao {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int[] insertPartnerBoard(PartnerBoard pb) {
        int result = sqlSession.insert("insertPartnerBoard", pb);
        int[] resultArr = new int[2];
        resultArr[0] = result;
        resultArr[1] = pb.getPetsitterBoardNo();
        return resultArr;
    }

    public int insertPartnerBoardOption(HashMap<String, Object> map) {
        return sqlSession.insert("insertPartnerBoardOption", map);
    }

    public int inesrtPartnerBoardFile(PartnerBoardFileVO pbf) {
        return sqlSession.insert("insertPartnerBoardFile", pbf);
    }
}
