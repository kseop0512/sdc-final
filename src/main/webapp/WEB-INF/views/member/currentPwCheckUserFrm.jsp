<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/currentPwCheckUser.do" method="post">
		<fieldset>
			<span>현재 비밀번호 입력 : </span>
			<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			<input type="password" name="memberPw">
			<input type="submit" value="현재비밀번호">
		</fieldset>
	</form>
</body>
</html>