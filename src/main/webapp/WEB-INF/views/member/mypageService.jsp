<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 이용내역</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<!-- 마이페이지 CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_service.css">
<!-- 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
						<li><a href="/mypagePet.do">나의 똑독캣</a></li>
						<li><a href="/mypageMessage.do">1:1 문의내역</a></li>
						<li><a href="/mypageService.do?memberId=${sessionScope.m.memberId }" class="active">이용내역</a></li>
						<li><a href="/mypagePetDiary.do">돌봄·훈련일지</a></li>
						<li><a href="/mypageQnA.do">훈련사Q&A</a></li>
						<li><a href="/withdraw.do">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
		        <div id="mypage-content">
		          <div id="title">
		            <h4>이용내역</h4>
		          </div>
		          <div id="content-wrap">
		            <div id="content">
		              <!-- 이용내역 -->
		              <div class="service-box">
		                <table>
		                  <thead>
		                    <tr>
		                      <td class="th-start-date">서비스시작일</td>
		                      <td class="th-end-date">서비스종료일</td>
		                      <td class="th-pet">똑독캣</td>
		                      <td class="th-category">서비스종류</td>
		                      <td class="th-partner">담당파트너</td>
		                      <td class="th-price">이용요금</td>
		                      <td class="th-state">예약상태</td>
		                      <td class="th-cancle-review">취소/후기</td>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  <c:forEach items="${list}" var="b">
		                    <tr>
		                    	<input type="hidden" value="${b.bookingNo}">
		                    	<td><input type="text" class="td-start-date" value="${b.startDate} ${b.bookingTime}" readonly></td>
		                    	<td><input type="text" class="td-end-date" value="${b.endDate}" readonly></td>
		                    	<td><input type="text" class="td-pet" value="${b.petNo}" readonly></td>
		                    	<td><input type="text" class="td-category" value="${b.category}" readonly></td>
		                    	<td><input type="text" class="td-partner" value="${b.PNo}" readonly></td>
		                    	<td><input type="text" class="td-price" value="${b.price}" readonly></td>
		                    	<td><input type="text" class="td-state" value="${b.partnerAccept}" readonly></td>
		                    	<td><input type="text" class="td-cancle-review" value="${b.reviewState}" readonly></td>
			                    	<!--
			                    	<td>
			                    	<c:choose>
			                    		<c:when test="${rdm.dmType ==0}">결제/취소</c:when>
			                    		<c:when test="${rdm.dmType ==1}">예약</c:when>
			                    		<c:when test="${rdm.dmType ==2}">기타문의</c:when>
			                    		<c:otherwise>오잉</c:otherwise>
			                    	</c:choose>
			                    	</td>
				                    <td>
				                    <c:choose>
			                    		<c:when test="${rdm.senderCategory eq 'A'}">관리자</c:when>
			                    		<c:when test="${rdm.senderCategory eq 'P'}">${rdm.sender }</c:when>
			                    		<c:otherwise>오잉</c:otherwise>
			                    	</c:choose>
				                    </td>
					                <td class="td-content">
					                	<a href='javascript:void(0);' onclick="receiveModal(this, ${rdm.dmNo},${rdm.sender },${rdm.dmContent },${rdm.dmDate },${rdm.dmType });">${rdm.dmContent }</a>
					                </td>
					                <td>${rdm.dmDate }</td>
					                <input type="hidden" class="sender-category" value="${rdm.senderCategory }">
					                <input type="hidden" class="read-check" value="${rdm.readCheck }">
					                -->
		                    </tr>
		                   </c:forEach>
		                    
		                  </tbody>
		                </table>
		              </div><!-- .msg-box receive종료 -->
		            </div><!-- End #content -->
		          </div><!-- End #content-wrap -->
		        </div><!-- End #mypage-content -->
			</div>
		</section>
	</main>
	<!-- End #main -->

	<!-- 메시지 상세보기 모달 -->
	<div class="msg-modal" style="display: none;">
		<div class="msg-modal-head">
			<span id="msg-modal-title">받은메시지</span>
			<span id="close-btn" class="material-symbols-outlined">close</span>
		</div>
		<form action="/insertMemberDm.do" method="post">
			<div class="msg-modal-content">
				<div class="msg-info msg-sender">
					<span>보낸사람</span>
					<input type="text" id="receiver-view" value="하하하하" readonly>
					<input type="hidden" name="receiver" value="">
					<input type="hidden" name="sender" value="${sessionScope.m.memberId }">
					<input type="hidden" name="senderCategory" value="M">
					<input type="hidden" name="dmType" value="">
					<input type="hidden" name="reply" value="">
				</div>
				<div class="msg-info msg-date">
					<span>받은날짜</span>
					<input type="text" value="" disabled>
				</div>
				<div class="msg-content">
					<textarea id="reply-msg" name="dmContent" style="display: none;"></textarea>
					<textarea id="receive-msg" disabled></textarea>
				</div>
				<div class="msg-btn-wrap">
					<input type="button" id="reply-btn" value="답장">
					<input type="submit" id="submit-btn" value="보내기" style="display: none">
				</div>
			</div>
		</form>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script type="text/javascript" src="/resources/js/member/mypage_service.js"></script>
</body>
</html>