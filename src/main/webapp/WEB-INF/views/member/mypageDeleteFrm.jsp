<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 마이페이지</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 마이페이지 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_myinfo.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>
</head>
<style>
.sweet-alert h2{
	font-size: 21px;
}
.deleteSpan{
	color: white;
}
.closeNav{
	display: none !important;
}
#mypage-nav{
    width: 200px;
    position: fixed;
    top: 200px;
    transition-duration: 0.5s;
}
.deleteMBtn{
	background: lightgray;
	position: absolute;
    bottom: 50px;
    width: 300px;
    height: 70px;
    left: 530px;
	
}
.deleteMBtn:hover{
	background: #ffa526;
    color: white;
}
</style>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<!-- main -->
	<main id="main">
		<section class="mypage">
			<div class="mypage-container" style="left:-100px;">
				<!-- 마이페이지 메뉴 리모컨 -->
				<div id="mypage-nav" style="left:100px;">
					<ul>
						<li><a href="/memberMypage.do">나의 정보</a></li>
						<li><a href="/mypageMyPet.do?memberNo=${sessionScope.m.memberNo }">나의 똑독캣</a></li>
						<li><a href="/mypageMessage.do">1:1 문의내역</a></li>
						<li><a href="/mypageService.do">서비스 이용내역</a></li>
						<li><a href="/mypageDeleteFrm.do?memberNo=${sessionScope.m.memberNo }" class="active">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
				<div id="mypage-content">
					<div id="title" style="height: 80px;padding-top: 35px;width:800px;border-bottom: 3px solid rgba(255, 255, 255, 0.2);position: absolute;">
						<h4>회원탈퇴</h4>
					</div>
					<div id="content-wrap">
						<div id="content" style="width:800px;display:flex;justify-content: center;">
<textarea style="resize: none;width: 800px;height: 400px;margin-left: -110px;position: relative;top: 100px;left: -2px;background: #fff0d9;padding-left: 10px;"readonly>

회원탈퇴 시 개인정보 및 똑독캣에서 만들어진 모든 데이터는 삭제됩니다.
(단, 아래 항목은 표기된 법률에 따라 특정기간 동안 보관됩니다.)

1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존기간 : 5년
2. 대금결제 및 재화 등의 공급에 관한 기록보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존기간 : 5년
3. 전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 : 5년
4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 :  전자상거래 등에서의 소비자보호에 관한 법률 보존기간 / 3년
5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한 법률 보존기간 / 3년
6. 전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사항 고시*국세청 고시 제 2016-3호)
(전자세금계산서 사용자에 한함) : 5년
(단, (세금)계산서 내 개인식별번호는 3년 경과 후 파기)

유의사항
회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며,해당 아이디는 영구적으로 삭제되어 재가입이 불가합니다.</textarea>
						</div>
						<span class="deleteSpan" style="position: relative;top: 110px;left: 12vw;font-size: 18px;">해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다<input type="checkbox" class="deleteChk"></span>
						<button type="button" class="deleteMBtn" onclick="deleteMember('${sessionScope.m.memberId}');">탈퇴하기</button>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	<script>
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
	function deleteMember(memberId){
		var delChk = $(".deleteChk").is(":checked");
		if(delChk){
			swal({
				title: "완료되지 않은 예약이 있을경우 탈퇴되지 않습니다. 정말 탈퇴하시겠습니까?",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "예",
				cancelButtonText: "아니요",
				closeOnConfirm: false,
				closeOnCancel : true
			}, function (isConfirm) {
				if (!isConfirm) return;
				jQuery.ajax({
					type : "POST",
					url : "/getBookingAccept.do",
					data : { memberId : memberId},
					cache: false,
					dataType : "json",
					success : function(data) {
						if(data.includes("R" || "Y" || "C")){
							swal({
								title: "처리가 완료되지 않은 예약내역이 있습니다.\n이용내역으로 가시겠습니까?",
								type: "error",
								showCancelButton: true,
								confirmButtonColor: "#DD6B55",
								confirmButtonText: "예",
								cancelButtonText: "아니요",
								closeOnConfirm: false,
								closeOnCancel : true
							}, function (isConfirm) {
								if(isConfirm){								
									location.href="/mypageService.do";
								}else{									
									location.href="/memberMypage.do";
								}
							});
						}else{
							location.href="/deleteMember.do?memberId="+memberId;
						}
						
					}
				});
			});
		}else{
			swal("실패", "탈퇴 약관에 동의해주세요.", "error");
		}
	}
	</script>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script type="text/javascript" src="/resources/js/member/mypage_myinfo.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>