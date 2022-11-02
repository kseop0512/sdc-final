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
			
		
		}
	
	});

	
	}