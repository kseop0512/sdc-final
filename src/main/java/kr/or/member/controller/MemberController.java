package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
	
	//로그인 폼 이동
	@RequestMapping(value="/loginUserFrm.do")
	public String loginUserFrm(){
		return "main/common/loginUser";
	}
	
	//유저 로그인 화면
	@RequestMapping(value="/loginUser.do")
	public String loginUser(Member member, HttpSession session) {
		Member m = service.selectOneMember(member);
		if(m!=null) {
			session.setAttribute("m", m);
		}
		return "redirect:/";
	}
	
	//유저 로그아웃
	@RequestMapping(value="logoutUser.do")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
