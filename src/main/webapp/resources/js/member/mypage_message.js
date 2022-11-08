var pwChk = 1; //비밀번호 유효성 검사
var bdateChk = 1; //생년월일 유효성 검사
var phoneChk = 1; //전화번호 유효성 검사
var updateFinalChk = 2; //검사 결과 3일때만 submit가능하도록 초기 2로 설정(비밀번호는 암호화때문에 재입력 필수)

///비밀번호 유효성 조건 소문자/대문자/숫자로 8~12글자
$("[name=memberPw]").on("keyup", function () {
	$("#pwSpan").text("");
	const pwReg = /^[a-zA-Z0-9!@#$%^*+=-]{8,12}$/;
	const pwReg1 = /[a-z]/;
	const pwReg2 = /[A-Z]/;
	const pwReg3 = /[0-9]/;
	var pw = $("#mPw");
	var pwValue = pw.val();
	updateFinalChk = 2;
	if (pwReg.test(pwValue) && pwReg1.test(pwValue) && pwReg2.test(pwValue) && pwReg3.test(pwValue)) {
		$("#pwSpan").text("사용 가능한 비밀번호입니다.");
		$("#pwSpan").css("color", "#cda45e");
		pwChk = 1;
	} else {
		$("#pwSpan").text("비밀번호는 소문자/대문자/숫자 조합으로 8~12글자입니다.");
		$("#pwSpan").css("color", "red");
		pwChk = 0;
	}
	updateFinalChk += pwChk;
	console.log("updateFinalChk(Password): "+updateFinalChk);
});

//생년월일 유효성 검사
$("[name=memberBdate]").on("keyup",function(){
	const dateReg=/^[0-9]{8}$/;
	$("#bdateSpan").text("");
	var mBdate = $("#mBdate").val();
	var bdateFinalChk = 0; //최종검사결과 반영용 변수
	if(!dateReg.test(mBdate)){
		$("#bdateSpan").text("입력형식이 맞지 않습니다.(YYYYMMDD)");
		$("#bdateSpan").css("color","red");
		bdateChk = 0;
		bdateFinalChk = -1;
	}else{
		bdateChk = 1;
	}
	updateFinalChk = updateFinalChk + bdateChk + bdateFinalChk;
	console.log("updateFinalChk(Bdate): "+updateFinalChk);
});

//전화번호 유효성 검사
$("[name=memberPhone]").on("keyup",function(){
	const phoneReg=/^[0-9]{10,11}$/;
	$("#phoneSpan").text("");
	var mPhone = $("#mPhone").val();
	var phoneFinalChk = 0; //최종검사결과 반영용 변수
	if(!phoneReg.test(mPhone)){
		$("#phoneSpan").text("입력형식이 맞지 않습니다. -를 제외한 숫자만");
		$("#phoneSpan").css("color","red");
		phoneChk = 0;
		phoneFinalChk = -1;
	}else{
		phoneChk = 1;
	}
	updateFinalChk = updateFinalChk + phoneChk + phoneFinalChk;
	console.log(updateFinalChk);
});

//유효성 검사 모두 통과하면 submit(정보수정)
$("[type=submit]").click(function(e){
	if((updateFinalChk >= 3) && (pwChk == 1) && (bdateChk == 1) && (phoneChk == 1) && (!$("#mAddr").val()=="") && (!$("#mName").val()=="") && (!$("#mPw").val()=="")){
	}else{
		e.preventDefault();
		alert("입력값을 확인해주세요");
		if(pwChk != 1 || $("[name=memberPw]").val()==""){
			$("[name=memberPw]").focus();
		}else if(bdateChk != 1){
			$("[name=memberBdate]").focus();
		}else if(phoneChk != 1){
			$("[name=memberPhone]").focus();
		}
	}
});

//세션에 저장된 회원 성별 체크
$(function genderCheck(){
	const mGender = $("#mGender").val();
	if(mGender=='M'){
		$("#m").attr('checked',true);
	}else if(mGender=='F'){
		$("#f").attr('checked',true);
	}
});

//우편번호 주소 검색 api
$("#mAddr").on("click", function() {
    new daum.Postcode({
        oncomplete: function(data) {
        	const getAddr = getDetailAddr();
			if(getAddr != null){
				const detailAddr = data.address+", "+getAddr;
            	$("#mAddr").val(detailAddr);
			}
        }
    }).open();
})

//상세주소 입력창
function getDetailAddr(){
	const getAddr = prompt("상세주소를 입력하세요");
	return getAddr;
}