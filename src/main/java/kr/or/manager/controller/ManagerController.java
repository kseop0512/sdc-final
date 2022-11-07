package kr.or.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.manager.model.service.ManagerService;
import kr.or.manager.model.vo.Manager;
import kr.or.member.model.vo.Member;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	//관리자 로그인 폼 이동
	@RequestMapping(value="/loginManagerFrm.do")
	public String loginManagerFrm() {
		return "manager/loginManager";
	}
	
	//관리자 로그인 화면
	@RequestMapping(value="loginManager.do")
	public String loginManager(Manager manager, HttpSession session) {
		Manager g = service.selectOneManager(manager);
		if(g!=null) {
			session.setAttribute("g", g);
		}
		return "redirect:/";
	}
	
	//관리자 로그아웃
	@RequestMapping(value="logoutManager.do")
	public String logoutManager(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
	
	//관리자p 회원관리 검색
	@RequestMapping(value="/searcMember.do")
	public String searchMember(String memberType,String type, String keyword, Model model) {
		int result = service.selectMemberList();
		int result2 = service.selectPartnerList();
		int result3 = service.selectTotalMember();
		model.addAttribute("memberCount", result);
		model.addAttribute("partnerCount", result2);
		model.addAttribute("totalCount",result3);
		
		ArrayList<Member> list = service.searchMember(memberType,type,keyword);
		model.addAttribute("list",list);
		return "manager/adminMemberList";
			
	}
	
	//유저리스트 회원 엑셀다운로드
	@RequestMapping(value="/excelDown.do")
	@ResponseBody
	public void excelDown(HttpServletResponse response, HttpServletRequest request) throws IOException{
		service.excelDown(response);
	}
	
	//1:1문의내역 P 이동
	@RequestMapping(value="/adminDmMessage.do")
	public String adminDmPage() {
		return "manager/adminDmMessage";
	}
	//관리자 index P이동
	@RequestMapping(value="/adminIndex.do")
	public String adminIndex() {
		return "manager/adminIndex";
	}
	@RequestMapping(value="/partnerList.do")
	public String partnerList() {
		return "manager/partnerList";
	}
	
}













