package kr.or.pet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.pet.model.vo.PetCheckList;
import kr.or.pet.model.vo.Pet;
import kr.or.pet.model.vo.PetAvgStat;

@Repository
public class PetDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPet(Pet p) {
		return sqlSession.insert("pet.insertPet", p);
	}

	public int insertPetChk(PetCheckList petChk) {
		return sqlSession.insert("pet.insertPetChk", petChk);
	}

	public ArrayList<Pet> selectMyPet(int memberNo) {
		List list = sqlSession.selectList("pet.selectMyPet", memberNo);
		return (ArrayList<Pet>)list;
	}

	public ArrayList<PetCheckList> selectMyPetChk(int memberNo) {
		List list = sqlSession.selectList("pet.selectMyPetChk", memberNo);
		return (ArrayList<PetCheckList>)list;
	}

	public String selectPetName(int petNo) {
		return sqlSession.selectOne("pet.selectPetName",petNo);
	}
	
	public ArrayList<PetAvgStat> getAvgStat() {
		List list = sqlSession.selectList("pet.getAvgStat");
		return (ArrayList<PetAvgStat>)list;
	}
}
