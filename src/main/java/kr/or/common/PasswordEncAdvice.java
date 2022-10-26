package kr.or.common;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.partner.model.vo.Partner;

@Component
@Aspect
public class PasswordEncAdvice {
   @Autowired
   private SHA256Util passEnc;
   
   // 파트너 비밀번호 암호화
   @Pointcut(value="execution(* kr.or.partner.model.service.PartnerService.*PartNer(kr.or.partner.model.vo.Partner))")
   public void partnerEncPointcut() {}
   
   @Before(value="partnerEncPointcut()")
   public void passwordEnc(JoinPoint jp) throws Exception{
      Object[] args = jp.getArgs();
      Partner p = (Partner)args[0];
      String partnerPw = p.getPPw();
      System.out.println("사용자 입력 비밀번호 : "+partnerPw);
      if(partnerPw != null) {
         String encPw = passEnc.encData(partnerPw);
         p.setPPw(encPw);
      }
   }
}