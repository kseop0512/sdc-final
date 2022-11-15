
$(function(){
	getPartnerCount();
});


function getPartnerCount(){

	$.ajax({
		url :"/bookingCount.do",
		success: function(data){
			$("#bookingCount").append(data);
		},
		error : function(){
			console.log("err");
		}
	
	});
}


/*문의제목 눌렀을때 모달 띄우기*/ 
function modal(obj){
    $(".modal-modal").show();
    $(".modalmodel-wrap").show();
    
   const bookingNo = $(obj).parent().prev().prev().text();

    $.ajax({
    	url :"/bookingDetail.do",
    	data : {bookingNo : bookingNo},
    	dataType:'json',
    	success : function(data){	
	
    		$("#detailNo").text(bookingNo); //예약번호
    		$("#detailId").text(data.memberId); //아이디
    		$("#detailPartnerNo").text(data.pNo); //파트너번호
    		$("#detailPetNo").text(data.petNo); //펫번호
    		$("#detailBookingDate").text(data.bookedDate); //예약일
    		$("#detailPartnerAccpet").text(data.partnerAccept); //예약현황
    			if(data.partnerAccept == 'C'){
    					$("#detailPartnerAccpet").text("취소처리중"); 
    			}else if(data.partnerAccept == 'N'){
    				$("#detailPartnerAccpet").text("취소완료");
    			}
    		$("#detailStart").text(data.startDate); //시작일
    		//$("#detailEnd").text(data.applyDate); //종료일
    		
    		const price = $(obj).parent().next().next().next().next().text();
    		$("#detailPrice").text(price+"원"); //가격
    		
    		
    		//$("#detailCancelComment").text(data.comment); //예약취소사유
    	}
    
    });
}


 /* 닫기 버튼 눌렀을때 */
function closeModal(){
    $(".modal-modal").hide();
    $(".modalmodel-wrap").hide();
    $("#detailText").val(""); 
}






