package kr.or.dm.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.dm.model.vo.DirectMessage;
import kr.or.member.model.vo.Member;

@Repository
public class DirectMessageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//보낸쪽지 조회
	public ArrayList<DirectMessage> selectDmList(DirectMessage dm) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("dm.selectMyDm",dm);
		return (ArrayList<DirectMessage>) list;
	}
//회원 한명 조회
	public Member selectOneMember(String sender) {
		System.out.println(sender);
		Member m = sqlSession.selectOne("manager.memberOne",sender);
		return m;
	}
	
	//dm 조회
	public DirectMessage dmDetail(int dmNo) {
		DirectMessage dm = sqlSession.selectOne("dm.dmDetail",dmNo);
		return dm;
	}
	//dm 총 수 
	public int dmCount() {
		int result = sqlSession.selectOne("dm.dmCount");
		return result;
	}


	
	
}
