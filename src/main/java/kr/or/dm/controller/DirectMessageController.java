package kr.or.dm.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.or.dm.model.service.DirectMessageService;
import kr.or.dm.model.vo.DirectMessage;

import kr.or.manager.model.vo.Manager;
import kr.or.member.model.vo.Member;

@Controller
public class DirectMessageController {
	@Autowired
	private DirectMessageService service;
	
	//관리자 - 1:1문의 리스트
	@ResponseBody
	@RequestMapping (value="/myDmList.do", produces="application/json;charset=utf-8")
	public String myDmList(@SessionAttribute Manager g, DirectMessage dm) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dm", dm);
		map.put("adminId", g.getAdminId());
		ArrayList<DirectMessage> list = service.myDmList(map);
		return new Gson().toJson(list);
	}
	
//관리자 -  dm.js에 모달 띄워줄때 아이디를 준 회원정보조회, 내용조회
@ResponseBody
@RequestMapping(value="/detailMember.do", produces="application/json;charset=utf-8")
public String detailMember(String sender, int dmNo) {
	HashMap<String, Object> m  = service.selectOneMember(sender, dmNo);
	return new Gson().toJson(m);
	}

 //관리자 -  총 카운트 
	@ResponseBody
	@RequestMapping(value="/dmCount.do", produces="application/json;charset=utf-8")
	public int dmCount(@SessionAttribute Manager g) {
		int result = service.dmCount(g);
		return result;
		
	}
	// 관리자 -  답변대기 카운트 
	@ResponseBody
	@RequestMapping(value="/dmReadCount.do",produces="application/json;charset=utf-8")
	public int dmReadCount(@SessionAttribute Manager g) {
		int result = service.dmReadCount(g);
		return result;
	}
	
	//관리자 - 답변완료 카운트 
	@ResponseBody
	@RequestMapping(value="/dmCheckRead.do",produces="application/json;charset=utf-8")
	public int dmCheckRead() {
		int result = service.dmCheckRead();
		return result;
	}
	//관리자 - 답장하기
	@ResponseBody
	@RequestMapping(value="/insertDm.do",produces="application/json;charset=utf-8")
	public String insertDm(DirectMessage dm){
		int result = service.insertDm(dm);
		if(result>0) {
			//답변 성공시 -> dm.js (dmsend()에  data가 1로 들어감)
			return "1";
		}else {
			return "0";
		}
	}
	//관리자 P 1;1 검색 
	@ResponseBody
	@RequestMapping(value="/selectdmType.do",produces="application/json;charset=utf-8")
	public String selectdmType(int dmType, String keyword, Model model) {
		System.out.println(dmType);
		System.out.println(keyword);
		ArrayList<DirectMessage> list = service.selectdmType(dmType,keyword);
		model.addAttribute("list",list);
		return new Gson().toJson(list);
	}
}
	

