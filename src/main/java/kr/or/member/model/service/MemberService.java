package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public int selectOneMemberId(String memberId) {
		return dao.selectOneMemberId(memberId);
	}
	

	@Transactional
	public int insertMember(Member m) {
		return dao.insertMember(m);
	}
	
	//유저용 로그인 화면
	public Member selectOneMember(Member member) {
		Member m = dao.selectOneMember(member);
		return m;
	}
	
	@Transactional
	public Member updateMember(Member m) {
		int result = dao.updateMember(m);
		if(result>0) {
			Member updateM = dao.selectOneMember(m);
			return updateM;
		}else {
			return null;
		}
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
