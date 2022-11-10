/*
$(function(){
	getPartnerCount();
});


function getPartnerCount(){

$.ajax({
		url :"/partnerCount.do",
		success: function(data){
			$("#partnerCount").append(data);
		},
		error : function(){
			console.log("err");
		}
	
	});
}
*/

/*문의제목 눌렀을때 모달 띄우기*/ 
function modal(obj){
    $(".modal-modal").show();
    $(".modalmodel-wrap").show();
    
    const pNo = $(obj).prev().text();
    
    $.ajax({
    	url :"/onePartner.do",
    	data : {pNo:pNo},
    	success : function(data){
    		console.log(data);
    	}
    
    });
}

 /* 닫기 버튼 눌렀을때 */
function closeModal(){
    $(".modal-modal").hide();
    $(".modalmodel-wrap").hide();
    $("#detailText").val(""); 
}



//파트너 승인 
function partnerGrade(obj){
	
	const gradeType = $(obj).parent().prev().children().val();
	const pNo = $(obj).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
	const email = $(obj).parent().prev(). prev().prev().prev().prev().prev().prev().text();
	
	console.log(gradeType);
	console.log(pNo);
	console.log(email);
	
	location.href="/upgradeOk.do?pNo="+pNo+"&gradeType="+gradeType+"&email="+email;

}


//파트너 승인 상세보기 






