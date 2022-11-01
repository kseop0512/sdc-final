package kr.or.common;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.member.model.vo.Member;
import kr.or.partner.model.vo.Partner;

@Component
@Aspect
public class PasswordEncAdvice {
   @Autowired
   private SHA256Util passEnc;
   
   // 파트너 비밀번호 암호화
   @Pointcut(value="execution(* kr.or.partner.model.service.PartnerService.*PartNer(kr.or.partner.model.vo.Partner))" +
           "|| execution(* kr.or.main.partner.model.service.PartnerMainService.*Partner(kr.or.partner.model.vo.Partner))")
   public void partnerEncPointcut() {}
   
   @Before(value="partnerEncPointcut()")
   public void passwordEnc(JoinPoint jp) throws Exception{
      Object[] args = jp.getArgs();
      Partner p = (Partner)args[0];
      String partnerPw = p.getPPw();
      if(partnerPw != null) {
         String encPw = passEnc.encData(partnerPw);
         p.setPPw(encPw);
      }
   }
   
   
   //이용자 비밀번호 암호화  <아직 확인 못함>
   
   @Pointcut(value="execution(* kr.or.member.model.service.MemberService.*Member(kr.or.member.model.vo.Member))")
   public void memberEncPointcut() {}
   
   @Before(value="memberEncPointcut()")
   public void passwordEncMember(JoinPoint jp) throws Exception{
      Object[] args = jp.getArgs();
      Member m = (Member)args[0];
      String memberPw = m.getMemberPw();
      if(memberPw != null) {
         String encPw = passEnc.encData(memberPw);
         m.setMemberPw(encPw);
      }
   }

   
}