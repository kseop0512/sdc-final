<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:choose>
    <c:when test="${not empty sessionScope.g }">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>똑독캣 마이페이지 - 관리자용</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
         <link rel="stylesheet" href="/resources/css/admin/style-admin.css">
         <link rel="stylesheet" href="/resources/css/admin/notice.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>



<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/adminIndex.do">똑독캣 관리자페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4" style="margin-left: auto !important;">
                <li class="nav-item dropdown" style="position: relative;display: flex;flex-wrap: wrap;align-items: stretch;width: 100%;">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <!--<li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><hr class="dropdown-divider" /></li>-->
                        <li><a class="dropdown-item" href="/logoutManager.do">Logout</a></li>
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
                        <h1 class="mt-4">공지사항</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자용</li>
                        </ol>
                        <hr style="color: #cda45e;">
                        <div id="notice-title">
                        	<h1>게시글 상세보기</h1>
						</div>
						<hr style="color: #cda45e;">
						<table border="1" style="width: 100%;background-color: #f8f9fa;font-size: 20px;border-color: #282f44;">
							<tr style="border-bottom: black solid 1px;">
								<th style="border-right: black solid 1px;width: 90px;text-align: center;">글번호</th>
								<td style="border-right: black solid 1px;padding-left: 5px;">${ng.noticeGNo }</td>
								<th style="border-right: black solid 1px;width: 90px;text-align: center;">제목</th>
								<td style="padding-left: 5px;">${ng.noticeGTitle }</td>
							</tr>
							<tr style="border-bottom: black solid 1px;">
								<th style="border-right: black solid 1px;text-align: center;">작성자</th>
								<td style="border-right: black solid 1px;padding-left: 5px;">${ng.noticeGWriter }</td>
								<th style="border-right: black solid 1px;text-align: center;">작성일</th>
								<td style="padding-left: 5px;">${ng.noticeGDate }</td>
							</tr>
							<tr style="border-bottom: black solid 1px;">
								<th style="border-right: black solid 1px;text-align: center;">첨부파일</th>
								<td colspan="3">
								<c:forEach items="${ng.fileList }" var="fvg">
									<p>
										<a href="#">${fvg.filenameG }</a>
									</p>
								</c:forEach>
								</td>
							</tr>
							<tr style="background-image: url(/resources/assets/img/logo-15수정본.png);background-repeat: no-repeat;background-position: center center;background-size: contain;">
								<th style="border-right: black solid 1px;text-align: center;">내용</th>
								<td colspan="4" style="height: 500px; padding-left: 5px;  white-space: pre-line;">
									${ng.noticeGContent }
								</td>
							</tr>
						</table>
                    </div>
                </main>
                <div style="height: 20vh;"></div>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 똑독캣 2022</div>
                            <div>
                                <a href="/">메인으로 돌아가기</a>
                                &middot;
                                <a href="/#menu">산책 &amp; 돌봄 서비스</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
      	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/notice.js"></script>
    </body>
</c:when>

<c:otherwise>

	 <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
    <title>똑독캣 공지사항</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
         <link rel="stylesheet" href="/resources/css/admin/style-admin.css">
         <link rel="stylesheet" href="/resources/css/admin/notice.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
        <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    </head>
    <body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	
	<main style="margin-top: 150px;">
	<div id="wrapper" style="position: relative;min-height: calc(100vh - 63px);padding-bottom: 80px;background-color: #fff;">
         <div id="contents" class="notice" style="max-width: 1170px;margin: 0 auto;">
         	<h1 style="height: 145px;padding-top: 82px;color: #17191d;">공지사항</h1>
         	<h2 style="position: absolute;top: 86px;right: 35px;padding-top: 5px;font-size: 14px;font-weight: 400;">똑독캣 공지</h2>
         	<div class="noticeView" style="border-top: 2px solid #17191d;">
         		<h3 style="height: 58px;padding: 24px 0 11px 20px;color: #17191d;">${ng.noticeGTitle }</h3>
         		<div class="noticeInfo" style="position: relative;height: 40px;padding-right: 6px;border-bottom: 1px solid #dde1e5;text-align: right;color: black;">
         			<div class="cate" style="position: absolute;top: 0;left: 20px;">
         				<th class="acchidden" style="position: absolute;overflow: hidden;clip: rect(0 0 0 0);height: 1px;width: 1px; margin: -1px;"></th>
         				<th>[공지]</th>
         			</div>
         			<div class="date" style="display: inline-block;padding-right: 21px;">
         				<th class="acchidden" style="position: absolute;overflow: hidden;clip: rect(0 0 0 0);height: 1px;width: 1px; margin: -1px;">등록일</th>
         				<td>${ng.noticeGDate }</td>
         			</div>
         			<div class="count" style="display: inline-block;padding-right: 21px;">
         				<th class="acchidden" style="position: absolute;overflow: hidden;clip: rect(0 0 0 0);height: 1px; width: 1px;margin: -1px;">조회수</th>
         				<td>${ng.readGCount }</td>
         			</div>
         		</div>
         		<div class="noticeInfo" style="position: relative;padding-right: 6px;border-bottom: 1px solid #dde1e5;text-align: right;">
         			<tr style="border-bottom: black solid 1px;">
						<th style="border-right: black solid 1px;text-align: center;">첨부파일</th>
						<td colspan="3">
						<c:forEach items="${ng.fileList }" var="fvg">
							<p style="color: black;">
								<a href="/boardFileDown.do?fileGNo=${fvg.fileGNo }">${fvg.filenameG }</a>
							</p>
						</c:forEach>
						</td>
					</tr>
         		</div>
         		<div class="noticeCnts" style="padding: 36px 20px;color: #363940;">
         			<p class="MsoNoSpacing" style="margin: 0cm;">
         				<span style="font-size: 20.5px;letter-spacing: -0.4px;color: #000000;white-space: pre-line;">${ng.noticeGContent }</span>
         			</p>
         		</div>
         		<div class="noticeBt" style="padding-top: 60px;text-align: center;border-top: 1px solid #dde1e5;">
         			<a href="/homeNoticeList.do?reqPage=1" style="display: inline-block;width: 146px;height: 52px;padding-top: 12px;font-weight: 700;border: 2px solid #ffb347;background-color: #ffb347;color: #fff;">목록</a>
         		</div>
         	</div>
         </div>
    </div>
	</main>
	
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/notice.js"></script>
	</body>

</c:otherwise>
</c:choose>
</html>