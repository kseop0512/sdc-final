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


	public Member findIdUser(Member member) {
		return dao.findIdUser(member);
	}


	public Member selectOneMemberEnc(Member member) {
		return dao.selectOneMember(member);
	}


	public int updatePwEncMember(Member m) {
		return dao.updatePwMember(m);
	}


	

	//카카오톡 존재하는 아이디 체크
	/*
	public Member searchId(String memberId) {
		Member m = dao.searchId(memberId);
	    return m;
	}
*/
	/*
	public int changePwMember(Member m) {
		return dao.changePwMember(m);
	}


	public Member searchPwUser(Member m) {
		return dao.searchPwUser(m);
	}
	*/
	
	
	
	
}
