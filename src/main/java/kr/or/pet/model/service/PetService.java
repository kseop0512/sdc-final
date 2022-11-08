package kr.or.pet.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.pet.model.dao.PetDao;
import kr.or.pet.model.vo.DogCheckList;
import kr.or.pet.model.vo.Pet;

@Service
public class PetService {
	@Autowired
	private PetDao dao;
	
	@Transactional
	public int insertPetDog(Pet p, DogCheckList dogChk) {
		int result = dao.insertPetDog(p);
		if(result > 0) {
			dogChk.setPetNo(p.getPetNo());
			result = dao.insertDogChk(dogChk);			
			return result;
		}else {
			return result;
		}
	}
	
}
