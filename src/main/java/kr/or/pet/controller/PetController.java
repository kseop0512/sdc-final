package kr.or.pet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.pet.model.service.PetService;

@Controller
public class PetController {
	@Autowired
	private PetService service;
}
