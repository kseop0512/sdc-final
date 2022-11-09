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

// trainerBoardFrm.jsp
function deleteFile(btn){
	const delBtn = $(btn);
	const inputFile = delBtn.prev();
	if(inputFile.val()==''){
		return;
	}else{
		inputFile.val("");
		// delBtn.closest(".input-group").remove();
	}
}


//추가
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
	
	// 오늘 yyyy-MM-dd
	const todayYmd = new Date().toISOString().substring(0, 10)
	let disabledDates = []

	// 비활성화할 날짜 목록 로드
	$.ajax({
		url: "/disabled-dates.do",
		data: {},
		success: function (data) {
			console.log('loaded disabled-dates', data);
			disabledDates = data;
		}
	});
  
  var calendar = new FullCalendar.Calendar(calendarEl, {
    locale: 'ko', // 한국어 설정
    selectable: true,
    headerToolbar: {
      left: 'prev,next',
      center: 'title',
      right: 'today',
    },
    
 	selectAllow: function (evt) {
			console.log('selectAllow', evt)
			const clickedYmd = evt.startStr; // ex) clickedDay = '2022-11-08'
			console.log("clickedYmd="+clickedYmd);
			console.log(todayYmd);
			// 선택한 날짜가 오늘 날짜보다 작으면 선택 불가능
			if (clickedYmd <= todayYmd) {
				
				return false
			}

			// 선택한 날짜가 disabledDates에 포함되어 있으면 불가능
			if (disabledDates.includes(clickedYmd)) {
				return false
			}

			// 그 외에는 선택 허용
			return true
		},
    
    select: function(info) {
      const selectedDate = info.startStr;
      const showDate = $(".showDate");
      showDate.empty();
      showDate.append(selectedDate);
      $("input[name=startDate]").attr("value",selectedDate);
      // 시간 조회하기
      var pNo = $("input[name=pNo]").val();
    	const times = $(".list_time>li");
    	times.removeClass("unAvailable_time");
    	times.addClass("available_time");  
      $.ajax({
      	url: "/selectBookingTime.do",
      	data: {PNo:pNo, startDate:selectedDate},
      	success: function(data){
      		console.log(data);
      		if(data != 0){
      			for(let i=0;i<times.length;i++){
      				for(let j=0;j<data.length;j++){
	      				if(times.eq(i).text() === data[j]){
	      					times.eq(i).removeClass("available_time");
	      					times.eq(i).addClass("unAvailable_time");
	      				} 
      				
      				}
      			}
			}
		}
      });
      
     //end 시간조회하기
    }
  });

  calendar.render();
  
});
// 시간 출력
let timeArr = new Array();
$(".available_time").on("click",function(){
	if($(".showDate").text()==''){
		alert("예약 날짜를 선택해주세요");
		event.preventDefault();
	}else{
	const selectedTime = $(this).text();
	timeArr.push(selectedTime);
	const timeSpan = $(".showTime");
	timeSpan.append("["+selectedTime+"] ");
	$("input[name=bookingTime]").attr("value",timeArr);
	
	// 돈계산
	const totalFee = timeArr.length*120000;
	$("#totalFee").empty();
	$("#totalFee").append(totalFee);
	}
});

// 결제 
const IMP = window.IMP; // 생략 가능
        IMP.init("imp41006251");
        function requestPay() {
            // IMP.request_pay(param, callback) 결제창 호출
            const d = new Date();
            const date = d.getFullYear()+""+(d.getMonth()+1) + "" + d.getDate() + "" + d.getHours() + "" + d.getMinutes() + "" + d.getSeconds();
            IMP.request_pay({ // param
                pg: "html5_inicis",
                pay_method: "card",
                merchant_uid: "PLG-" + date,
                name: "똑독캣 예약하기",
                amount: $("#totalFee").text(),
                buyer_email: $("input[name=buyer_email]").val(),
                buyer_name: $("#buyer_name").val(),
                buyer_tel: $("input[name=bookingPhone]").val(),
                //buyer_addr: "인천시 서구 청라커낼로 163",
                buyer_postcode: "01181"
            }, function (rsp) { // callback
                if (rsp.success) {
                    $("form[name=booking_form]").submit();
                } else {
                    alert("예약 실패! 관리자에게 문의하세요")
                }
            });
        }