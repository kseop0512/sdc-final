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
import java.util.List;
import java.util.Map;

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
                    result[0] += dao.insertPartnerBoardFile(partnerBoardFileVo);
                }
            }
        }
        return result;
    }

    public List<Map<String, Object>> selectPetSitterBoardList(HashMap<String, Object> param) {

        if(param.get("reqPage") == null || param.get("reqPage") == "") {
            param.put("reqPage", 1);
        }
        int reqPage = Integer.parseInt(String.valueOf(param.get("reqPage")));
        if(param.get("start") == null || param.get("start") == "") {
            int numPerPage = 10;
            int end = numPerPage*reqPage;
            int start = end - numPerPage + 1;
            param.put("end", String.valueOf(end));
            param.put("start", String.valueOf(start));
        }

        List<Map<String, Object>> list = dao.selectPetSitterBoardList(param);

        return list;

    }

    public String getPageNavi(HashMap<String, Object> param) {
        if(param.get("reqPage") == null || param.get("reqPage") == "") {
            param.put("reqPage", 1);
        }
        int reqPage = Integer.parseInt(String.valueOf(param.get("reqPage")));
        int numPerPage = 10;
        int totalCount = dao.selectPetSitterBoardListCount(param);

        int totalPage = 0;
        if(totalCount%numPerPage == 0) {
            totalPage = totalCount/numPerPage;
        } else {
            totalPage = totalCount/numPerPage + 1;
        }

        int pageNaviSize = 5;
        int pageNo = 1;
        if(reqPage>3) {
            pageNo = reqPage - 2;
        }

        String pageNavi = "<ul class=\"justify-content-center\">";

        if(pageNo != 1) {
            pageNavi += "<li><a href='/petSitterBoardList.do?reqPage=" + (pageNo + 1) + "'>prev</a></li>";
        }

        for(int i=0;i<pageNaviSize;i++) {
            if(pageNo == reqPage) {
                pageNavi += "<li class=\"active\"><a href='/petSitterBoardList.do?reqPage=" + pageNo + "'>" + pageNo + "</a></li>";
            } else {
                pageNavi += "<li><a href='/petSitterBoardList.do?reqPage=" + pageNo + "'>" + pageNo + "</a></li>";
            }
            pageNo++;
            if(pageNo > totalPage) {
                break;
            }
        }


        if(pageNo <= totalPage) {
            pageNavi += "<li><a href='/petSitterBoardList.do?reqPage=" + pageNo + "'>next</a></li>";
        }
        pageNavi += "</ul>";

        return pageNavi;
    }

    public Map<String, Object> selectPetSitterBoard(HashMap<String, Object> param) {

        Map<String, Object> detailContent = dao.selectPetSitterBoard(param);

        return detailContent;
    }

    public ArrayList<Map<String, Object>> selectBoardReplyList(Object pNo) {
        return dao.selectBoardReplyList(pNo);
    }

    public ArrayList<Map<String, Object>> selectRsvList(Object pNo) {
        return dao.selectRsvList(pNo);
    }
}
