<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>파트너메인페이지</title>
        <script src="http://code.jquery.com/jquery-3.6.1.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/resources/css/partnerStyles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">파트너 마이페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/">SDC홈페이지</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/logout.do">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                	내정보 수정
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/showProfile.do">프로필 변경</a>
                                    <a class="nav-link" href="/changePwFrm.do">비밀번호 변경</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                               		 스케줄 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        	예약관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link"  href="/appliedList.do?pNo=${sessionScope.p.PNo }">예약요청 리스트</a>
                                            <a class="nav-link" href="#">뭐 넣지</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        스케줄
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">스케줄 달력</a>
                                            <a class="nav-link" href="#">스케줄 등록</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">수입관리</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                수입 내역 확인하기
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                수입 내역
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${sessionScope.p.PId }
                    </div>
                </nav>
            </div>
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
                				<c:when test="${sessionCope.p.category == T  }">
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
													<button type="button" class="btn-warning petDetailBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">반려견 보기</button>
												</td>
											</tr>
												
											</c:forEach>
                						</tbody>
                					</table>
                				</div>
                				</c:when>
                				<c:when test="${sessionScope.p.category == L }">
                				
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
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">거절</button>
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
        	const petNo = $(this).prev().val();
        	let bookingNo = $(this).parent().parent().children().eq(0).text();
        	console.log(bookingNo);
         	$.ajax({
        		url: "/getPetInfo.do",
        		data: {petNo:petNo, bookingNo:bookingNo},
        		dataType: 'json',
        		success: function(data){
        			
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
         	}) // ajax끝
         	$(".acceptBtn").on("click",function(){
         		if(window.confirm("예약 요청을 수락하시겠습니까?")){
         			const pNo = $("#pNo").val();
         			location.href="/acceptBooking.do?bookingNo="+bookingNo+"&&pNo="+pNo;
         		}
         	})
         });
        </script>
        <script src="/resources/js/partner-datatables-simple-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    </body>
</html>