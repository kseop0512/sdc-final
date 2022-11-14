<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <!-- ======= Book A Table Section ======= -->
  <section id="book-a-table" class="book-a-table section-bg1">
    <div class="container" data-aos="fade-up" id="loginBack">

      <div class="section-title">
        <h2>LOGIN</h2>
        <p>환영합니다, 똑독캣입니다</p>
      </div>
	
      <form action="/loginUser.do" method="post" role="form" data-aos="fade-up" data-aos-delay="100">
        <div class="row">
          <div class="col-lg-4 col-md-6 form-group">
            ID <input type="text" name="memberId" class="form-control" id="memberId" placeholder="Your ID" style="background-color: #0c0b09;border-color: #625b4b;color:#aaaaaa;"autocomplete="off">
          </div>
          <div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
            PASSWORD <input type="password" class="form-control" name="memberPw" id="memberPw" placeholder="Your PASSWORD" style="background-color: #0c0b09;border-color: #625b4b;color:#aaaaaa;" autocomplete="off">
          </div>
          <div class="submit-btn">
            <a href="/memberJoinFrm.do">회원가입</a>
            <a href="/findIdUserFrm.do" id="findIdBtn">| 아이디 찾기</a>
            <a href="/findPwUserFrm.do" id="findPwBtn">/비밀번호 찾기</a>
          </div>
          <br>
          <br>
          <br>
          <br>
        <div class="text-center"><input type="submit" class="submitBtn loginBtn" value="LOGIN" style="background: #cda45e;border: 0;padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;"></div>
		
      </form>
      <div>
			<a href="/kakaoLogin.do">
				<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
			</a>
		</div>
    </div>
  </section><!-- End Book A Table Section -->
	
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>