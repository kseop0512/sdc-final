<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<style type="text/css">
	input:button{
		hover: background-color: skyblue;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<h1>회원가입 완료!!</h1>
	<input type="button" id="backBtn" value="로그인" style="background-color: lightgrey; font-weight:bolder; border:none">
	<input type="button" id="addPet" value="펫등록" style="background-color: lightgrey; color:white; font-weight:bolder; border:none">
	<script>
		$("#backBtn").click(function(){
			location.href="/";
		});
		$("#addPet").click(function(){
			location.href="/petAddFrm.do";
		});
	</script>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>