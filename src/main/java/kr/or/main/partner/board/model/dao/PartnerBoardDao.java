package kr.or.main.partner.board.model.dao;

import kr.or.main.partner.board.model.vo.PartnerBoard;
import kr.or.main.partner.board.model.vo.PartnerBoardFileVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class PartnerBoardDao {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int[] insertPartnerBoard(PartnerBoard pb) {
        int result = sqlSession.insert("partnerBoard.insertPartnerBoard", pb);
        int[] resultArr = new int[2];
        resultArr[0] = result;
        resultArr[1] = pb.getPetsitterBoardNo();
        return resultArr;
    }

    public int insertPartnerBoardOption(HashMap<String, Object> map) {
        return sqlSession.insert("partnerBoard.insertPartnerBoardOption", map);
    }

    public int insertPartnerBoardFile(PartnerBoardFileVO pbf) {
        return sqlSession.insert("partnerBoard.insertPartnerBoardFile", pbf);
    }

    public List<Map<String, Object>> selectPetSitterBoardList(HashMap<String, Object> param) {
        List<Map<String, Object>> list = sqlSession.selectList("partnerBoard.selectPetSitterBoardList", param);
        return list;
    }

    public int selectPetSitterBoardListCount(HashMap<String, Object> param) {
        return sqlSession.selectOne("partnerBoard.selectPetSitterBoardCount", param);
    }

    public Map<String, Object> selectPetSitterBoard(HashMap<String, Object> param) {
        return sqlSession.selectOne("partnerBoard.selectPetSitterBoard", param);
    }
}
