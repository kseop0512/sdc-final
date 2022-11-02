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
</head>
<body>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
<main id="main">
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
				<img src="/resources/upload/partner/profileImg/${p.profilePath }">
			</div>
			<div class="title-wrapper">
				<h2>${tb.boardTitle }</h2>
				<div>${tb.trainerName }훈련사 5점!</div>
			</div>
			<div class="carrers">
				<div class="top-career"></div>
				<div class="prof-field"></div>
				<div class="visit-area"></div>
			</div>
			<div class="experiences">
				<div style="margin-top: 50px;"><p>경력·자격</p></div>
				<div>${p.license }</div>
			</div>
			<div class="about-me">
				<div style="margin-top: 50px;"><p>자기소개</p></div>
				<div style="margin-top: 28px;"><p>${tb.aboutMe }</p></div>
			</div>
			<div class="user-comments">!고객후기!</div>
		</div>
		<div class="main-right">
			<div class="askBox-wrapper"></div>
			<div class="fee-wrapper"></div>
			<div class="schedule-wrapper"></div>
		</div>
	</div>
</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="/resources/js/partnerScripts.js"></script>

</body>
</html>	