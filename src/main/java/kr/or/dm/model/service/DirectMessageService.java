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
import kr.or.partner.model.vo.Partner;

@Service
public class DirectMessageService {
	@Autowired
	private DirectMessageDao dao;

	//보낸쪽지 조회
	public ArrayList<DirectMessage> myDmList(HashMap<String, Object> map) {		
		return dao.selectDmList(map);
	}
	
	//회원 한명 조회, 답변조회
	public HashMap<String, Object> selectOneMember(String sender,int dmNo) {
		Member m = dao.selectOneMember(sender);
		Partner p = dao.selectOnepMember(sender);
		DirectMessage dm = dao.selectReply(dmNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m", m);
		map.put("p",p);
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
	
	// 답장하기 
	@Transactional
	public int insertDm(DirectMessage dm) {
		int result = dao.insertDm(dm);
		if (dm.getReadCheck() == 0) {
			dao.updateReadCheck(dm.getReply());
		}
		return result;
	}
	
	//유저 받은메시지 조회
	public ArrayList<DirectMessage> selectMemberReceiveDm(String memberId) {
		return dao.selectMemberReceiveDm(memberId);
	}
	
	//유저 보낸메시지 조회
	public ArrayList<DirectMessage> selectMemberSendDm(String memberId) {
		return dao.selectMemberSendDm(memberId);
	}

	//메시지 상세조회 시 읽음 상태로 변경
	@Transactional
	public int updateMemberReadCheck(int dmNo) {
		return dao.updateMemberReadCheck(dmNo);
	}
	
	//이름 표시를 위해 파트너 정보 불러오기
	public Partner selectDmPartner(String pId) {
		return dao.selectDmPartner(pId);
	}
	
	//선택 메시지 삭제
	@Transactional
	public int deleteDm(int dmNo) {
		return dao.deleteDm(dmNo);
	}

	// dm 검색하기 
	public ArrayList<DirectMessage> selectdmType(int dmType, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dmType", dmType);
		map.put("keyword", keyword);
		return dao.selectdmType(map);
	}
//관리자 - Member만 
	public ArrayList<DirectMessage> getMemberDmList(HashMap<String, Object> map) {
		
		return dao.selectMemberDmList(map);
	}

	public ArrayList<DirectMessage> getPartnerDmList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectpartnerDmList(map);
	}

	public int insertPartnerDm(DirectMessage dm) {
		// TODO Auto-generated method stub
		return dao.insertPartnerDm(dm);
	}
	

}
