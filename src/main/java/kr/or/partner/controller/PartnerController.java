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
			model.addAttribute("icon","error");
			model.addAttribute("loc","/chkPwFrm.do");
			return "common/msg";
		}else {
			// 현재비밀번호 일치 -> resetPassword 페이지 이동
			return "partner/resetPwFrm";
		}
	}
	// 파트너 비밀번호 변경
	@RequestMapping(value="/changePw.do")
	public String changePw(Partner p, Model model) {
		int result = service.changePwPartNer(p); // *PartNer : 암호화
		if(result>0) {
			model.addAttribute("title","비밀번호 변경 완료");
			model.addAttribute("msg","새 비밀번호로 변경되었습니다.");
			model.addAttribute("icon","success");
			model.addAttribute("loc","/partnerMain.do");
			return "common/msg";
		}else {
			model.addAttribute("title","비밀번호 변경 실패");
			model.addAttribute("msg","비밀번호 변경 중 문제가 생겼습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/chkPw.do");
			return "common/msg";
		}
	}
	// 파트너 비밀번호 변경
	@RequestMapping(value = "/joinPartnerFrm.do")
	public String joinPartnerFrm() {
		return "main/partner/joinPartnerFrm";
	}
	// 파트너 프로필 이동
	@RequestMapping(value="/showProfile.do")
	public String showProfile() {
		return "partner/showProfile";
	}
	
}
