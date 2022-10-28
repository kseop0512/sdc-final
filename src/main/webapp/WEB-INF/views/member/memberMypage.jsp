<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 (SDC) | 펫시터, 훈련사, 그루머 예약서비스</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<!-- 마이페이지 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_myinfo.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>

	<main id="main">
		<section class="mypage">
			<div class="mypage-container">
				<!-- 마이페이지 메뉴 리모컨 -->
				<div id="mypage-nav">
					<ul>
						<li><a href="/my_info.html" class="active">나의 정보</a></li>
						<li><a href="/my_pet.html">나의 똑독캣</a></li>
						<li><a href="/my_message.html">1:1 문의내역</a></li>
						<li><a href="/my_service.html">이용내역</a></li>
						<li><a href="/my_pet_diary.html">돌봄·훈련일지</a></li>
						<li><a href="/my_qna.html">훈련사Q&A</a></li>
						<li><a href="/withdraw.html">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
				<div id="mypage-content">
					<div id="title">
						<h4>나의 정보</h4>
					</div>
					<div id="content-wrap">
						<div id="content">
							<form action="#" method="post">
								<div>
									<label for="memberId">아이디</label> <input type="text"
										id="memberId" name="memberId" value="memberId" readonly
										autocomplete="off">
								</div>
								<div>
									<label for="memberPw">비밀번호</label> <input type="text"
										id="memberPw" name="memberPw" value="memberPw"
										autocomplete="off">
								</div>
								<div>
									<label for="memberName">이름</label> <input type="text"
										id="memberName" name="memberName" value="memberName"
										autocomplete="off">
								</div>
								<div id="gender-div">
									<label>성별</label> <input type="radio" id="m"
										name="memberGender" value="m"> <label for="m"
										class="radio-label">남</label> <input type="radio" id="f"
										name="memberGender" value="f"> <label for="f"
										class="radio-label">여</label>
								</div>
								<div>
									<label for="memberBday">생년월일</label> <input type="text"
										id="memberBday" name="memberBday" value="memberBday"
										autocomplete="off">
								</div>
								<div>
									<label for="memberAddr">주소</label> <input type="text"
										id="memberAddr" name="memberAddr" value="memberAddr"
										autocomplete="off">
								</div>
								<div>
									<label for="memberPhone">전화번호</label> <input type="text"
										id="memberPhone" name="memberPhone" value="memberPhone"
										autocomplete="off">
								</div>
								<div>
									<input type="submit" value="정보수정">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 메뉴 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>