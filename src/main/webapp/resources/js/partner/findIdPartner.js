function findIdPartner() {
    	const nameVal = $("#pName").val();
    	const phoneVal = $("#pPhone").val();
    	const resultDiv = $(".resultDiv");
    	resultDiv.html("");
    	const p = $("<p>");
    	$.ajax({
            url  : '/findIdPartner.do',
            type : 'post',
            data : {pName : nameVal, pPhone : phoneVal},
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


    $("#pName").focusin(function() {
    	$(this).css("border-color", "#ffc107");
        $(this).prev().prev().addClass("afterColor");
    })
     
    $("#pName").focusout(function() {
    	const nameVal = $("#pName").val();
    	
    	if(nameVal == "") {
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
    
  //휴대전화 정규식
    //const phoneReg = /^010\d{4}\d{4}$/;
    const phoneRef = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;

    $(".btn").on("click", function(){
    	const nameVal = $("#pName").val();
    	const phoneVal = $("#pPhone").val();
    	const nameComment = $("#pName").prev().children();
    	const phoneComment = $("#pPhone").prev().children();
    	
    	nameComment.text("");
    	phoneComment.text("");
    	
    	if(nameVal == "") {
    		nameComment.text(": 올바른 이름이 입력해주세요.");
    	}
        
    	if (phoneVal == "") {
    		phoneComment.text(": 전화번호를 입력해주세요.");
    	} else if (!phoneRef.test(phoneVal)) { // 정규표현식을 만족하지 않는다면
            phoneComment.text(": 올바른 전화번호 형식으로 입력해주세요.");
        }
    	
    	if(phoneRef.test(phoneVal) && (nameVal != "")) {
    		findIdPartner();
    	}
    });