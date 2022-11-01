package kr.or.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/memberJoinSuccess.do")
	public String memberJoinSuccess() {
		return "member/memberJoinSuccess";
	}
	
	@RequestMapping(value="/memberJoinChkFrm.do")
	public String memberJoinChkFrm() {
		return "member/memberJoinChkFrm";
	}
	
	@RequestMapping(value="/memberJoinFrm.do")
	public String memberJoinFrm() {
		return "member/memberJoinFrm";
	}
	
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin(Member m) {
		System.out.println(m);
		int result = service.insertMember(m);
		if (result > 0) {
			return "member/memberJoinSuccess";
		} else {
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxCheckMemberId.do")
	public int ajaxCheckMemberId(String memberId) {
		int result = service.selectOneMemberId(memberId);
		return result;
	}
	

	@RequestMapping(value="/memberMypage.do")
	public String memberMypage() {
		return "member/memberMypage";
	}
	
	//메인에서 로그인 버튼 누르면 나오는 첫 페이지 이동
	@RequestMapping(value="/beforeLogin.do")
	public String beforeLogin(){
		return "main/common/beforeLogin";
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
	
	//유저 정보수정
	@RequestMapping(value="/memberUpdate.do")
	public String memberUpdate(Member m, Model model, HttpSession session) {
		Member updateM = service.updateMember(m);
		if(updateM != null) {
			session.setAttribute("m", updateM);
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
	
	//관리자 페이지 확인용
	@RequestMapping(value="/adminMemberList.do")
	public String adminMemberList() {
		return "manager/adminMemberList";
	}
	
	//유저리스트 회원 수 
	@RequestMapping(value="/selectUserList.do")
	public String selectUserList(Model model,Member m) {
		int result = service.selectMemberList();
		int result2 = service.selectPartnerList();
		int result3 = service.selectTotalMember();
		model.addAttribute("memberCount", result);
		model.addAttribute("partnerCount", result2);
		model.addAttribute("totalCount",result3);
		
		
		
		ArrayList<Member> list = service.selectMemberPartnerList(m);
		model.addAttribute("list",list);
		return "manager/adminMemberList";
	}
	//관리자P 공지사항 이동
	@RequestMapping(value="/adminNotice.do")
	public String adminNotice() {
		return "manager/adminNotice";
	}
	
	//관리자P 공지사항 글쓰기 Frm
	@RequestMapping(value="/adminNoticeWriteFrm.do")
	public String adminNoticeFrm() {
		return "manager/adminNoticeWrite";
	}
	
}
