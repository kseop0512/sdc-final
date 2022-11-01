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
<style>
	.uploadBtn{	
		display: block;
		margin: 50px auto 0 auto;
		height: 50px;
	}
</style>
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
		<div class="box-wrapper">
			<div class="trainerBox">
				<div class="trainerImg"><img src="/resources/upload/partner/boardFiles/훈련사게시글사진.jpeg"></div>
				<a class="trainerExp" href="/onePartner.do?p_no=pNo" target="_blank">
					<div class="box-upper">
						<div class="upper-left">
							<p class="tName">신혜규 훈련사</p>
							<h2 class="tTitle">우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요</h2>
						</div>
						<img class="upper-right" src="/resources/upload/partner/profileImg/훈련사사진1.png">
					</div>
					<div class="box-middle">#반려견전문가 #행동교정전문가</div>
					<div class="box-bottom">
						<div class="bottom-wrapper">
							<div class="bottom-content">
								<div class="bt-content-left">별점</div>
								<div class="bt-content-right">₩150,000</div>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="box-wrapper">
			<div class="trainerBox">
				<div class="trainerImg"><img src="/resources/upload/partner/boardFiles/훈련사게시글사진.jpeg"></div>
				<a class="trainerExp" href="/onePartner.do?p_no=pNo" target="_blank">
					<div class="box-upper">
						<div class="upper-left">
							<p class="tName">신혜규 훈련사</p>
							<h2 class="tTitle">우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요</h2>
						</div>
						<img class="upper-right" src="/resources/upload/partner/profileImg/훈련사사진1.png">
					</div>
					<div class="box-middle">#반려견전문가 #행동교정전문가</div>
					<div class="box-bottom">
						<div class="bottom-wrapper">
							<div class="bottom-content">
								<div class="bt-content-left">별점</div>
								<div class="bt-content-right">₩150,000</div>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="box-wrapper">
			<div class="trainerBox">
				<div class="trainerImg"><img src="/resources/upload/partner/boardFiles/훈련사게시글사진.jpeg"></div>
				<a class="trainerExp" href="/onePartner.do?p_no=pNo" target="_blank">
					<div class="box-upper">
						<div class="upper-left">
							<p class="tName">신혜규 훈련사</p>
							<h2 class="tTitle">우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요</h2>
						</div>
						<img class="upper-right" src="/resources/upload/partner/profileImg/훈련사사진1.png">
					</div>
					<div class="box-middle">#반려견전문가 #행동교정전문가</div>
					<div class="box-bottom">
						<div class="bottom-wrapper">
							<div class="bottom-content">
								<div class="bt-content-left">별점</div>
								<div class="bt-content-right">₩150,000</div>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		<c:choose>
		<c:when test="${not empty sessionScope.p }">
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
