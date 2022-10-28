<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<style type="text/css">
	input:button{
		hover: background-color: skyblue;
	}
</style>
<body>
	<h1>회원가입 완료!!</h1>
	<input type="button" id="backBtn" value="메인페이지로" style="background-color: lightgrey; font-weight:bolder; border:none">
	<input type="button" id="addPet" value="펫등록하기" style="background-color: lightgrey; color:white; font-weight:bolder; border:none">
	<script>
		$("#backBtn").click(function(){
			location.href="/";
		});
	</script>
</body>
</html>