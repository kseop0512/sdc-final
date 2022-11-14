function findIdUser() {
    	const nameVal = $("#memberName").val();
    	const phoneVal = $("#memberPhone").val();
    	const resultDiv = $(".resultDiv");
    	resultDiv.html("");
    	const p = $("<p>");
    	$.ajax({
            url  : '/findIdUser.do',
            type : 'post',
            data : {memberName : nameVal, memberPhone : phoneVal},
            success : function(data){
            	if(data.includes("/")) {
            		const result = data.split("/");
            		p.append("똑독캣에 가입하신 아이디는 [ ");
            		p.append("<span class='resultSpan'>" + result[0] + "</span> ] 이며,<br>[ ");
            		p.append("<span class='resultSpan'>" + result[1] + "</span> ](으)로 가입하셨습니다.");
            		resultDiv.append(p);
            	} else {
            		p.append("존재하지 않는 아이디입니다");
            		resultDiv.append(p);
            	}
            }
        });
    }


    $("#memberName").focusin(function() {
    	$(this).css("border-color", "#ffc107");
        $(this).prev().prev().addClass("afterColor");
    })
     
    $("#memberName").focusout(function() {
    	const nameVal = $("#memberName").val();
    	
    	if(nameVal == "") {
    		$(this).css("border-color", "#ccc");
        	$(this).prev().prev().removeClass("afterColor");
        }
    });

    $("#memberPhone").focusin(function() {
    	$(this).css("border-color", "#ffc107");
        $(this).prev().prev().addClass("afterColor");
    })
     
    $("#memberPhone").focusout(function() {
    	const phoneVal = $("#memberPhone").val();
    	
    	if(phoneVal == "") {
    		$(this).css("border-color", "#ccc");
        	$(this).prev().prev().removeClass("afterColor");
        }
    });
    
  //휴대전화 정규식
    const phoneReg = /^010\d{4}\d{4}$/;

    $(".btn").on("click", function(){
    	const nameVal = $("#memberName").val();
    	const phoneVal = $("#memberPhone").val();
    	const nameComment = $("#memberName").prev().children();
    	const phoneComment = $("#memberPhone").prev().children();
    	
    	nameComment.text("");
    	phoneComment.text("");
    	
    	if(nameVal == "") {
    		nameComment.text(": 올바른 이름이 입력해주세요.");
    	}
        
    	if (phoneVal == "") {
    		phoneComment.text(": 전화번호를 입력해주세요.");
    	} else if (!phoneReg.test(phoneVal)) { // 정규표현식을 만족하지 않는다면
            phoneComment.text(": 올바른 전화번호 형식으로 입력해주세요.");
        }
    	
    	if(phoneReg.test(phoneVal) && (nameVal != "")) {
    		findIdUser();
    	}
    });