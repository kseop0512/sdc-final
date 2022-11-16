<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 이용내역</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp" />
<!-- 마이페이지 CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_service_detail.css">
<!-- 아이콘-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/main/common/header.jsp" />
	<!-- main -->
	<main id="main">
		<section class="mypage">
			<div class="mypage-container">
				<!-- 마이페이지 메뉴 리모컨 -->
				<div id="mypage-nav">
					<ul>
						<li><a href="/memberMypage.do">나의 정보</a></li>
						<li><a href="/mypageMyPet.do?memberNo=${sessionScope.m.memberNo }">나의 똑독캣</a></li>
						<li><a href="/mypageMessage.do">1:1 문의내역</a></li>
						<li><a href="/mypageService.do" class="active">서비스 이용내역</a></li>
						<li><a href="/mypageDeleteFrm.do?memberNo=${sessionScope.m.memberNo }">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
				<div id="mypage-content">
					<div id="title">
						<h4>서비스 이용내역</h4>
					</div>
					<div id="content-wrap">
						<div id="content">
							<!-- 상세보기 -->
							<div class="service-box">
								<!-- 서비스 구분 -->
								<div id="service-category">
									<input type="hidden" class="" value="${b.category }">
									<c:choose>
										<c:when test="${b.category eq 'L'}">
											<div class="active">돌봄</div>
											<div>훈련</div>
										</c:when>
										<c:otherwise>
											<div>돌봄</div>
											<div class="active">훈련</div>
										</c:otherwise>
									</c:choose>
									
								</div>
								<!-- 서비스 상세정보 -->
								<div id="service-content">
									<h5>
										<span class="material-symbols-outlined">pets</span> ${p.PName}
										<c:choose>
											<c:when test="${b.category eq 'L'}">
											펫시터 님의 돌봄 서비스
											</c:when>
											<c:otherwise>
											훈련사 님의 훈련 서비스
											</c:otherwise>
										</c:choose>
									</h5>
									
									<div id="info-partner">
										<img src="/resources/upload/partner/profileImg/${p.profilePath}">
										<div>
											<p class="grade">
											<c:choose>
												<c:when test="${p.PGrade eq 'C'}">
												<span class="face-icon material-symbols-outlined">sentiment_satisfied</span> 똑독캣에서 인증받은 정파트너
												</c:when>
												<c:when test="${p.PGrade eq 'B'}">
												<span class="face-icon material-symbols-outlined">mood</span> 똑독캣에서 인증받은 실버파트너
												</c:when>
												<c:when test="${p.PGrade eq 'A'}">
												<span class="face-icon material-symbols-outlined">sentiment_very_satisfied</span> 똑독캣에서 인증받은 골드파트너
												</c:when>
											</c:choose>
											 입니다.
											</p>
											<p>전화번호 : <span class="phone1">${p.PPhone }</span></p>
											<p>이메일 : ${p.PEmail }</p>
										</div>
									</div>
									
									<h5>
										<span class="material-symbols-outlined">pets</span> 예약 상세정보
									</h5>
									<table id="info-booking">
										<tr>
											<th id="border-top-left">예약한 똑똑캣</th>
											<td>${petName }</td>
											<th>예약일</th>
											<td>${b.bookedDate }</td>
										</tr>
										<tr>
											<th>안내받을 연락처</th>
											<td colspan="3" class="phone2">${b.bookingPhone }</td>
										</tr>
										<tr>
											<th>서비스이용일</th>
											<td colspan="3" class="td-service-date">
												<input type="hidden" class="hidden-startdate" value="${b.startDate }">
												<input type="hidden" class="hidden-enddate" value="${b.endDate }">
												<input type="hidden" class="hidden-bookingtime" value="${b.bookingTime }">
												<span class="service-date"></span>
											</td>
										</tr>
										<tr>
											<th id="border-bottom-left">서비스요금</th>
											<td colspan="3" class="price">${b.price }</td>
										</tr>
									</table>
									
									<h5>
										<span class="material-symbols-outlined">pets</span> 요청사항
									</h5>
									<c:choose>
										<c:when test="${b.specialRequest eq null}">
											<textarea class="special-request" readonly>없음</textarea>
										</c:when>
										<c:otherwise>
											<textarea class="special-request" readonly>${b.specialRequest }</textarea>
										</c:otherwise>
									</c:choose>

								</div><!-- End #service-content -->
							</div><!-- End .service-box -->
						</div><!-- End #content -->
					</div><!-- End #content-wrap -->
				</div><!-- End #mypage-content -->
			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script type="text/javascript"
		src="/resources/js/member/mypage_service_detail.js"></script>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp" />
</body>
</html>