package kr.or.dm.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dm.model.dao.DirectMessageDao;
import kr.or.dm.model.vo.DirectMessage;
import kr.or.member.model.vo.Member;

@Service
public class DirectMessageService {
	@Autowired
	private DirectMessageDao dao;

	//보낸쪽지 조회
	public ArrayList<DirectMessage> myDmList(DirectMessage dm) {		
		return dao.selectDmList(dm);
	}
	//회원 한명 조회
	public Member selectOneMember(String sender) {
		return dao.selectOneMember(sender);
	}
	
	//dm.js에 모달 띄워줄때 아이디를 준 회원정보조회	
	public DirectMessage dmDetail(int dmNo) {
		return dao.dmDetail(dmNo);
	}
	//dm 총 갯수 
	public int dmCount() {
		return dao.dmCount();
	}



	
	
}
