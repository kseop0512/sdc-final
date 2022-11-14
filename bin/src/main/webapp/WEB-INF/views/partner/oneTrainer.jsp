<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>똑독캣 (SDC) | 강아지 전문 훈련사 </title>
    <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    <link href="/resources/css/partner/trainerStyles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
<main id="oneTrainer">
	<div class="page-top">
		<div class="top-left"><img src="/resources/upload/partner/trainerFiles/${tb.fileList[0].imgPath }"></div>
		<div class="top-right">
			<div class="right-top"><img src="/resources/upload/partner/trainerFiles/${tb.fileList[1].imgPath }"></div>
			<div class="right-bottom"><img src="/resources/upload/partner/trainerFiles/${tb.fileList[2].imgPath }"></div>
		</div>
	</div>
	
	<div class="page-main">
		<div class="main-left">
			<div class="prof-img">
				<img src="/resources/upload/partner/profileImg/${tb.trainerImg }">
			</div>
			<div class="title-wrapper">
				<h2>${tb.boardTitle }</h2>
				<div>${tb.trainerName }훈련사 !5!점</div>
			</div>
			<div class="carrers">
				<div class="top-career">
					<img src="/resources/img/good.png" style="width: 32px; height: 32px;">
					<div style="margin-top: 4px; margin-left: 18px;">
						<p class="careers-title">대표경력</p>
						<p class="careers-insert">${tb.topExp }</p>
					</div>
				</div>
				<div class="prof-field">
					<img src="/resources/img/trophy.png" style="width: 32px; height: 32px;">
					<div style="margin-top: 4px; margin-left: 18px;">
						<p class="careers-title">전문 분야</p>
						<p class="careers-insert">${tb.profField }</p>
					</div>
				</div>
				<div class="visit-area">
					<img src="/resources/img/home.png" style="width: 32px; height: 32px;">
					<div style="margin-top: 4px; margin-left: 18px;">
						<p class="careers-title">방문 지역</p>
						<p class="careers-insert">${tb.visitArea }</p>
					</div>
				</div>
			</div>
			<div class="experiences">
				<div style="margin: 50px 10px;"><p>경력·자격</p></div>
				<c:forTokens items="${p.license }" var="li" delims="/">
				<div style=" padding-bottom: 45px; overflow: hidden;">
					<div style="float: left; width: 45px; height: 45px; margin-left: 45px;"><span class="material-symbols-outlined" style="font-size: 30px; color:#333333">menu_book</span></div>
					<div style="color: #333333;float: left;font-size: 16px; font-weight: 500; letter-spacing: -0.2px;line-height: 30px;">${li }</div>
				</div>
				</c:forTokens>
				
			</div>
			<div class="about-me">
				<div style="margin-top: 50px;"><p>자기소개</p></div>
				<div style="margin-top: 28px;"><p>${tb.aboutMe }</p></div>
			</div>
			<div class="comments-wrapper" style="padding-top: 50px;">
				<div class="comments-title">
					<p>고객 후기</p>
				</div>
				<!-- forEach로 후기 호출하기 -->
				<div class="comments-main">
					<div></div>
					<div style="margin-top: 32px;">
						<p>!훈련 너무 좋은시간이었어요~~!! 전에 훈련사님은 어쩌고저쩌고 ㅠㅠ 근데 너무 좋아요!</p>
					</div>
					<div class="file-wrapper">
						<!-- forEach로 후기사진 호출하기 -->
						<div><img src=""></div>
					</div>
				</div>
			</div>
		</div>
		<div class="main-right">
			<div class="askBox-wrapper">
				<p>궁금한 내용이 있다면, <strong>${tb.trainerName }</strong> 훈련사님께 교육 문의를 보내보세요!</p>
				<div>
					<span>문의하기</span>
				</div>
			</div>
			<div class="fee-wrapper">
				<div><p>이용요금</p></div>
				<div>
					<div><p>방문 교육 (60분)</p></div>
					<div><p>₩120,000</p></div>
				</div>
			</div>
			
			<div class="askBox-wrapper" style="margin-top: 38px;">
				<c:choose>
				<c:when test="${empty sessionScope.m }">
				<div style="margin-top: 0; font-size: 18px; font-weight: 600;">예약 요청(회원전용)</div>
				</c:when>
				<c:when test="${not empty sessionScope.m}">
				<div id="bookingBtn" onclick="location.href='/bookTrainerFrm.do?pNo=${tb.PNo}&&memberNo=${sessionScope.m.memberNo }'" style="margin-top: 0; font-size: 18px; font-weight: 600; cursor: pointer;">실시간 예약하기</div>
				</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="/resources/js/partnerScripts.js"></script>

</body>
</html>	