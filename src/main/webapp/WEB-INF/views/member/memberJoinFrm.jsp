<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>똑독캣</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" type="text/css" href="https://demo.plantpot.works/assets/css/normalize.css">
<link rel="stylesheet" href="https://use.typekit.net/opg3wle.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/memberJoin.css">
</head>
<body>
	<form action="/join.do" method="post">
		<fieldset>
			<h3>회원가입<br><span style="font-size: 12px">똑독캣의 회원이 되어보세요!</span></h3>
			
				<label for="mId">아이디</label><span id="idSpan"></span><br>
				<input type="text" name="memberId" id="mId" placeholder="아이디 입력(6~10자)"><br>
				<label for="mPw">비밀번호</label><span id="pwSpan"></span><br>
				<input type="password" name="memberPw" id="mPw" placeholder="비밀번호 입력(대소문자, 숫자, 특수문자를 포함한 10~20자)"><br>
				<label for="mPwRe">비밀번호확인</label><span id="pwReSpan"></span><br>
				<input type="password" name="memberPwRe" id="mPwRe" placeholder="비밀번호 재입력"><br>
				<label for="mName">이름</label><br>
				<input type="text" name="memberName" id="mName" placeholder="본명을 입력해주세요"><br>
				
			성별<br>
				<div id="genderWrap">
		          <label class="custom-radio-button__container">
		            <input type="radio" name="memberGender" checked>
		            <span class="custom-radio-button designer"><img class="personImg" src="/resources/img/man.png"></span>
		          </label>
		          <label class="custom-radio-button__container">
		            <input type="radio" name="memberGender">
		            <span class="custom-radio-button"><img class="personImg" src="/resources/img/woman.png"></span>
		          </label><br>
		        </div>	
		        
					<label for="mBdate">생년월일</label><br>
					<input type="text" id="mBdate" placeholder="ex)20221225 숫자8자리"><br>
					<label for="mAddr">주소</label><br>
					<input type="text" id="mAddr" placeholder=""><br>
					<label for="mPhone">전화번호</label><br>
					<input type="text" id="mPhone" placeholder="ex)01012340000 숫자만"><br>
				</fieldset>
			</form>
	<script>
	var joinFrmChks = 0; //모든 조건 만족 확인을 위한 변수
	
	//아이디 부분체크
	$("[name=memberId]").on("keyup",function(){
		var joinFrmChksId = 0;
		$("#idSpan").text("");
		const memberId=$(this).val();
		//유효성 검사 먼저 수행
		const idReg = /^[a-zA-Z0-9]{6,20}$/;
		const id=$("#mId");
		const idValue = id.val();
		//유효성 검사 통과하면 중복체크
		if(idReg.test(idValue)){
			$.ajax({
				url:"/ajaxCheckMemberId.do",
				type:"get",
				data: {memberId:memberId},
				success: function(data){
					if(data=="1"){
						$("#idSpan").text("이미 사용중인 아이디입니다.");
						$("#idSpan").css("color","red");
						joinFrmChksId = 0;
					}else if(data=="0"){
						$("#idSpan").text("사용가능한 아이디입니다.");
						$("#idSpan").css("color","blue");
						joinFrmChksId = 1;
					}
					
					
				}
				
			});
		}else{
			$("#idSpan").text("영어/숫자 조합으로 6~20글자입니다.");
			$("#idSpan").css("color","red");
		}
		
	});
	
	
	//비밀번호 유효성 조건 소문자/대문자/숫자로 8~12글자
    $("[name=memberPw]").on("keyup",function(){
    	var joinFrmChksPw = 0;
    	var joinFrmChksPwRe = 0;
		$("#pwSpan").text("");
		const pwReg=/^[a-zA-Z0-9!@#$%^*+=-]{8,12}$/;
	    const pwReg1=/[a-z]/;
	    const pwReg2=/[A-Z]/;
	    const pwReg3=/[0-9]/;
	    
	    var pw = $("#mPw");
	    var pwValue = pw.val();
		if(pwReg.test(pwValue) && pwReg1.test(pwValue) && pwReg2.test(pwValue) && pwReg3.test(pwValue)){
			$("#pwSpan").text("사용 가능한 비밀번호입니다.");
			$("#pwSpan").css("color","blue");
			joinFrmChksPw = 1;
			
			//비밀번호확인 일치검사
			$("[name=memberPwRe]").on("keyup",function(){
				$("#pwReSpan").text("");
				var pwRe = $("#mPwRe");
				var pwReValue = pwRe.val();
				if(pwValue == pwReValue){
					$("#pwReSpan").text("비밀번호가 일치합니다.");
					$("#pwReSpan").css("color","blue");
					joinFrmChksPwRe = 1;	
				}else{
					$("#pwReSpan").text("비밀번호가 일치하지 않습니다.");
					$("#pwReSpan").css("color","red");
					joinFrmChksPwRe = 0;
				}	
			});
		}else{
			$("#pwSpan").text("비밀번호는 소문자/대문자/숫자 조합으로 8~12글자입니다.");
			$("#pwSpan").css("color","red");
			joinFrmChksPw = 0;
		}
    });
	</script>
</body>
</html>