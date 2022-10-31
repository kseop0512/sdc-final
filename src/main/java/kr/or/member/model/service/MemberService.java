package kr.or.member.model.service;

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

	public int insertMember(Member m) {
		return dao.insertMember(m);
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
}
