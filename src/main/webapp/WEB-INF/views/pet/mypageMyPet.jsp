<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>똑독캣 마이페이지</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 마이페이지 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_mypet.css">
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
						<li><a href="/mypageMyPet.do?memberNo=${sessionScope.m.memberNo }" class="active">나의 똑독캣</a></li>
						<li><a href="/mypageMessage.do?memberId=${sessionScope.m.memberId }">1:1 문의내역</a></li>
						<li><a href="/mypageService.do">이용내역</a></li>
						<li><a href="/mypagePetDiary.do">돌봄·훈련일지</a></li>
						<li><a href="/mypageQnA.do">훈련사Q&A</a></li>
						<li><a href="/withdraw.do">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
				<div id="mypage-content">
					<div id="title">
						<img class="petLogo" style="max-width: 100%; height: auto;" src="/resources/img/dogBlack.png"><h4>나의 똑독캣</h4><img class="petLogo" src="/resources/img/catBlack.png">
					</div>
					<div id="content-wrap">
						<c:forEach items="${petList}" var="pet">
							<div class="pet-wrap">
								<img class="petProfile" src="/resources/upload/pet/petProfile/${pet.petFilename }">
								<div class="info-wrap">
									<p class="petName">${pet.petName }</p>
									<p class="petInfo">
										<c:choose>
											<c:when test="${pet.petType eq 1 && pet.petWeight lt 7}">
													${pet.petWeight }kg(소형)
											</c:when>
											<c:when test="${pet.petType eq 1 && pet.petWeight lt 15} ">
													${pet.petWeight }kg(중형)
											</c:when>
											<c:when test="${pet.petType eq 1 && pet.petWeight ge 15} ">
													${pet.petWeight }kg(대형)
											</c:when>
											<c:when test="${pet.petType eq 2}">
												${pet.petWeight }kg
											</c:when>
										</c:choose>
										/ 
										<c:choose>
											<c:when test="${pet.petGender eq 'M'}">
												남
											</c:when>
											<c:when test="${pet.petGender eq 'F'}">
												여
											</c:when>
										</c:choose>/
										<c:set var="nowYear" value="<%=new java.util.Date()%>" />
										<c:set var="dd"><fmt:formatDate value="${nowYear}" pattern="yyyy" /></c:set>
										<c:set var="petAge" value="${dd-pet.petBdate+1 }" />
										${petAge }살
									</p>
								</div>
							</div>
							<hr class="hrCss">
						</c:forEach>
							<div class="pet-wrap addPetLink" onclick="petAddBtn();">
								<div class="addPet">
									<span class="addPetSpan">+　반려동물추가</span>
								</div>
							</div>
							<hr class="hrCss">
							<div class="pet-wrap" style="cursor: default;">
							</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	
	<!-- 펫 추가하기 모달창 -->
	<div class="img_btn-wrap">
		<a class="backTag" onclick="back()">돌아가기</a>
		<button type="button" class="btn-img petBtn1" onclick="location.href='/petDogAddFrm.do'"><span class="petType textSpan1">강아지</span></button>
		<button type="button" class="btn-img petBtn2" onclick="location.href='/petCatAddFrm.do'"><span class="petType textSpan2">고양이</span></button>
	</div>
	
	<!-- 펫 상세보기 -->	
	<div></div>
	<script>
		
	</script>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script type="text/javascript" src="/resources/js/member/mypageMyPet.js"></script>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>