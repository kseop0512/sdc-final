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
                                    	
                                        <form action="/chkPw.do" method="post">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" id="inputPw" name="pPw" placeholder="password"/>
                                                <label for="inputPw">Enter your current password</label>
                                                <input type="hidden" name="pId" value="${sessionScope.p.PId }">
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="/partnerMain.do">마이페이지</a>
                                                <input type="submit" class="btn btn-primary" value="비밀번호 확인">
                                            </div>
                                        </form>
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

                        
