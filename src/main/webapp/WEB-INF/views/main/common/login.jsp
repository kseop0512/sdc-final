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
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>LOGIN</h2>
        <p>환영합니다, 똑독캣입니다</p>
      </div>

      <form action="/login.do" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">
        <div class="row">
          <div class="col-lg-4 col-md-6 form-group">
            ID <input type="text" name="id" class="form-control" id="id" placeholder="Your ID" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
            <div class="validate"></div>
          </div>
          <div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
            PASSWORD <input type="password" class="form-control" name="password" id="password" placeholder="Your PASSWORD" data-rule="email" data-msg="Please enter a valid email">
            <div class="validate"></div>
          </div>
          <div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
            <img src="assets/img/WELC.png" alt="" class="img-fluid" style="width: 200px; height: 200px;">
          </div>
          <div class="submit-btn" style="display: flex;justify-content: center;align-items: center;margin-top: -240px;margin-left: 45px;">
            <a href="#">회원가입</a>
            <a href="/findIdPage.do" id="findIdBtn">| 아이디 찾기</a>
            <a href="/findPwPage.do" id="findPwBtn">/비밀번호 찾기</a>
          </div>
          <br>
        <div class="text-center"><button type="submit" class="submitBtn loginBtn"  id="loginBtn">LOGIN</button></div>
      </form>

    </div>
  </section><!-- End Book A Table Section -->
	
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>