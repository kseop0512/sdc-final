//초기화면 - 받은메시지 목록조회, 읽지않음 카운트
getMemberRDm();
msgFilter();

//받은메시지 - 목록 불러오기
function getMemberRDm(){
	const memberId = $("#memberId").val();
	$.ajax({
		url : "/getMemberRDm.do",
		data : {memberId : memberId},
		success: function(list){
			const tbody = $(".receive tbody");
			tbody.empty();
			for(let i=0;i<list.length;i++){
				const dm = list[i];
				const tr = $("<tr>");
				//체크박스
				const checkboxTd = $("<td><input class='form-check-input check-r' type='checkbox'></td>");
				const dmNoInput = $("<input type='hidden' value='"+dm.dmNo+"'>");
				checkboxTd.append(dmNoInput);
				
				//문의유형
				const typeTd = $("<td>");
				if(dm.dmType == 0){
					typeTd.text("결제/취소")
				}else if(dm.dmType==1){
					typeTd.text("예약")
				}else{
					typeTd.text("기타문의")
				}
				
				//보낸사람
				const senderTd = $("<td>");
				if(dm.senderCategory == 'A'){
		    		senderTd.text("관리자")
		    	}else{
		    		$.ajax({
			    		url : "/selectDmPartner.do",
			    		data : {pId:dm.sender},
			    		success : function(p){
			    			if(p.category == 'T'){
					    		senderTd.text(p.pName+" 훈련사");
					    	}else{
					    		senderTd.text(p.pName+" 펫시터");
					    	}
			    		}
		    		});
		    	} 
				
				//문의내용
				const contentTd = $("<td class='td-content'>");
				const aTag = $("<a href='javascript:void(0);'>");
				aTag.text(dm.dmContent);
				contentTd.append(aTag);	
				aTag.attr("onclick","receiveModal("+dm.dmNo+",'"+dm.sender+"','"+dm.dmContent+"','"+dm.dmDate+"')");
				
				//날짜
				const dmDateTd = $("<td>");
				dmDateTd.text(dm.dmDate);
				
				//보낸사람구분
				const senderCategory = $("<input type='hidden' class='sender-category'>");
				senderCategory.val(dm.senderCategory);
				
				//읽음여부
				const readCheckInput = $("<input type='hidden' class='read-check'>");
				readCheckInput.val(dm.readCheck);
				
				//합치기
				tr.append(checkboxTd).append(typeTd).append(senderTd).append(contentTd).append(dmDateTd).append(senderCategory).append(readCheckInput);
				tbody.append(tr);
			}
		unreadR();
		msgFilter();
		}
	});
}

//보낸메시지 - 목록 불러오기
function getMemberSDm(){
	const memberId = $("#memberId").val();
	$.ajax({
		url : "/getMemberSDm.do",
		data : {memberId : memberId},
		success: function(list){
			const tbody = $(".send tbody");
			tbody.empty();
			for(let i=0;i<list.length;i++){
				const dm = list[i];
				const tr = $("<tr>");
				
				//체크박스
				const checkboxTd = $("<td><input class='form-check-input check-s' type='checkbox'></td>");
				const dmNoInput = $("<input type='hidden' value='"+dm.dmNo+"'>");
				checkboxTd.append(dmNoInput);
				
				//문의유형
				const typeTd = $("<td>");
				if(dm.dmType == 0){
					typeTd.text("결제/취소")
				}else if(dm.dmType==1){
					typeTd.text("예약")
				}else{
					typeTd.text("기타문의")
				}
				
				//받는사람
				const receiverTd = $("<td>");
				if(dm.receiver == 'admin'){
		    		receiverTd.text("관리자")
		    	}else{
		    		$.ajax({
			    		url : "/selectDmPartner.do",
			    		data : {pId:dm.receiver},
			    		success : function(p){
			    			if(p.cartgory == 'T'){
					    		receiverTd.text(p.pName+" 훈련사");
					    	}else{
					    		receiverTd.text(p.pName+" 펫시터");
					    	}
			    		}
		    		});
		    	} 
				
				//문의내용
				const contentTd = $("<td class='td-content'>");
				const aTag = $("<a href='javascript:void(0);'>");
				aTag.text(dm.dmContent);
				contentTd.append(aTag);	
				aTag.attr("onclick","sendModal('"+dm.receiver+"','"+dm.dmContent+"','"+dm.dmDate+"')");
				
				//날짜
				const dmDateTd = $("<td>");
				dmDateTd.text(dm.dmDate);
				
				//읽음여부
				const readCheckTd = $("<td class='td-readcheck'>");
				const readCheckInput = $("<input type='hidden' class='read-check'>");
				readCheckInput.val(dm.readCheck);
				
				//합치기
				tr.append(checkboxTd).append(typeTd).append(receiverTd).append(contentTd).append(dmDateTd).append(readCheckTd).append(readCheckInput);
				tbody.append(tr);
			}
		unreadS();
		}
	});
}

//메시지 전체체크
$("#check-all-r").on("change",function(){
    if($(this).prop("checked")){
        $(".check-r").prop("checked",true);
    }else{
        $(".check-r").prop("checked",false);
    }
});
$("#check-all-s").on("change",function(){
    if($(this).prop("checked")){
        $(".check-s").prop("checked",true);
    }else{
        $(".check-s").prop("checked",false);
    }
});

//메시지 개별체크
$(".receive").on("click",".check-r",function(){
    if(!$(this).prop("checked")){
        $("#check-all-r").prop("checked",false);
    }
});
$(".send").on("change",".check-s",function(){
    if(!$(this).prop("checked")){
        $("#check-all-s").prop("checked",false);
    }
});

//삭제 버튼
$("#delete").on("click", function(){
	const answer = confirm("선택한 메시지를 삭제합니다.");
	if(answer){
		const chkDm = $("tbody [type=checkbox]:checked");
		$(chkDm).each(function (index, item) {
			const chkNo = $(item).next().val();
			console.log(chkNo);
			$.ajax({
				url : "/deleteDm.do",
				data : {dmNo : chkNo},
				success: function(data){
					console.log(data);
				}
			});//ajax종료
	    });
	    //새로고침
		location.reload(true);
	}
	//체크박스 해제
	$("[type=checkbox]").prop("checked",false);
});

//읽음 버튼
$("#reading").on("click", function(){
	const chkDm = $("tbody [type=checkbox]:checked");
	$(chkDm).each(function (index, item) {
		const chkNo = $(item).next().val();
		console.log(chkNo);
		$.ajax({
			url : "/updateReadCheck.do",
			data : {dmNo : chkNo},
			success: function(data){
				if(data>0){
					console.log("O(-<");
				}else{
					console.log("(ㄱ-)");
				}
			}
		});//ajax종료
    });
    //새로고침
	location.reload(true);
});

//탭 클릭에 따라 받은메시지, 보낸메시지 표시
$("#tab-receive").on("click",function(){
	//체크박스 해제
	$("[type=checkbox]").prop("checked",false);
	//받은메시지 출력
	getMemberRDm();
	//css변경
    $(this).addClass("active-tap");
    $("#tab-send").removeClass();
    $(".send").hide();
    $(".receive").show();
    $("#reading").show();
    $("#msg-filter").show();
});
$("#tab-send").on("click",function(){
	//체크박스 해제
	$("[type=checkbox]").prop("checked",false);
	//보낸메시지 출력
	getMemberSDm();
	//css변경
    $(this).addClass("active-tap");
    $("#tab-receive").removeClass();
    $(".send").show();
    $(".receive").hide();
    $("#reading").hide();
    $("#msg-filter").hide();
});

//읽지않음,전체 메시지 카운트
function msgFilter(){
    const unreadFilter = $(".unread>.count");
    const allFilter = $(".all>.count");
    const unreadCnt = $(".receive .read-check[value=0]").length;
    const allCnt = $(".receive .read-check").length;
    unreadFilter.text(unreadCnt);
    allFilter.text(allCnt);
}

//읽지않음,전체 필터 클릭에 따라 표시
$(".unread").on("click",function(){
	if($(this).children().val() == 0){
		$(".all").click();
		return;
	}
    $(".unread").addClass("active-tap");
    $(".receive .read-check").each(function(index,item){
        if($(item).val()==1){
            $(item).siblings().find(".check-msg").attr("disabled", true);
            $(item).parent().hide();
        }
    });
    filter();
});
$(".all").on("click",function(){
    $(".unread").removeClass("active-tap");
    $(".receive tbody>tr").show();
    $(".receive tbody>tr>td>.check-msg").attr("disabled", false);
});

//받은메시지 - 읽지않은메시지 굵게 표시
function unreadR(){
    const rMsg = $(".receive .td-content>a");
    rMsg.each(function(index, item){
        const readCheck = $(item).parent().siblings(".read-check").val();
        if(readCheck == 0){
            $(item).css("font-weight","bold");
        }
    });
}
unreadR();

//보낸메시지 - 읽음여부 표시
function unreadS(){
    const sMsg = $(".send .td-content>a");
    sMsg.each(function(index, item){
        const readCheck = $(item).parent().siblings(".read-check").val();
        if(readCheck == 0){
            $(item).parent().siblings(".td-readcheck").text("읽지않음");
        }else if(readCheck == 1){
            $(item).parent().siblings(".td-readcheck").text("읽음");
        }
    });
}
unreadS();

//받은메시지 - 보낸사람 필터
//관리자만 보기
function showAdminMsg(){
    $(".receive .sender-category").each(function(index,item){
        if($(item).val()=="A"){
            $(item).siblings().find(".check-msg").attr("disabled", false);
            $(item).parent().show();
        }else if($(item).val()!="A"){
            $(item).siblings().find(".check-msg").attr("disabled", true);
            $(item).parent().hide();
        }
    });
}
//파트너만 보기
function showPartnerMsg(){
    $(".receive .sender-category").each(function(index,item){
        if($(item).val()=="P"){
            $(item).siblings().find(".check-msg").attr("disabled", false);
            $(item).parent().show();
        }else if($(item).val()!="P"){
            $(item).siblings().find(".check-msg").attr("disabled", true);
            $(item).parent().hide();
        }
    });
}
//전체보기
function showAllMsg(){
    $(".receive .sender-category").each(function(index,item){
        $(item).siblings().find(".check-msg").attr("disabled", false);
        $(item).parent().show();
    });
}

//받은메시지 - 상세보기 모달창
function receiveModal(dmNo,dmSender,dmContent,dmDate){
	//읽음 반영
	$.ajax({
		url : "/updateReadCheck.do",
		data : {dmNo : dmNo},
		success: function(data){
			if(data>0){
				console.log("O(-<");
			}else{
				console.log("(ㄱ-)");
			}
		}
	});
	//받은메시지 재출력
	getMemberRDm();
	
	//기본 세팅으로 복구
	$("#submit-btn").hide();
    $("#reply-btn").show();
    $("#reply-msg").hide();
    $("#receive-msg").show();
    
    //받은메시지 창 세팅
    $("#msg-modal-title").text("받은메시지");
    $(".msg-modal-content textarea").css("height","400px");
    $(".msg-btn-wrap").show();
    $(".msg-sender>span").text("보낸사람");
    $(".msg-date>span").text("받은날짜");
    
    //보낸사람, 날짜, 내용 세팅
    $("[name=receiver]").val(dmSender);
    if(dmSender=="admin"){
    	$("#receiver-view").val("관리자");
    }else{
    	$.ajax({
    		url : "/selectDmPartner.do",
    		data : {pId:dmSender},
    		success : function(p){
    			if(p.category == 'A'){
    				$("#receiver-view").val("관리자");
    			}else if(p.category == 'T'){
    				$("#receiver-view").val(p.pName+" 훈련사");
    			}else{
    				$("#receiver-view").val(p.pName+" 펫시터");
    			}
    		}
    	});
    }
    $(".msg-date>input").val(dmDate);
    $("#receive-msg").text(dmContent);  
      
    //이후 모달창 보여주기
    $(".msg-modal").show();
    //ESC키 누르면 닫기
    $(this).keydown(function(event) {
        if ( event.keyCode == 27 || event.which == 27 ) {
            $("#close-btn").click();
        }
    });
}

//받은메시지 - 답장 버튼
$("#reply-btn").on("click",function(){
	//답변창 숨기기, 입력창 표시, 버튼 텍스트 변경, 버튼에 submit가능한 id부여
    $("#receive-msg").hide();
    $("#reply-msg").show();
    $("#reply-msg").focus();
    $(this).hide();
    $("#submit-btn").show();
    //버튼 한번 더 클릭하면 타입 submit으로 변경, 모달창 숨기기
});

//보낸메시지 - 상세보기 모달창
function sendModal(dmReceiver,dmContent,dmDate){
	//기본세팅으로 복구
	$("#reply-msg").hide();
    $("#receive-msg").show();
    //보낸메시지 창 세팅
    $("#msg-modal-title").text("보낸메시지");
    $(".msg-modal-content textarea").attr("readonly");
    $(".msg-modal-content textarea").css("height","470px");
    $(".msg-btn-wrap").hide();
    $(".msg-sender>span").text("받는사람");
    $(".msg-date>span").text("보낸날짜");
    //받는사람, 내용 세팅
    $("[name=receiver]").val(dmReceiver);
    if(dmReceiver=="admin"){
    	$("#receiver-view").val("관리자");
    }else{
    	$.ajax({
    		url : "/selectDmPartner.do",
    		data : {pId:dmReceiver},
    		success : function(p){
    			if(p.category == 'A'){
    				$("#receiver-view").val("관리자");
    			}else if(p.category == 'T'){
    				$("#receiver-view").val(p.pName+" 훈련사");
    			}else{
    				$("#receiver-view").val(p.pName+" 펫시터");
    			}
    		}
    	});
    }
    $(".msg-date>input").val(dmDate);
    $("#receive-msg").text(dmContent);
    //이후 모달창 보여주기
    $(".msg-modal").show();
    //ESC키 누르면 닫기
    $(this).keydown(function(event) {
        if ( event.keyCode == 27 || event.which == 27 ) {
            $("#close-btn").click();
        }
    });
}

//모달창 우측상단 닫기 버튼
$("#close-btn").on("click",function(){
    $("#reply-msg").hide();
    $(".msg-modal").hide();
});