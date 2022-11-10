// 아이디 정규표현식
//const idReg = /^[a-zA-Z0-9]{6,20}$/;
const idRef = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

//휴대전화 정규식
//const phoneReg = /^010\d{4}\d{4}$/;
const phoneRef = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;

function findPwP() {
	const idVal = $("#pId").val();
	const phoneVal = $("#pPhone").val();
	const resultDiv = $(".resultDiv");
	resultDiv.html("");
	const p = $("<p>");
	$.ajax({
        url  : '/findPwPartner.do',
        type : 'post',
        data : {pId : idVal, pPhone : phoneVal},
        success : function(data){
        	if(data == "find") {
        		location.href="/updatePwPFrm.do";
        	} else if(data == "kakao") {
        		p.append("카카오로 가입하셨습니다. (비밀번호 찾기 불가)");
        		resultDiv.append(p);
        	} else {
        		p.append(data);
        		resultDiv.append(p);
        	}
        }
    });
}

let intervalId;
function verifyCount() {
	const span = $("#timeZone");
	span.html("<span id='min'>3</span> : <span id='sec'>00</span>");
	intervalId = window.setInterval(function(){
		timeCount();
	}, 1000); // 1초에 한번씩 timeCount() 함수 동작
}

let resultCode;
function timeCount() {
	const min = Number($("#min").text());
	const sec = $("#sec").text();
	if(sec == "00") {
		if(min == 0) {
			resultCode = null;
			clearInterval(intervalId);
			$(".verifyMsg").text("인증시간만료");
			$(".verifyMsg").css("color", "red");
			$("#timeZone").hide();
			$("#verifyBtn").hide();
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
}
		
$("#verifyBtn").on("click", function(){
	const inputValue = $(".verifyInput").val();
	$(".verifyMsg").text("");
	// console.log(inputValue);
	if(resultCode != null){
		if(inputValue == resultCode) {
			$(".verifyMsg").append("인증 성공<i class='fa-solid fa-circle-check'></i>");
			$(".verifyMsg").css("color", "#ffc107");
			clearInterval(intervalId); // 시간 카운트 함수 멈춤
			$("#verifyChk").val("true");
			$("#pPhone").attr("readonly", true);
			$("#pId").attr("readonly", true);
			$("#pPhone").removeClass("shortInput");
			$(".verifyInput").hide();
			$("#timeZone").hide();
			$("#verifyBtn").hide;
			$("#sendBtn").hide();
			$(this).hide();
		} else {
			//$(".verifyMsg").text("인증 실패");
			$(".verifyMsg").append("인증 실패<i class='fa-solid fa-circle-xmark'></i>");
			$(".verifyMsg").css("color", "red");
		}
	}
})

$("#sendBtn").on("click", function() {
	const phoneComment = $("#pPhone").prev().children();
	const phoneVal = $("#pPhone").val();
	const div = $(".verifyBox");
	div.hide();
	phoneComment.text("");
	
	if ((phoneVal != "") && phoneRef.test(phoneVal)) {
		const phVal = $("#pPhone").val().replace('-', '');
		$.ajax({
	        url  : '/sendMsgP.do',
	        type : 'post',
	        data : {pPhone : phVal},
	        success : function(data){
	        	div.show();
	        	if(intervalId != undefined) {
		        	clearInterval(intervalId);
	        	}
				$("#timeZone").show();
				$("#verifyBtn").show();
	        	$(".verifyInput").val("");
	        	$(".verifyMsg").text("");
	        	resultCode = data;
	        	console.log(resultCode);
	        	verifyCount();
	        }
	    });
	} else if (phoneVal == "") {
		phoneComment.text("전화번호를 입력해주세요.");
	} else if (!phoneRef.test(phoneVal)) { // 정규표현식을 만족하지 않는다면
        phoneComment.text("전화번호 형식으로 입력해주세요.");
    }
});



$("#pId").focusin(function() {
	$(this).css("border-color", "#ffc107");
    $(this).prev().prev().addClass("afterColor");
})
 
$("#pId").focusout(function() {
	const idVal = $("#pId").val();
	
	if(idVal == "") {
		$(this).css("border-color", "#ccc");
    	$(this).prev().prev().removeClass("afterColor");
    }
});

$("#pPhone").focusin(function() {
	$(this).css("border-color", "#ffc107");
    $(this).prev().prev().addClass("afterColor");
})
 
$("#pPhone").focusout(function() {
	const phoneVal = $("#pPhone").val();
	
	if(phoneVal == "") {
		$(this).css("border-color", "#ccc");
    	$(this).prev().prev().removeClass("afterColor");
    }
});

$(".btn").on("click", function(){
	const idVal = $("#pId").val();
	const phoneVal = $("#pPhone").val();
	const idComment = $("#pId").prev().children();
	const phoneComment = $("#pPhone").prev().children();
	const verifyChk = $("#verifyChk").val();
	
	idComment.text("");
	phoneComment.text("");
	
	if(idVal == "") {
		idComment.text("아이디를 입력해주세요.");
	} else if (!idRef.test(idVal)) { // 정규표현식을 만족하지 않는다면
        idComment.text("다시 입력해주세요");
    }
    
	if (phoneVal == "") {
		phoneComment.text("전화번호를 입력해주세요.");
	} else if (!phoneRef.test(phoneVal)) { // 정규표현식을 만족하지 않는다면
        phoneComment.text(" - 형식으로 입력해주세요.");
    }
	
	if(phoneRef.test(phoneVal) && (idVal != "")) {
		if(verifyChk == "true") {
			findPwP();
		} else {
			phoneComment.text("전화번호를 인증해주세요.");
		}
	}
});