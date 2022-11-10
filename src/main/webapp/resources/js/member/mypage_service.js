$(function(){
	//실제 DB 서비스 시작시간, 종료시간 값
	const start = $(".input-start-time");
	const end = $(".input-end-time");
	
	//실제DB 서비스 시작일, 종료일 값
	const startDate = $(".input-start-date");
	const endDate = $(".input-end-date");
	
	//화면에 표시할 서비스 시작일, 종료일 입력할 span태그
	const sSpan = $(".span-start-date");
	const eSpan = $(".span-end-date");	
	
	//span태그에 화면표시값 입력하기 'yy/mm/dd (hh:mi)'
	for(let i=0;i<start.length;i++){
		let time = start.eq(i).val().split(",");
		start.eq(i).val(time[0]);
		end.eq(i).val(time[1]);
		let sDate = startDate.eq(i).val();
		let eDate = endDate.eq(i).val();
		//날짜 시간 합침 - 종료일 null인 경우 시작일+종료시간
		sSpan.eq(i).html(sDate+"<br>"+" ("+time[0]+")");
		if(eDate==""){
			eSpan.eq(i).html(sDate+"<br>"+" ("+time[1]+")");
		}else{
			eSpan.eq(i).html(eDate+"<br>"+" ("+time[1]+")");
		}
	}
	
	//펫번호로 펫이름 조회해서 span태그에 입력하기
	for(let i=0;i<$(".input-pet").length;i++){
		const petNo = $(".input-pet").eq(i).val();
		$.ajax({
			url : "/getPetName.do",
			data : {petNo : petNo},
			success: function(petName){
				$(".span-pet").eq(i).text(petName);
			}
		});
	}
	
	//파트너번호로 파트너이름 조회해서 span태그에 입력하기
	for(let i=0;i<$(".input-partner").length;i++){
		const pNo = $(".input-partner").eq(i).val();
		$.ajax({
			url : "/getPartnerName.do",
			data : {pNo : pNo},
			success: function(pName){
				$(".span-partner").eq(i).text(pName);
			}
		});
	}
	
	//가격 세자리마다 콤마(,)표시
	for(let i=0;i<$(".input-price").length;i++){
		const price = $(".input-price").eq(i).val();
		const commaPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
		$(".span-price").eq(i).text(commaPrice);
	}
});


//이용내역 화면표시값 변경
//startDate-startTime, endDate-endTime 'yy/mm/dd(hh:mi)'
//petNo, category, PNo, price, partnerAccept, reviewState]
function replaceTd(){
	const petNo = $("#memberId").val();
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
				aTag.attr("onclick","receiveModal(this, '"+dm.dmNo+"', '"+dm.sender+"', '"+dm.dmDate+"', '"+dm.dmType+"')");
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
		}
	});
}

//받은메시지 - 상세보기 모달창
function receiveModal(obj,dmNo,dmSender,dmDate,dmType){
	//읽음 반영
	$.ajax({
		url : "/updateMemberReadCheck.do",
		data : {dmNo : dmNo},
		success: function(data){
			if(data>0){
				console.log("읽음 업데이트");
			}else{
				console.log("(ㄱ-)");
			}
		}
	});
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
    
    //보낸사람 표시값, receiver, dmType, reply값 세팅
    $("[name=receiver]").val(dmSender);
    $("[name=reply]").val(dmNo);
    $("[name=dmType]").val(dmType);
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
    //내용, 받은날짜 표시
    const dmContent = $(obj).text();
    $("#receive-msg").text(dmContent);
    $(".msg-date>input").val(dmDate);
    
    //받은메시지 재출력
	getMemberRDm();
    
    //이후 모달창 보여주기
    $(".msg-modal").show();
    //ESC키 누르면 닫기
    $(this).keydown(function(event) {
        if ( event.keyCode == 27 || event.which == 27 ) {
            $("#close-btn").click();
        }
    });
}

//받은메시지 - 답장
$("#reply-btn").on("click",function(){
	//답장(reply)버튼 숨기고 보내기(submit)버튼 표시
    $("#receive-msg").hide();
    $("#reply-msg").show();
    $("#reply-msg").focus();
    $(this).hide();
    $("#submit-btn").show();
});

//모달창 우측상단 닫기 버튼
$("#close-btn").on("click",function(){
    $("#reply-msg").hide();
    $(".msg-modal").hide();
});

//초기화면
//getMemberRDm();