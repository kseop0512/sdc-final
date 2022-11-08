/*모달 버튼 js*/
let qNo = 0;
let hqNo = 0;
const q1=$(".q1");
const q2=$(".q2");
const q3=$(".q3");
const q4=$(".q4");
const q5=$(".q5");
const q6=$(".q6");
const q7=$(".q7");
const q8=$(".q8");
const hq1=$(".hq1");
const hq2=$(".hq2");
const hq3=$(".hq3");
var social; //사회성 점수
var sense; //예민성
var active; //활동성
var inde; //독립성
$(".socialBtn").click(function(){
	$(".psnModal").fadeIn();
	q1.show();
	qNo = 1;
});
$(".healthBtn").click(function(){
	$(".hltModal").fadeIn();
	hq1.show();
	hqNo = 1;
});
$(".nextBtn").click(function(){
	switch(qNo){
	case 1:
		if($("input[name=question1]").is(":checked")){
			q1.hide();
			q2.show();
			qNo = 2;
			
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	
	case 2:
		if($("input[name=question2]").is(":checked")){
			q2.hide();
			q3.show();
			qNo = 3;					
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	
	case 3:
		if($("input[name=question3]").is(":checked")){
			q3.hide();
			q4.show();
			qNo = 4;					
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	
	case 4:
		if($("input[name=question4]").is(":checked")){
			q4.hide();
			q5.show();
			qNo = 5;					
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	
	case 5:
		if($("input[name=question5]").is(":checked")){
			q5.hide();
			q6.show();
			qNo = 6;					
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	
	case 6:
		if($("input[name=question6]").is(":checked")){
			q6.hide();
			q7.show();
			qNo = 7;					
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	
	case 7:
		if($("input[name=question7]").is(":checked")){
			q7.hide();
			q8.show();
			qNo = 8;					
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	
	case 8:
		if($("input[name=question8]").is(":checked")){
			q8.hide();
			$(".psnModal").fadeOut();
			$(".socialBtn").css("background-color","#ffb347");					
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	}
});

$(".exitBtn").click(function(){
	switch(qNo){
	case 1:
		$(".psnModal").fadeOut();
		qNo = 0;
		break;
	
	case 2:
		q2.hide();
		q1.show();
		qNo = 1;
		break;
	
	case 3:
		q3.hide();
		q2.show();
		qNo = 2;
		break;
	
	case 4:
		q4.hide();
		q3.show();
		qNo = 3;
		break;
	
	case 5:
		q5.hide();
		q4.show();
		qNo = 4;
		break;
	
	case 6:
		q6.hide();
		q5.show();
		qNo = 5;
		break;
	
	case 7:
		q7.hide();
		q6.show();
		qNo = 6;
		break;
	
	case 8:
		q8.hide();
		q7.show();
		qNo = 7;
		break;
	}
});

$(".h-nextBtn").click(function(){
	switch(hqNo){
	case 1:
		if($("input[name=hquestion1-1]").is(":checked")||$("input[name=hquestion1-2]").is(":checked")||$("input[name=hquestion1-3]").is(":checked")||$("input[name=hquestion1-4]").is(":checked")||$("input[name=hquestion1-5]").is(":checked")){
			hq1.hide();
			hq2.show();
			hqNo = 2;
			
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	
	case 2:
		if($("input[name=hquestion2-1]").is(":checked")||$("input[name=hquestion2-2]").is(":checked")||$("input[name=hquestion2-3]").is(":checked")){
			hq2.hide();
			hq3.show();
			hqNo = 3;
			
		}else{
			alert("답변을 선택해주세요");
		}
		break;
	case 3:
		$(".hltModal").fadeOut();
		$(".healthBtn").css("background-color","#ffb347");
		hq3.hide();
		break;
	}
});
$(".h-exitBtn").click(function(){
	switch(hqNo){
	case 1:
		$(".hltModal").fadeOut();
		hqNo = 0;
		break;
	
	case 2:
		hq2.hide();
		hq1.show();
		hqNo = 1;
		break;
	
	case 3:
		hq3.hide();
		hq2.show();
		hqNo = 2;
		break;
	}
});

$("input:radio").click(function(){
	const radio = $(this);
	if(radio.hasClass("is-active")) {
		radio.prop("checked", false);
		radio.removeClass("is-active");
	} else {
		radio.prop("checked", true);
		radio.addClass("is-active");	
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
});

$("#hq1a5").click(function(){
	$("#hq1a1").prop("checked", false);
	$("#hq1a1").removeClass("is-active");
	$("#hq1a2").prop("checked", false);
	$("#hq1a2").removeClass("is-active");
	$("#hq1a3").prop("checked", false);
	$("#hq1a3").removeClass("is-active");
	$("#hq1a4").prop("checked", false);
	$("#hq1a4").removeClass("is-active");
});
$("#hq2a3").click(function(){
	$("#hq2a1").prop("checked", false);
	$("#hq2a1").removeClass("is-active");
	$("#hq2a2").prop("checked", false);
	$("#hq2a2").removeClass("is-active");
});
$("#hq1a1").click(function(){
	$("#hq1a5").prop("checked", false);
	$("#hq1a5").removeClass("is-active");
});
$("#hq1a2").click(function(){
	$("#hq1a5").prop("checked", false);
	$("#hq1a5").removeClass("is-active");
});
$("#hq1a3").click(function(){
	$("#hq1a5").prop("checked", false);
	$("#hq1a5").removeClass("is-active");
});
$("#hq1a4").click(function(){
	$("#hq1a5").prop("checked", false);
	$("#hq1a5").removeClass("is-active");
});
$("#hq2a1").click(function(){
	$("#hq2a3").prop("checked", false);
	$("#hq2a3").removeClass("is-active");
});
$("#hq2a2").click(function(){
	$("#hq2a3").prop("checked", false);
	$("#hq2a3").removeClass("is-active");
});