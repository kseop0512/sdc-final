<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
         <link rel="stylesheet" href="/resources/css/admin/notice_write.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
                            <a class="nav-link collapsed" href="memberList.html" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                유저관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/selectUserList.do">유저리스트</a>
                                    <a class="nav-link" href="/partnerList.do">파트너관리</a>
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
                            <a class="nav-link" href="pay_cancel.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                결제관리
                            </a>
                            <a class="nav-link" href="dm_message.html">
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
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                공지사항 글쓰기
                            </div>
                            <div class="card-body">
                                <div id="adminwrite-wrap">
                                    <!-- <div class="btn bc22" id="adminnotice-List">목록</div> -->
                                    <form action="/adminNoticeWrite.do" method="post" enctype="multipart/form-data"> <!--파일형식을 form태그로 보낼때는  method="post" enctype="multipart/form-data" 2가지 필수!!!!-->
                                        <table class="table table-bordered" id="admin-writetbl">
                                            <thead>
                                            <tr>
                                                <th scope="col" colspan="4" style="background-color: #282f44; color: #fff;">글쓰기</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <th scope="row" style="vertical-align: middle;">제목</th>
                                                <td colspan="3">
                                                    <input type="text" id="admin-noticeTitle" name="noticeGTitle" class="input-form" placeholder="제목을 입력하세요">
                                                </td>
                                            </tr>
                                           <!--  
                                            <tr class="tr-1">                                                <th class="td-3">첨부파일</th>
                                                <td colspan="3"><input type="file" name="boardFileG"></td> 
                                                <input type="file" name="boardFileG" multiple style="display:none;">
                                            </tr>
                                            -->
                                            
                                            <tr>
												<th>첨부파일</th>
												<td>
													<div class="fileZone">
														<div class="fileMsg">여기에 파일을 두세요</div>
													</div>
												</td>
											</tr>
                                            
                                            <tr>
                                                <th scope="row" style="vertical-align: middle;">내용</th>
                                                <td colspan="4">
                                                    <textarea id="admin-noticeContent" name="noticeGContent" class="input-form"  placeholder=" 내용을 입력하세요"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: right;">
                                                    <input type="checkbox">
                                                        <span>공지글 등록</span>
                                                </td>
                                            </tr>
                                                <td colspan="4">
                                                	<input type="file" name="boardFileG" multiple style="display:none;">
													<input type="hidden" name="noticeGWriter" value="${sessionScope.g.adminId }">
													<input type="submit" value="게시글작성" class="btn bc22 bs4" id="writeBtn">
                                                    <button class="btn bc22 bs4"><a href="/adminNotice.do?reqPage=1" class="bc99" style="color: #fff;text-decoration: none;">취소</a></button><!--공지사항 리스트로이동-->
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
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
        
        <script>
        const fileZone = $(".fileZone");
		const files = new Array();
		//드래그되는 영역에 들어올 때
		fileZone.on("dragenter",function(e){
			e.stopPropagation();//이벤트버블링제거
			e.preventDefault();//기본이벤트제거
			$(this).css("border","2px dashed #0b85a1");
		});
		//드래그영역에서 나갈때
		fileZone.on("dragleave",function(e){
			e.stopPropagation();//이벤트버블링제거
			e.preventDefault();//기본이벤트제거
			$(this).css("border","2px dotted #0b85a1");
		});
		//드래그영역에 올라와 있을 때
		fileZone.on("dragover",function(e){
			e.stopPropagation();//이벤트버블링제거
			e.preventDefault();//기본이벤트제거
		});
		//드래그영역에 내려놓을 때
		fileZone.on("drop",function(e){
			e.stopPropagation();//이벤트버블링제거
			e.preventDefault();//기본이벤트제거
			//e.originalEvent.dataTransfer.files
			for(let i=0;i<e.originalEvent.dataTransfer.files.length;i++){
				files.push(e.originalEvent.dataTransfer.files[i]);
			}
			$(".fileMsg").hide();
			$(this).find(".fileName").remove();
			for(let i=0;i<files.length;i++){
				const fileNameDiv = $("<div>");
				fileNameDiv.addClass("fileName");
				const fileNameSpan = $("<span>");
				fileNameSpan.text(files[i].name);
				const closeBtn = $("<span>");
				closeBtn.addClass("closeBtn");
				closeBtn.text("X");
				closeBtn.attr("onclick","deleteFile(this)");
				fileNameDiv.append(fileNameSpan).append(closeBtn);
				$(this).append(fileNameDiv);
			}
			fileSetting();
		});
		function deleteFile(obj){
			const deleteFilename = $(obj).prev().text();
			for(let i=0;i<files.length;i++){
				if(files[i].name == deleteFilename){
					files.splice(i,1);
					break;
				}
			}
			if(files.length == 0){
				$(".fileMsg").show();
				fileZone.css("border", "2px dotted #0b85a1");
			}
			$(obj).parent().remove();
			fileSetting();
		}
		function fileSetting(){
			//input[type=file] value 는 보안상 변경이 불가능
			//input[type=file] 변경용 객체 필요
			const dataTransfer = new DataTransfer();
			for(let i=0;i<files.length;i++){
				dataTransfer.items.add(files[i]);
			}
			$("input[name=boardFileG]").prop("files",dataTransfer.files);
		}
        </script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>