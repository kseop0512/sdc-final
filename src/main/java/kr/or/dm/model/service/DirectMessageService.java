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
	//회원 한명 조회 , 답변조회
	public HashMap<String, Object> selectOneMember(String sender,int dmNo) {
		Member m = dao.selectOneMember(sender);
		DirectMessage dm = dao.selectReply(dmNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m", m);
		map.put("dm",dm);
		return map;
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
	//답장하기 
	@Transactional
	public int insertDm(DirectMessage dm) {
		int result = dao.insertDm(dm);
		if (dm.getReadCheck() == 0) {
			dao.updateReadCheck(dm.getReply()); //답장한 메세지번호
		}
		return result;
	}
	
	// dm 검색하기 

	public ArrayList<DirectMessage> selectdmType(int dmType, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dmType", dmType);
		map.put("keyword", keyword);
		return dao.selectdmType(map);
	}
	
	
}
