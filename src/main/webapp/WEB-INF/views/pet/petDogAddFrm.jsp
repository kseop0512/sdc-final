<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_nav.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_pet.css">
</head>
<body>
<style>

</style>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<main id="main">
		<section class="mypage">
			<div class="mypage-container">
				<!-- 마이페이지 메뉴 리모컨 -->
				<div id="mypage-nav">
					<ul>
						<li><a href="/my_info.html">나의 정보</a></li>
						<li><a href="/my_pet.html" class="active">나의 똑독캣</a></li>
						<li><a href="/my_message.html">1:1 문의내역</a></li>
						<li><a href="/my_service.html">이용내역</a></li>
						<li><a href="/my_pet_diary.html">돌봄·훈련일지</a></li>
						<li><a href="/my_qna.html">훈련사Q&A</a></li>
						<li><a href="/withdraw.html">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
				<div id="mypage-content">
					<div id="title">
						<h4>강아지 등록</h4><img class="dogLogo" src="/resources/img/dogBlack.png">
					</div>
					<div id="content-wrap">
						<div id="content">
							<form action="/petDogAdd.do" method="post">
							<span>기본사항*</span>
								<input type="hidden" name="petType" value="1">
								<div>
									<label for="">이름</label>
									<input type="text" id="pName" name="petName" placeholder="예) 댕댕이">
								</div>
								<div id="gender-div">
									<label>성별</label>
									<input type="radio" id="m" name="petGender" value="M" checked>
									<label for="m" class="radio-label">남자아이</label>
									<input type="radio" id="f" name="petGender" value="F"> 
									<label for="f" class="radio-label">여자아이</label>
								</div>
								<div>
									<label for="pKind">품종</label>
									<input type="text" id="pKind" name="petKind" placeholder="예) 말티푸">
								</div>
								<div>
									<label for="pBdate">생년월일</label>
									<input type="text" id="pBdate" name="petBdate" placeholder="예) 20221101">
								</div>
								<div class="weightDiv">
									<label for="pWeight">무게</label>
									<span class="weightSpan" >kg</span>
									<input type="text" id="pWeight" name="petWeight" placeholder="예) 1.2">
								</div>
								<div id="gender-div">
									<label>중성화</label>
									<input type="radio" id="y" name="petNeut" value="Y">
									<label for="y" class="radio-label">했어요</label>
									<input type="radio" id="n" name="petNeut" value="N"> 
									<label for="n" class="radio-label">안했어요</label>
								</div>
								<div>
									<label for="pHospital">동물병원</label>
									<input type="text" id="pHospital" name="petHospital" placeholder="자주 다니는 동물병원을 알려주세요">
								</div>
								<hr class="hrCss">
								<span>체크리스트*</span>
								<div class="chk-wrap">
									<div class="socialChk">
										<button type="button" class="socialBtn chksBtn">사회성 및 성향</button>
									</div>
									<div class="healthChk">
										<button type="button" class="healthlBtn chksBtn">접종 및 건강상태</button>
									</div>								
								</div>
								
								<br><br>
								<hr class="hrCss">
								<label class="noteSpan" for="pNotes">기타 참고사항</label>
								<textarea id="pNotes" name="petNotes" placeholder="300자 이내로 추가사항들을 적어주세요"></textarea>
								<div>
									<input type="submit" value="강아지등록!">
								</div>
								<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<!-- 모달 창 -->
	<div class="chk-modal">
		<div class="modal-body">
			<form action="" method="post">
				<div class="q1 modal-question active-question">
					<h4>Q1</h4>
					<p>집에 낯선 사람이 들어오면 어떤 반응을 보이나요?</p>
					<input type="radio" name="a1" value="좋아하며 가까이 다가가 반겨요">
					<label for="a1" class="modal-label">1) 좋아하며 가까이 다가가 반겨요</label>
					<input type="radio" name="a2" value="초반에 짖기는 하지만 물지는 않아요"><br>
					<label for="a2" class="modal-label">2) 초반에 짖기는 하지만 물지는 않아요</label>
					<input type="radio" name="a3" value="무서워하며 뒤로 물러나거나 피하려고 해요"><br>
					<label for="a3" class="modal-label">3) 무서워하며 뒤로 물러나거나 피하려고 해요</label>
					<input type="radio" name="a4" value="짖거나 으르렁대며 경계를 하고, 물 수도 있어요"><br>
					<label for="a4" class="modal-label">4) 짖거나 으르렁대며 경계를 하고, 물 수도 있어요</label>
					<input type="radio" name="a5" value="별로 관심이 없어요"><br>
					<label for="a5" class="modal-label">5) 별로 관심이 없어요</label><br>
					<input type="hidden" class="q1answer">
					<button type="button" class="modal-nextBtn">다음으로</button>
				</div>
				<div class="q2 modal-question">
					<p>Q1. 집에 낯선 사람이 들어오면 어떤 반응을 보이나요?</p>
					<input type="radio" name="a1" value="좋아하며 가까이 다가가 반겨요">
					<label for="a1" class="modal-label">1) 좋아하며 가까이 다가가 반겨요</label>
					<input type="radio" name="a2" value="초반에 짖기는 하지만 물지는 않아요"><br>
					<label for="a2" class="modal-label">2) 초반에 짖기는 하지만 물지는 않아요</label>
					<input type="radio" name="a3" value="무서워하며 뒤로 물러나거나 피하려고 해요"><br>
					<label for="a3" class="modal-label">3) 무서워하며 뒤로 물러나거나 피하려고 해요</label>
					<input type="radio" name="a4" value="짖거나 으르렁대며 경계를 하고, 물 수도 있어요"><br>
					<label for="a4" class="modal-label">4) 짖거나 으르렁대며 경계를 하고, 물 수도 있어요</label>
					<input type="radio" name="a5" value="별로 관심이 없어요"><br>
					<label for="a5" class="modal-label">5) 별로 관심이 없어요</label>
					<input type="hidden" class="q1answer">
					<button type="button" class="modal-nextBtn">다음으로</button>
				</div>
				<div class="q3 modal-question">
					<p>Q1. 집에 낯선 사람이 들어오면 어떤 반응을 보이나요?</p>
					<input type="radio" name="a1" value="좋아하며 가까이 다가가 반겨요">
					<label for="a1" class="modal-label">1) 좋아하며 가까이 다가가 반겨요</label>
					<input type="radio" name="a2" value="초반에 짖기는 하지만 물지는 않아요"><br>
					<label for="a2" class="modal-label">2) 초반에 짖기는 하지만 물지는 않아요</label>
					<input type="radio" name="a3" value="무서워하며 뒤로 물러나거나 피하려고 해요"><br>
					<label for="a3" class="modal-label">3) 무서워하며 뒤로 물러나거나 피하려고 해요</label>
					<input type="radio" name="a4" value="짖거나 으르렁대며 경계를 하고, 물 수도 있어요"><br>
					<label for="a4" class="modal-label">4) 짖거나 으르렁대며 경계를 하고, 물 수도 있어요</label>
					<input type="radio" name="a5" value="별로 관심이 없어요"><br>
					<label for="a5" class="modal-label">5) 별로 관심이 없어요</label>
					<input type="hidden" class="q1answer">
					<button type="button" class="modal-nextBtn">다음으로</button>
				</div>
				<div class="q4 modal-question">
					<p>Q1. 집에 낯선 사람이 들어오면 어떤 반응을 보이나요?</p>
					<input type="radio" name="a1" value="좋아하며 가까이 다가가 반겨요">
					<label for="a1" class="modal-label">1) 좋아하며 가까이 다가가 반겨요</label>
					<input type="radio" name="a2" value="초반에 짖기는 하지만 물지는 않아요"><br>
					<label for="a2" class="modal-label">2) 초반에 짖기는 하지만 물지는 않아요</label>
					<input type="radio" name="a3" value="무서워하며 뒤로 물러나거나 피하려고 해요"><br>
					<label for="a3" class="modal-label">3) 무서워하며 뒤로 물러나거나 피하려고 해요</label>
					<input type="radio" name="a4" value="짖거나 으르렁대며 경계를 하고, 물 수도 있어요"><br>
					<label for="a4" class="modal-label">4) 짖거나 으르렁대며 경계를 하고, 물 수도 있어요</label>
					<input type="radio" name="a5" value="별로 관심이 없어요"><br>
					<label for="a5" class="modal-label">5) 별로 관심이 없어요</label>
					<input type="hidden" class="q1answer">
					<button type="button" class="modal-nextBtn">다음으로</button>
				</div>
				<div class="q5 modal-question">
					<p>Q1. 집에 낯선 사람이 들어오면 어떤 반응을 보이나요?</p>
					<input type="radio" name="a1" value="좋아하며 가까이 다가가 반겨요">
					<label for="a1" class="modal-label">1) 좋아하며 가까이 다가가 반겨요</label>
					<input type="radio" name="a2" value="초반에 짖기는 하지만 물지는 않아요"><br>
					<label for="a2" class="modal-label">2) 초반에 짖기는 하지만 물지는 않아요</label>
					<input type="radio" name="a3" value="무서워하며 뒤로 물러나거나 피하려고 해요"><br>
					<label for="a3" class="modal-label">3) 무서워하며 뒤로 물러나거나 피하려고 해요</label>
					<input type="radio" name="a4" value="짖거나 으르렁대며 경계를 하고, 물 수도 있어요"><br>
					<label for="a4" class="modal-label">4) 짖거나 으르렁대며 경계를 하고, 물 수도 있어요</label>
					<input type="radio" name="a5" value="별로 관심이 없어요"><br>
					<label for="a5" class="modal-label">5) 별로 관심이 없어요</label>
					<input type="hidden" class="q1answer">
					<button type="button" class="modal-nextBtn">다음으로</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		$(".socialBtn").click(function(){
			$(".chk-modal").fadeIn();
		});
		$(".modal-body").click(function(){
			
		});
	 	
	</script>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>