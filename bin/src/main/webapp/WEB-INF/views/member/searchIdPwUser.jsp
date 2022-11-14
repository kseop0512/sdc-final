<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 정보 찾기</title>
</head>
<body>
	<h2>아이디 찾기</h2>
	<form action="/searchId.do" method="post">
		<fieldset>
			생년월일 입력 : <input type="text" name="memberBdate"><br>
			<input type="submit" value="아이디 찾기">
			서비스 예정
		</fieldset>
	</form>
	<hr>
	<h2>비밀번호찾기</h2>
	<form action="/searchPwUser.do" method="post">
		<fieldset>
			아이디 입력 : <input type="text" name="memberId"><br>
			이름 입력 : <input type="text" name="memberName"><br>
			<input type="submit" value="비밀번호 찾기">
		</fieldset>
	</form>
</body>
</html>