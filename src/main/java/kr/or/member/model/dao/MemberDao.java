package kr.or.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectOneMemberId(String memberId) {
		return sqlSession.selectOne("member.selectOneMemberId", memberId);
	}


	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember", m);

	}
	
	//유저용 로그인
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		System.out.println("로그인완료");
		System.out.println(m.getMemberId());
		return m;
	}

	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember",m);
	}

	//관리자 P 유저 수 
	public int selectUserList() {
		int result = sqlSession.selectOne("member.selectUserList");
		return result;
	}
	//관리자 P 파트너 수 
	public int selectPartnerCount() {
		int result = sqlSession.selectOne("partner.selectPartner");
		return result;
	}
	//관리자 P 총 인원
	public int selectTotalMember() {
		int result = sqlSession.selectOne("member.selectTotal");
		return result;
	}

}
