package kr.or.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.member.model.service.memberService;

@Controller
public class MemberController {
	@Autowired
	private memberService service;
}
