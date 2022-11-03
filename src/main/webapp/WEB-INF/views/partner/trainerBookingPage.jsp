<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>똑독캣 (SDC) | 강아지 전문 훈련사 </title>
    <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    <link href="/resources/css/partner/t-bookingStyles.css" rel="stylesheet" />
	<link href='/resources/fullcalendar-5.11.3/lib/main.min.css' rel='stylesheet' />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
<main id="main">
	<div class="mainPage-wrapper">
		<div class="page-top"><span>${trainer.PName }</span> 훈련사님 실시간 예약</div>
		<div class="section-inner">
			<div class="dateDiv">
				<div class="material-symbols-outlined">calendar_month</div>
				<div id="showDate">선택한 날짜<span class="showDate"></span></div>
			</div>
			<div id="calendar" style="margin-top: 20px;"></div>
			<div class="timeDiv">
				<div class="material-symbols-outlined">schedule</div>
				<div id="showDate">시간 선택<span class="showTime" style="padding-left: 10px;"></span></div>
			</div>
			<div class="time-wrapper">
				<div>
					<span class="time_tit">AM</span>
					<ul class="list_time">
						<li class="time">10:00</li>
						<li class="time">11:00</li>
					</ul>
				</div>
				<div>
					<span class="time_tit" style="margin-top: 10px;">PM</span>
					<ul class="list_time">
						<li class="time">12:00</li>
						<li class="time">1:00</li>
						<li class="time">2:00</li>
						<li class="time">3:00</li>
						<li class="time">4:00</li>
						<li class="time">5:00</li>
						<li class="time">6:00</li>
					</ul>
				</div>
			</div>
			<h3 class="section-title">예약 내용을 확인해주세요</h3>
				<div class="booking-summary">
					<table class="sum">
						<tr>
							<th>일정</th>
							<td class="showDate"></td>
						</tr>
						<tr>
							<th>시간</th>
							<td class="showTime"></td>
						</tr>
						<tr>
							<th style="height: 60px;"><span style="font-size: 24px; color: #565655">결제 금액</span></th>
							<td style="text-align: right;"><span id="totalFee">0</span><span>원</span></td>
						</tr>
					</table>
				</div>
			<h3 class="section-title">회원 정보</h3>
			
		</div>
		
	</div>
</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="/resources/js/partnerScripts.js"></script>
<script src='/resources/fullcalendar-5.11.3/lib/main.min.js'></script>

</body>
</html>	