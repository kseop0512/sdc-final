package kr.or.pet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PetDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
