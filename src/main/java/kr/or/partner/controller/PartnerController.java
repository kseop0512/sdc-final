package kr.or.partner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.partner.model.service.PartnerService;

@Controller
public class PartnerController {
	@Autowired
	private PartnerService service;

	public PartnerController() {
		super();
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value="/partnerMain.do")
	public String partnerMain() {
		return "partner/myPage";
	}
}
