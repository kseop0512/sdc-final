package kr.or.dm.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.dm.model.vo.DirectMessage;
import kr.or.manager.model.vo.Manager;
import kr.or.member.model.vo.Member;
import kr.or.partner.model.vo.Partner;

@Repository
public class DirectMessageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//보낸쪽지 조회
	public ArrayList<DirectMessage> selectDmList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("dm.selectMyDm",map);
		return (ArrayList<DirectMessage>) list;
	}
//회원 한명 조회
	public Member selectOneMember(String sender) {
		System.out.println(sender);
		Member m = sqlSession.selectOne("manager.memberOne",sender);
		return m;
	}
	
	public Partner selectOnepMember(String sender) {
		Partner p = sqlSession.selectOne("manager.partnerOne",sender);
		return p;
	}
	
	
	//dm 총 수 
	public int dmCount(Manager g) {
		int result = sqlSession.selectOne("dm.dmCount",g);
		return result;
	}
	//dm 답변대기 수
	public int dmReadCount(Manager g) {
		int result = sqlSession.selectOne("dm.dmReadCount",g);
		return result;
	}
	//dm 답변완료 카운트
	public int dmCheckRead() {
		int result = sqlSession.selectOne("dm.dmCheckRead");
		return result;
	}
	//답장하기
	public int insertDm(DirectMessage dm) {
		return sqlSession.insert("dm.insertDm",dm);
	}
	//답장한 read_Check 변경하기 
	public int updateReadCheck(int reply) {
		 return sqlSession.update("dm.updateReadCheck", reply);
	}
	
	//유저 받은메시지 조회
	public ArrayList<DirectMessage> selectMemberReceiveDm(String memberId) {
		List rdm = sqlSession.selectList("dm.selectMemberReceiveDm",memberId);
		return (ArrayList<DirectMessage>) rdm;
	}

	//유저 보낸메시지 조회
	public ArrayList<DirectMessage> selectMemberSendDm(String memberId) {
		List sdm = sqlSession.selectList("dm.selectMemberSendDm",memberId);
		return (ArrayList<DirectMessage>) sdm;
	}

	//메시지 상세조회 시 읽음 상태로 변경
	public int updateMemberReadCheck(int dmNo) {
		return sqlSession.update("dm.updateMemberReadCheck",dmNo);
	}
	
	//파트너 정보 불러오기
	public Partner selectDmPartner(String pId) {
		return sqlSession.selectOne("dm.selectDmPartner", pId);
	}
	
	//메시지 삭제
	public int deleteDm(int dmNo) {
		return sqlSession.delete("dm.deleteDm",dmNo);
	}


	//답변보여주기 
	public DirectMessage selectReply(int dmNo) {
		return sqlSession.selectOne("dm.showDmContent",dmNo);
	}
	//관리자P dm 결제/취소 검색
	public ArrayList<DirectMessage> selectdmType(HashMap<String, Object> map) {
		List list = sqlSession.selectList("dm.selectdmType",map);
		return (ArrayList<DirectMessage>)list;
	}
	//관리자 Member만 조회 
	public ArrayList<DirectMessage> selectMemberDmList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("dm.selectMemberDmList",map);
		return (ArrayList<DirectMessage>) list;
	}
	//관리자 partner만조회
	public ArrayList<DirectMessage> selectpartnerDmList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("dm.selectPartnerDmList",map);
		return (ArrayList<DirectMessage>) list;
	}
	public int insertPartnerDm(DirectMessage dm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("dm.insertPartnerDm",dm);
	}
	


}
