<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="author" content="" />--%>
    <title>파트너메인페이지 - 문의관리</title>
    <jsp:include page="/WEB-INF/views/partner/common/headContent.jsp"/>
</head>
<body class="sb-nav-fixed">
<jsp:include page="/WEB-INF/views/partner/common/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/partner/common/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">문의관리</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item">마이페이지</li>
                    <li class="breadcrumb-item active">문의관리</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        문의관리
                    </div>
                    <div class="card-body">
                        <table id="partnerDataTable">
                            <thead>
                            <tr>
                                <th>DM-NO</th>
                                <th>보낸사람</th>
                                <th>DM 구분</th>
<%--                                <th>받는사람</th>--%>
                                <th>내용</th>
                                <th>보낸날짜</th>
                                <th>답변여부</th>
                                <th>DM 유형</th>
                                <%--<th>reply</th>--%>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>DM-NO</th>
                                <th>보낸사람</th>
                                <th>DM 구분</th>
<%--                                <th>받는사람</th>--%>
                                <th>내용</th>
                                <th>보낸날짜</th>
                                <th>답변여부</th>
                                <th>DM 유형</th>
                                <%--<th>reply</th>--%>
                            </tr>
                            </tfoot><%--
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Tiger Nixon</td>
                                <td>Edinburgh</td>
                                <td>01011112323</td>
                                <td>34</td>
                                <td>2022/10/11</td>
                                <td>109점</td>
                                <td>
                                    <select name="승인현황" required autofocus>
                                        <option value="대기">대기</option>
                                        <option value="보류">보류</option>
                                        <option value="승인완료">승인완료</option>
                                    </select>
                                </td>
                                <td><button>처리하기</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Tiger Nixon</td>
                                <td>Edinburgh</td>
                                <td>01011112323</td>
                                <td>29</td>
                                <td>2022/10/11</td>
                                <td>125점</td>
                                <td>
                                    <select name="승인현황" required autofocus>
                                        <option value="대기">대기</option>
                                        <option value="보류">보류</option>
                                        <option value="승인완료">승인완료</option>
                                    </select>
                                </td>
                                <td><button type="button">처리하기</button></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Tiger Nixon</td>
                                <td>Edinburgh</td>
                                <td>01011112323</td>
                                <td>31</td>
                                <td>2022/10/11</td>
                                <td>89점</td>
                                <td>
                                    <select name="승인현황" required autofocus>
                                        <option value="대기">대기</option>
                                        <option value="보류">보류</option>
                                        <option value="승인완료">승인완료</option>
                                    </select>
                                </td>
                                <td><button type="button">처리하기</button></td>
                            </tr>
                            </tbody>
                        --%></table>
                    </div>
                </div>


            </div>
            <input type="hidden" name="partnerNo" value="<c:if test="${not empty sessionScope.p}">${sessionScope.p.PNo}</c:if>">
        </main>
        <footer>
        </footer>
    </div>
</div>
<%--<script src="/resources/js/partnerScripts.js"></script>--%>

<%--<script src="/resources/js/partner-datatables-simple-demo.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/resources/js/partner/common-partner-mypage.js"></script>
<script>

    const partnerObj = {
       partnerNo : $("[name=partnerNo]").val()
    }
</script>
</body>

</html>
