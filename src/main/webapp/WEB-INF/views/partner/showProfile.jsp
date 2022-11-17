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
    		width: 900px;
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
    	}
    	.gradeTable{
    		display: none;
    		margin-top: 10px;
    		text-align: center;
    	}
    	#gradeTbl{
    		cursor: pointer;
    	}
    </style>
<body class="sb-nav-fixed">
<jsp:include page="/WEB-INF/views/partner/common/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/partner/common/sidebar.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">파트너 프로필</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">${sessionScope.p.PName }님 환영합니다.</li>
                        </ol>
                  	<div>
                      <table class="table table-warning profileTable">
                          <tr>
                              <td rowspan="5" style="width: 20%; background-color: #fff"><img src="/resources/upload/partner/profileImg/${sessionScope.p.profilePath }" style="width: 100%; height: 100%;"></td>
                              <th>이름</th>
                              <td>${sessionScope.p.PName }</td>
                          </tr>
                          <tr>
                          	<th>생년월일</th>
                          	<td>${sessionScope.p.PDob }</td>
                          </tr>
                          <tr>
                          	<th>주소</th>
                          	<td>${sessionScope.p.PAddr }</td>
                          </tr>
                          <tr>
                          	<th>전화번호</th>
                          	<td>${sessionScope.p.PPhone }</td>
                          </tr>
                          <tr>
                          	<th>E-Mail</th>
                          	<td>${sessionScope.p.PEmail }</td>
                          </tr>
                      </table>
                      <table class="table table-warning profileTable">
                      	<tr>
                      		<th>파트너 가입일</th>
                      		<td colspan="3">${sessionScope.p.approveDate }</td>
                      		
                      	</tr>
                      	<tr>
                      		<th id="gradeTbl">파트너 등급    *</th>
                      		<td>${sessionScope.p.PGrade}</td>
                      		<th id="gradeTbl">포인트    *</th>
                      		<td>${sessionScope.p.PPoint}</td>
                      	</tr>
                      </table>
                      <table class="table profileTable gradeTable">
                      	<tr style="background-color: #f8f9fa;">
                      		<th colspan="2" style="border-right: 1px solid">파트너 등급 기준</th>
                      		<th>포인트 적립 기준</th>
                      	</tr>
                      	<tr>
                      		<td>등급 C</td>
                      		<td>0 point ~ 300 point</td>
                      		<td style="border-left: 1px solid ;">서비스제공 마다 <span><strong>50</strong></span> point!</td>
                      	</tr>
                      	<tr>
                      		<td>등급 B</td>
                      		<td>301 point ~ 700 point</td>
                      		<td style="border-left: 1px solid ;">이용자가 후기작성하면 <span><strong>30</strong></span> point!</td>
                      	</tr>
                      	<tr>
                      		<td>등급 A</td>
                      		<td>701 point ~</td>
                      		<td style="border-left: 1px solid ;">파트너가 훈련일지/돌봄일지 <span><strong>30</strong></span> point!</td>
                      	</tr>
                      </table>
                      <table class="table table-warning profileTable">
                      	<tr>
                      		<th>자격증</th>
                      		<td>
                    			<c:forTokens items="${sessionScope.p.license }" var="l" delims=",">
                    			${l }<br>
                    			</c:forTokens>
                      		</td>
                      	</tr>
                      	<tr>
                      		<th>경력 사항</th>
                      		<td>${sessionScope.p.workExp }</td>
                      	</tr>
                      </table>
                      <div class="profileTable">
                      	<button type="button" class="btn btn-warning updateBtn" onclick="location.href='/updateProfileFrm.do'">내 정보 수정</button>
                      </div>
                  </div>
                  </div>
                </main>
            </div>
        </div>
        <script src="/resources/js/partnerScripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>

                        
