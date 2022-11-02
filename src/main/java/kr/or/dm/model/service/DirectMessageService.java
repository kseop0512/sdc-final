package kr.or.dm.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dm.model.dao.DirectMessageDao;
import kr.or.dm.model.vo.DirectMessage;

@Service
public class DirectMessageService {
	@Autowired
	private DirectMessageDao dao;

	//보낸쪽지 조회
	public ArrayList<DirectMessage> myDmList(DirectMessage dm) {		
		return dao.selectDmList(dm);
	}
	
	
	
	
}
