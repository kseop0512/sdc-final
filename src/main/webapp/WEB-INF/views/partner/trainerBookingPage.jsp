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
						<li class="available_time">10:00</li>
						<li class="available_time">11:00</li>
					</ul>
				</div>
				<div>
					<span class="time_tit" style="margin-top: 10px;">PM</span>
					<ul class="list_time">
						<li class="available_time">12:00</li>
						<li class="available_time">1:00</li>
						<li class="available_time">2:00</li>
						<li class="available_time">3:00</li>
						<li class="available_time">4:00</li>
						<li class="available_time">5:00</li>
						<li class="available_time">6:00</li>
					</ul>
				</div>
			</div>
			<div class="section-title">예약 내용을 확인해주세요</div>
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
			<div class="section-title" style="border-top: 2px solid #565655;">회원 정보</div>
			<div class="infoTbl">
			<form action="/bookingMemberInfo.do"  method="post" name="booking_form">
				<table class="table bookingInfo">
					<tr>
						<th>회원 이름</th>
						<td id="buyer_name">${sessionScope.m.memberName }</td>
					</tr>
					<tr>
						<th>반려견 이름</th>
						<td>
							<select name="petNo" class="inputStyle" required>
								<c:forEach items="${petList }" var="p">
								<option value="${p.petNo }">${p.petName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="buyer_email" class="inputStyle" required></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="bookingPhone" class="inputStyle" value="${sessionScope.m.memberPhone }"></td>
					</tr>
					<tr>
						<th>훈련사께 남기실 말씀</th>
						<td><textarea name="specialRequest" placeholder="Enter any additional instruction to this Trainer"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="border: none; text-align: center">
						   <!--<button type="button" onclick="requestPay()" class="payBtn">결제하기</button>-->
							  <input type="submit" class="payBtn" value="결제하기">
							<input type="hidden" name="startDate">
							<input type="hidden" name="bookingTime">
							<input type="hidden" name="pNo" value="${trainer.PNo }">
							<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
						</td>
					</tr>
				</table>
			</form>
			</div>
		</div>
		
	</div>
</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="/resources/js/partnerScripts.js"></script>
<script src='/resources/fullcalendar-5.11.3/lib/main.min.js'></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
	$(document).on("click",".unAvailable_time",function(){
		alert("이용 가능한 시간이 아닙니다");
		$(".showTime").empty();
		$("#totalFee").empty();
		$("#totalFee").append(0);
	})

</script>
</body>
</html>	