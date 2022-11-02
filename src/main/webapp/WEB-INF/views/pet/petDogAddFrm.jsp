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
	<!-- 활동성 -1 --><label for="q5a6" class="modal-label">5) 대형견 -대형견 - 2시간 미만</label>
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
					<label for="q8a1" class="modal-label">1) 보호자 한 명만 유독 잘 따르고 다른 가족에게는 관심이 덜 해요 </label><!-- 독립성+2 -->
					<input type="radio" id="q8a2" name="question8" value="두루두루 잘 따르는 편이에요 ">
					<label for="q8a2" class="modal-label">2) 두루두루 잘 따르는 편이에요 </label><!-- 영향없음 -->
					<input type="radio" id="q8a3" name="question8" value="반려동물을 혼자 키우고 있어요 ">
					<label for="q8a3" class="modal-label">3) 반려동물을 혼자 키우고 있어요 </label><!-- 영향없음 -->
					<div class="modal-btn">
						<button type="button" class="botBtn exitBtn">◀이전</button>
						<button type="button" class="botBtn nextBtn">완료</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
	 	
		/*모달 버튼 js*/
		let qNo = 0;
		const q1=$(".q1");
		const q2=$(".q2");
		const q3=$(".q3");
		const q4=$(".q4");
		const q5=$(".q5");
		const q6=$(".q6");
		const q7=$(".q7");
		const q8=$(".q8");
		var social; //사회성 점수
		var sense; //예민성
		var active; //활동성
		var inde; //독립성
		$(".socialBtn").click(function(){
			$(".chk-modal").fadeIn();
			q1.show();
			qNo = 1;
		});
		$(".nextBtn").click(function(){
			switch(qNo){
			case 1:
				if($("input[name=question1]").is(":checked")){
					q1.hide();
					q2.show();
					qNo = 2;
					
				}else{
					alert("답변을 선택해주세요");
				}
				break;
			
			case 2:
				if($("input[name=question2]").is(":checked")){
					q2.hide();
					q3.show();
					qNo = 3;					
				}else{
					alert("답변을 선택해주세요");
				}
				break;
			
			case 3:
				if($("input[name=question3]").is(":checked")){
					q3.hide();
					q4.show();
					qNo = 4;					
				}else{
					alert("답변을 선택해주세요");
				}
				break;
			
			case 4:
				if($("input[name=question4]").is(":checked")){
					q4.hide();
					q5.show();
					qNo = 5;					
				}else{
					alert("답변을 선택해주세요");
				}
				break;
			
			case 5:
				if($("input[name=question5]").is(":checked")){
					q5.hide();
					q6.show();
					qNo = 6;					
				}else{
					alert("답변을 선택해주세요");
				}
				break;
			
			case 6:
				if($("input[name=question6]").is(":checked")){
					q6.hide();
					q7.show();
					qNo = 7;					
				}else{
					alert("답변을 선택해주세요");
				}
				break;
			
			case 7:
				if($("input[name=question7]").is(":checked")){
					q7.hide();
					q8.show();
					qNo = 8;					
				}else{
					alert("답변을 선택해주세요");
				}
				break;
			
			case 8:
				if($("input[name=question8]").is(":checked")){
					q8.hide();
					q1.show();
					$(".chk-modal").fadeOut();
					$(".socialBtn").css("background-color","#ffb347");					
				}else{
					alert("답변을 선택해주세요");
				}
				break;
			}
		});
		
		$(".exitBtn").click(function(){
			switch(qNo){
			case 1:
				$(".chk-modal").fadeOut();
				qNo = 0;
				break;
			
			case 2:
				q2.hide();
				q1.show();
				qNo = 1;
				break;
			
			case 3:
				q3.hide();
				q2.show();
				qNo = 2;
				break;
			
			case 4:
				q4.hide();
				q3.show();
				qNo = 3;
				break;
			
			case 5:
				q5.hide();
				q4.show();
				qNo = 4;
				break;
			
			case 6:
				q6.hide();
				q5.show();
				qNo = 5;
				break;
			
			case 7:
				q7.hide();
				q6.show();
				qNo = 6;
				break;
			
			case 8:
				q8.hide();
				q7.show();
				qNo = 7;
				break;
			}
		});
	</script>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>