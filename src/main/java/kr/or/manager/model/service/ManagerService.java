package kr.or.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.manager.model.dao.ManagerDao;
import kr.or.manager.model.vo.FileVOG;
import kr.or.manager.model.vo.Manager;
import kr.or.manager.model.vo.NoticeG;
import kr.or.manager.model.vo.NoticeGPageData;
import kr.or.member.model.vo.Member;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;
	
	//관리자용 로그인
	public Manager selectOneManager(Manager manager) {
		Manager g = dao.selectOneManager(manager);
		return g;
	}
	
	//관리자 P 회원 수
	public int selectMemberList() {
			return dao.selectUserList();
	}
	//관리자 P 파트너 수 
	public int selectPartnerList() {
		return dao.selectPartnerCount() ;
	}
	// 관리자 P 총 인원
	public int selectTotalMember() {
		return dao.selectTotalMember();
	}
	//관리자p 회원리스트
	public ArrayList<Member> selectMemberPartnerList(Member m) {
		ArrayList<Member> list = dao.selectMemberPartnerList(m);
		return list;
	}
	
	//관리자 공지사항 리스트
	public NoticeGPageData selectAdminNotice(int reqPage) {
		int numPerPage = 10;
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<NoticeG> list = dao.selectAdminNotice(map);
		
		int totalCount = dao.selectNoticeGCount();
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage>3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/adminNotice.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/adminNotice.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/adminNotice.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		NoticeGPageData ngpd = new NoticeGPageData(list, pageNavi, reqPage, numPerPage, totalCount);
		return ngpd;
	}
	
	public NoticeG selectOneNoticeG(int noticeGNo) {
		NoticeG ng = dao.selectOneNoticeG(noticeGNo);
		return ng;
	}

	public int insertNoticeG(NoticeG ng) {
		int result = dao.insertNoticeG(ng);
		if(result>0) {
			for(FileVOG fvg : ng.getFileList()) {
				fvg.setNoticeGNo(ng.getNoticeGNo());
				result += dao.insertFile(fvg);
			}
		}
		return result;
	}

	public int deleteNotice(NoticeG noticeGNo) {
		return dao.deleteNotice(noticeGNo);
	}
	
	
	
	public void readGCountUpdate(int noticeGNo) {
		dao.readGCountUpdate(noticeGNo);
		
	}
	/*
	public int selectTotalNotice() {
		return dao.selectTotalNotice();
	}
	*/
	
	
}
