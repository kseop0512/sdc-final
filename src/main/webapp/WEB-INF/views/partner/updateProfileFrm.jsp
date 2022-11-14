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
    	.profileTable{
    		width: 1000px;
    		margin: 0 auto;
    		margin-top: 20px;
    		vertical-align: middle;
    	}
    	.profileTable th{
    		width: 20%;
    		text-align: center;
    	}
    	.updateBtn{
    		display: block;
    		margin: 0 auto;
    		margin-top: 20px;
    	}
    	.inputStyle{
    		width: 90%; height: 44px; 
    		outline: none;
    	}
    	
    </style>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/partnerMain.do">파트너 마이페이지</a>
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
                        <li><a class="dropdown-item" href="/logoutPartner.do">로그아웃</a></li>
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
                            <a class="nav-link" href="/partnerMain.do">
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
                                    <a class="nav-link" href="/chkPwFrm.do">비밀번호 변경</a>
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
                        <h1 class="mt-4">파트너 프로필 수정</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">${sessionScope.p.PName }님 환영합니다.</li>
                        </ol>
                  	<div>
                  	<form action="/updateProfile.do" method="post" enctype="multipart/form-data">
                      <table class="table table-warning profileTable">
                          <tr>
                              <td rowspan="5" style="width: 20%;">
                              	<img id="profileImg" src="/resources/upload/partner/profileImg/${sessionScope.p.profilePath }" style="width:100%;">
							    <input type="file" class="custom-file-input" name="profileFile" style="width: 100%;" accept=".jpg,.png,.jpeg,gif" onchange="loadImg(this);" aria-describedby="inputGroupFileAddon01">
                              </td>
                              <th>이름</th>
                              <td colspan="2">
                              	<input type="hidden" name="pNo" value="${sessionScope.p.PNo }">
                              	${sessionScope.p.PName }
                              </td>
                          </tr>
                          <tr>
                          	<th>생년월일</th>
                          	<td colspan="2">${sessionScope.p.PDob }</td>
                          </tr>
                          <tr>
                          	<th>주소</th>
                          	<td style="padding: 0"><input type="text" name="pAddr" class="inputStyle" placeholder="${sessionScope.p.PAddr }" value="${sessionScope.p.PAddr }"></td>
                         	<td style="width:8%;padding: 0px; vertical-align: middle;"><button type="button"class="btn btn-secondary btn-addr-search" style="width: 100%;">찾기</button></td>
                          </tr>
                          <tr>
                          	<th>전화번호</th>
                          	<td style="padding: 0px;" colspan="2">
                          	<input type="text" name="pPhone" placeholder="${sessionScope.p.PPhone }" value="${sessionScope.p.PPhone }" class="inputStyle">
                          	</td>
                          </tr>
                          <tr>
                          	<th>E-Mail</th>
                          	<td colspan="2" style="padding: 0px;"><input type="text" name="pEmail" placeholder="${sessionScope.p.PEmail }" value="${sessionScope.p.PEmail }"class="inputStyle"></td>
                          </tr>
                      </table>
                      <table class="table table-warning profileTable">
                      	<tr>
                      		<th>파트너 가입일</th>
                      		<td colspan="3">${sessionScope.p.approveDate }</td>
                      		
                      	</tr>
                      	<tr>
                      		<th>파트너 등급</th>
                      		<td>${sessionScope.p.PGrade}</td>
                      		<th>포인트</th>
                      		<td>${sessionScope.p.PPoint}</td>
                      	</tr>
                      </table>
                      <table class="table table-warning profileTable">
                      	<tr>
                      		<th>자격증</th>
                      		<td class="licenseTd">
                      			<input type="hidden" name="license" value="${sessionScope.p.license }">
                      			<c:forTokens items="${sessionScope.p.license }" var="l" delims=",">
                      			${l }<br>
                      			</c:forTokens>
                      		</td>
                      		<td style="width: 8%; padding: 0px;vertical-align: middle;"><button type="button"class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width:100%;">수정</button></td>
                      	</tr>
                      	<tr>
                      		<th>경력 사항</th>
                      		<td colspan="2"><textarea name="workExp" style="width: 100%;">${sessionScope.p.workExp }</textarea></td>
                      	</tr>
                      </table>
                      <button type="submit" class="btn btn-warning updateBtn">정보 수정</button>
                      </form>
                  </div>
                  </div>
                  <!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">자격증 및 교육수료</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <div class="col mt-3">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="license1" value="반려견지도사/훈련사 3급">
                                    <label class="form-check-label" for="license1">반려견지도사/훈련사 3급</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="license2" value="반려견지도사/훈련사 2급">
                                    <label class="form-check-label" for="license2">반려견지도사/훈련사 2급</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox"id="license3" value="반려견지도사/훈련사 1급">
                                    <label class="form-check-label" for="license3">반려견지도사/훈련사 1급</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="license4" value="반려동물관리사/행동교정사">
                                    <label class="form-check-label" for="license4">반려동물관리사/행동교정사</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox"  id="license5" value="KPA 수료증 (CTP, Foundation 등)">
                                    <label class="form-check-label" for="license5">KPA 수료증 (CTP, Foundation 등)</label>
                                </div>
                            </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-warning modifyBtn" data-bs-dismiss="modal">업데이트</button>
				      </div>
				    </div>
				  </div>
				</div>
                </main>
            </div>
        </div>
        <script>
        	$(".modifyBtn").on("click",function(){
        		const chkedLicense = $("input[type=checkbox]:checked")
        		let licenseArr = new Array();
	        	if(chkedLicense.length>0){
	        		$(".licenseTd").empty();
	        		for(let i=0; i<chkedLicense.length; i++){
	        			$(".licenseTd").append(chkedLicense[i].value).append("<br>");
	        			licenseArr.push(chkedLicense[i].value);
	        		}
        			const newInput = $("<input type='hidden' name='license'>");
        			newInput.attr("value",licenseArr);
        			$(".licenseTd").append(newInput);
	        	}// if문 종료
        	});
        </script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="/resources/js/partnerScripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>

                        
