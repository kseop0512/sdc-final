
$(function(){
	getPartnerCount();
});


function getPartnerCount(){

	$.ajax({
		url :"/partnerGradeCount.do",
		success: function(data){
			$("#partnerCount").append(data);
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
    
    const pNo = $(obj).parent().prev().text();
    
    $.ajax({
    	url :"/onePartner.do",
    	data : {pNo:pNo},
    	success : function(data){
    		
    		$("#detailProfile").children().attr("src", "/resources/upload/partner/profileImg/" + data.profilePath); //프로필사진
    		$("#detailId").text(data.pId); //아이디
    		$("#detailName").text(data.pName); //이름
    		$("#detailHbd").text(data.pDob); //생년월일
    		$("#detailAddr").text(data.pAddr); //주소
    		$("#detailPhone").text(data.pPhone); //전화번호
    		$("#detailG").text(data.pGender); //성벌
    			if(data.pGender == 'M'){
    					$("#detailG").text("남"); 
    			}else{
    				$("#detailG").text("여");
    			
    			}
    		$("#detailApplydate").text(data.applyDate); //가입일
    		$("#detailLicence").text(data.license); //자격증
    		$("#detailWork").text(data.workExp); //근무경력
    		$("#detailMotive").text(data.applyMotiv); //지원동기
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





