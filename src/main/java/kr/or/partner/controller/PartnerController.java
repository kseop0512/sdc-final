package kr.or.partner.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.partner.model.service.PartnerService;
import kr.or.partner.model.vo.Partner;

@Controller
public class PartnerController {
	@Autowired
	private PartnerService service;

	public PartnerController() {
		super();
		// TODO Auto-generated constructor stub
	}
	// 파트너 메인페이지 이동
	@RequestMapping(value="/partnerMain.do")
	public String partnerMain() {
		return "partner/myPage";
	}
	// 파트너 비밀번호 변경 - 현재 비밀번호 입력 페이지 이동
	@RequestMapping(value="/chkPwFrm.do")
	public String changePwFrm() {
		return "partner/chkPwFrm";
	}
	// 파트너 현재비밀번호 확인(암호화) - 성공: 새 비밀번호 페이지 이동 / 실패: sweetalert으로 메시지 띄워주기
	@RequestMapping(value="/chkPw.do")
	public String chkPw(Partner p, Model model) {
		Partner partner = service.selectOnePartNer(p); // *PartNer : 암호화
		if(partner == null) {
			// 비밀번호 틀림 -> sweetalert창
			model.addAttribute("title","비밀번호 불일치");
			model.addAttribute("msg","현재 비밀번호와 일치하지 않습니다");
			model.addAttribute("icon","warning");
			model.addAttribute("loc","/chkPwFrm.do");
			return "common/msg";
		}else {
			// 현재비밀번호 일치 -> resetPassword 페이지 이동
			return "partner/updatePw";
		}
	}
}
