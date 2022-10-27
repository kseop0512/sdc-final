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

// 파트너 비밀번호 변경 유효성 검사
$("#password1").on("keyup",function(){
	console.log("asdf");
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

