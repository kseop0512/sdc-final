package kr.or.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="memberJoinSuccess.do")
	public String memberJoinSuccess() {
		return "member/memberJoinSuccess";
	}
	
	@RequestMapping(value="memberJoinChkFrm.do")
	public String memberJoinChkFrm() {
		return "member/memberJoinChkFrm";
	}
	
	@RequestMapping(value="memberJoinFrm.do")
	public String memberJoinFrm() {
		return "member/memberJoinFrm";
	}
	
	@RequestMapping(value="memberJoin.do")
	public String memberJoin(Member m) {
		int result = service.insertMember(m);
		return "member/memberJoinSuccess";
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxCheckMemberId.do")
	public int ajaxCheckMemberId(String memberId) {
		int result = service.selectOneMemberId(memberId);
		return result;
	}
	
	@RequestMapping(value="/memberMypage.do")
	public String memberMypage() {
		return "member/memberMypage";
	}
	/*
	@RequestMapping(value="/memberUpdate.do")
	public String memberUpdate(Member m, Model model) {
		int result = service.updateMember(m);
		if(result>0) {
			model.addAttribute("title","정보수정 완료");
			model.addAttribute("msg","입력하신 정보로 수정을 완료했습니다.");
			model.addAttribute("icon","success");
			model.addAttribute("loc","/memberMypage.do");
		}else {
			model.addAttribute("title","정보수정 실패");
			model.addAttribute("msg","정보수정 중 오류가 발생했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/memberMypage.do");
		}
		return "common/msg";
	}
	*/
}
