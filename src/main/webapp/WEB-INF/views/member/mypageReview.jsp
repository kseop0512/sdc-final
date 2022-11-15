<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 이용후기</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<!-- 마이페이지 CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_service.css">
<!-- 아이콘-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- 사진첨부 li -->
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
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
						<li><a href="/mypageService.do">서비스 이용내역</a></li>
						<li><a href="/mypageReview.do" class="active">나의 이용후기</a></li>
						<li><a href="/withdraw.do">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
		        <div id="mypage-content">
		          <div id="title">
		            <h4>나의 이용후기</h4>
		          </div>
		          <div id="content-wrap">
		            <div id="content">
		              <!-- 이용내역 -->
		              <div class="service-box">
		                <table>
		                  <thead>
		                    <tr>
		                      <td class="th-category">서비스</td>
		                      <td class="th-start-date">이용날짜</td>
		                      <td class="th-end-date">이용시간대</td>
		                      <td class="th-pet">똑독캣</td>
		                      <td class="th-partner">담당파트너</td>
		                      <td class="th-price">이용요금</td>
		                      <td class="th-state">예약상태</td>
		                      <td class="th-cancle-review">취소/후기</td>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  <input type="hidden" value="${fn:length(list)}" id="listLength">
		                  <c:forEach items="${list}" var="b">
		                    <tr>
		                    	<!-- 서비스유형 -->
		                    	<td class="td-category">
		                    		<input type="hidden" class="input-booking-no" value="${b.bookingNo}">
		                    		<input type="hidden" class="input-category" value="${b.category}">
		                    		<a href="javascript:serviceDetail('${b.bookingNo}');" class="span-category">
		                    		 <c:choose>
			                    		<c:when test="${b.category eq 'V'}"><b>방문돌봄</b></c:when>
			                    		<c:when test="${b.category eq 'L'}"><b>위탁돌봄</b></c:when>
			                    		<c:when test="${b.category eq 'T'}"><b>훈련</b></c:when>
			                    	 </c:choose>
			                    	</a>
		                    	</td>
		                    	<!-- 시작일 -->
		                    	<td class="td-start-date">
		                    		<input type="hidden" class="input-start-date" value="${b.startDate}">		                    		
		                    		<input type="hidden" class="input-start-time" value="${b.bookingTime}">
		                    		<span class="span-start-date"></span>
		                    	</td>
		                    	<!-- 종료일 -->
		                    	<td class="td-end-date">
		                    		<input type="hidden" class="input-end-date" value="${b.endDate}">
		                    		<input type="hidden" class="input-end-time" value="${b.bookingTime}">
		                    		<span class="span-end-date"></span>
		                    	</td>
		                    	<!-- 반려동물 이름 -->
		                    	<td class="td-pet">
		                    		<input type="hidden" class="input-pet" value="${b.petNo}">
		                    		<span class="span-pet"></span>
		                    	</td>
		                    	<!-- 파트너 이름 -->
		                    	<td class="td-partner">
		                    		<input type="hidden" class="input-partner" value="${b.PNo}">
		                    		<span class="span-partner"></span>
		                    	</td>
		                    	<!-- 이용요금 -->
		                    	<td class="td-price">
		                    		<input type="hidden" class="input-price" value="${b.price}">
		                    		<span class="span-price"></span>
		                    	</td>
		                    	<!-- 예약상태 -->
		                    	<td class="td-state">
		                    		<input type="hidden" class="input-state" value="${b.partnerAccept}">
		                    		<a href="javascript:serviceDetail('${b.bookingNo}');">
		                    		 <c:choose>
			                    		<c:when test="${b.partnerAccept eq 'R'}">예약대기중</c:when>
			                    		<c:when test="${b.partnerAccept eq 'Y'}">예약완료</c:when>
			                    		<c:when test="${b.partnerAccept eq 'C'}">취소처리중</c:when>
			                    		<c:when test="${b.partnerAccept eq 'N'}">취소완료</c:when>
			                    		<c:when test="${b.partnerAccept eq 'D'}">이용완료</c:when>
			                    	 </c:choose>
			                    	 <span class="detail-icon material-symbols-outlined">add_circle</span>
		                    		</a>
		                    	</td>
		                    	<!-- 취소신청 및 취소상태 표시/후기작성 및 평점 표시하는 란 -->
		                    	<td class="td-cancle-review">
		                    		<input type="hidden" class="input-cancle-review" value="${b.reviewState}">
		                    		<c:choose>
			                    		<c:when test="${b.partnerAccept eq 'D' && b.reviewState eq 1}">
			                    			<a href="javascript:viewReview('${b.bookingNo}');" class="a-review-rate">후기수정</a>
			                    		</c:when>
			                    		<c:when test="${b.partnerAccept eq 'D' && b.reviewState eq 0}">
			                    			<a href="javascript:writeReview('${b.bookingNo}','${sessionScope.m.memberNo}','${b.PNo}','${b.petNo}');">후기작성</a>
			                    		</c:when>
			                    		<c:when test="${b.partnerAccept eq 'Y'}">
			                    			<a href="javascript:cancleComment('${b.bookingNo}');">예약취소</a>
			                    		</c:when>
			                    		<c:when test="${b.partnerAccept eq 'R'}">
			                    			<a href="/serviceCancle.do">신청취소</a>
			                    		</c:when>
			                    		<c:when test="${b.partnerAccept eq 'C'}">
			                    			취소처리중
			                    		</c:when>
			                    		<c:when test="${b.partnerAccept eq 'N'}">
			                    			취소완료
			                    		</c:when>
			                    	 </c:choose>
		                    	</td>
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
	<!-- 후기작성 모달 -->
	<div class="review-modal insert-review" style="display:none;">
		<!-- 모달최상단 꾸밈 -->
		<div class="review-modal-head">
			<span id="review-modal-title">이용후기</span>
			<span class="close-btn material-symbols-outlined">close</span>
		</div>
		<!-- 모달컨텐츠(폼) -->
		<form action="/writeReview.do" method="post" enctype="multipart/form-data">
			<div class="review-modal-content">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="bookingNo">
				<input type="hidden" name="memberNo">
				<input type="hidden" name="pNo">
				<input type="hidden" name="petNo">
				<!-- 후기평점 -->
				<div class="review-info review-rate">
					<b class="rate-label">평점</b>
					<span class="star" style="padding: 0;">
					★★★★★
						<span>★★★★★</span>
						<input type="range" id="star-range" oninput="drawStarI(this)" value="0" step="1" min="0" max="5">
					</span>
					<input type="text" name="reviewRate" id="i-rate" value="0" readonly>
					<span class="rate-comment">*드래그해서 평점을 입력하세요</span>
				</div>
				<!-- 후기사진첨부 -->
				<div class="review-photo">
					<b>사진첨부<b>
					<span class="photo-comment">*최대 3개까지 첨부가능</span>
					<div class="filebox clearfix">
						<div class="inputFile">
							<label for="AddImgs" class="addImgBtn"><span class="material-symbols-outlined">add</span></label>
							<input type="file" id="AddImgs" class="upload-hidden" name="reviewFile" accept=".jpg, .jpeg, .png, .gif" multiple>
						</div>
						<ul id="Preview-i" class="sortable">
							<li><label for="AddImgs" class="addImgBtn"></label></li>
							<li><label for="AddImgs" class="addImgBtn"></label></li>
							<li><label for="AddImgs" class="addImgBtn"></label></li>
						</ul>
					</div>
				<!-- 후기내용 -->
				<div class="review-content">
					<textarea id="reviewContent" name="reviewContent" placeholder="내용을 입력해주세요.

서비스의 장점 및 단점 등 상세한 내용 작성은
사이트 이용자와 파트너에게 큰 도움이 됩니다!

※ 광고, 도배, 욕설, 비방 등
서비스와 무관한 내용 작성시
신고 및 무통보 삭제될 수 있습니다." required></textarea>
				</div>
				<!-- 버튼 -->
				<div class="review-btn-wrap">
					<input type="button" id="insert-btn" value="작성">
				</div>
			</div>
			</div>
		</form>
	</div>
	
	<!-- 후기수정 모달 -->
	<div class="review-modal update-review" style="display:none;">
		<!-- 모달최상단 꾸밈 -->
		<div class="review-modal-head">
			<span id="review-modal-title">이용후기</span>
			<span class="close-btn material-symbols-outlined">close</span>
		</div>
		<!-- 모달컨텐츠(폼) -->
		<form action="/updateReview.do" method="post" enctype="multipart/form-data">
			<div class="review-modal-content">
				<input type="hidden" name="reviewNo">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="bookingNo">
				<input type="hidden" name="memberNo">
				<input type="hidden" name="pNo">
				<input type="hidden" name="petNo">
				<!-- 후기평점 -->
				<div class="review-info review-rate">
					<b class="rate-label">평점</b>
					<span class="star" style="padding: 0;">
					★★★★★
						<span>★★★★★</span>
						<input type="range" id="star-range" oninput="drawStarU(this)" value="0" step="1" min="0" max="5">
					</span>
					<input type="text" name="reviewRate" id="u-rate" value="0" readonly>
					<span class="rate-comment">*드래그해서 평점을 입력하세요</span>
				</div>
				<!-- 후기사진첨부 -->
				<div class="review-photo">
					<div class="filebox clearfix">
						<ul id="Preview-u" class="sortable"></ul>
					</div>
				</div>
				<!-- 후기내용 -->
				<div class="review-content">
					<textarea id="reviewContent" name="reviewContent" placeholder="내용을 입력해주세요.

서비스의 장점 및 단점 등 상세한 내용 작성은
사이트 이용자와 파트너에게 큰 도움이 됩니다!

※ 광고, 도배, 욕설, 비방 등
서비스와 무관한 내용 작성시
신고 및 무통보 삭제될 수 있습니다." required></textarea>
				</div>
				<!-- 버튼 -->
				<div class="review-btn-wrap">
					<input type="button" id="update-btn" value="수정">
				</div>
			</div>
		</form>
	</div>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script type="text/javascript" src="/resources/js/member/mypage_service.js"></script>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>