package kr.or.manager.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.manager.model.service.ManagerService;
import kr.or.manager.model.vo.Manager;

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
}
