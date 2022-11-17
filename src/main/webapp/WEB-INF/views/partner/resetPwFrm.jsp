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
<body class="sb-nav-fixed">
<jsp:include page="/WEB-INF/views/partner/common/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/partner/common/sidebar.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">비밀번호 변경</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">똑독캣 파트너</li>
                        </ol>
						 <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 변경</h3></div>
                                    <div class="card-body">
                                    	<div class="small mb-3 text-muted">8~16자의 영문 대문자,소문자, 숫자, 특수문자 포함</div>
                                       
                                            <div class="form-floating mb-3">
                                            	<input type="hidden" id="partnerId" value="${sessionScope.p.PId }">
                                                <input class="form-control" id="password1" type="password" placeholder="New password" />
                                                <label for="password1" id="pwComment">Enter your new password</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="password2" type="password" placeholder="Password" />
                                                <label for="password2">Confirm your new password</label>
                                            </div>
                                        
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="/partnerMain.do">마이페이지</a>
                                                <button class="btn btn-primary chkNewPw">비밀번호 변경</button>
                                            </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </main>
                <footer>
                </footer>
            </div>
        </div>
        <script src="/resources/js/partnerScripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>

                        
