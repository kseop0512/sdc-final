//nav 스크롤 이하일때 사라지는 js
$(function(){
     var lastScroll = 0;
     $(window).scroll(function(event){
          var scroll = $(this).scrollTop();
          if (scroll > 300){
          //이벤트를 적용시킬 스크롤 높이
               $("#mypage-nav").addClass("closeNav");
          }
          else {
               $("#mypage-nav").removeClass("closeNav");
          }
          lastScroll = scroll;
     });
});
	
$(window).on("resize", function(){
      if (window.innerWidth <= 900) {
      	  $("#mypage-nav").addClass("closeNav");
	  }
	  else {
	      $("#mypage-nav").removeClass("closeNav");
	  }
});

$(".pet-wrap").hover(function(){
	$(this).find(".petName").css("border-color","#ffb347");
	$(this).find(".petProfile").css("border","2px solid orange");
}, function(){
	$(this).find(".petName").css("border-color","#fff");
	$(this).find(".petProfile").css("border","2px solid #fff");
});

//펫 추가 모달
$(".img_btn-wrap").hide();
function petAddBtn(){
	$("#main").hide();
	$(".img_btn-wrap").show();
}
function back(){
	$("#main").show();
	$(".img_btn-wrap").hide();
}
$(".petBtn1").hover(function(){
	$(this).addClass("active");
	$(".textSpan1").addClass("text-active");
	$(".textSpan1").removeClass("petType");
}, function(){
	$(this).removeClass("active")
	$(".textSpan1").removeClass("text-active");
	$(".textSpan1").addClass("petType");
});

$(".petBtn2").hover(function(){
	$(this).addClass("active");
	$(".textSpan2").addClass("text-active");
	$(".textSpan2").removeClass("petType");
}, function(){
	$(this).removeClass("active");
	$(".textSpan2").removeClass("text-active");
	$(".textSpan2").addClass("petType");
});


//펫 상세 모달
$(".pdModal-wrap").hide();
	function petDetail(){
		$("#main").hide();
		$(".pdModal-wrap").show();

	}
	function pdModalClose(){
		$("#main").show();
		$(".pdModal-wrap").hide();
	}
	
	new Chart(document.getElementById("radar-chart"), {
	    type: 'radar',
	    data: {
	      labels: ["Independence", "Activity", "Min ~ Max", "Sociality","Sensitivity"],
	      datasets: [
	        {
	          label: "평균",
	          fill: true,
	          backgroundColor: "rgba(179,181,198,0.2)",
	          borderColor: "rgba(179,181,198,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(179,181,198,1)",
	          data: [5,5,0,5,5]
	        }, {
	          label: "철용",
	          fill: true,
	          backgroundColor: "rgba(255,99,132,0.2)",
	          borderColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          data: [4,3,10,8,7]
	        }
	      ]
	    },
	    options: {
		    title: {
		      display: true,
		      text: '철용이의 성향 그래프'
		    }   
	    }
	});