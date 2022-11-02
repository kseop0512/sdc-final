<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_pet.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<main id="main">
		<section class="mypage">
			<div class="mypage-container">
				<!-- 마이페이지 메뉴 리모컨 -->
				<div id="mypage-nav">
					<ul>
						<li><a href="/my_info.html">나의 정보</a></li>
						<li><a href="/my_pet.html" class="active">나의 똑독캣</a></li>
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
						<h4>고양이 등록</h4>
					</div>
					<div id="content-wrap">
						<div id="content">
							<form action="/petCatAdd.do" method="post">
							
								<input type="hidden" name="petType" value="2">
								<div>
									<label for="memberId">아이디</label>
									<input type="text" id="mId" name="memberId" value="${sessionScope.m.memberId}" readonly autocomplete="off">
								</div>
								<div>
									<label for="memberPw">비밀번호</label>
									<input type="password" id="mPw" name="memberPw" value="${sessionScope.m.memberPw}" autocomplete="off">
									<span id="pwSpan">* 정보를 수정하려면 비밀번호를 재입력하세요.</span>
								</div>
								<div>
									<label for="memberName">이름</label>
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
									<label for="memberBdate">생년월일</label>
									<input type="text" id="mBdate" name="memberBdate" value="${sessionScope.m.memberBdate}" autocomplete="off">
									<span id="bdateSpan"></span>
								</div>
								<div>
									<label for="memberAddr">주소</label>
									<input type="text" id="mAddr" name="memberAddr" value="${sessionScope.m.memberAddr}" autocomplete="off">
								</div>
								<div>
									<label for="memberPhone">전화번호</label>
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
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>