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
import kr.or.partner.model.vo.Partner;

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
	public String detailMember(String sender, String dmNo) {
		HashMap<String, Object> m  = service.selectOneMember(sender, dmNo);
		return new Gson().toJson(m);
		}


 // 총 카운트 
	@ResponseBody
	@RequestMapping(value="/dmCount.do", produces="application/json;charset=utf-8")
	public int dmCount(@SessionAttribute Manager g) {
		int result = service.dmCount(g);
		return result;
		
	}
	//답변대기 카운트 
	@ResponseBody
	@RequestMapping(value="/dmReadCount.do",produces="application/json;charset=utf-8")
	public int dmReadCount(@SessionAttribute Manager g) {
		int result = service.dmReadCount(g);
		return result;
	}
	
	//답변완료 카운트 
	@ResponseBody
	@RequestMapping(value="/dmCheckRead.do",produces="application/json;charset=utf-8")
	public int dmCheckRead() {
		int result = service.dmCheckRead();
		return result;
	}
	
	//답장하기
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
	
	//유저 받은메시지 조회
	@ResponseBody
	@RequestMapping(value = "/getMemberRDm.do", produces = "application/json;charset=utf-8")
	public String getMemberRdm(String memberId) {
		ArrayList<DirectMessage> list = service.selectMemberReceiveDm(memberId);
		return new Gson().toJson(list);
	}

	//유저 보낸메시지 조회
	@ResponseBody
	@RequestMapping(value = "/getMemberSDm.do", produces = "application/json;charset=utf-8")
	public String getMemberSdm(String memberId) {
		ArrayList<DirectMessage> list = service.selectMemberSendDm(memberId);
		return new Gson().toJson(list);
	}

	//이름 표시를 위해 파트너 정보 불러오기
	@ResponseBody
	@RequestMapping(value="/selectDmPartner.do",produces="application/json;charset=utf-8")
	public String selectDmPartner(String pId) {
		Partner p = service.selectDmPartner(pId);
		return new Gson().toJson(p);
	}
	
	//유저 받은메시지 읽음처리
	@ResponseBody
	@RequestMapping(value = "/updateMemberReadCheck.do")
	public int updateMemberReadCheck(String dmNo) {
		int result = service.updateMemberReadCheck(dmNo);
		return result;
	}
	
	//유저 받은메시지에 답장
	@RequestMapping(value = "/insertMemberDm.do")
	public String insertMemberDm(DirectMessage dm, Model model) {
		int result = service.insertDm(dm);
		if(result>0) {
			model.addAttribute("title","메시지 전송 완료");
			model.addAttribute("msg","입력하신 내용으로 메시지를 전송했습니다.");
			model.addAttribute("icon","success");
		}else {
			model.addAttribute("title","메시지 전송 실패");
			model.addAttribute("msg","메시지가 성공적으로 전송되지 않았습니다.");
			model.addAttribute("icon","error");
		}
		model.addAttribute("loc","/mypageMessage.do");
		return "common/msg";
	}
	
	//1:1문의 삭제
	@ResponseBody
	@RequestMapping(value="/deleteDm.do")
	public String deleteDm(String dmNo) {
		int result = service.deleteDm(dmNo);
		String resultMsg;
		if(result>0) {
			resultMsg = "success";
		}else {
			resultMsg = "fail";
		}
		return resultMsg;
	}
	//관리자 P 1;1 검색 
	@ResponseBody
	@RequestMapping(value="/selectdmType.do",produces="application/json;charset=utf-8")
	public String selectdmType(int dmType, String keyword) {
		System.out.println(dmType);
		System.out.println(keyword);
		ArrayList<DirectMessage> list = service.selectdmType(dmType,keyword);
		return new Gson().toJson(list);
	}
	//관리자 - member만 
	@ResponseBody
	@RequestMapping(value="/getMemberDmList.do",produces="application/json;charset=utf-8")
	public String getMemberDmList(@SessionAttribute Manager g, DirectMessage dm) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dm", dm);
		map.put("adminId", g.getAdminId());
		ArrayList<DirectMessage> list = service.getMemberDmList(map);
		return new Gson().toJson(list);
	}
	//관리자 - partner만 
	@ResponseBody
	@RequestMapping(value="/getPartnerDmList.do",produces="application/json;charset=utf-8")
	public String getPartnerDmList(@SessionAttribute Manager g, DirectMessage dm) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dm", dm);
		map.put("adminId", g.getAdminId());
		ArrayList<DirectMessage> list = service.getPartnerDmList(map);
		return new Gson().toJson(list);
	}
	
	// 혜규 on 11/14
	@RequestMapping(value="/insertPartnerDm.do")
	public String insertPartnerDm(DirectMessage dm, String tBoardNo, Model model) {
		int result = service.insertPartnerDm(dm);
		if(result>0) {
			model.addAttribute("title","문의하기 완료");
			model.addAttribute("msg","문의하기 메시지가 전달되었습니다.");
			model.addAttribute("icon","success");
		}else {
			model.addAttribute("title","문의하기 실패 ㅠㅠ");
			model.addAttribute("msg","다시 시도해보세요!");
			model.addAttribute("icon","error");
		}
		model.addAttribute("redirect:/oneTrainer.do?tBoardNo="+tBoardNo);
		return "common/msg";
	}
	// end 혜규 on 11/14
}