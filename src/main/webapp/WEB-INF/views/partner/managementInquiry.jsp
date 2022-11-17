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
    <style>
        .table-inquiry tbody tr{
            cursor: pointer;
        }
        .table-overflow {
            display: flex;
            flex: 1;
        }

        .table-overflow-space {
            flex: 1;
            width: 1px;
        }

        .table-overflow-text {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            word-break: break-all;
        }
    </style>
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
                        <table id="partnerDataTable" class="table-inquiry">
                            <thead>
                            <tr>
                                <th>DM-NO</th>
                                <th>보낸사람</th>
<%--                                <th>DM 구분</th>--%>
<%--                                <th>받는사람</th>--%>
                                <th>내용</th>
<%--                                <th>DM 유형</th>--%>
                                <th>보낸날짜</th>
                                <th>답변여부</th>
                                <%--<th>reply</th>--%>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>DM-NO</th>
                                <th>보낸사람</th>
<%--                                <th>DM 구분</th>--%>
<%--                                <th>받는사람</th>--%>
                                <th>내용</th>
<%--                                <th>DM 유형</th>--%>
                                <th>보낸날짜</th>
                                <th>답변여부</th>

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
            <input type="hidden" name="partnerNo" value="<c:if test="${not empty sessionScope.p}">${sessionScope.p.PId}</c:if>">
        </main>
        <footer>
        </footer>
    </div>
</div>


<div class="modal fade" id="answerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="answerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="/insertDmFromPartner.do">
            <div class="modal-header">
                <h5 class="modal-title" id="answerModalLabel">답변하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-sm">보낸사람</span>
                                <input type="hidden" name="dmNo" value="">
                                <input type="hidden" name="sender" value="${sessionScope.p.PId}">
                                <input type="hidden" name="senderCategory" value="P">
                                <input type="hidden" name="dmType" value="2">
                                <input type="hidden" name="reply" value="">
                                <input type="text" class="form-control" name="receiver" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" id="receiveContent" style="height: 100px" readonly></textarea>
                                <label for="receiveContent"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mt-3">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" id="dmContent" name="dmContent" style="height: 100px" required></textarea>
                                <label for="receiveContent">답변입력</label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary">전송</button>
            </div>
            </form>
        </div>
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
    const ansModal = document.getElementById('answerModal');
    var answerModal = new bootstrap.Modal(ansModal, {
        keyboard: false
    })
    let targetObj;
    ansModal.addEventListener('show.bs.modal', function (event) {
        const modal = event.target;
        const targetRow = $(targetObj);
        const dmNo = targetRow.find(">td:nth-child(1)").text();
        const receiver = targetRow.find(">td:nth-child(2)").text();
        const msg = targetRow.find(">td:nth-child(3)").text();
        $(modal).find("[name=receiver]").val(receiver);
        $(modal).find("#receiveContent").val(msg);
        $(modal).find("[name=dmNo]").val(dmNo);
    })

    function showAnswerModal(obj) {
        targetObj = obj
        answerModal.show();
    }

</script>
</body>

</html>
