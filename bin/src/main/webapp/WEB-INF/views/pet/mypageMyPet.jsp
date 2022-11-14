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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
							<div class="pet-wrap" onclick="petDetail()";>
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
							<!-- 상세에서 사용할 데이터들 -->
							<!-- pet_tbl -->
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							
							<!-- pet_chklist꺼 -->
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
							<input type="hidden" class="" value="">
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
	<div class="pdModal-wrap">
		<div class="petDetail-wrap">
			<div class="pdTopDiv">
				<table class="pdTable">
					<tr>
						<td class="pdProfileTd" rowspan="4"  align="center"><img class="pdProfile" alt="펫 프사" src="/resources/img/dogBlack.png"></td>
						<td colspan="1" align="center">이름</td>
						<td colspan="2" align="center"><span class="answerSpan">철asdfa용</span></td>
						<td colspan="1" align="center">나이</td>
						<td colspan="2" align="center"><span class="answerSpan">1살</span></td>
					</tr>
					<tr> 
						<td colspan="1" align="center">성별</td>
						<td colspan="2" align="center"><span class="answerSpan">수컷</span></td>
						<td colspan="1" align="center">중성화</td>
						<td colspan="2" align="center"><span class="answerSpan">안했어요</span></td>
					</tr>
					<tr> 
						<td colspan="1" align="center">생일</td>
						<td colspan="2" align="center"><span class="answerSpan">20221110</span></td>
						<td colspan="1" align="center">종</td>
						<td colspan="2" align="center"><span class="answerSpan">말티푸</span></td>
					</tr>
					<tr> 
						<td colspan="2" align="center" >자주가는병원<span style="color:green">✚</span></td>
						<td colspan="3" align="center" style="padding-right: 40px"><span class="answerSpan" style="font-size: 17px">SDC동물병원asdfdfdf</span></td>
					</tr>
				</table>
			</div>
			<div class="pdMidDiv">
				<textarea class="pdCharacter" readonly>
ㅇㄴ리ㅏㄴㅁ아ㅓㄹㄴㅁ아ㅓㄹㅇㄴ머ㅏㄹㄴㅁ아ㅓ뤈아무럼ㄴ우런우런ㅇㅁ런ㅁㅇㄹ
ㅓㄴㅇㅁㄻㄴ어ㅏ뤄ㅏㅇㄴ;ㅁ리ㅏㅓㅇ누라ㅓㄴㅇ;ㅁ루;ㅓㅏㄴ무라ㅓㄴ뭐ㅓㄴㅁ
ㄴㅁㅇ러ㅏㅓㅜㄴㅇ밀ㄴㅇㅁㄹㄴㅁㅇ런ㅇㅁ
ㄹㅇㄴ럼ㄴ울
ㄴㅁㅇ뤙ㄴㄹ
ㅇㅁ눙ㄹㄴㅇㄹㄴㅁ아ㅓㄹㅇ나ㅓㅗ로ㅓㄴㅇㅁㄹㅇㄴ
ㅇㄴ리ㅏㄴㅁ아ㅓㄹㄴㅁ아ㅓㄹㅇㄴ머ㅏㄹㄴㅁ아ㅓ뤈아무럼ㄴ우런우런ㅇㅁ런ㅁㅇㄹ
ㅓㄴㅇㅁㄻㄴ어ㅏ뤄ㅏㅇㄴ;ㅁ리ㅏㅓㅇ누라ㅓㄴㅇ;ㅁ루;ㅓㅏㄴ무라ㅓㄴ뭐ㅓㄴㅁ
ㄴㅁㅇ러ㅏㅓㅜㄴㅇ밀ㄴㅇㅁㄹㄴㅁㅇ런ㅇㅁ
ㄹㅇㄴ럼ㄴ울
ㄴㅁㅇ뤙ㄴㄹ
ㅇㅁ눙ㄹㄴㅇㄹㄴㅁ아ㅓㄹㅇ나ㅓㅗ로ㅓㄴㅇㅁㄹㅇㄴㅇㄴ리ㅏㄴㅁ아ㅓㄹㄴㅁ아ㅓㄹㅇㄴ머ㅏㄹㄴㅁ아ㅓ뤈아무럼ㄴ우런우런ㅇㅁ런ㅁㅇㄹ
ㅓㄴㅇㅁㄻㄴ어ㅏ뤄ㅏㅇㄴ;ㅁ리ㅏㅓㅇ누라ㅓㄴㅇ;ㅁ루;ㅓㅏㄴ무라ㅓㄴ뭐ㅓㄴㅁ
ㄴㅁㅇ러ㅏㅓㅜㄴㅇ밀ㄴㅇㅁㄹㄴㅁㅇ런ㅇㅁ
ㄹㅇㄴ럼ㄴ울
ㄴㅁㅇ뤙ㄴㄹ
ㅇㅁ눙ㄹㄴㅇㄹㄴㅁ아ㅓㄹㅇ나ㅓㅗ로ㅓㄴㅇㅁㄹㅇㄴ</textarea>
			</div>
			<div class="pdBotDiv">
				<div class="pdGraph" style="width:400px;height:400px;">
					<canvas id="radar-chart"></canvas>
				</div>
				<div class="pdGraph-detail">
				<textarea readonly>
Independence: 체크리스트를 통해 대략적으로 측정한 값으로 얼마나 독립적인 지를 보여주는 독립성 지표입니다.

Activity: 체크리스트를 통해 대략적으로 측정한 값으로 얼마나 활동적인 지를 보여주는 활동성 지표입니다.

Sociality: 체크리스트를 통해 대략적으로 측정한 값으로 얼마나 사회적인 지를 보여주는 사회성 지표입니다.

Sensitivity: 체크리스트를 통해 대략적으로 측정한 값으로 얼마나 예민한지를 보여주는 예민성 지표입니다.

Min ~ Max: 최소값과 최대값을 나타내주기 위한 지표입니다.</textarea>
				</div>
				<div class="pdBtn-wrap">
					<button class="pdPetEditBtn pdBtn" onclick="">펫정보수정</button>
					<button class="pdClosebtn pdBtn" onclick="pdModalClose();">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	</script>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script type="text/javascript" src="/resources/js/member/mypageMyPet.js"></script>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>