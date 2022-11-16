<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>똑독캣 마이페이지 - 관리자용</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resources/css/admin/style-admin.css">
        <link rel="stylesheet" href="/resources/css/admin/trainerBooking.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
</head>
<body class="sb-nav-fixed">
       <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/adminIndex.do">똑독캣 관리자페이지</a>
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
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
					<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">홈</div>
                            <a class="nav-link" href="/adminIndex.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                              	  마이페이지
                            </a>
                            <div class="sb-sidenav-menu-heading">메뉴</div>
                              <a class="nav-link" href="/selectUserList.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                	회원리스트
                            </a>
                            <a class="nav-link collapsed" href="/adminMemberList.do" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                               	 파트너관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/partnerList.do">파트너승인</a>
                                            <a class="nav-link" href="/getPartner.do">파트너리스트</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="/trainerBooking.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                	예약내역
                            </a>
                            <a class="nav-link" href="/adminDmMessage.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                1:1문의내역
                            </a>
                            <div class="sb-sidenav-menu-heading">게시판</div>
                            <a class="nav-link" href="/adminNotice.do?reqPage=1">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	공지사항
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        DDOK DOG&CAT
                    </div>
                </nav>
            </div>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">예약관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자용</li>
                        </ol>
                        <hr>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               	 위탁/훈련 예약취소
                            </div>
                            <div class="card-body">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <p class="mb-0">
                                           	<span>예약취소 총</span>
                                <code>[<code id="bookingCount"></code>]</code>건 
                                        </p>
                                        <p class="mb-0">
                                       	<span>취소신청 중</span>
                                       	<code>[<code id="CancelCnt"></code>]</code>
                                            	 <span>/ 취소완료</span>
                                            <code>[<code id="CancelOkay"></code>]</code>건
                                        </p>
                                        <div id="nameIdSerarch-Box" style="float: right;">
                                            <form action="/searchBooking.do" method="get">
                                                <select name="type" style="width: 150px">
                                                    <option value="bookingNo">예약번호</option>
                                                    <option value="id">아이디</option>
                                                </select>
                                                    <input class="input-form2" type="text" placeholder="입력하세요" style="width: 500px;" name="keyword">
                                                    <button type="submit" class="bc22" id="sb">검색</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>카테고리</th>
                                            <th>아이디</th>
                                            <th>전화번호</th>
                                            <th>예약일</th>
                                            <th>훈련신청일</th>
                                            <th>요금</th>
                                            <th>예약상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>카테고리</th>
                                            <th>아이디</th>
                                            <th>전화번호</th>
                                            <th>예약일</th>
                                            <th>훈련신청일</th>
                                            <th>요금</th>                                            
                                            <th>예약상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${list }" var="b">
                                        <tr>
                                            <td>${b.bookingNo }</td>
                                            <td> <c:choose>
                                            	<c:when test="${b.category eq 'T'}">
                                            		훈련
                                            	</c:when>
                                            	<c:when test="${b.category eq 'L'}">
                                            		위탁
                                            	</c:when>
                                            </c:choose></td>
                                            <td style="font-weight: 900; cursor: pointer;">
                                            	<div onclick="modal(this);">${b.memberId }</div>
                                            </td>
                                            <td>${b.bookingPhone }</td>
                                            <td>${b.bookedDate }</td>
                                            <td>${b.startDate }</td>
                                            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${b.price }"/></td>
<%--                                             <td><div style="overflow: hidden; width: 400px; text-overflow: ellipsis; white-space: nowrap;">${b.cancleComment }</div></td> --%>
                                            <td>
										<c:choose>
											<c:when test="${b.partnerAccept eq 'C'}">
												취소신청
											</c:when>
											<c:when test="${b.partnerAccept eq 'N'}">
												취소완료
											</c:when>
										</c:choose>
										</td>
<!-- 											<td> -->
<!--             									<select name="acceptType"> -->
<!--                                                     <option value="N">승인</option> -->
<!--                                                 </select> -->
<!--                                             </td> -->
													<td>
											<c:choose>
												<c:when test="${b.partnerAccept eq 'C'}">
                                            		<button class="bc22">확인
                                            			<a  href="/bookingFail.do?bookingNo=${b.bookingNo }"></a>
                                            		</button>												
												</c:when>
											</c:choose>
                                            </td>
                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                             <!-- 모달 -->
                             <div class="modalmodel-wrap" id="modalmodal-wrap"> <!--뒤에 흐려지게 해주는거-->
                            <div class="modal-modal"><!--흐려진 화면 위로 보여지게 해주는거 -->
                                <div class="modal-top">
                                    <p>상세정보</p>
                                    <span style="font-size: 30px;" class="close-area" onclick="closeModal();">&times;</span>
                                </div>
                                <div class="modalmodal-content">
                                    <div class="dmFrm">
                                        <table class="table table-bordered" id="oneNotice">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="text-align: center;">예약번호</th>
                                                    <td scope="col"  colspan="5" style="text-align: center;">
                                                    	<span id="detailNo"></span>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <th scope="col" style="text-align: center;">아이디</th>
                                                    <td scope="col" colspan="5" style="text-align: center;">
                                                    	<span id="detailId"></span>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <th scope="col" style="text-align: center;">파트너번호</th>
                                                    <td scope="col"  colspan="5" style="text-align: center;">
                                                    	<span id="detailPartnerNo"></span>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <th scope="col" style="text-align: center;">펫번호</th>
                                                    <td scope="col"  colspan="5" style="text-align: center;">
                                                    	<span id="detailPetNo"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col" style="text-align: center;">예약일</th>
                                                    <td scope="col"  colspan="5" style="text-align: center;">
                                                    	<span id="detailBookingDate"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col" style="text-align: center;">시작일</th>
                                                    <td scope="col" colspan="1" style="text-align: center;">
                                                    	<span id="detailStart"></span>
                                                    </td>
                                                    <th scope="col" style="text-align: center;">종료일</th>
                                                    <td scope="col" colspan="1" style="text-align: center;">
                                                    	<span id="detailEnd"></span>
                                                    </td>
                                                       <th scope="col" style="text-align: center;">훈련시간</th>
                                                    <td scope="col" colspan="1" style="text-align: center;">
                                                    	<span id="detailTime"></span>
                                                    </td>
                                                </tr>
                                                <tr>
            									 <th scope="col" style="text-align: center;">예약현황</th>
                                                    <td scope="col" colspan="2"  style="text-align: center;">
                                                    	<span id="detailPartnerAccpet" ></span>
                                                    </td>
                                                    <th scope="col" style="text-align: center;">금액</th>
                                                    <td scope="col" colspan="2" style="text-align: center;">
                                                    	<span id="detailPrice" ></span>
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody>
            									
                                                <tr>
                                                    <th scope="col" style="text-align: center; line-height: 200px;">취소신청사유</th>
                                                    <td scope="col"  colspan="5"  style="height: 200px;">
                                                    	<span id="detailCancelComment" ></span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                    
   
                                    <div id="modalmodal-Btn">
                                        <button id="admin-noticeUpdate" class="btn bc11 bs4" onclick="closeModal();"><span>닫기</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 -->
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 똑독캣 2022</div>
                            <div>
                                <a href="index.html">메인으로 돌아가기</a>
                                &middot;
                                <a href="index.html#menu">산책 &amp; 돌봄 서비스</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
       	<script src="/resources/js/scripts.js"></script>
       	<script src="/resources/js/jquery-3.6.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
         <script src="/resources/js/datatables-simple-demo.js"></script>
         <script src="/resources/js/admin/trainerBooking.js"></script>
    </body>
</html>