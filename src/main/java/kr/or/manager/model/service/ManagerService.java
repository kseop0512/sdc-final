package kr.or.manager.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.manager.model.dao.ManagerDao;
import kr.or.manager.model.vo.Manager;
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
	
	
}
