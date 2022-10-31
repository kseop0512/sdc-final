//비밀번호 유효성 조건 소문자/대문자/숫자로 8~12글자
$("[name=memberPw]").on("keyup",function(){
	var joinFrmChksPw = 0;
	var joinFrmChksPwRe = 0;
	$("#pwSpan").text("");
	const pwReg=/^[a-zA-Z0-9!@#$%^*+=-]{8,12}$/;
    const pwReg1=/[a-z]/;
    const pwReg2=/[A-Z]/;
    const pwReg3=/[0-9]/;
    
    var pw = $("#memberPw");
    var pwValue = pw.val();
	if(pwReg.test(pwValue) && pwReg1.test(pwValue) && pwReg2.test(pwValue) && pwReg3.test(pwValue)){
		$("#pwSpan").text("사용 가능한 비밀번호입니다.");
		$("#pwSpan").css("color","#ffb347");
		joinFrmChksPw = 1;
	}else{
		$("#pwSpan").text("비밀번호는 소문자/대문자/숫자 조합으로 8~12글자입니다.");
		$("#pwSpan").css("color","red");
		joinFrmChksPw = 0;
	}
});

$("[name=memberBdate]").on("keyup",function(){
	var joinFrmChksBdate = 0;
	const dateReg=/^[0-9]{8}$/;
	$("#bdateSpan").text("");
	var mBdate = $("#memberBdate").val();
	if(!dateReg.test(mBdate)){
		$("#bdateSpan").text("입력형식이 맞지 않습니다.(YYYYMMDD)");
		$("#bdateSpan").css("color","red");
		joinFrmChksBdate = 0;
	}else{
		joinFrmChksBdate = 1;
	}
});

$("[name=memberPhone]").on("keyup",function(){
	var joinFrmChksPhone = 0;
	const phoneReg=/^[0-9]{10,11}$/;
	$("#phoneSpan").text("");
	var mPhone = $("#memberPhone").val();
	if(!phoneReg.test(mPhone)){
		$("#phoneSpan").text("입력형식이 맞지 않습니다. -를 제외한 숫자만");
		$("#phoneSpan").css("color","red");
		joinFrmChksPhone = 0;
	}else{
		joinFrmChksPhone = 1;
	}
});