package kr.or.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.manager.model.vo.Manager;
import kr.or.member.model.vo.Member;
import kr.or.partner.model.vo.Partner;

@Repository
public class ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//관리자용 로그인
	public Manager selectOneManager(Manager manager) {
		Manager g = sqlSession.selectOne("manager.selectOneManager",manager);
		System.out.println("관리자 로그인완료");
		System.out.println(manager.getAdminId());
		System.out.println(g.getAdminId());
		return g;
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
	   //관리자p 회원리스트
	   public ArrayList<Member> selectMemberPartnerList(Member m) {
	      List list = sqlSession.selectList("member.selectMemberPartnerList",m);
	      return (ArrayList<Member>)list;
	   }
//관리자P 유저관리 검색 - 이용자검색
	public ArrayList<Member> searchMember(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchMember",map);
		return (ArrayList<Member>) list;
	}
//관리자P 유저검색 - 파트너 검색
	public ArrayList<Member> serchPartner(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchPartner",map);
		return (ArrayList<Member>)list;
	}
}
