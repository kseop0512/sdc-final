<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 마이페이지</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<!-- 마이페이지 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_myinfo.css">
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
						<li><a href="/memberMypage.do" class="active">나의 정보</a></li>
						<li><a href="/mypageMyPet.do">나의 똑독캣</a></li>
						<li><a href="/mypageMessage.do">1:1 문의내역</a></li>
						<li><a href="/mypageService.do?memberId=${sessionScope.m.memberId }">이용내역</a></li>
						<li><a href="/mypagePetDiary.do">돌봄·훈련일지</a></li>
						<li><a href="/mypageQnA.do">훈련사Q&A</a></li>
						<li><a href="/withdraw.do">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
				<div id="mypage-content">
					<div id="title">
						<h4>나의 정보</h4>
					</div>
					<div id="content-wrap">
						<div id="content">
							<form action="/memberUpdate.do" method="post">
								<div>
									<label for="mId">아이디</label>
									<input type="text" id="mId" name="memberId" value="${sessionScope.m.memberId}" readonly autocomplete="off">
								</div>
								<div>
									<label for="mPw">비밀번호</label>
									<input type="password" id="mPw" name="memberPw" placeholder="* 현재 비밀번호 혹은 새 비밀번호를 입력하세요" autocomplete="off">
									<span id="pwSpan"></span>
								</div>
								<div>
									<label for="mName">이름</label>
									<input type="text" id="mName" name="memberName" value="${sessionScope.m.memberName}" autocomplete="off">
								</div>
								<div id="gender-div">
									<label>성별</label>
									<input type="hidden" value="${sessionScope.m.memberGender }" id="mGender">
									<input type="radio" id="m" name="memberGender" value="M">
									<label for="m" class="radio-label">남</label>
									<input type="radio" id="f" name="memberGender" value="F"> 
									<label for="f" class="radio-label">여</label>
								</div>
								<div>
									<label for="mBdate">생년월일</label>
									<input type="text" id="mBdate" name="memberBdate" value="${sessionScope.m.memberBdate}" autocomplete="off">
									<span id="bdateSpan"></span>
								</div>
								<div>
									<label for="mAddr">주소</label>
									<input type="text" id="mAddr" name="memberAddr" value="${sessionScope.m.memberAddr}" autocomplete="off" readonly>
								</div>
								<div>
									<label for="mPhone">전화번호</label>
									<input type="text" id="mPhone" name="memberPhone" value="${sessionScope.m.memberPhone}" autocomplete="off">
									<span id="phoneSpan"></span>
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
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script type="text/javascript" src="/resources/js/member/mypage_myinfo.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>