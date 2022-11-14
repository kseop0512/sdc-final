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
      <div class="container trainerList">
      	<c:forEach items="${boardList }" var="bl">
		<div class="box-wrapper">
			<div class="trainerBox">
				<div class="trainerImg"><img src="/resources/upload/partner/trainerFiles/${bl.fileList[0].imgPath }" style="width:100%; height: 100%"></div>
				<a class="trainerExp" href="/oneTrainer.do?tBoardNo=${bl.TBoardNo }" target="_blank">
					<div class="box-upper">
						<div class="upper-left">
							<p class="tName">${bl.trainerName } 훈련사</p>
							<h2 class="tTitle">${bl.boardTitle }</h2>
						</div>
						<img class="upper-right" src="/resources/upload/partner/profileImg/${bl.trainerImg }">
					</div>
					<div class="box-middle">${bl.hashTag }</div>
					<div class="box-bottom">
						<div class="bottom-wrapper">
							<div class="bottom-content">
								<div class="bt-content-left">별점</div>
								<div class="bt-content-right">₩120,000</div>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		</c:forEach>
		<c:choose>
		<c:when test="${not empty sessionScope.p && sessionScope.p.PGrade != 'N'}"> <!-- 준회원이 아닌 파트너만 글 작성 버튼 활성화 -->
		<input type="button" class="btn btn-outline-warning uploadBtn" onclick="location.href='/trainerBoardFrm.do'" value="훈련사 소개글 작성">
		</c:when>
		</c:choose>
      </div>
    </section>
</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="/resources/js/partnerScripts.js"></script>

</body>
</html>
