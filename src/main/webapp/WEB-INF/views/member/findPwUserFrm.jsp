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
	<div class="page-content" style="position: relative;">
        <div class="wrap">
            <div class="title" style="margin-left: 20px;margin-bottom: 10px;">
                <h1>비밀번호 찾기</h1>
            </div>
            <div class="content">
                <form action="/findPwUser.do" method="post" autocomplete="off">
                    <div class="box" style="margin-bottom: 5px;">
                        <label for="memberId">아이디<span class="comment"></span></label>
                        <input type="text" name="memberId" id="memberId" class="input" style="border-color: #ffc107;background-color:#1A1814;border-radius: 10px;margin-left: 27px;color: #fff;">
                    </div>
                    <div class="box" style="margin-bottom: 15px;">
                        <label for="memberPhone">전화번호<span class="comment"></span></label>
                        <input type="text" name="memberPhone" id="memberPhone" class="input shortInput" placeholder="-를 제외한 형식" style="border-color: #ffc107;background-color:#1A1814;border-radius: 10px;margin-left: 27px;color: #fff;">
                        <input type="hidden" id="verifyChk" value="false">
                        <button type="button" id="sendBtn">인증번호발송</button>
                    </div>
                    <div class="verifyBox" style="display:none;">
                    	<input type="text" class="verifyInput" placeholder="인증번호 입력">
                    	<span id="timeZone"></span>
                    	<button type="button" id="verifyBtn">인증하기</button>
                    	<span class="verifyMsg"></span>
                    </div>
                    <div class="btn-box">
                        <button type="button" class="btn" onclick="findPw();" style="background-color: #ffb347;width: 150px;margin-left: 35px;">비밀번호 찾기</button>
                    </div>
                </form>
                <div class="submit-btn" style="margin-left: 38px;">
		            <a href="/loginUser.do" id="findIdBtn">로그인</a>
		        </div>
            </div>
            <div class="resultDiv">
            </div>
        </div>
    </div>
	
	</div>
  </section>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script src="/resources/js/member/findPwUser.js"></script>
</body>
</html>