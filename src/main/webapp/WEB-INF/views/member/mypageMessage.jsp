<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 1:1문의내역</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<!-- 마이페이지 CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_message.css">
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
						<li><a href="/mypageMessage.do" class="active">1:1 문의내역</a></li>
						<li><a href="/mypageService.do?memberId=${sessionScope.m.memberId }">이용내역</a></li>
						<li><a href="/mypagePetDiary.do">돌봄·훈련일지</a></li>
						<li><a href="/mypageQnA.do">훈련사Q&A</a></li>
						<li><a href="/withdraw.do">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
		        <div id="mypage-content">
		          <div id="title">
		            <h4>1:1 문의내역</h4>
		          </div>
		          <div id="content-wrap">
		            <div id="content">
		              <!-- 탭 -->
		              <div id="tab-wrap">
		                <div id="tab-receive" class="active-tap">받은메시지</div>
		                <div id="tab-send">보낸메시지</div>
		              </div>
		              <!-- 읽지않음 수 표시 & 버튼 -->
		              <div id="btn-wrap">
		                <button type="button" id="delete">삭제</button>
		                <button type="button" id="reading">읽음</button>
		                <div id="msg-filter">
		                  <span class="unread filter">읽지않음 <span class="count">1</span></span>
		                  <span id="filter-div">/ </span>
		                  <span class="all filter">전체 <span class="count">3</span></span>
		                </div>
		              </div>
		              <input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
		              <!-- 받은메시지함 -->
		              <div class="msg-box receive">
		                <table>
		                  <thead>
		                    <tr>
		                      <td class="th-checkbox"><input class="form-check-input" type="checkbox" id="check-all-r"></td>
		                      <td class="th-category">문의유형</td>
		                      <td class="th-sender">
		                        <button type="button" class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		                          	보낸사람<span class="visually-hidden">Toggle Dropdown</span>
		                        </button>
		                        <ul class="dropdown-menu">
		                          <li><a class="dropdown-item" href='javascript:void(0);' onclick="showAdminMsg();">관리자</a></li>
		                          <li><a class="dropdown-item" href='javascript:void(0);' onclick="showPartnerMsg();">펫시터·훈련사</a></li>
		                          <li><hr class="dropdown-divider"></li>
		                          <li><a class="dropdown-item" href='javascript:void(0);' onclick="showAllMsg();">전체보기</a></li>
		                        </ul>
		                      </td>
		                      <td class="th-content">내용</td>
		                      <td class="th-date">받은날짜</td>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  <!-- 
		                  <c:forEach items="${rdm}" var="rdm">
		                    <tr>
		                    	<td><input class="form-check-input check-r" type="checkbox"></td>
		                    	<input type="hidden" value="${rdm.dmNo}">
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
		                    </tr>
		                   </c:forEach>
		                    -->
		                  </tbody>
		                </table>
		              </div><!-- .msg-box receive종료 -->
		              <!-- 보낸메시지함 -->
		              <div class="msg-box send" style="display: none;">
		                <table>
		                  <thead>
		                    <tr>
		                      <td class="th-checkbox"><input class="form-check-input" type="checkbox" id="check-all-s"></td>
		                      <td class="th-category">문의유형</td>
		                      <td class="th-receiver">받는사람</td>
		                      <td class="th-content">내용</td>
		                      <td class="th-date">보낸날짜</td>
		                      <td class="th-readcheck">읽음여부</td>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  <!-- ajax로 처리 -->
		                  </tbody>
		                </table>
		              </div><!-- .msg-box send -->
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
					<textarea id="reply-msg" name="dmContent" style="display: none;" placeholder="내용을 입력해주세요.

※ 광고, 도배, 욕설, 비방 등
서비스와 무관한 내용 작성시
신고 및 무통보 삭제될 수 있습니다." required></textarea>
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
	<script type="text/javascript" src="/resources/js/member/mypage_message.js"></script>
</body>
</html>