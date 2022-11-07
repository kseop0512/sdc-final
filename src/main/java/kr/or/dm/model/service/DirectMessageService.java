package kr.or.dm.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dm.model.dao.DirectMessageDao;
import kr.or.dm.model.vo.DirectMessage;
import kr.or.manager.model.vo.Manager;
import kr.or.member.model.vo.Member;

@Service
public class DirectMessageService {
	@Autowired
	private DirectMessageDao dao;

	//보낸쪽지 조회
	public ArrayList<DirectMessage> myDmList(HashMap<String, Object> map) {		
		return dao.selectDmList(map);
	}
	//회원 한명 조회
	public Member selectOneMember(String sender) {
		return dao.selectOneMember(sender);
	}
	
	//dm 총 갯수 
	public int dmCount(Manager g) {
		return dao.dmCount(g);
	}
	//답변대기 카운트
	public int dmReadCount(Manager g) {
		return dao.dmReadCount(g);
	}
	//답변완료 카운트
	public int dmCheckRead() {
		// TODO Auto-generated method stub
		return dao.dmCheckRead();
	}
	// 답장하기 
	@Transactional
	public int insertDm(DirectMessage dm) {
		int result = dao.insertDm(dm);
		if (dm.getReadCheck() == 0) {
			dao.updateReadCheck(dm.getReply());
		}
		return result;
	}



	
}
