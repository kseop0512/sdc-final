<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>

<script src="https://kit.fontawesome.com/7b7a761eb5.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<section id="book-a-table" class="book-a-table section-bg1">
    <div class="container" data-aos="fade-up" id="loginBack">

      <div class="section-title">
        <h2>LOGIN</h2>
        <p>환영합니다, 똑독캣입니다</p>
      </div>
      	<div class="page-content">
		<div class="wrap">
			<h1>비밀번호가 변경되었습니다.</h1>
			<a href="/loginPartner.do" class="btn" style="background-color: #ffb347;width: 150px;margin-left: 35px;">로그인하러 가기</a>		
		</div>
	</div>
	    </div>
	  </section>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>