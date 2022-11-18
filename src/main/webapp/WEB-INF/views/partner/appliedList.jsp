<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>파트너메인페이지</title>
        <link href="/resources/css/partnerStyles.css" rel="stylesheet" />
        <jsp:include page="/WEB-INF/views/partner/common/headContent.jsp"/>
</head>
    <style>
    	.list-table th, .list-table td{
    		text-align: center;
    	}
    	table img{
    		width: 100%;
    		height: 100%;
    	}
    	.petInfo{
    		min-height: 80px; 
    		border:1px solid #ebebeb;
    		border-radius: 5px;
    		margin-top: 10px;
    		margin-bottom: 10px;
    	}
    	.petInfo-wrapper table{
    		vertical-align: middle;
    		text-align: center;
    	}
    	.petInfo-wrapper table>tbody>tr td{
    		color: #04293A;
    		font-weight: 1000;
    	}
    	.petInfo{
    		padding: 10px 10px;
    	}
    	#question{
    		color: #EA5C2B;
    		font-size: 14px;
    		font-weight: 900;
    	}
    	#answer1, #answer2, #answer3{
    		font-size: 14px;
    		padding-left: 20px;
    	}
    </style>
<body class="sb-nav-fixed">
<jsp:include page="/WEB-INF/views/partner/common/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/partner/common/sidebar.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                	<div class="container-fluid px-4">
                		<h1>예약 요청 리스트</h1>
                		<ol class="breadcrumb mb-4">
                			<li class="breadcrumb-item active">똑독캣 파트너
                		</ol>
                		<div class="container">
                			<div class="card mb-4">
                				<div class="card-header">
                					<i class="fas fa-table me-1"></i>
                					${sessionScope.p.PName }님의 예약요청 리스트
                				</div>
                				<c:choose>
                				<c:when test="${sessionScope.p.category == 'T' }">
                				<div class="card-body">
                					<table class="list-table"id="datatablesSimple">
                						<thead>
                							<tr>
                								<th>예약번호</th>
                								<th>신청자 아이디</th>
                								<th>예약신청 날짜</th>
                								<th>예약신청 시간</th>
                								<th>연락처</th>
                								<th>결제 날짜</th>
                								<th>반려견 정보</th>
                							</tr>
                						</thead>
                						<tbody>
                							<c:forEach items="${lists }" var="li">
                							<input type="hidden" name="petNo" value="${li.petNo }">
											<tr>
												<td>${li.bookingNo }</td>
												<td>${li.memberId }</td>
												<td>${li.startDate }</td>
												<td>${li.bookingTime }</td>
												<td>${li.bookingPhone }</td>
												<td>${li.bookedDate }</td>
												<td>
			                                       <input type="hidden" id="pNo" value="${sessionScope.p.PNo }">
			                                       <input type="hidden" name="petNo" value="${li.petNo }">
			                                       <input type="hidden" id="bookingPhone" value="${li.bookingPhone }">
			                                       <button type="button" class="btn-warning petDetailBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">반려견 보기</button>
                                    			</td>
											</tr>
												
											</c:forEach>
                						</tbody>
                					</table>
                				</div>
                				</c:when>
                				<c:when test="${sessionScope.p.category == 'L'  }"> <!-- 위탁펫시터 화면 -->
                				<div class="card-body">
                					<table class="list-table"id="datatablesSimple">
                						<thead>
                							<tr>
                								<th>예약번호</th>
                								<th>신청자 아이디</th>
                								<th>맡기는 날짜/시간</th>
                								<th>찾는 날짜/시간</th>
                								<th>연락처</th>
                								<th>결제 날짜</th>
                								<th>반려견 정보</th>
                							</tr>
                						</thead>
                						<tbody>
                							<c:forEach items="${sitter }" var="s">
                							<input type="hidden" name="petNo" value="${s.petNo }">
											<tr>
												<td>${s.bookingNo }</td>
												<td>${s.memberId }</td>
												<td>${s.startDate }</td>
												<td>${s.endDate }</td>
												<td>${s.bookingPhone }</td>
												<td>${s.bookedDate }</td>
												<td>
			                                       <input type="hidden" id="pNo" value="${sessionScope.p.PNo }">
			                                       <input type="hidden" name="petNo" value="${s.petNo }">
			                                       <input type="hidden" id="bookingPhone" value="${s.bookingPhone }">
			                                       <button type="button" class="btn-warning petDetailBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">반려견 보기</button>
                                    			</td>
											</tr>
												
											</c:forEach>
                						</tbody>
                					</table>
                				</div>
                				</c:when>
                				</c:choose>
                			</div>
                		</div> <!-- end Container -->
                	</div>
                </main>
                <!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: 900;">반려견 정보</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				      	<div class="petInfo-wrapper">
					      	<table class="table">
					      		<tr>
					      			<td rowspan="4" style="width: 30%;"><img id="petImg"></td>
					      			<th>이름</th>
					      			<td id="name"></td>
					      			<th>나이</th>
					      			<td id="age"></td>
					      		</tr>
					      		<tr>
					      			<th>성별</th>
					      			<td id="gender"></td>
					      			<th>중성화</th>
					      			<td id="neut"></td>
					      		</tr>
					      		<tr>
					      			<th>생일</th>
					      			<td id="dob"></td>
					      			<th style="width: 20%">종</th>
					      			<td style="width: 15%;" id="kind"></td>
					      		</tr>
					      		<tr>
					      			<th colspan="2">자주 가는 병원</th>
					      			<td colspan="2" id="hospital"></td>
					      		</tr>
					      	</table>
					      	<div class="petInfo">
					      		<p id="question">산책할 때 다른 강아지를 보면 어떻게 행동하나요?</p>
					      		<p id="answer1"></p>
					      		<p id="question">집에서 평상시 행동은 어떤가요?</p>
					      		<p id="answer2"></p>
					      		<p id="question">주로 어떤 보호자를 따르는 편인가요?</p>
					      		<p id="answer3"></p>
					      	</div> <!-- petInfo -->
					      	<span style="font-weight: 900;">똑독캣 님의 반려견 소개</span>
					      	<div class="petInfo about-pet"></div>
					      	<span style="font-weight: 900;">파트너님께 남긴 메시지</span>
					      	<div class="petInfo leftMsg"></div>
				      	</div> <!-- petInfo-wrapper -->
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary denyBtn" data-bs-dismiss="modal">거절</button>
				        <button type="button" class="btn btn-warning acceptBtn">수락</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!--  end Modal -->
            </div>
        </div>
        <script>
        $(document).on("click",".petDetailBtn",function(){
        	const petNo = $("input[name=petNo]").val();
        	let bookingNo = $(this).parent().parent().children().eq(0).text();
        	console.log(bookingNo);
        	console.log(petNo);
         	$.ajax({
        		url: "/getPetInfo.do",
        		data: {petNo:petNo, bookingNo:bookingNo},
        		dataType: 'json',
        		success: function(data){
        			if(data!=0){
        			$("#petImg").empty(); $(".about-pet").empty(); $("#answer2").empty();
        			$("#name").empty(); $("#hospital").empty();	$("#answer3").empty();
        			$("#age").empty(); $("#kind").empty();	 $(".leftMsg").empty();
        			$("#dob").empty(); $("#neut").empty();
        			$("#gender").empty();	$("#answer1").empty();
        			
        			const petImg = $("#petImg");
        		    petImg.attr("src","/resources/upload/pet/petProfile/"+data.petFilepath);
        		    $("#name").append(data.petName);
        		    const currentYear = new Date().getFullYear();
          			const dob = data.petBdate.substring(0,4);
          			const age = (currentYear - dob) + 1;
        		    $("#age").append(age+"살");
        		    const month = data.petBdate.substring(4,6);
        		    const date = data.petBdate.substring(6,8);
        		    $("#dob").append(month+"월"+date+"일");
        		    $("#gender").append(data.petGender);
        		    $("#neut").append(data.petNeut);
        		    $("#kind").append(data.petKind);
        		    $("#hospital").append(data.petHospital);
        		    $(".about-pet").append(data.petNote);
        		    $("#answer1").append(data.character2);
        		    $("#answer2").append(data.health1);
        		    $("#answer3").append(data.health2);
        		    $(".leftMsg").append(data.specialRequest);
        		}
        		}
         	}) // ajax끝
         	$(".acceptBtn").on("click",function(){
                if(confirm("예약 요청을 수락하시겠습니까?")){
                   const pNo = $("#pNo").val();
                   const bookingPhone = $("#bookingPhone").val();
                   location.href="/acceptBooking.do?bookingNo="+bookingNo+"&&pNo="+pNo+"&&bookingPhone="+bookingPhone;
                }
             })
             $(".denyBtn").on("click",function(){
                if(confirm("예약 요청을 정말 '거절'하시겠습니까?^^")){
                   const pNo = $("#pNo").val();
                   console.log("위탁"+pNo);
                   const bookingPhone = $("#bookingPhone").val();
                  	console.log("위탁"+bookingPhone);
                   location.href="/denyBooking.do?bookingNo="+bookingNo+"&&pNo="+pNo+"&&bookingPhone="+bookingPhone;
                }
             })
         });
        </script>
        <script src="/resources/js/partner-datatables-simple-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    </body>
</html>