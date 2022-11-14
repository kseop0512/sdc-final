<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>똑독캣 마이페이지 - 관리자용</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resources/css/admin/style-admin.css">
        <link rel="stylesheet" href="/resources/css/Qna_reportList.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
                        <!--<li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><hr class="dropdown-divider" /></li>-->
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
                                            <a class="nav-link" href="/getPartner.do">파트너리스트</a>
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
                        <h1 class="mt-4">예약내역</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자용</li>
                        </ol>
                        <hr>
                        <br>
                        <br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                예약현황
                            </div>
                            
                            <div class="card-body">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <p class="mb-0">
                                            총 예약
                                            <code>[0]</code> 
                                            <span>/</span>
                                            예약취소
                                            <code>[0]</code>건
                                        </p>
                                    </div>
                                </div>
                                <input type="hidden" id="memberId" value="${sessionScope.m.memberId}">
                                <div id="report-btn">
                                    <button class="btn bc22 bs4">처리하기</button>
                                </div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>예약번호</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>서비스종류</th>
                                            <th>신청날짜</th>
                                            <th>이용자현황</th>
                                            <th>파트너현황</th>
                                            <th>요금</th>
                                            <th>관리자</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>예약번호</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>서비스종류</th>
                                            <th>신청날짜</th>
                                            <th>이용자현황</th>
                                            <th>파트너현황</th>
                                            <th>요금</th>
                                            <th>관리자</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Tiger Nixon</td>
                                            <td>01011112323</td>
                                            <td>산+돌/120분</td>
                                            <td>2022/10/11<br>
                                                13:00 ~ 15:00
                                            </td>
                                            <td>
                                                <select name="이용자현황" required autofocus>
                                                    <option value="신청대기">신청대기</option>
                                                    <option value="취소요청">취소요청</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="파트너현황" required autofocus>
                                                    <option value="수락대기">수락대기</option>
                                                    <option value="수락완료">수락완료</option>
                                                    <option value="취소요청">취소요청</option>
                                                </select>
                                            </td>
                                            <td>54,000</td>
                                            <td>
                                                <select name="관리자" required autofocus>
                                                    <option value="처리중">처리중</option>
                                                    <option value="완료">완료</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Tiger Violet</td>
                                            <td>01011117777</td>
                                            <td>산+돌/120분</td>
                                            <td>2022/10/13<br>
                                                15:00 ~ 17:00
                                            </td>
                                            <td>
                                                <select name="이용자현황" required autofocus>
                                                    <option value="신청대기">신청대기</option>
                                                    <option value="취소요청">취소요청</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="파트너현황" required autofocus>
                                                    <option value="수락대기">수락대기</option>
                                                    <option value="수락완료">수락완료</option>
                                                    <option value="취소요청">취소요청</option>
                                                </select>
                                            </td>
                                            <td>54,000</td>
                                            <td>
                                                <select name="관리자" required autofocus>
                                                    <option value="처리중">처리중</option>
                                                    <option value="완료">완료</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>김만식</td>
                                            <td>01011337777</td>
                                            <td>산+돌/60분</td>
                                            <td>2022/10/13<br>
                                                11:00 ~ 12:00
                                            </td>
                                            <td>
                                                <select name="이용자현황" required autofocus>
                                                    <option value="신청대기">신청대기</option>
                                                    <option value="취소요청">취소요청</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="파트너현황" required autofocus>
                                                    <option value="수락대기">수락대기</option>
                                                    <option value="수락완료">수락완료</option>
                                                    <option value="취소요청">취소요청</option>
                                                </select>
                                            </td>
                                            <td>27,000</td>
                                            <td>
                                                <select name="관리자" required autofocus>
                                                    <option value="처리중">처리중</option>
                                                    <option value="완료">완료</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>마동석</td>
                                            <td>01099997777</td>
                                            <td>똑독캣 패키지2</td>
                                            <td>2022/10/15<br>
                                                15:00 ~ 17:40
                                            </td>
                                            <td>
                                                <select name="이용자현황" required autofocus>
                                                    <option value="신청대기">신청대기</option>
                                                    <option value="취소요청">취소요청</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="파트너현황" required autofocus>
                                                    <option value="수락대기">수락대기</option>
                                                    <option value="수락완료">수락완료</option>
                                                    <option value="취소요청">취소요청</option>
                                                </select>
                                            </td>
                                            <td>200,000</td>
                                            <td>
                                                <select name="관리자" required autofocus>
                                                    <option value="처리중">처리중</option>
                                                    <option value="완료">완료</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>