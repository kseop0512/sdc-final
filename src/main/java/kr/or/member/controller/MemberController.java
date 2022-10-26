package kr.or.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.memberService;

@Controller
public class MemberController {
	@Autowired
	private memberService service;
	
	@RequestMapping(value="memberJoinSuccess.do")
	public String memberJoinSuccess() {
		return "member/memberJoinSuccess";
	}
	
	@RequestMapping(value="memberJoinFrm.do")
	public String memberJoinFrm() {
		return "member/memberJoinFrm";
	}
	
	@RequestMapping(value="memberJoin.do")
	public String memberJoin() {
		return "member/memberJoin";
	}
}
