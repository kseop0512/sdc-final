<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/member/mypage_pet.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<main id="main">
		<section class="mypage">
			<div class="mypage-container">
				<!-- 마이페이지 메뉴 리모컨 -->
				<div id="mypage-nav">
					<ul>
						<li><a href="/memberMypage.do">나의 정보</a></li>
						<li><a href="/mypageMyPet.do?memberNo=${sessionScope.m.memberNo}" class="active">나의 똑독캣</a></li>
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
						<h4>강아지 등록</h4><img class="petLogo" src="/resources/img/dogBlack.png">
					</div>
					<div id="content-wrap">
						<div id="content">
							<form action="/petAdd.do" method="post" enctype="multipart/form-data">
							<span class="profileSpan">프로필사진</span>
							<input type="file" name="imageFile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);">
							<div class="fileZone">
								<img id="img-view">
							</div>
							<span>기본사항*</span>
								<div>
									<label for="pName">이름</label>
									<input type="text" id="pName" name="petName" placeholder="예) 댕댕이">
									<input type="hidden" id="memNo" name="memberNo" value="${sessionScope.m.memberNo }">
									<input type="hidden" name="petType" value="1">
								</div>
								<div id="gender-div">
									<label>성별</label>
									<input type="radio" id="m" name="petGender" value="M">
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
									<span class="weightSpan">kg</span>
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
										<input type="hidden" id="character1" name="character1">
										<input type="hidden" id="character2" name="character2">
										<input type="hidden" id="character3" name="character3">
										<input type="hidden" id="character4" name="character4">
										<input type="hidden" id="character5" name="character5">
										<input type="hidden" id="character6" name="character6">
										<input type="hidden" id="character7" name="character7">
										<input type="hidden" id="character8" name="character8">
										<input type="hidden" id="socialInput" name="social">
										<input type="hidden" id="senseInput" name="sense">
										<input type="hidden" id="activeInput" name="active">
										<input type="hidden" id="indeInput" name="inde">
									</div>
									<div class="healthChk">
										<button type="button" class="healthBtn chksBtn">접종 및 건강상태</button>
										<input type="hidden" id="health1" name="health1">
										<input type="hidden" id="health2" name="health2">
										<input type="hidden" id="health3" name="health3">
									</div>								
								</div>
								
								<br><br>
								<hr class="hrCss">
								<label class="noteSpan" for="pNote">기타 참고사항</label>
								<textarea id="pNote" name="petNote" placeholder="300자 이내로 추가사항들을 적어주세요"></textarea>
								<div>
									<input type="submit" value="강아지등록!">
								</div>
								<br><br><br><br>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<!-- 모달 창 -->
	<div class="chk-modal psnModal">
		<div class="modal-body">
			<div class="q1 qstn">
				<h2 class="qNumber">Q1</h2><h4 class="qqNumber">1/8</h4>
				<p class="chkQuestion">집에 낯선 사람이 들어오면 어떤 반응을 보이나요?</p>
				<input type="radio" id="q1a1" name="question1" value="좋아하며 가까이 다가가 반겨요">
<!-- 사회성 +2 --><label for="q1a1" class="modal-label">1) 좋아하며 가까이 다가가 반겨요</label>
				<input type="radio" id="q1a2" name="question1" value="초반에 짖기는 하지만 물지는 않아요">
<!-- 예민성 +1 --><label for="q1a2" class="modal-label">2) 초반에 짖기는 하지만 물지는 않아요</label>
				<input type="radio" id="q1a3" name="question1" value="무서워하며 뒤로 물러나거나 피하려고 해요">
<!--예민성+1사회성-1--><label for="q1a3" class="modal-label">3) 무서워하며 뒤로 물러나거나 피하려고 해요</label>
				<input type="radio" id="q1a4" name="question1" value="짖거나 으르렁대며 경계를 하고, 물 수도 있어요">
<!--예민성+1사회성-2--><label for="q1a4" class="modal-label">4) 짖거나 으르렁대며 경계를 하고, 물 수도 있어요</label>
				<input type="radio" id="q1a5" name="question1" value="별로 관심이 없어요">
<!--예민성+1사회성+1--><label for="q1a5" class="modal-label">5) 별로 관심이 없어요</label>
				<div class="modal-btn">
					<button type="button" class="botBtn exitBtn">취소</button>
					<button type="button" class="botBtn nextBtn">다음▶</button>
				</div>
			</div>
			<div class="q2 qstn">
				<h2 class="qNumber">Q2</h2><h4 class="qqNumber">2/8</h4>
				<p class="chkQuestion">산책할 때 다른 강아지를 보면 어떻게 행동하나요? </p>
				<input type="radio" id="q2a1" name="question2" value="궁금해하며 가까이 다가가 인사해요">
<!-- 사회성 +2 --><label for="q2a1" class="modal-label">1) 궁금해하며 가까이 다가가 인사해요</label>
				<input type="radio" id="q2a2" name="question2" value="경계하며 짖거나 으르렁대요">
<!--예민성+1사회성-1--><label for="q2a2" class="modal-label">2) 경계하며 짖거나 으르렁대요</label>
				<input type="radio" id="q2a3" name="question2" value="무서워하며 뒤로 물러나거나 피하려고 해요">
<!--예민성+1사회성-1--><label for="q2a3" class="modal-label">3) 무서워하며 뒤로 물러나거나 피하려고 해요</label>
				<input type="radio" id="q2a4" name="question2" value="별로 관심이 없어요">
<!--독립성+1사회성+1--><label for="q2a4" class="modal-label">4) 별로 관심이 없어요</label>
				<div class="modal-btn">
					<button type="button" class="botBtn exitBtn">◀이전</button>
					<button type="button" class="botBtn nextBtn">다음▶</button>
				</div>
			</div>
			<div class="q3 qstn">
				<h2 class="qNumber">Q3</h2><h4 class="qqNumber">3/8</h4>
				<p class="chkQuestion"> 스킨십을 할 때 어떤가요?　　　　　　　　</p>
				<input type="radio" id="q3a1" name="question3" value="거부감이 없어요">
<!--예민성-2사회성+1--><label for="q3a1" class="modal-label">1) 거부감이 없어요</label>
				<input type="radio" id="q3a2" name="question3" value="초반 낯가림은 있지만 입질은 없어요">
<!-- 예민성 +1 --><label for="q3a2" class="modal-label">2) 초반 낯가림은 있지만 입질은 없어요</label>
				<input type="radio" id="q3a3" name="question3" value="오랫동안 만지면 으르렁대거나 물 수도 있어요">
<!-- 독립성 +1 --><label for="q3a3" class="modal-label">3) 오랫동안 만지면 으르렁대거나 물 수도 있어요</label>
				<input type="radio" id="q3a4" name="question3" value="겁이 많아서 만지면 물 수도 있어요">
<!--예민성+2사회성-1--><label for="q3a4" class="modal-label">4) 겁이 많아서 만지면 물 수도 있어요</label>
				<div class="modal-btn">
					<button type="button" class="botBtn exitBtn">◀이전</button>
					<button type="button" class="botBtn nextBtn">다음▶</button>
				</div>
			</div>
			<div class="q4 qstn">
				<h2 class="qNumber">Q4</h2><h4 class="qqNumber">4/8</h4>
				<p class="chkQuestion">새로운 장소에 가면 어떤 행동을 하나요?　　　　　　　　</p>
				<input type="radio" id="q4a1" name="question4" value="호기심을 갖고 적극적으로 탐색해요">
<!--예민성-2사회성+1--><label for="q4a1" class="modal-label">1) 호기심을 갖고 적극적으로 탐색해요</label>
				<input type="radio" id="q4a2" name="question4" value="초반에는 경계하지만 시간이 지나면 적응해요">
<!--  영향없음  --><label for="q4a2" class="modal-label">2) 초반에는 경계하지만 시간이 지나면 적응해요</label>
				<input type="radio" id="q4a3" name="question4" value="무서워하고 적응하는 데 시간이 오래 걸려요">
<!-- 예민성 +2 --><label for="q4a3" class="modal-label">3) 무서워하고 적응하는 데 시간이 오래 걸려요</label>
				<input type="radio" id="q4a4" name="question4" value="특별한 반응없이 잘 적응하는 편이에요">
<!--예민성-2독립성+1--><label for="q4a4" class="modal-label">4) 특별한 반응없이 잘 적응하는 편이에요</label>
				<div class="modal-btn">
					<button type="button" class="botBtn exitBtn">◀이전</button>
					<button type="button" class="botBtn nextBtn">다음▶</button>
				</div>
			</div>
			<div class="q5 qstn">
				<h2 class="qNumber">Q5</h2><h4 class="qqNumber">5/8</h4>
				<p class="chkQuestion">하루에 산책을 얼마나 하나요?　　　　　　　　</p>
				<input type="radio" id="q5a1" name="question5" value="소형견 - 1시간~1시간 30분 사이 ">
<!-- 활동성 +1 --><label for="q5a1" class="modal-label">1) 소형견 - 1시간~1시간 30분 사이 </label>
				<input type="radio" id="q5a2" name="question5" value="소형견 - 1시간 30분 이상">
<!-- 활동성 +2 --><label for="q5a2" class="modal-label">2) 소형견 - 1시간 30분 이상 </label>
				<input type="radio" id="q5a3" name="question5" value="소형견 - 1시간 미만">
<!-- 활동성 -1 --><label for="q5a3" class="modal-label">3) 소형견 - 1시간 미만</label>
				<input type="radio" id="q5a4" name="question5" value="대형견 - 2시간~3시간 사이">
<!-- 활동성 +1 --><label for="q5a4" class="modal-label">4) 대형견 - 2시간~3시간 사이</label>
				<input type="radio" id="q5a5" name="question5" value="대형견 - 3시간 이상">
<!-- 활동성 +2 --><label for="q5a5" class="modal-label">5) 대형견 - 3시간 이상</label>
				<input type="radio" id="q5a6" name="question5" value="대형견 - 2시간 미만">
<!-- 활동성 -1 --><label for="q5a6" class="modal-label">6) 대형견 -대형견 - 2시간 미만</label>
				<div class="modal-btn">
					<button type="button" class="botBtn exitBtn">◀이전</button>
					<button type="button" class="botBtn nextBtn">다음▶</button>
				</div>
			</div>
			<div class="q6 qstn">
				<h2 class="qNumber">Q6</h2><h4 class="qqNumber">6/8</h4>
				<p class="chkQuestion">집에서 평상시 행동은 어떤가요?　　　　　　　　</p>
				<input type="radio" id="q6a1" name="question6" value="산책 여부와 상관없이 항상 뛰어다니고 움직여요">
<!-- 활동성 +2 -->	<label for="q6a1" class="modal-label">1) 산책 여부와 상관없이 항상 뛰어다니고 움직여요</label>
				<input type="radio" id="q6a2" name="question6" value="방에 있거나 화장실을 가면 항상 찾아와요">
<!-- 활동성 +1 --><label for="q6a2" class="modal-label">2) 방에 있거나 화장실을 가면 항상 찾아와요</label>
				<input type="radio" id="q6a3" name="question6" value="대부분을 누워 있지만 사람이 오면 일어나요">
<!--활동성-1사회성 +1--><label for="q6a3" class="modal-label">3) 대부분을 누워 있지만 사람이 오면 일어나요</label>
				<input type="radio" id="q6a4" name="question6" value="밥을 먹거나 화장실 갈 때를 제외하곤 항상 누워있어요">
<!-- 활동성 -2 -->	<label for="q6a4" class="modal-label">4) 밥을 먹거나 화장실 갈 때를 제외하곤 항상 누워있어요</label>
				<div class="modal-btn">
					<button type="button" class="botBtn exitBtn">◀이전</button>
					<button type="button" class="botBtn nextBtn">다음▶</button>
				</div>
			</div>
			<div class="q7 qstn">
				<h2 class="qNumber">Q7</h2><h4 class="qqNumber">7/8</h4>
				<p class="chkQuestion">집에 혼자 남겨질 때 어떤 반응을 보이나요?</p>
				<input type="radio" id="q7a1" name="question7" value="불안해하며 안절부절 못해요">
<!-- 독립성 +1 --><label for="q7a1" class="modal-label">1) 불안해하며 안절부절 못해요</label>
				<input type="radio" id="q7a2" name="question7" value="크게 신경쓰지 않고 평소대로 행동해요">
<!-- 독립성 +2 --><label for="q7a2" class="modal-label">2) 크게 신경쓰지 않고 평소대로 행동해요</label>
				<div class="modal-btn">
					<button type="button" class="botBtn exitBtn">◀이전</button>
					<button type="button" class="botBtn nextBtn">다음▶</button>
				</div>
			</div>
			<div class="q8 qstn">
				<h2 class="qNumber">Q8</h2><h4 class="qqNumber">8/8</h4>
				<p class="chkQuestion">주로 어떤 보호자를 따르는 편인가요?　　　　　　　　</p>
				<input type="radio" id="q8a1" name="question8" value="보호자 한 명만 유독 잘 따르고 다른 가족에게는 관심이 덜 해요 ">
<!-- 독립성+2 --><label for="q8a1" class="modal-label">1) 보호자 한 명만 유독 잘 따르고 다른 가족에게는 관심이 덜 해요 </label>
				<input type="radio" id="q8a2" name="question8" value="두루두루 잘 따르는 편이에요 ">
<!-- 영향없음 --><label for="q8a2" class="modal-label">2) 두루두루 잘 따르는 편이에요 </label>
				<input type="radio" id="q8a3" name="question8" value="반려동물을 혼자 키우고 있어요 ">
<!-- 영향없음 --><label for="q8a3" class="modal-label">3) 반려동물을 혼자 키우고 있어요 </label>
				<div class="modal-btn">
					<button type="button" class="botBtn exitBtn">◀이전</button>
					<button type="button" class="botBtn nextBtn">완료</button>
				</div>
			</div>
		</div>
	</div>
	<div class="chk-modal hltModal">
		<div class="modal-body">
			<div class="hq1 qstn">
				<h2 class="qNumber">Q1</h2><h4 class="qqNumber">1/3</h4>
				<p class="chkQuestion hchkQuestion">필수 예방접종을 완료 하셨나요?(중복체크가능)<br>
				<span class="sub-texts">(진행중인 접종이아닌 완료한 접종만 체크해주세요)</span></p>
				
				<input type="radio" id="hq1a1" name="hquestion1-1" value="광견병 (매년 1회 접종완료)">
				<label for="hq1a1" class="modal-label">광견병 (매년 1회 접종완료)</label>
				<input type="radio" id="hq1a2" name="hquestion1-2" value="종합백신 (매년 1회 접종완료)">
				<label for="hq1a2" class="modal-label">종합백신 (매년 1회 접종완료)</label>
				<input type="radio" id="hq1a3" name="hquestion1-3" value="코로나 (매년 1회 접종완료)">
				<label for="hq1a3" class="modal-label">코로나 (매년 1회 접종완료)</label>
				<input type="radio" id="hq1a4" name="hquestion1-4" value="켄넬코프 (매년 1회 접종완료)">
				<label for="hq1a4" class="modal-label">켄넬코프 (매년 1회 접종완료)</label>
				<input type="radio" id="hq1a5" name="hquestion1-5" value="모두 1년이 지났거나 접종을 하지 않았습니다">
				<label for="hq1a5" class="modal-label">모두 1년이 지났거나 접종을 하지 않았습니다</label>
				<div class="modal-btn">
					<button type="button" class="botBtn h-exitBtn">취소</button>
					<button type="button" class="botBtn h-nextBtn">다음▶</button>
				</div>
			</div>
			<div class="hq2 qstn">
				<h2 class="qNumber">Q2</h2><h4 class="qqNumber">2/3</h4>
				<p class="chkQuestion hchkQuestion">내/외부 기생충 예방 여부를 선택해주세요　　　　　　　　　<br>(중복체크가능)　　　　　　</p>
				<input type="radio" id="hq2a1" name="hquestion2-1" value="심장사상충(매월 1회 예방완료)">
				<label for="hq2a1" class="modal-label">심장사상충(매월 1회 예방완료)</label>
				<input type="radio" id="hq2a2" name="hquestion2-2" value="외부기생충 (매월 1회 예방완료)">
				<label for="hq2a2" class="modal-label">외부기생충 (매월 1회 예방완료)</label>
				<input type="radio" id="hq2a3" name="hquestion2-3" value="둘 다 하지않았습니다">
				<label for="hq2a3" class="modal-label">둘 다 하지않았습니다</label>
				<div class="modal-btn">
					<button type="button" class="botBtn h-exitBtn">◀이전</button>
					<button type="button" class="botBtn h-nextBtn">다음▶</button>
				</div>
			</div>
			<div class="hq3 qstn">
				<h2 class="qNumber">Q3</h2><h4 class="qqNumber">3/3</h4>
				<p class="chkQuestion">건강 관련한 주의사항을 알려주세요　　　　　　<br>
				<span class="sub-texts sub-texts1">(전염병이 있는 경우, 펫시팅이 불가합니다)</span></p>
				<textarea  id="hq3a1" placeholder="예) 알러지 음식, 슬개골 탈구, 피부병 등"></textarea>
				
				<div class="modal-btn">
					<button type="button" class="botBtn h-exitBtn">◀이전</button>
					<button type="button" class="botBtn h-nextBtn">완료</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script>
	
	</script>
	<!-- 모달JS -->
	<script type="text/javascript" src="/resources/js/member/petDogAddFrm.js"></script>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>