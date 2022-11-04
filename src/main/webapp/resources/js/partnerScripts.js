/*!
    * Start Bootstrap - SB Admin v7.0.5 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2022 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});



// 주소API 열기
$(".btn-addr-search").on("click", function() {
    new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data);
        	const roadAddr = data.roadAddress;
        	const jibunAddr = data.jibunAddress;
        	if(roadAddr != ''){
        		const roadAddr = data.roadAddress;
        		$("input[name=pAddr]").attr("value",roadAddr);
        		console.log(roadAddr);
        	}else if(jibunAddr !== ''){
        		const jibunAddr = data.jibunAddress;
        		$("input[name=pAddr]").attr("value",jibunAddr);
        	}
        }
    }).open();
});

// 파트너 비밀번호 변경 유효성 검사
 $("#password1").on("keyup",function(){
	const pwValue = $(this).val();
	const pwComment = $(this).next();
	
  	const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}/;

    if(pwReg.test(pwValue)){
	    pwComment.css("color","blue");
    }else{	   
	    pwComment.css("color","red");
 	 }
});

// 파트너 변경 비밀번호 일치해야만 버튼 활성화 -> update password
$(".chkNewPw").on("click",function(){
	const newPw = $("#password1").val();
	const chkPw = $("#password2").val();
	if (newPw == chkPw){		
		const pId = $("#partnerId").val();
		location.href = "/changePw.do?pId="+pId+"&&pPw="+chkPw;
	}else{	
		event.preventDefault();
		alert("비밀번호가 일치하지 않습니다.");
	}
});

// 파트너 등급기준 표 보여주기

$("#gradeTbl").on("click",function(){
	$(".gradeTable").slideDown();
 });

// 프로필 변경사진 띄워주기
function loadImg(f){
	if(f.files.length!=0 && f.files[0]!=0){
		const reader = new FileReader(); 
		reader.readAsDataURL(f.files[0]);
		reader.onload = function(e){
			$("#profileImg").attr("src",e.target.result);
		}
	}else{
		$("#profileImg").attr("src","");
	}
}

// trainerBoardFrm.jsp  - summernote
$(document).ready(function(){
	$("#summernote").summernote({
		height: 200,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: "ko-KR",
		placeholder: '자기소개글을 작성해주세요'
	});
}); 


// required alert
 $(".uploadBtn").on("click",function(){
	const title = $("input[name=boardTitle]").val();
	
if(title == ''){
	alert("제목을 입력해주세요");
	event.preventDefault();
	}
});

// trainerBookingPage.jsp
// 달력
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    selectable: true,
    headerToolbar: {
      left: 'prev,next',
      center: 'title',
      right: 'today'
    },
    select: function(info) {
      const selectedDate = info.startStr;
      const showDate = $(".showDate");
      showDate.empty();
      showDate.append(selectedDate);
      input[name=bookingDate].attr("value",selectedDate);
    },
   
  });

  calendar.render();
  
});
// 시간 출력
let timeArr = new Array();
$(".time").on("click",function(){
	if($(".showDate").text()==''){
		alert("예약 날짜를 선택해주세요");
		event.preventDefault();
	}else{
	const selectedTime = $(this).text();
	timeArr.push(selectedTime);
	const timeSpan = $(".showTime");
	timeSpan.append("["+selectedTime+"] ");
	input[name=bookingTime].attr("value",selectedTime);
	// 돈계산
	const totalFee = timeArr.length*120000;
	$("#totalFee").empty();
	$("#totalFee").append(totalFee);
	}
});

