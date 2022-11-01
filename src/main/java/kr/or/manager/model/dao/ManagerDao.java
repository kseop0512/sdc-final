package kr.or.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.manager.model.vo.Manager;

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
	
	
}
