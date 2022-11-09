package kr.or.pet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.pet.model.vo.DogCheckList;
import kr.or.pet.model.vo.Pet;

@Repository
public class PetDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPetDog(Pet p) {
		System.out.println("강아지추가dao");
		return sqlSession.insert("pet.insertPet", p);
	}

	public int insertDogChk(DogCheckList dogChk) {
		System.out.println("체크리스트추가dao");
		return sqlSession.insert("pet.insertDogChk", dogChk);
	}
}
