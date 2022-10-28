

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

$("[name=memberBdate]").on("keyup",function(){
	var joinFrmChksBdate = 0;
	const dateReg=/^[0-9]{8}$/;
	$("#bdateSpan").text("");
	var mBdate = $("#mBdate").val();
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
	var mPhone = $("#mPhone").val();
	if(!phoneReg.test(mPhone)){
		$("#phoneSpan").text("입력형식이 맞지 않습니다. -를 제외한 숫자만");
		$("#phoneSpan").css("color","red");
		joinFrmChksPhone = 0;
	}else{
		joinFrmChksPhone = 1;
	}
});

$("#joinBtn").click(function(){
	var memberGender = $("input[name=genderRadio]:checked").val();
	console.log(memberGender);
});