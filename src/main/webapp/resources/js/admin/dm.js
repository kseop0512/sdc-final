//쪽지 페이지 들어왔을 때 받은 쪽지, 보낸 쪽지 list 나오게 

$(function(){
	getReceiveDm(); 
});


/* 받은 쪽지 가져오기*/

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
				
				//문의내용
				const contentTd = $("<td>");
				contentTd.text(dm.dmContent);
				contentTd.attr("onclick","modal("+dm.dmNo+")"); 
				
				//날짜
				const dmDateTd = $("<td>");
				dmDateTd.text(dm.dmDate);
				
				//답변여부
				const readTd = $("<td>");
				if(dm.readCheck == 0){
					tr.addclass("blod");
					readTd.text("답변하기");
				}else{
					readTd.text("답변대기");
				}
				tr.append(noTd).append(senderTd).append(typeTd).append(contentTd).append(dmDateTd).append(readTd);
				tbody,append(tr);
			
			}
		},
		error : function(){
		
		}
	
	});

	
	}