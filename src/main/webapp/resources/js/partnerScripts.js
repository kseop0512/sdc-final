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
$("input[name=newPw]").on("focusout",function(){
	console.log("asdf");
	const pwValue = $(this).val();
	const pwComment = $(this).next();
	
  	const pwReg = /^[a-zA-Z0-9]{8,16}$/;
	const pwReg1 = /^[a-z]/;
	const pwReg2 = /^[A-Z]/;
	const pwReg3 = /^[0-9]/;
	const pwReg4 = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/;
	$(this).attr("style", "margin-bottom: 0px;");
	
    if(pwReg.test(pwValue)&&pwReg1.test(pwValue)&&pwReg2.test(pwValue)&&pwReg3.test(pwValue)&&pwReg4.test(pwValue)){
	    pwComment.text("Satisfied");
	    pwComment.css("color","blue");
    }else{
	    pwComment.text("8~16자의 영문 대소문자, 숫자, 특수문자")
	    pwComment.css("color","red");
	  
  }
});

