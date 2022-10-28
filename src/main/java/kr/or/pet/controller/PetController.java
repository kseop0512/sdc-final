package kr.or.pet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.pet.model.service.PetService;

@Controller
public class PetController {
	@Autowired
	private PetService service;
	
	@RequestMapping(value="/petAddFrm.do")
	public String petAddFrm() {
		return "pet/petAddFrm";
	}
}
