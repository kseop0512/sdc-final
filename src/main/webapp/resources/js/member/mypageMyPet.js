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