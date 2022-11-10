//nav 스크롤 이하일때 사라지는 js
$(function(){
     var lastScroll = 0;
     $(window).scroll(function(event){
          var scroll = $(this).scrollTop();
          console.log(scroll);
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