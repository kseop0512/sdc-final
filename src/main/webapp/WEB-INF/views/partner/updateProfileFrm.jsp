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
<jsp:include page="/WEB-INF/views/partner/common/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/partner/common/sidebar.jsp"/>    
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
                                    <input class="form-check-input" type="checkbox"  id="license5" value="KPA 수료증 (CTP / Foundation 등)">
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

                        
