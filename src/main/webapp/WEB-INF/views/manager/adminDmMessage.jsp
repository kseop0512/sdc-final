<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>똑독캣 마이페이지 - 관리자용</title>
        <link rel="stylesheet" href="/resources/css/admin/style-admin.css">
        <link rel="stylesheet" href="/resources/css/admin/gdm_message.css">
         <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
                        <!-- <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><hr class="dropdown-divider" /></li> -->
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
                        <h1 class="mt-4">1:1문의내역</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active" style="padding-left: 8px;">
                                <span>1:1문의 총</span>
                                <code>[<code id="dmMax_Count"></code>]</code>건
                            </li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                	관리자페이지 1:1  문의내역
                            </div>
                            <div class="card-body">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <p class="mb-0">
                                            <span>답변대기</span>
                                            <code>[<code id="dm_check"></code>]</code> 
                                            <span>/</span>
                                           	<span>답변완료</span>
                                            <code>[<code id="dm_checkRead"></code>]</code>건
                                        </p>
                                        <div id="nameIdSerarch-Box" style="float: right;">
                                            <form action="/selectdmType.do" method="get">
                                                <select name="dmType">
                                                    <option>문의유형</option>
                                                    <option value="0">취소/결제</option>
                                                    <option value="1">예약</option>
                                                    <option value="2">기타문의</option>
                                                </select>
                                                    <input class="input-form2" type="text" name="keyword" placeholder="아이디를 입력하세요" style="width: 500px;">
                                                    <button class="bc22">검색</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <table id="datatablesSimple">
								 <!-- 탭 -->
                      			<div id="membertab">
                                    <div id="tabAllMember" >전체<span>/</span></div>
                                    <div id="tabMember" class="active-tap">이용자<span>/</span></div>
                                <div id="tabPartner">파트너</div>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>구분(M/P)</th>
                                            <th>아이디</th>
                                            <th>문의유형</th>
                                            <th>문의내용</th>
                                            <th>날짜</th>
                                            <th>답변여부</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>구분(M/P)</th>
                                            <th>아이디</th>
                                            <th>문의유형</th>
                                            <th>문의내용</th>
                                            <th>날짜</th>
                                            <th>답변여부</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--모달-->
                        <div class="modalmodel-wrap" id="modalmodal-wrap"> <%--뒤에 흐려지게 하는거 --%>
                            <div class="modal-modal"><%--흐려진 화면 위로 보여지게 해주는거 --%>
                                <div class="modal-top">
                                    <h4>1:1 문의내용</h4>
                                </div>
                                <div class="modalmodal-content">
                                    <div class="dmFrm">
                                        <table class="table table-bordered" style="min-width: 800px;">
                                            <thead>
                                                <tr>
                                                	<th scope="col" style="text-align: center;">No</th>
                                                    <td scope="col" style="text-align: center;"><span id="detailNo"></span></td>
                                                    <th scope="col" style="text-align: center;">문의유형</th>
                                                    <td scope="col" style="text-align: center;"><span id="detailType"></span></td>
                                                    <th scope="col" style="text-align: center;">날짜</th>
                                                    <td scope="col" " style="text-align: center;"><span id="detailDate"></span></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" style="text-align: center;">아이디</th>
                                                    <td style="text-align: center;"><span id="detailId"></span></td>
                                                    <th style="text-align: center;">이름</th>
                                                    <td style="text-align: center;"><span id="detailSender"></span></td>
                                                    <th style="text-align: center;">연락처</th>
                                                    <td style="text-align: center;"><span id="detailPhone"></span></td>
                                                    <input type="hidden" id="sender" value="${sessionScope.g.adminId}">
                                                    <input type="hidden" id="receiver">
                                                    <input type="hidden" id="sender-category" value="A">
                                                    <input type="hidden" id="dm-type" value="">
                                                </tr>
                                            </thead>
                                            <tbody style="min-width: 800px;">
                                                <tr>
                                                    <th style="line-height: 130px;">문의내용</th>
                                                    <td colspan="5"><textarea id="detailContent" style="resize: none;" readonly></textarea></td>
                                                </tr>
                                                <tr>
                                                    <th style="line-height: 130px;">답변하기</th>
                                                    <td colspan="5"><textarea id="detailText" style="resize: none;"></textarea></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div id="modalmodal-Btn">
                                            <button class="btn bc11" onclick="dmSend();">답장</button>
                                            <button class="btn bc11" onclick="closeModal();">닫기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--모달 --%>
                        <div></div>
                </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="/resources/js/jquery-3.6.1.min.js"></script>
    <!--<script src="/resources/js/admin/dm_message.js"></script> -->
         <script src="/resources/js/admin/dm.js"></script>
    </body>
</html>