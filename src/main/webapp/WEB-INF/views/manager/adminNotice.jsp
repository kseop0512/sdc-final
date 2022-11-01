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
            <a class="navbar-brand ps-3" href="index_my.html">똑독캣 관리자페이지</a>
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
                            <a class="nav-link" href="index_my.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                마이페이지
                            </a>
                            <div class="sb-sidenav-menu-heading">메뉴</div>
                            <a class="nav-link collapsed" href="memberList.html" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                유저관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="memberList.html">유저리스트</a>
                                    <a class="nav-link" href="partnerList.html">파트너관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                신고내역
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="reportList.html" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        리뷰신고
                                    </a>
                                    <a class="nav-link collapsed" href="reportList.html" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Q&A신고
                                    </a>
                                </nav>
                            </div>
                            <a class="nav-link" href="reservationList.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                예약내역
                            </a>
                            <a class="nav-link" href="dm_message.html">
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
                        <h1 class="mt-4">공지사항</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자용</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                관리페이지 공지사항
                            </div>
                            <div class="card-body">
                                <div style="font-size: 15px; padding-bottom: 10px;">게시글 총<code id="singoCount">[0]</code>건</div>
                                <div id="notice-write">
                                    <!-- <input type="hidden" id="memberId" value="${sessionScope.m.memberId}"> -->
                                            <a class="btn bc22 writeBtn" href="/adminNoticeWriteFrm.do">글쓰기</a> 
                                </div>
                                <!-- <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>선택</th>
                                            <th>게시글번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>선택</th>
                                            <th>게시글번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td><label><input type="checkbox" name="choice" value="choice"></label></td>
                                            <td>4</td>
                                            <td><a href="#">사이트 이용 안내 공지사항 입니다</a></td>
                                            <td>관리자</td>
                                            <td>2022/10/26</td>
                                            <td>33</td>
                                            <td><button>삭제</button></td>
                                        </tr>
                                        <tr>
                                            <td><label><input type="checkbox" name="choice" value="choice"></label></td>
                                            <td>3</td>
                                            <td><a href="#">베타버전 사이트 공지사항 입니다</a></td>
                                            <td>관리자</td>
                                            <td>2022/10/26</td>
                                            <td>29</td>
                                            <td><button>삭제</button></td>
                                        </tr>
                                        <tr>
                                            <td><label><input type="checkbox" name="choice" value="choice"></label></td>
                                            <td>2</td>
                                            <td><a href="#">공지사항 테스트 입니다</a></td>
                                            <td>관리자</td>
                                            <td>2022/10/25</td>
                                            <td>12</td>
                                            <td><button>삭제</button></td>
                                        </tr>
                                        <tr>
                                            <td><label><input type="checkbox" name="choice" value="choice"></label></td>
                                            <td>1</td>
                                            <td><a href="#">테스트 진행중 입니다</a></td>
                                            <td>관리자</td>
                                            <td>2022/10/24</td>
                                            <td>8</td>
                                            <td><button>삭제</button></td>
                                        </tr>
                                    </tbody>
                                </table> -->
                                <table class="table">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col" style="text-align: center;">제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">조회수</th>
                                        <th scope="col">관리</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td onclick="modal();" style="text-align: center;">똑독캣 오픈공지 드립니다.</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>@mdo</td>
                                        <td><button class="bc77">삭제</button></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>@fat</td>
                                        <td><button class="bc77">삭제</button></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td><button class="bc77">삭제</button></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">6</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">7</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">8</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">9</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">10</th>
                                        <td style="text-align: center;">똑똑캣페이지 점검시간 변경안내드립니다.</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <nav aria-label="Page navigation example" style="margin-right: 20px;">
                                <ul class="pagination justify-content-end">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                                </ul>
                            </nav>
                            <div id="titleContentSerarch-Box">
                                <select style="width: 100px; height: 40px; margin-right: -4px;" >
                                    <option>제목</option>
                                    <option>제목+내용</option>
                                </select>
                                <input type="text" placeholder="입력하세요" style="width: 400px; height: 40px;">
                                <button class="searchbox-btn btn bc22 searchBtn">검색</button>
                            </div>
                        </div>
                        <!--모달-->
                        <div class="modalmodel-wrap" id="modalmodal-wrap"> <!--뒤에 흐려지게 해주는거-->
                            <div class="modal-modal"><!--흐려진 화면 위로 보여지게 해주는거 -->
                                <div class="modal-top">
                                    <p>공지사항</p>
                                    <span style="font-size: 30px;" class="close-area" onclick="closeModal();">&times;</span>
                                </div>
                                <div class="modalmodal-content">
                                    <div class="dmFrm">
                                        <div id="pre-btn">
                                            <a class="btn bc22 updateBtn" href="#">수정</a>
                                            <a class="btn bc22 updateBtn">삭제</a>
                                        </div>
                                        <table class="table table-bordered" id="oneNotice">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="text-align: center;">제목</th>
                                                    <td scope="col" colspan="5" style="text-align: center;"><span id="detailType">공지드립니다.</span></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" style="text-align: center;">작성자</th>
                                                    <td style="text-align: center;"><span id="detailId">user01</span></td>
                                                    <th style="text-align: center;">작성일</th>
                                                    <td style="text-align: center;"><span id="detailSender">2022/10/27</span></td>
                                                </tr>
                                                <tr>
                                                    <th style="text-align: center;">첨부파일</th>
                                                    <td colspan="5">
                                                        <%--  <%if(q.getFileName() != null){ --%> 
                                                            <img src="/img/file.png" width="16px">
                                                            <%-- <a href="/qnaFileDown.do?InfoNo=q.getInfoNo()>q.getFileName()</a> --%>
                                                            <%-- <%} > --%>
                                                        </td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th style="line-height: 230px; text-align: center;">내용</th>
                                                    <td colspan="3"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                    <!--댓글-->
                                    <div class="inputCommentBox">
                                        <form action="/insertComment.do" method="post">
                                            <ul>
                                                <li>
                                                    <span class="comment-img">
                                                        <img src="/resources/img/프로필.jpg">
                                                    </span>
                                                </li>
                                                <li>
                                                    <input type="hidden" name="memberId" value="1"> <!-- 로그인된 아이디가 들어워야하는거지? -->
                                                    <input type="hidden" name="infoNo" value="1"><!--어떤공지사항의 댓글인지 -->
                                                    <input type="hidden" name="commentNo" value="0">
                                                    <textarea class="input-form" name="commentContent"></textarea>
                                                </li>
                                                <li>   
                                                    <button type="submit" class="btn bc22 bs2" id="comment-button">등록</button>
                                                </li>
                                            </ul>
                                        </form>
                                    </div>
                                    <!--댓글 달고나서 보여지는 댓글 창 -->
                                    <div class="commentBox">

                                        <ul class="posting-comment">
                                            <li>
                                                <img src="/resources/img/프로필.jpg">
                                            </li>
                                            <li>
                                                <p class="comment-info">
                                                    <span>작성자</span>
                                                    <span>날짜</span>
                                                </p>								<!--br처리해줘야함 -->
                                                <p class="comment-content">nc content</p>
                                                <textarea name="ncContent" class="input-form" style="min-height:96px;display:none;">content</textarea>
                                                <p class="comment-link">

                                                        <a href="javascript:void(0)" onclick="modifyComment">수정</a>
                                                        <a href="javascript:void(0)" onclick="deleteComment">삭제</a>
                                                    <a href="javascript:void(0)" class="recShow">답글달기</a>
                                            
                                                </p>
                                            </li>
                                        </ul>
                                        <!--대댓글 내용-->
                                            <ul class="posting-comment reply">
                                                <li>
                                                    <span class="material-icons">subdirectory_arrow_right</span>
                                                    <img src="/resources/img/유튜브_기본프로필_녹색.jpg">
                                                </li>
                                                <li>
                                                    <p class="comment-info">
                                                        <span>NcWriter</span>
                                                        <span>ncdate</span>
                                                    </p>
                                                    <p class="comment-content">nccontent</p>
                                                    <textarea name="ncContent" class="input-form" style="min-height:96px;display:none;">nccontent</textarea>
                                                    <p class="comment-link">
                                                            <a href="javascript:void(0)" onclick="modifyComment">수정</a>
                                                            <a href="javascript:void(0)" onclick="deleteComment">삭제</a>
                                                    </p>
                                                </li>
                                            </ul>
                                    </div>
                                    <div id="modalmodal-Btn">
                                        <button id="admin-noticeUpdate" class="btn bc11 bs4"><span>△</span>이전글</button>
                                        <button id="admin-noticeDelete" class="btn bc11 bs4">다음글<span>▽</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--모달-->
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
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/notice.js"></script>
    </body>
</html>