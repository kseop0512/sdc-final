<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 쪽지함</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<!-- 마이페이지 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_message.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<!-- main -->
	<main id="main">
		<section class="mypage">
			<div class="mypage-container">
				<!-- 마이페이지 메뉴 리모컨 -->
				<div id="mypage-nav">
					<ul>
						<li><a href="/memberMypage.do">나의 정보</a></li>
						<li><a href="/mypagePet.do">나의 똑독캣</a></li>
						<li><a href="/mypageMessage.do" class="active">1:1 문의내역</a></li>
						<li><a href="/mypageService.do">이용내역</a></li>
						<li><a href="/mypagePetDiary.do">돌봄·훈련일지</a></li>
						<li><a href="/mypageQnA.do">훈련사Q&A</a></li>
						<li><a href="/withdraw.do">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
				<div id="mypage-content">
					<div id="title">
						<h4>1:1 문의내역</h4>
					</div>
					<div id="content-wrap">
						<div id="content">
							
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script type="text/javascript" src="/resources/js/member/mypage_message.js"></script>
</body>
</html>