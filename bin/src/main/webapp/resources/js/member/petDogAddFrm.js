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
var social //사회성 점수
var sense //예민성
var active //활동성
var inde //독립성



$(".socialBtn").click(function(){
	$(".psnModal").fadeIn();
	social = 0;
	sense = 0;
	active = 0;
	inde = 0;
	$("#socialInput").val(social);
	$("#senseInput").val(sense);
	$("#activeInput").val(active);
	$("#indeInput").val(inde);
	q1.show();
	qNo = 1;
});
$(".healthBtn").click(function(){
	$(".hltModal").fadeIn();
	hq1.show();
	$("#health1").val("");
	$("#health2").val("");
	$("#health3").val("");
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
		//q1
		if($("#q1a1").is(":checked")){
			social += 2;
		}else if($("#q1a2").is(":checked")){
			sense += 1;
		}else if($("#q1a3").is(":checked")){
			sense += 1;
			social -= 1;
		}else if($("#q1a4").is(":checked")){
			sense += 1;
			social -= 2;
		}else if($("#q1a5").is(":checked")){
			sense += 1;
			social += 1;
		};
		//q2
		if($("#q2a1").is(":checked")){
			social += 2;
		}else if($("#q2a2").is(":checked")){
			sense += 1;
			social -= 1;
		}else if($("#q2a3").is(":checked")){
			sense += 1;
			social -= 1;
		}else if($("#q2a4").is(":checked")){
			inde += 1;
			social += 1;
		}
		//q3
		if($("#q3a1").is(":checked")){
			sense -= 2;
			social += 1;
		}else if($("#q3a2").is(":checked")){
			social += 1;
		}else if($("#q3a3").is(":checked")){
			inde += 1;
		}else if($("#q3a4").is(":checked")){
			sense += 2;
			social -= 1;
		}
		//q4
		if($("#q4a1").is(":checked")){
			sense -= 2;
			active += 1;
		}else if($("#q4a2").is(":checked")){
			
		}else if($("#q4a3").is(":checked")){
			sense += 2;
		}else if($("#q4a4").is(":checked")){
			sense -= 1;
			inde += 1;
		}
		//q5
		if($("#q5a1").is(":checked")){
			active += 1;
		}else if($("#q5a2").is(":checked")){
			active += 2;
		}else if($("#q5a3").is(":checked")){
			active -= 1;
		}else if($("#q5a4").is(":checked")){
			active += 1;
		}else if($("#q5a5").is(":checked")){
			active += 2;
		}else if($("#q5a6").is(":checked")){
			active -= 1;
		}
		//q6
		if($("#q6a1").is(":checked")){
			active += 2;
		}else if($("#q6a2").is(":checked")){
			active += 1;
		}else if($("#q6a3").is(":checked")){
			active -= 1;
			social += 1;
		}else if($("#q6a4").is(":checked")){
			active -= 2;
		}
		//q7
		if($("#q7a1").is(":checked")){
			inde -= 2;
		}else if($("#q7a2").is(":checked")){
			inde += 2;
		}
		//q8
		if($("#q8a1").is(":checked")){
			inde += 2;
		}else if($("#q1a2").is(":checked")){
			
		}else if($("#q1a3").is(":checked")){
		
		}
		$("#socialInput").val(social);
		$("#senseInput").val(sense);
		$("#activeInput").val(active);
		$("#indeInput").val(inde);
		$("#character1").val($("input[name=question1]:checked").val());
		$("#character2").val($("input[name=question2]:checked").val());
		$("#character3").val($("input[name=question3]:checked").val());
		$("#character4").val($("input[name=question4]:checked").val());
		$("#character5").val($("input[name=question5]:checked").val());
		$("#character6").val($("input[name=question6]:checked").val());
		$("#character7").val($("input[name=question7]:checked").val());
		$("#character8").val($("input[name=question8]:checked").val());
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
		var h1Answer = $("input[name=hquestion1-1]:checked").val() + $("input[name=hquestion1-2]:checked").val() + $("input[name=hquestion1-3]:checked").val() + $("input[name=hquestion1-4]:checked").val() + $("input[name=hquestion1-5]:checked").val();
		h1Answer = h1Answer.replace(/undefined/gi, "");
		h1Answer = h1Answer.replace(/NaN/gi, "");
		var h2Answer = $("input[name=hquestion2-1]:checked").val() + $("input[name=hquestion2-2]:checked").val() + $("input[name=hquestion2-3]:checked").val();
		h2Answer = h2Answer.replace(/undefined/gi, "");
		h2Answer = h2Answer.replace(/NaN/gi, "");
		$("#health1").val(h1Answer);
		$("#health2").val(h2Answer);
		$("#health3").val($("#hq3a1").val());
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


//프로필 사진
function loadImg(f){
	//첨부파일이 여러개일 수 있으므로 항상 배열 처리
	console.log(f.files);//input에서 file을 선택하면 해당 파일이 들어있는 배열
	if(f.files.length !=0 && f.files[0] != 0){
		const reader = new FileReader(); //파일 정보를 읽어올 수 있는 객체
		reader.readAsDataURL(f.files[0]); //선택한 파일 정보 읽어옴
		//파일리더가 파일을 다 읽어오면 동작할 함수 작성
		reader.onload = function(e){
			$("#img-view").attr("src",e.target.result);
		}
	}else{
		//이미지 교체되면 src 비움
		$("#img-view").attr("src","");
	}
}

//nav 스크롤 220이하일때 사라지는 js
$(function(){
	     var lastScroll = 0;
	     $(window).scroll(function(event){
	          var scroll = $(this).scrollTop();
	          console.log(scroll);
	          if (scroll > 220){
	          //이벤트를 적용시킬 스크롤 높이
	               $("#mypage-nav").addClass("closeNav");
	          }
	          else {
	               $("#mypage-nav").removeClass("closeNav");
	          }
	          lastScroll = scroll;
	     });
	});
	
//width 900이하면 nav 사라짐
$(window).on("resize", function(){
      if (window.innerWidth <= 900) {
      	  $("#mypage-nav").addClass("closeNav");
	  }
	  else {
	      $("#mypage-nav").removeClass("closeNav");
	  }
});	