package kr.or.member.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Kakao;
import kr.or.member.model.vo.KakaoResult;

@Repository
public class KakaoDao {
private SqlSession sqlSession;
    
    //public static final String MAPPER = "ezen.dev.spring.kakao";
    
    @Autowired
    public KakaoDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    // 정보 저장
    public void kakaoinsert(HashMap<String, Object> userInfo) {
        sqlSession.insert("member.insert",userInfo);
    }
 
    // 정보 확인
    public Kakao findkakao(HashMap<String, Object> userInfo) {
        System.out.println("RN:"+userInfo.get("nickname"));
        System.out.println("RE:"+userInfo.get("email"));
    
        
        return sqlSession.selectOne("member.kakao", userInfo);
}
}
