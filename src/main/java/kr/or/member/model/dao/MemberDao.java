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
	
	
	//유저용 로그인
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		System.out.println("로그인완료");
		return m;
	}
}
