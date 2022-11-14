//비밀번호 정규식
const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;

$("#pPw").focusin(function() {
	$(this).css("border-color", "#ffc107");
    $(this).prev().prev().addClass("afterColor");
})
 
$("#pPw").focusout(function() {
	const pwVal = $("#pPw").val();
	
	if(pwVal == "") {
		$(this).css("border-color", "#ccc");
    	$(this).prev().prev().removeClass("afterColor");
    }
});

$("#pPwChk").focusin(function() {
	$(this).css("border-color", "#ffc107");
    $(this).prev().prev().addClass("afterColor");
})
 
$("#pPwChk").focusout(function() {
	const pwChkVal = $("#pPwChk").val();
	
	if(pwChkVal == "") {
		$(this).css("border-color", "#ccc");
    	$(this).prev().prev().removeClass("afterColor");
    }
});

$(".btn").on("click", function(){
	const pwVal = $("#pPw").val();
	const pwChkVal = $("#pPwChk").val();
	const pwComment = $("#pPw").prev().children();
	const pwChkComment = $("#pPwChk").prev().children();
	
	pwComment.text("");
	pwChkComment.text("");
	
	if(pwVal == "") {
		pwComment.text("비밀번호를 입력해주세요.");
	} else if (!pwReg.test(pwVal)) { // 정규표현식을 만족하지 않는다면
        pwComment.text("영문, 숫자, 특수문자 포함 8~12자리 입력");
    }
    
	if (pwChkVal == "") {
		pwChkComment.text("비밀번호를 다시 입력해주세요.");
	} else if (pwVal != pwChkVal) { // 정규표현식을 만족하지 않는다면
        pwChkComment.text("비밀번호가 일치하지 않습니다.");
    }
	
	if(pwReg.test(pwVal) && (pwVal == pwChkVal)) {
		$("#updatePwPForm").submit();
	}
});