package kr.or.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.memberService;

@Controller
public class MemberController {
	@Autowired
	private memberService service;
	
	@RequestMapping(value="memberJoinSuccess.do")
	public String memberJoinSuccess() {
		return "member/memberJoinSuccess";
	}
	
	@RequestMapping(value="memberJoinChkFrm.do")
	public String memberJoinFrm() {
		return "member/memberJoinChkFrm";
	}
	
	@RequestMapping(value="memberJoinFrm.do")
	public String memberJoin() {
		return "member/memberJoinFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxCheckMemberId.do")
	public int ajaxCheckMemberId(String memberId) {
		int result = service.selectOneMemberId(memberId);
		return result;
	}
}
