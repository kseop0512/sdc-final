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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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
				<div class="phone-wrap">
				<input type="text" style="width:40%;min-width: 40%;" name="memberPhone" id="mPhone" placeholder="ex)01012340000 숫자만">
				<button type="button" class="smsBtn" onclick="sendSMS();" style="width:19%;height:50px;min-width: 19%;">인증번호발송</button><br>
				</div>
				<div class="sms-wrap" style="display:block;width:60%">
					<input type="text" style="width:27%;min-width: 32%;" class="smsVal" placeholder="인증번호입력">
					<div class="timeZone" style="display: inline-block;width: 32%; height: 50px;color: #fff;background: transparent;text-align: center;">
						<span class="timeRSpan"><span id="min">3</span><span class="timeSpan">분 </span><span id="sec">00</span>초</span>
					</div>
					<input type="hidden" id="smsChk" value="0">
					<button type="button" class="smsChkBtn" style="width:33%;height:50px;margin-left: 1%;">인증번호확인</button><br>
				</div>
				<input type="hidden" name="memberGender" id="mGender">
				<input type="submit" id="joinBtn" value="회원가입">
			</fieldset>
		</form>
	</div>
</main>
<script>
//우편번호 주소 검색 api
$("#mAddr").on("click", function() {
    new daum.Postcode({
	     oncomplete: function(data) {
        	(async () => {
        	    const { value: getAddr } = await Swal.fire({
        	        title: '상세주소',
        	        text: '나머지 주소를 입력해주세요',
        	        input: 'text'
        	    });
        	    if(getAddr){
    				const detailAddr = data.address+", "+getAddr;
                	$("#mAddr").val(detailAddr);
    			}
        	})()

			
        }
    }).open();
})

//상세주소 입력창
function getDetailAddr(){
	const getAddr = prompt("상세주소를 입력하세요");
	return getAddr;
}

</script>
	<script type="text/javascript" src="/resources/js/member/memberJoinFrm.js">
	</script>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>