$(function(){
	getPartnerCount();
});


function getPartnerCount(){

$.ajax({
		url : "/partnerCount.do",
		success: function(data){
			$("#partnerCount").append(data);
		},
		error : function(){
			console.log("err");
		}
	
	});
}
