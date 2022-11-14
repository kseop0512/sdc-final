<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <link rel="stylesheet" href="/resources/css/admin/partnerList.css">
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
                            <a class="nav-link collapsed" href="/adminMemberList.do" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                               	 유저관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/adminMemberList.do">유저리스트</a>
                                     <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        	파트너관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                     <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="/partnerList.do">파트너승인</a>
                                            <a class="nav-link" href="/getPartner.do">등급관리</a>
                                        </nav>
                                    </div>
                                    
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                	신고내역
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="/reviewReportList.do" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        	리뷰신고
                                    </a>
                                    <a class="nav-link collapsed" href="/qnaReportList.do" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Q&A신고
                                    </a>
                                </nav>
                            </div>
                            <a class="nav-link" href="/reservationList.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                	예약내역
                            </a>
                            <a class="nav-link" href="/adminDmMessage.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                1:1문의내역
                            </a>
                            <div class="sb-sidenav-menu-heading">게시판</div>
                            <a class="nav-link" href="/adminNotice.do">
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
                        <h1 class="mt-4">파트너관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자용</li>
                        </ol>
                        <hr>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               	 파트너승인
                            </div>
                            <div class="card-body">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <p class="mb-0">
                                           	<span>파트너 신청</span>
                                <code>[<code id="partnerCount"></code>]</code>건 
                                        </p>
                                        <div id="nameIdSerarch-Box" style="float: right;">
                                            <form action="/partnerList.do" method="get">
                                                <select name="type">
                                                    <option value="id">아이디</option>
                                                    <option value="name">이름</option>
                                                </select>
                                                    <input class="input-form2" type="text" placeholder="입력하세요" style="width: 500px;" name="keyword">
                                                    <button type="submit" class="bc22" >검색</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>전화번호</th>
                                            <th>가입일</th>
                                            <th>테스트점수</th>
                                            <th>자격증</th>
                                            <th>등급</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>전화번호</th>
                                            <th>가입일</th>
                                            <th>테스트점수</th>
                                            <th>자격증</th>
                                            <th>등급</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${list }" var="p">
                                        <tr>
                                            <td>${p.PNo }</td>
                                            <td style="font-weight: 900; cursor: pointer;"><div onclick="modal(this);">${p.PName }</div></td>
                                            <td>${p.PId }</td>
                                            <td>${p.PPhone }</td>
                                            <td>${p.applyDate }</td>
                                            <td>점수</td>
                                            <td><div style="overflow: hidden; width: 400px; text-overflow: ellipsis; white-space: nowrap;">${p.license }</div></td>
                                            <td>
										<c:choose>
											<c:when test="${p.PGrade eq 'N'}">
												준파트너
											</c:when>
										</c:choose>
										</td>
											<td>
            									<select name="gradeType">
                                                    <option value="C">승인</option>
                                                    <option value="Z">거절</option>
                                                </select>
                                            </td>
                                            <td>
                                            	<input type="hidden" name="pNo"><!-- '${pNo}','${gradeType}' -->
                                            	<button type="submit" onclick="partnerGrade(this);">확인</button>
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
                                                    <td scope="col" rowspan="7" style="width: 230px; height: 200px;">
                                                    	<span id="detailProfile"><img src="" style="width: 230px; height: 200px;"></span>
                                                    </td>
                                                    <th scope="col" style="text-align: center;">아이디</th>
                                                    <td scope="col"  style="text-align: center;">
                                                    	<span id="detailId"></span>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <th scope="col" style="text-align: center;">이름</th>
                                                    <td scope="col" style="text-align: center;">
                                                    	<span id="detailName"></span>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <th scope="col" style="text-align: center;">생년월일</th>
                                                    <td scope="col"  style="text-align: center;">
                                                    	<span id="detailHbd"></span>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <th scope="col" style="text-align: center;">주소</th>
                                                    <td scope="col" style="text-align: center;">
                                                    	<span id="detailAddr"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col" style="text-align: center;">전화번호</th>
                                                    <td scope="col" colspan="6" style="text-align: center;">
                                                    	<span id="detailPhone"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col" style="text-align: center;">성별</th>
                                                    <td scope="col" colspan="6" style="text-align: center;">
                                                    	<span id="detailG"></span>
                                                    </td>
                                                
                                                </tr>
                                                <tr>
                                                    <th scope="col" style="text-align: center;">가입일</th>
                                                    <td scope="col" colspan="6" style="text-align: center;">
                                                    	<span id="detailApplydate" ></span>
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th style="line-height: 230px; text-align: center;">자격증</th>
                                                    <td colspan="5">
                                                    	<span id="detailLicence"></span>
                                                    </td>
                                                </tr>
                                                  <tr>
                                                    <th style="line-height: 230px; text-align: center;">근무경력</th>
                                                    <td colspan="5">
                                                    	<span id="detailWork"></span>
                                                    </td>
                                                </tr>
                                                  <tr>
                                                    <th style="line-height: 230px; text-align: center;">지원동기</th>
                                                    <td colspan="5">
                                                    	<span id="detailMotive"></span>
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
         <script src="/resources/js/admin/partnerList.js"></script>
    </body>
</html>