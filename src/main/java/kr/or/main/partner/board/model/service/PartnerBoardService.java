package kr.or.main.partner.board.model.service;

import kr.or.main.partner.board.model.dao.PartnerBoardDao;
import kr.or.main.partner.board.model.vo.PartnerBoard;
import kr.or.main.partner.board.model.vo.PartnerBoardFileVO;
import kr.or.main.partner.board.model.vo.PartnerBoardOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class PartnerBoardService {
    @Autowired
    private PartnerBoardDao dao;

    @Transactional
    public int[] insertPartnerBoard(PartnerBoard pb, PartnerBoardOption pbo, ArrayList<PartnerBoardFileVO> list) {
        int[] result = dao.insertPartnerBoard(pb);
        if(result[0] > 0) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("petsitterBoardNo", result[1]);
            map.put("pbo", pbo);
            result[0] += dao.insertPartnerBoardOption(map);
            if(result[0] > 1 && !list.isEmpty()) {
                for(PartnerBoardFileVO partnerBoardFileVo : list) {
                    partnerBoardFileVo.setPetsitterBoardNo(result[1]);
                    result[0] += dao.inesrtPartnerBoardFile(partnerBoardFileVo);
                }
            }
        }
        return result;
    }

}
