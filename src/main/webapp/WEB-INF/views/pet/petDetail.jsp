<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<style>
.pdModal-wrap{
	display: flex;
	justify-content: center;
    min-height: 100vh;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.2);
    overflow: scroll;
}
.pdModal-wrap::-webkit-scrollbar{
	display:none;
}
.petDetail-wrap{
	width: 800px;
	height: 1000px;
	background-color: #fff;
	border: 3px solid black;
	margin-top: 20vh;
	margin-bottom: 50px;
}
.pdTable{
	color: black;
	margin: 0 auto;
	margin-top: 10px;
	width: 740px;
	height: 300px;
	font-size: 25px;
	font-weight: bolder;
}
.pdTable td{
	width: 90px;
}
.answerSpan{
	width: 140px;
	border-bottom: 2px solid #ffb347;
	padding-bottom: 5px;
	font-size: 20px;
	font-weight: normal;
	color: rgba(0,0,0,0.7);
}
.pdProfileTd{
	border: 1px solid black;
	width: 250px !important;
}
.pdMidDiv{
	width: 740px;
	margin: 0 auto;
	color: black;
	margin-top: 5px;
}
.pdCharacter{
	width: 726px;
    height: 240px;
    border: 2px solid rgba(255, 179, 71, 0.3);
    resize: none;
    outline:none;
}
.pdBotDiv{
	width: 800px;
	margin: 0 auto;
	height: 410px;
	margin-top: 5px;
	color: black;
}
.pdGraph{
	display: inline-block;
	width: 240px;
	height: 270px;
	border: 2px solid rgba(255, 179, 71, 0.3);
}
.pdBtn-wrap{
    display: inline-block;
    width: 210px;
    height: 150px;
    position: relative;
    right: -50px;
    bottom: 30px;
}
.pdBotDiv>div{
	margin-left:25px;
	margin-top: 3px;
}
#radar-chart{
	margin-left: 10px;
}
.pdGraph-detail{
	display: inline-block;
    width: 300px;
    position: absolute;
    height: 250px;
}
.pdGraph-detail>textarea{
	width: 100%;
	height: 100%;
	resize: none;
	border: 1px solid rgba(255, 179, 71, 0.2);
	outline:none;
}
.pdBtn{
	display: block;
    width: 200px;
    height: 50px;
    margin-bottom: 5px;
    border-radius: 10px;
    margin-top: 15px;
    border: none;
}
.pdBtn:hover{
	background-color: #ffb347;
	color: #fff;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
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
					<button class="pdClosebtn pdBtn" onclick="">닫기</button>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
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
          data: [5,5,0,5,5]
        }, {
          label: "철용",
          fill: true,
          backgroundColor: "rgba(255,99,132,0.2)",
          borderColor: "rgba(255,99,132,1)",
          pointBorderColor: "#fff",
          pointBackgroundColor: "rgba(255,99,132,1)",
          pointBorderColor: "#fff",
          data: [4,3,10,8,7]
        }
      ]
    },
    options: {
	    title: {
	      display: true,
	      text: '철용이의 성향 그래프'
	    }   
    }
});
</script>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<!-- 마이페이지 JS -->
	<script type="text/javascript" src="/resources/js/member/mypage_nav.js"></script>
</body>
</html>