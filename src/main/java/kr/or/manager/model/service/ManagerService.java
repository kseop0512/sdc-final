package kr.or.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.manager.model.dao.ManagerDao;
import kr.or.manager.model.vo.Manager;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;
	
	//관리자용 로그인
	public Manager selectOneManager(Manager manager) {
		Manager g = dao.selectOneManager(manager);
		return g;
	}
	
	
}
