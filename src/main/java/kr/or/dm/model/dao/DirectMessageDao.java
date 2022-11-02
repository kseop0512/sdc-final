package kr.or.dm.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.dm.model.vo.DirectMessage;

@Repository
public class DirectMessageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//보낸쪽지 조회
	public ArrayList<DirectMessage> selectDmList(DirectMessage dm) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("dm.selectMyDm",dm);
		return null;
	}
	
	
	
}
