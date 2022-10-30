<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>똑독캣 (SDC) | 강아지 전문 훈련사 예약하기</title>
    <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    <link href="/resources/css/trainerStyles.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
<main id="main">
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">
			<div class="justify-content">
				<h1>훈련사를 소개합니다!</h1>
				<hr>
				<h4>나와 우리 반려견에게 꼭 맞는 훈련사를 찾아보세요!</h4>
			</div>
		</div>
	</section>	
	<section class="inner-page">
      <div class="container">
       	<c:forEach items="${list }" var="t">
			<div class="trainerBox">
				<div class="trainerImg"></div>
				<div class="trainerExp"></div>
			</div>
			<div class="trainerBox">
				<div class="trainerImg"></div>
				<div class="trainerExp">
					<div class="trainer">
						<div class="trainerTitle"></div>
						<div class="trainerProfile"></div>
					</div>
				</div>
			</div>
		</c:forEach>
      </div>
    </section>
</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="/resources/js/partnerScripts.js"></script>

</body>
</html>
