package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.List;

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
		return m;
	}

	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember",m);
	}



}
