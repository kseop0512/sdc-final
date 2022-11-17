package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.booking.model.vo.Booking;
import kr.or.dm.model.vo.DirectMessage;
import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectOneMemberId(String memberId) {
		return sqlSession.selectOne("member.selectOneMemberId", memberId);
	}

	//유저 회원가입
	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember", m);

	}
	
	//유저용 로그인
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		System.out.println("로그인완료");
		return m;
	}
	
	//유저 정보수정
	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember",m);
	}


	public ArrayList<Booking> selectBookingList(Member m) {
		List list = sqlSession.selectList("booking.selectBookingList", m);
		return (ArrayList<Booking>) list;
	}


	public Member searchId(String memberId) {
		return sqlSession.selectOne("member.kakaoSearchId", memberId);
	}

	/* 아이디 찾기 */
	public Member findIdUser(Member member) {
		return sqlSession.selectOne("member.findIdUser",member);
	}


	public int updatePwMember(Member m) {
		return sqlSession.update("member.updatePw", m);
	}
	
	/*
	public int insertKakao(Member m) {
		System.out.println(m);
		return sqlSession.insert("member.insertKakao", m);
	}
*/

}
