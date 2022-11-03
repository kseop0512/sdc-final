package kr.or.dm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.dm.model.service.DirectMessageService;
import kr.or.dm.model.vo.DirectMessage;
import kr.or.member.model.vo.Member;

@Controller
public class DirectMessageController {
	@Autowired
	private DirectMessageService service;
	
	@ResponseBody
	@RequestMapping (value="/myDmList.do", produces="application/json;charset=utf-8")
	public String myDmList(DirectMessage dm) {
		ArrayList<DirectMessage> list = service.myDmList(dm);
		return new Gson().toJson(list);
	}
//dm.js에 모달 띄워줄때 아이디를 준 회원정보조회	
@ResponseBody
@RequestMapping(value="/detailMember.do", produces="application/json;charset=utf-8")
public String detailMember(String sender) {
	Member m  = service.selectOneMember(sender);
	return new Gson().toJson(m);
	}
	

	
}
