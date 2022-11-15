<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.deleteA{
	color: white;
    position: relative;
    float: right;
    right: 150px;
    bottom: 150px;
    font-size: 17px;
}
.deleteA:hover{
	color: red;
    font-weight: bolder;
    font-size: 1.1em;
}
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
						<li><a href="/mypageDeleteFrm.do?memberNo=${sessionScope.m.memberNo }">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- 마이페이지 컨텐츠 -->
				<div id="mypage-content">
					<div id="title">
						<img class="petLogo" style="max-width: 100%; height: auto;" src="/resources/img/dogBlack.png"><h4>나의 똑독캣</h4><img class="petLogo" src="/resources/img/catBlack.png">
					</div>
					<div id="content-wrap">
						<c:forEach var="pet" items="${petList}" varStatus="statNum">
							<div class="pet-wrap" onclick="petDetail(this);">
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
										
										<c:set var="petAge" value="${dd-pet.petBdate.substring(0,4)+1 }" />
										${petAge }살
									</p>
								</div>
								<!-- 상세에서 사용할 데이터들 -->
								<!-- pet_chklist꺼 -->
								<div class="info-petChk-wrap">
									<input type="hidden" class="character1" value="${petChkList[statNum.index].character1 }">
									<input type="hidden" class="character2" value="${petChkList[statNum.index].character2 }">
									<input type="hidden" class="character3" value="${petChkList[statNum.index].character3 }">
									<input type="hidden" class="character4" value="${petChkList[statNum.index].character4 }">
									<input type="hidden" class="character5" value="${petChkList[statNum.index].character5 }">
									<input type="hidden" class="character6" value="${petChkList[statNum.index].character6 }">
									<input type="hidden" class="character7" value="${petChkList[statNum.index].character7 }">
									<input type="hidden" class="character8" value="${petChkList[statNum.index].character8 }">
									<input type="hidden" class="health1" value="${petChkList[statNum.index].health1 }">
									<input type="hidden" class="health2" value="${petChkList[statNum.index].health2 }">
									<input type="hidden" class="health3" value="${petChkList[statNum.index].health3 }">
									<input type="hidden" class="social" value="${petChkList[statNum.index].social }">
									<input type="hidden" class="sense" value="${petChkList[statNum.index].sense }">
									<input type="hidden" class="active" value="${petChkList[statNum.index].active }">
									<input type="hidden" class="inde" value="${petChkList[statNum.index].inde }">
								</div>
								<!-- pet_tbl -->
								<div class="info-petInfo-wrap">
									<input type="hidden" class="info-petNo" value="${pet.petNo }">
									<input type="hidden" class="info-memberNo" value="${pet.memberNo}">
									<input type="hidden" class="info-petType" value="${pet.petType}">
									<input type="hidden" class="info-petName" value="${pet.petName}">
									<input type="hidden" class="info-petGender" value="${pet.petGender}">
									<input type="hidden" class="info-petBdate" value="${pet.petBdate}">
									<input type="hidden" class="info-petKind" value="${pet.petKind}">
									<input type="hidden" class="info-petWeight" value="${pet.petWeight}">
									<input type="hidden" class="info-petNeut" value="${pet.petNeut}">
									<input type="hidden" class="info-petHospital" value="${pet.petHospital}">
									<input type="hidden" class="info-petNote" value="${pet.petNote}">
									<input type="hidden" class="info-petFilename" value="${pet.petFilename}">
									<input type="hidden" class="info-petFilepath" value="${pet.petFilepath}">
								</div>
							</div>
							<a href="#" onclick="deletePet(${pet.petNo});" class="deleteA">삭제</a>
							<hr class="hrCss">
						</c:forEach>
						<!-- 펫 성향 평균값 -->
						<input type="hidden" class="avg-sense" value="${avgStat[0].sense}">
						<input type="hidden" class="avg-social" value="${avgStat[0].social}">
						<input type="hidden" class="avg-active" value="${avgStat[0].active}">
						<input type="hidden" class="avg-inde" value="${avgStat[0].inde}">
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
						<td class="pdProfileTd" rowspan="4"  align="center"><img class="pdProfile" alt="펫 프로필사진" src=""></td>
						<td colspan="1" align="center">이름</td>
						<td colspan="2" align="center"><span class="answerSpan pdPName"></span></td>
						<td colspan="1" align="center">나이</td>
						<td colspan="2" align="center"><span class="answerSpan pdPAge"></span></td>
					</tr>
					<tr> 
						<td colspan="1" align="center">성별</td>
						<td colspan="2" align="center"><span class="answerSpan pdPGender"></span></td>
						<td colspan="1" align="center">중성화</td>
						<td colspan="2" align="center"><span class="answerSpan pdPNeut"></span></td>
					</tr>
					<tr> 
						<td colspan="1" align="center">생일</td>
						<td colspan="2" align="center"><span class="answerSpan pdPBdate"></span></td>
						<td colspan="1" align="center">종</td>
						<td colspan="2" align="center"><span class="answerSpan pdPKind"></span></td>
					</tr>
					<tr> 
						<td colspan="2" align="center" >자주가는병원<span style="color:green">✚</span></td>
						<td colspan="3" align="center" style="padding-right: 40px"><span class="answerSpan pdPHospital" style="font-size: 17px"></span></td>
					</tr>
				</table>
					<input type="hidden" class="detailPetNo" value="">
					<input type="hidden" class="detailPetType" value="">
			</div>
			<div class="pdMidDiv">
				<textarea class="pdCharacter" readonly></textarea>
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
					<button class="pdPetEditBtn pdBtn" onclick="editPet();">펫정보수정</button>
					<button class="pdClosebtn pdBtn" onclick="pdModalClose();">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function deletePet(petNo){
		var deletePetNo = petNo;
		if(confirm("정말 삭제하시겠습니까?\n삭제 후에는 복구할 수 없습니다")){
			location.href="/petDelete.do?petNo="+deletePetNo;
		}else{
			preventEvent();
		}
	}
	
	function editPet(){
		var pNo = $(".detailPetNo").val();
		var pType = $(".detailPetType").val();
		window.location.href="/petEditPetFrm.do?petNo="+pNo;
		
	};
	
	
	$(".pdModal-wrap").hide();
	function petDetail(e){
		//체크리스값들 불러오기
		var petChk = $(e).children(".info-petChk-wrap");
		var char1 = petChk.children(".character1").val();
		var char2 = petChk.children(".character2").val();
		var char3 = petChk.children(".character3").val();
		var char4 = petChk.children(".character4").val();
		var char5 = petChk.children(".character5").val();
		var char6 = petChk.children(".character6").val();
		var char7 = petChk.children(".character7").val();
		var char8 = petChk.children(".character8").val();
		var health1 = petChk.children(".health1").val();
		var health2 = petChk.children(".health2").val();
		var health3 = petChk.children(".health3").val();
		var social = petChk.children(".social").val();
		var sense = petChk.children(".sense").val();
		var active = petChk.children(".active").val();
		var inde = petChk.children(".inde").val();
		
		//펫정보값들 불러오기
		var petInfo = $(e).children(".info-petInfo-wrap");
		var pNo = petInfo.children(".info-petNo").val();
		var pType = petInfo.children(".info-petType").val();
		var pName = petInfo.children(".info-petName").val();
		var pGender = petInfo.children(".info-petGender").val();
		var pBdate = petInfo.children(".info-petBdate").val();
		var pKind = petInfo.children(".info-petKind").val();
		var pWeight = petInfo.children(".info-petWeight").val();
		var pNeut = petInfo.children(".info-petNeut").val();
		var pHospital = petInfo.children(".info-petHospital").val();
		var pNote = petInfo.children(".info-petNote").val();
		var pFilename = petInfo.children(".info-petFilename").val();
		var pFilepath = petInfo.children(".info-petFilepath").val();
		var stat1;
		var stat2;
		var stat3;
		var stat4;
		
		//상세창에 값 입력
		//수정을 위한 펫 번호, 타입(개, 고양이)
		$(".detailPetNo").val(pNo);
		$(".detailPetType").val(pType);
		//프로필사진부분
		$(".pdProfile").attr("src", "/resources/upload/pet/petProfile/"+pFilename);
		//이름
		$(".pdPName").text(pName);
		//나이
		var now = new Date();	// 현재 날짜 및 시간
		var year = now.getFullYear(); //현재년도
		var pAge = pBdate.substr(0,4);
		$(".pdPAge").text(year-pAge+1+"살");
		//성별
		if(pGender == "M"){
			$(".pdPGender").text("수컷");
		}else{
			$(".pdPGender").text("암컷");
		}
		//중성화
		if(pNeut == "Y"){
			$(".pdPNeut").text("했어요");
		}else{
			$(".pdPNeut").text("안했어요");
		}
		//생일
		var bdate = (pBdate).toString();
		var pmonth = bdate.substr(4,2);
		var pday = bdate.substr(6,2);
		$(".pdPBdate").text(pmonth+"월 "+pday+"일");
		//종
		$(".pdPKind").text(pKind);
		//병원
		$(".pdPHospital").text(pHospital);
		//추가정보
		$(".pdCharacter").text(
				pName+"(이)는"+'\n'+char1+'\n\n'+
				char2+'\n\n'+
				char3+'\n\n'+
				char4+'\n\n'+
				char5+'\n\n'+
				char6+'\n\n'+
				char7+'\n\n'+
				char8);
		
		//성향그래프
		var avgSense = $(".avg-sense").val();
		var avgSocial = $(".avg-social").val();
		var avgActive = $(".avg-active").val();
		var avgInde = $(".avg-inde").val();
		new Chart(document.getElementById("radar-chart"), {
		    type: 'radar',
		    data: {
		      labels: ["Independence", "Activity", "Min ~ Max", "Sociality","Sensitivity"],
		      datasets: [
		        {
		          label: "평균",
		          fill: true,
		          backgroundColor: "rgba(179,181,198,0.2)",
		          borderColor: "rgba(179,181,198,1)",
		          pointBorderColor: "#fff",
		          pointBackgroundColor: "rgba(179,181,198,1)",
		          data: [avgSense,avgSocial,avgActive,avgInde]
		        }, {
		          label: pName,
		          fill: true,
		          backgroundColor: "rgba(255,99,132,0.2)",
		          borderColor: "rgba(255,99,132,1)",
		          pointBorderColor: "#fff",
		          pointBackgroundColor: "rgba(255,99,132,1)",
		          pointBorderColor: "#fff",
		          data: [inde,active,10,social,sense]
		        }
		      ]
		    },
		    options: {
			    title: {
			      display: true,
			      text: pName+'(이)의 성향 그래프'
			    }   
		    }
		});
	
		$("#main").hide();
		$(".pdModal-wrap").show();
	}
	function pdModalClose(){

		$("#main").show();
		$(".pdModal-wrap").hide();
	}
	
	</script>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script type="text/javascript" src="/resources/js/member/mypageMyPet.js"></script>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>