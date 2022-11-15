<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>똑독캣</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" type="text/css" href="https://demo.plantpot.works/assets/css/normalize.css">
<link rel="stylesheet" href="https://use.typekit.net/opg3wle.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/memberJoin.css">
</head>
<body>
<style>
.smsBtn{
	background: #fff;
	margin-bottom: 15px;

}
.smsBtn:hover{
	background: #cda45e;
	color: #fff;
}
.smsChkBtn:hover{
	background: #cda45e;
	color: #fff;
}
</style>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
<main id="main">
	<div class="content-wrap">
		<form action="/memberJoin.do" method="post">
			<fieldset class="content-field">
				<h3>회원가입<br><span style="font-size: 20px; color: #ccc">똑독캣의 회원이 되어보세요!</span></h3>
				<label for="mId">아이디</label><span id="idSpan"></span><br>
				<input type="text" name="memberId" id="mId" placeholder="아이디 입력(6~10자)"><br>
				<label for="mPw">비밀번호</label><span id="pwSpan"></span><br>
				<input type="password" name="memberPw" id="mPw" placeholder="비밀번호 입력(대소문자, 숫자, 특수문자를 포함한 10~20자)"><br>
				<label for="mPwRe">비밀번호확인</label><span id="pwReSpan"></span><br>
				<input type="password" name="memberPwRe" id="mPwRe" placeholder="비밀번호 재입력"><br>
				<label for="mName">이름</label><br>
				<input type="text" name="memberName" id="mName" placeholder="본명을 입력해주세요"><br>
				<div id="genderWrap">
					<span class="genderT">성별</span>
						<div class="genderImgWrap">
				          	<label class="custom-radio-button__container">
				            <input type="radio" id="RadioM" name="genderRadio" value="M" checked>
				            <span class="custom-radio-button designer"><img class="personImg" src="/resources/img/man.png"></span>
				          </label>
				          <label class="custom-radio-button__container">
				            <input type="radio" id="RadioF" name="genderRadio" value="F">
				            <span class="custom-radio-button"><img class="personImg" src="/resources/img/woman.png"></span>
				          </label>
			          </div>
		        </div>	
		        
				<label for="mBdate">생년월일</label><span id="bdateSpan"></span><br>
				<input type="text" name="memberBdate" id="mBdate" placeholder="ex)20221225 숫자8자리"><br>
				<label for="mAddr">주소</label><br>
				<input type="text" name="memberAddr" id="mAddr" placeholder=""><br>
				<label for="mPhone">전화번호</label><span id="phoneSpan"></span><br>
				<input type="text" style="width:300px;" name="memberPhone" id="mPhone" placeholder="ex)01012340000 숫자만">
				<button type="button" class="smsBtn" onclick="sendSMS();" style="width:170px;height:50px;">인증번호발송</button><br>
				<div class="sms-wrap" style="display:inline-block;">
					<input type="text" style="width:200px;min-width:200px;" class="smsVal" placeholder="인증번호입력">
					<div class="timeZone" style="display: inline-block;width: 197px; height: 50px;color: #fff;background: transparent;text-align: center;">
						<span class="timeRSpan"><span id="min">3</span><span class="timeSpan">분 </span><span id="sec">00</span>초</span>
					</div>
					<input type="hidden" id="smsChk" value="0">
					<button type="button" class="smsChkBtn" style="width:170px;height:50px;">인증번호확인</button><br>
				</div>
				<input type="hidden" name="memberGender" id="mGender">
				<input type="submit" id="joinBtn" value="회원가입">
			</fieldset>
		</form>
	</div>
</main>
<script>

/*휴대폰 인증번호 발송*/
$(".phoneChkSendBtn").click(function(){
   
   alert("인증번호가 발송되었습니다.");
   var phone1 = $("[name=frontNum]").val();
   var phone2 = $("[name=memberPhone1]").val();
   var phone = phone1+phone2;
   $.ajax({
      type : "POST",
      url : "/memberPhoneCheck.do",
      data : {phone : phone},
      success : function(numStr) {
              $(".certifyNum2").val(numStr);
                             
      }
   });
});
</script>
	<script type="text/javascript" src="/resources/js/member/memberJoinFrm.js">
	</script>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>