//쪽지 페이지 들어왔을 때 받은 쪽지, 보낸 쪽지 list 나오게 

$(function(){
	getReceiveDm(); 
	getdmMaxCount();
	getdmRead();
	getcheckRead();
	
		$("#tabAllMember").css("font-weight","900");
		$("#tabMember").css("font-weight","normal");
		$("#tabPartner").css("font-weight", "normal");

});


//1:1 문의 총 카운트 
 function getdmMaxCount(){
	$.ajax({
		url : "/dmCount.do",
		success: function(data){
			$("#dmMax_Count").append(data);
		},
		error : function(){
			console.log("err");
		}
	});
}


//답변대기 총 카운트
function getdmRead(){
	$.ajax({
		url: "/dmReadCount.do",
		success: function(data){
			console.log(data);
			$("#dm_check").append(data);
		
		},
		error : function(){
			console.log("답변대기err");
		}
	});
}
//답변완료 카운트
function getcheckRead(){
	$.ajax({
		url:"/dmCheckRead.do",
		success: function(data){
			console.log(data);
		 $("#dm_checkRead").append(data);
		
		}
	});
}


 /* 모달 닫기 버튼 눌렀을때 */
function closeModal(){
    $(".modal-modal").hide();
    $(".modalmodel-wrap").hide();
 //   $("#detailText").val(""); 
}


/* 사용자/파트너가 보낸  문의내용 가져오기 리스트 불러오기 */
function getReceiveDm(){
	const receiver = $("#sender").val(); 
	
	$.ajax({
		url:"/myDmList.do",
		data : {receiver : receiver},	
		success : function(list) {
			const tbody = $("#datatablesSimple>tbody");
			tbody.empty();
			for(let i=0;i<list.length;i++){
				const dm = list[i];
				
				console.log(dm);
				const tr = $("<tr>");
				
				// 번호, 아이디, 전화번호, 문의유형, 문의내용, 날짜, 답변여부
				const noTd = $("<td>"); //td만들기
				noTd.text(dm.dmNo);
				
				const senderCategroyTd = $("<td>");
				senderCategroyTd.text(dm.senderCategory);
				
				//아이디
				const senderTd = $("<td>");
				senderTd.text(dm.sender);
				
				//문의유형
				const typeTd = $("<td>");
				typeTd.text(dm.dmType);
				
				if(dm.dmType == 0){
					typeTd.text("결제/취소")
				}else if(dm.dmType==1){
					typeTd.text("예약")
				}else{
					typeTd.text("기타문의")
				}
				const typeHidden = $("<input type='hidden' class='dm-type-hidden'>");
				typeHidden.val(dm.dmType);
				typeTd.append(typeHidden);
				
				//문의내용
				const contentTd = $("<td>");
				const div = $("<div>");
				contentTd.append(div);
				
				div.addClass("tdContent");
				div.text(dm.dmContent);
				div.css("fontWeight","900");
				div.css("cursor","pointer");	
				div.css("width","300");
				div.css("overflow","hidden");
				div.css("text-overflow","ellipsis");
				div.css("white-space","nowrap");
				
				div.attr("onclick","modal(this,'"+dm.sender+"')");  //자기자신을 보내주고
				
				//날짜
				const dmDateTd = $("<td>");
				dmDateTd.text(dm.dmDate);
				
				//답변여부
				const readTd = $("<td>");
				if(dm.readCheck == 0){
					readTd.css("fontWeight","900");
					readTd.css("color","red");
					readTd.text("답변대기");
				}else{
					readTd.text("답변완료");
					readTd.css("color","black");
				}
				tr.append(noTd).append(senderCategroyTd).append(senderTd).append(typeTd).append(contentTd).append(dmDateTd).append(readTd);
				tbody.append(tr);
			}
		},
		error : function(){
			alert("err");
		}
	});

	}
	
	//모달 띄워서 admin한테 메세지를 보낸 사람의 정보 가져오기 
	function modal(obj,sender){			//자기자신을 obj로 받음 	
		//글번호 
		 const dmNo= $(obj).parent().prev().prev().prev().prev().text();
		 console.log(dmNo);
			
		$.ajax({
			url:"/detailMember.do",
			data : {sender : sender, dmNo:dmNo},
		
			success : function(data) {
			console.log("정보"+data);
			
			// M/P구분
			const memberCategoty = $(obj).parent().prev().prev().prev().text();
			console.log(memberCategoty);
			
			if(memberCategoty == 'M'){
				 $("#detailSender").text(data.m.memberName);//이름
				 $("#detailId").text(sender);//아이디	
			 	$("#detailPhone").text(data.m.memberPhone);//핸드폰	
			 			
			}else if(memberCategoty =='P'){
			 	$("#detailSender").text(data.p.pName);//이름
			 	$("#detailId").text(sender);//아이디	
			 	$("#detailPhone").text(data.p.pPhone);//핸드폰	
			}
			
			
			 //문의유형
			 const detailType= $(obj).parent().prev().text();  //자기자신(리스트문의내용)을 기준으로  문의유형을 가지고옴.
			 $("#detailType").text(detailType);
			 const hiddenDmType = $(obj).parent().prev().find(".dm-type-hidden").val();
			 $("#dm-type").val(hiddenDmType);
			
			//날짜	
			const detailDate = $(obj).parent().next().text(); //자기자신(리스트문의내용)을 기준으로  다음요소인 날짜를 가지고-> modal에 띄워줌
			$("#detailDate").text(detailDate);
			
			//다른사람이 나한테 문의한 내용
			const detailContent = $(obj).text();
			$("#detailContent").text(detailContent);
			
			
			 const detailNo= $(obj).parent().prev().prev().prev().prev().text();
			 $("#detailNo").text(detailNo);
			
			//답변완료된 화면 답변보여주기
			const reply= $(obj).parent().next().next().text();
			console.log("답변번호"+reply);
			$("#detailText").val("");
			if(reply == "답변완료"){
				$("#detailText").val(data.dm.dmContent);
				$("#detailText").attr("disabled",true); //답변완료인것은 disabled 처리
				$("#send-btn").hide(); // 내용이 있으면 답장 버튼 숨기기
	
			}else if(reply=="답변대기"){
				$("#detailText").val(""); //답변 하고 나면 textarea안에 값 비워주기
				$("#detailText").attr("disabled",false); //답변대기 부분은 답변가능하게
				$("#send-btn").show();
			}
			
			
			//모달을 보여줌 
			 $(".modalmodel-wrap").show();
			 $(".modal-modal").show();
			 
			 },
		});
	}

//답장보내기
function dmSend(){
	 const sender = $("#sender").val(); //보내는 사람 
	 const senderCategory = $("#sender-category").val();//보내는사람 구분(관리자라서'A')
	 const dmType = $("#dm-type").val();//문의유형
	 const dmContent = $("#detailText").val(); // 내용
	 const receiver = $("#detailId").text(); //받는 사람
	 const reply = $("#detailNo").text();//글 번호
	$.ajax({
		url:"/insertDm.do",
		data :{sender : sender, dmContent: dmContent , receiver:receiver, reply:reply, senderCategory:senderCategory, dmType:dmType},
		success : function(data){
		 if(data == 1 ){
		 	alert("답변성공");
		 	 closeModal(); //모달 닫기
		 	 getReceiveDm(); //리스트 불러오기
 			history.go(0);//새로고침
		 }else{
		 	alert("실패");
		 }
		},
		function(){
			alert("관리자에게 문의하세요");
		}
	});
}

//검색
function searchDm(){
	const keyword = $("[name=keyword]").val();
	const dmType = $("[name=dmType]").val(); //0,1,2,중에 선택한 값이 들어감
	
	console.log(keyword);
	console.log(dmType);
	
		if(dmType == null){
			alert("문의유형을 선택하세요");
		} else if(keyword == ""){
			alert("아이디를 입력하세요");
		} else {
		
			$.ajax({
				url:"/selectdmType.do",
				data :{dmType : dmType, keyword : keyword},
				success : function(list){
				
				const tbody = $("#datatablesSimple>tbody");
				tbody.empty();
				for(let i=0;i<list.length;i++){
				const dm = list[i];
				
				console.log(dm);
				const tr = $("<tr>");
				
				// 번호, 아이디, 전화번호, 문의유형, 문의내용, 날짜, 답변여부
				const noTd = $("<td>"); //td만들기
				noTd.text(dm.dmNo);
				
				const senderCategroyTd = $("<td>");
				senderCategroyTd.text(dm.senderCategory);
				
				//아이디
				const senderTd = $("<td>");
				senderTd.text(dm.sender);
				
				//문의유형
				const typeTd = $("<td>");
				typeTd.text(dm.dmType);
				
				if(dm.dmType == 0){
					typeTd.text("결제/취소")
				}else if(dm.dmType==1){
					typeTd.text("예약")
				}else{
					typeTd.text("기타문의")
				}
				const typeHidden = $("<input type='hidden' class='dm-type-hidden'>");
				typeHidden.val(dm.dmType);
				typeTd.append(typeHidden);
				
				//문의내용
				const contentTd = $("<td>");
				const div = $("<div>");
				contentTd.append(div);
				
				div.addClass("tdContent");
				div.text(dm.dmContent);
				div.css("fontWeight","900");
				div.css("cursor","pointer");	
				div.css("width","300");
				div.css("overflow","hidden");
				div.css("text-overflow","ellipsis");
				div.css("white-space","nowrap");
				
				div.attr("onclick","modal(this,'"+dm.sender+"')");  //자기자신을 보내주고
				
				//날짜
				const dmDateTd = $("<td>");
				dmDateTd.text(dm.dmDate);
				
				//답변여부
				const readTd = $("<td>");
				if(dm.readCheck == 0){
					readTd.css("fontWeight","900");
					readTd.css("color","red");
					readTd.text("답변대기");
				}else{
					readTd.text("답변완료");
					readTd.css("color","black");
				}
				tr.append(noTd).append(senderCategroyTd).append(senderTd).append(typeTd).append(contentTd).append(dmDateTd).append(readTd);
				tbody.append(tr);
			}
		},
		error : function(){
			alert("err");
		}
	});

	}
	}

//탭 클릭에 따라 받은메시지, 보낸메시지 표시
$("#tabMember").on("click",function(){
	//이용자 리스트 출력
	getMemberDm();
	$(this).css("font-weight","900");
	$("#tabAllMember").css("font-weight", "normal");
	$("#tabPartner").css("font-weight", "normal");
});
$("#tabPartner").on("click",function(){
	//파트너 리스트 출력 
	getPartnerDm();
	$(this).css("font-weight","900");
	$("#tabAllMember").css("font-weight", "normal");
	$("#tabMember").css("font-weight","normal");
});

$("#tabAllMember").on("click",function(){
	//파트너 리스트 출력 
	getReceiveDm();
	$(this).css("font-weight","900");
	$("#tabMember").css("font-weight","normal");
	$("#tabPartner").css("font-weight", "normal");
});

//이용자만 
function getMemberDm(){
	const receiver = $("#sender").val(); 
	$.ajax({
		url:"/getMemberDmList.do",
		data : {receiver : receiver},	
		success : function(list) {
			const tbody = $("#datatablesSimple>tbody");
			tbody.empty();
			for(let i=0;i<list.length;i++){
				const dm = list[i];
				
				console.log(dm);
				const tr = $("<tr>");
				
				// 번호, 아이디, 전화번호, 문의유형, 문의내용, 날짜, 답변여부
				const noTd = $("<td>"); //td만들기
				noTd.text(dm.dmNo);
				
				const senderCategroyTd = $("<td>");
				senderCategroyTd.text(dm.senderCategory);
				
				//아이디
				const senderTd = $("<td>");
				senderTd.text(dm.sender);
				
				//문의유형
				const typeTd = $("<td>");
				typeTd.text(dm.dmType);
				
				if(dm.dmType == 0){
					typeTd.text("결제/취소")
				}else if(dm.dmType==1){
					typeTd.text("예약")
				}else{
					typeTd.text("기타문의")
				}
				const typeHidden = $("<input type='hidden' class='dm-type-hidden'>");
				typeHidden.val(dm.dmType);
				typeTd.append(typeHidden);
				
				//문의내용
				const contentTd = $("<td>");
				const div = $("<div>");
				contentTd.append(div);
				
				div.addClass("tdContent");
				div.text(dm.dmContent);
				div.css("fontWeight","900");
				div.css("cursor","pointer");	
				div.css("width","300");
				div.css("overflow","hidden");
				div.css("text-overflow","ellipsis");
				div.css("white-space","nowrap");
				
				div.attr("onclick","modal(this,'"+dm.sender+"')");  //자기자신을 보내주고
				
				//날짜
				const dmDateTd = $("<td>");
				dmDateTd.text(dm.dmDate);
				
				//답변여부
				const readTd = $("<td>");
				if(dm.readCheck == 0){
					readTd.css("fontWeight","900");
					readTd.css("color","red");
					readTd.text("답변대기");
				}else{
					readTd.text("답변완료");
					readTd.css("color","black");
				}
				tr.append(noTd).append(senderCategroyTd).append(senderTd).append(typeTd).append(contentTd).append(dmDateTd).append(readTd);
				tbody.append(tr);
			}
		},
		error : function(){
			alert("err");
		}
	});

	}
	
	//파트너만
	function getPartnerDm(){
	const receiver = $("#sender").val(); 
	$.ajax({
		url:"/getPartnerDmList.do",
		data : {receiver : receiver},	
		success : function(list) {
			const tbody = $("#datatablesSimple>tbody");
			tbody.empty();
			for(let i=0;i<list.length;i++){
				const dm = list[i];
				
				console.log(dm);
				const tr = $("<tr>");
				
				// 번호, 아이디, 전화번호, 문의유형, 문의내용, 날짜, 답변여부
				const noTd = $("<td>"); //td만들기
				noTd.text(dm.dmNo);
				
				const senderCategroyTd = $("<td>");
				senderCategroyTd.text(dm.senderCategory);
				
				//아이디
				const senderTd = $("<td>");
				senderTd.text(dm.sender);
				
				//문의유형
				const typeTd = $("<td>");
				typeTd.text(dm.dmType);
				
				if(dm.dmType == 0){
					typeTd.text("결제/취소")
				}else if(dm.dmType==1){
					typeTd.text("예약")
				}else{
					typeTd.text("기타문의")
				}
				const typeHidden = $("<input type='hidden' class='dm-type-hidden'>");
				typeHidden.val(dm.dmType);
				typeTd.append(typeHidden);
				
				//문의내용
				const contentTd = $("<td>");
				const div = $("<div>");
				contentTd.append(div);
				
				div.addClass("tdContent");
				div.text(dm.dmContent);
				div.css("fontWeight","900");
				div.css("cursor","pointer");	
				div.css("width","300");
				div.css("overflow","hidden");
				div.css("text-overflow","ellipsis");
				div.css("white-space","nowrap");
				
				div.attr("onclick","modal(this,'"+dm.sender+"')");  //자기자신을 보내주고
				
				//날짜
				const dmDateTd = $("<td>");
				dmDateTd.text(dm.dmDate);
				
				//답변여부
				const readTd = $("<td>");
				if(dm.readCheck == 0){
					readTd.css("fontWeight","900");
					readTd.css("color","red");
					readTd.text("답변대기");
				}else{
					readTd.text("답변완료");
					readTd.css("color","black");
				}
				tr.append(noTd).append(senderCategroyTd).append(senderTd).append(typeTd).append(contentTd).append(dmDateTd).append(readTd);
				tbody.append(tr);
			}
		},
		error : function(){
			alert("err");
		}
	});

	}
	
