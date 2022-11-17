var joinFrmChks = 0; //모든 조건 만족 확인을 위한 변수
var joinFinalChk = 0;
$("#mGender").attr("value","M");
//아이디 부분체크
$("[name=memberId]").on("keyup change paste",function(){
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
					$("#idSpan").css("margin-left", "10px");
					joinFrmChks = 0;
					
				}else if(data=="0"){
					$("#idSpan").text("사용가능한 아이디입니다.");
					$("#idSpan").css("color","#ffb347");
					$("#idSpan").css("margin-left", "10px");
					joinFrmChks = 1;
					
				}
			}
		});
	}else{
		$("#idSpan").text("영어/숫자 조합으로 6~20글자입니다.");
		$("#idSpan").css("color","red");
	}
	joinFinalChk += joinFrmChks;
	console.log(joinFinalChk);
});


//비밀번호 유효성 조건 소문자/대문자/숫자로 8~12글자
$("[name=memberPw]").on("keyup change paste",function(){
	var joinFrmChksPw = 0;
	var joinFrmChksPwRe = 0;
	$("#pwSpan").text("");
	const pwReg=/^[a-zA-Z0-9!@#$%^*+=-]{8,12}$/;
    const pwReg1=/[a-z]/;
    const pwReg2=/[A-Z]/;
    const pwReg3=/[0-9]/;
    var pwRe = $("#mPwRe");
	var pwReValue = pwRe.val();
    var pw = $("#mPw");
    var pwValue = pw.val();
    if(pwReValue.length > 7){
	    if(pwValue == pwReValue){
			$("#pwReSpan").text("비밀번호가 일치합니다.");
			$("#pwReSpan").css("color","#ffb347");
			$("#pwReSpan").css("margin-left", "10px");
			joinFrmChks = 1;	
		}else{
			$("#pwReSpan").text("비밀번호가 일치하지 않습니다.");
			$("#pwReSpan").css("color","red");
			$("#pwRespan").css("margin-left", "10px");
			joinFrmChks = 0;
		}
	}
	if(pwReg.test(pwValue) && pwReg1.test(pwValue) && pwReg2.test(pwValue) && pwReg3.test(pwValue)){
		$("#pwSpan").text("사용 가능한 비밀번호입니다.");
		$("#pwSpan").css("color","#ffb347");
		$("#pwSpan").css("margin-left", "10px");
		joinFrmChks = 1;
		
		//비밀번호확인 일치검사
		$("[name=memberPwRe]").on("keyup change paste",function(){
			$("#pwReSpan").text("");
			
			if(pwReValue.length > 7){
				if(pwValue == pwReValue){
					$("#pwReSpan").text("비밀번호가 일치합니다.");
					$("#pwReSpan").css("color","#ffb347");
					$("#pwReSpan").css("margin-left", "10px");
					joinFrmChks = 1;	
				}else{
					$("#pwReSpan").text("비밀번호가 일치하지 않습니다.");
					$("#pwReSpan").css("color","red");
					$("#pwReSpan").css("margin-left", "10px");
					joinFrmChks = 0;
				}
			}	
		});
	}else{
		$("#pwSpan").text("비밀번호는 소문자/대문자/숫자 조합으로 8~12글자입니다.");
		$("#pwSpan").css("color","red");
		joinFrmChks = 0;
	}
	$("[name=memberPwRe]").on("keyup change paste",function(){
			$("#pwReSpan").text("");
			var pwRe = $("#mPwRe");
			var pwReValue = pwRe.val();
			if(pwReValue.length > 7){
				if(pwValue == pwReValue){
					$("#pwReSpan").text("비밀번호가 일치합니다.");
					$("#pwReSpan").css("color","#ffb347");
					$("#pwReSpan").css("margin-left", "10px");
					joinFrmChks = 1;	
				}else{
					$("#pwReSpan").text("비밀번호가 일치하지 않습니다.");
					$("#pwReSpan").css("color","red");
					$("#pwReSpan").css("margin-left", "10px");
					joinFrmChks = 0;
				}
			}	
		});
	joinFinalChk += joinFrmChks;
	console.log(joinFinalChk);
});

$("[name=memberBdate]").on("keyup change paste",function(){
	var joinFrmChksBdate = 0;
	const dateReg=/^[0-9]{8}$/;
	$("#bdateSpan").text("");
	var mBdate = $("#mBdate").val();
	if(!dateReg.test(mBdate)){
		$("#bdateSpan").text("입력형식이 맞지 않습니다.(YYYYMMDD)");
		$("#bdateSpan").css("color","red");
		$("#bdateSpan").css("margin-left", "10px");
		joinFrmChks = 0;
	}else{
		joinFrmChks = 1;
	}
	joinFinalChk += joinFrmChks;
	console.log(joinFinalChk);
});

$("[name=memberPhone]").on("keyup change paste",function(){
	var joinFrmChksPhone = 0;
	const phoneReg=/^[0-9]{10,11}$/;
	$("#phoneSpan").text("");
	var mPhone = $("#mPhone").val();
	if(!phoneReg.test(mPhone)){
		$("#phoneSpan").text("입력형식이 맞지 않습니다. -를 제외한 숫자만");
		$("#phoneSpan").css("color","red");
		$("#phoneSpan").css("margin-left", "10px");
		joinFrmChks = 0;
	}else{
		joinFrmChks = 1;
	}
	joinFinalChk += joinFrmChks;
});

//휴대폰 인증부분
var smsNum;
var intervalId;
$(".sms-wrap").hide();
function sendSMS(){
const phoneReg=/^[0-9]{10,11}$/;
	$("#phoneSpan").text("");
	var pNum = $("#mPhone").val();
	if(!phoneReg.test(pNum)){
		$("#phoneSpan").text("입력형식이 맞지 않습니다. -를 제외한 숫자만");
		$("#phoneSpan").css("color","red");
	}else{
		$.ajax({
	      	type : "POST",
	      	url : "/sendSMS.do",
	     	data : {pNum : pNum},
	     	success : function(data) {
				$(".sms-wrap").show();
				$("#phoneSpan").text("인증번호가 발송되었습니다.");
				$("#phoneSpan").css("color","#ffb347");
				$("#mPhone").attr("readonly",true);
				$(".smsBtn").hide();
	        	smsNum = data;
	            verifyCount();   
	      	}
	   	});
		
	}
};


function verifyCount() {
	intervalId = window.setInterval(function(){
		timeCount();
	}, 1000);
}

function timeCount() {
	const min = Number($("#min").text());
	const sec = $("#sec").text();
	if(sec == "00") {
		if(min == 0) {
			resultCode = null;
			clearInterval(intervalId);
			$("#min").text("");
			$("#sec").text("");
			$(".timeRSpan").text("인증시간만료");
			$(".timeRSpan").css("color", "red");
			$(".smsChkBtn").hide();
			joinFrmChks = 0;
		} else {
			$("#min").text(min-1);
			$("#sec").text(59);
		}
	} else {
		const newSec = Number(sec) - 1;
		if(newSec < 10) {
			$("#sec").text("0"+newSec);
		} else {
			$("#sec").text(newSec);
		}
	}
};

$(".smsChkBtn").on("click", function(){
	const smsVal = $(".smsVal").val();
	$(".timeRSpan").text("");
	if(smsNum != null){
		if(smsVal == smsNum) {
			$("#min").text("");
			$("#sec").text("");
			$(".timeRSpan").append("인증 성공");
			$(".timeRSpan").css("color", "#ffc107");
			clearInterval(intervalId); // 시간 카운트 함수 멈춤
			$("#smsChk").val("1");
			$("#mPhone").attr("readonly", true);
			$(".smsChkBtn").hide();
			$(".smsBtn").hide();
			joinFrmChks = 1;
			
		} else {
			$(".timeRSpan").append("인증 실패! 올바르게 입력 후 다시 확인버튼을 눌러주세요.");
			$(".timeRSpan").css("color", "red");
			$(".timeRSpan").css("font-size","15px");
			joinFrmChks = 0;
		}
	}
	joinFinalChk += joinFrmChks;
})




$("#RadioF").click(function(){
	$("#mGender").attr("value","F");
	console.log($("#mGender").val());
});
$("#RadioM").click(function(){
	$("#mGender").attr("value","M");
	console.log($("#mGender").val());
});

$("#joinBtn").click(function(e){
	if((joinFinalChk >= 5) && (joinFrmChks == 1) && (!$("#mAddr").val()=="") && (!$("#mName").val()=="") && (!$("#mPwRe").val()=="") && (!$("#mPw").val()=="")){

	}else{
		e.preventDefault();
		new swal("입력값을 확인해주세요!", "", "info");
	}
});