//쪽지 페이지 들어왔을 때 받은 쪽지, 보낸 쪽지 list 나오게 

$(function(){
	getReceiveDm(); 
	getdmMaxCount();
});


/* 사용자/파트너가 보낸  문의내용 가져오기*/

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
				
				//아이디
				const senderTd = $("<td>");
				senderTd.text(dm.sender);				
				
				//문의유형
				const typeTd = $("<td>");
				typeTd.text(dm.dmType);
			//	if(dm.dmType == 0){
			//		typeTd.text("결제/취소")
			//	}else if(dm.dmType==1){
			//		typeTd.text("예약")
			//	}else{
			//		typeTd.text("기타문의")
			//	}
				
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
					tr.addClass("blod");
					readTd.text("답변하기");
				}else{
					readTd.text("답변대기");
				}
				tr.append(noTd).append(senderTd).append(typeTd).append(contentTd).append(dmDateTd).append(readTd);
				tbody.append(tr);
			}
		},
		error : function(){
			alert("err");
		}
	});

	}
	
	function modal(obj,sender){			//자기자신을 obj로 받음 	
		$.ajax({
			url:"/detailMember.do",
			data : {sender : sender},
			success : function(data) {
			console.log(data);
			 $("#detailSender").text(data.memberName);//이름
			 $("#detailId").text(sender);//아이디	
			 $("#detailPhone").text(data.memberPhone);//핸드폰	
			 //문의유형
			 const detailType= $(obj).parent().prev().text();  //자기자신(리스트문의내용)을 기준으로  문의유형을 가지고옴.
			 $("#detailType").text(detailType);
			//날짜	
			const detailDate = $(obj).parent().next().text(); //자기자신(리스트문의내용)을 기준으로  다음요소인 날짜를 가지고-> modal에 띄워줌
			$("#detailDate").text(detailDate);
			//내용
			const detailContent = $(obj).text();
			$("#detailContent").text(detailContent);
			
			//모달을 보여줌 
			 $(".modalmodel-wrap").show();
			 $(".modal-modal").show();
			 
			 },

		});
	}


//1:1 문의 총 카운트 
 function getdmMaxCount(){
	$.ajax({
		url : "/dmCount.do",
		success: function(data){
			console.log(data);
			$("#dmMax_Count").append(data);
		},
		error : function(){
			console.log("err");
		}
	});
}





 /* 모달 닫기 버튼 눌렀을때 */
function closeModal(){
    $(".modal-modal").hide();
    $(".modalmodel-wrap").hide();
    $("#detailText").val(""); 
}

		
	