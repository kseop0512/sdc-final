package kr.or.pet.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pet.model.dao.PetDao;

@Service
public class PetService {
	@Autowired
	private PetDao dao;
	
}
