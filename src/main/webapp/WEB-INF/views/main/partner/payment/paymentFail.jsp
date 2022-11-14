<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>똑독캣 (SDC) | 펫시터, 훈련사, 그루머 예약서비스</title>
    <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    <link rel="stylesheet" href="/resources/css/main/style-partner.css">
</head>
<body>
<script src="/resources/js/sweetalert.min.js"></script>
<script>
    swal({
        title: "예약실패",
        text: "예약에 실패했습니다. 관리자에게 문의하세요.",
        icon: "warning"
    }).then(function(){
        location.href = "/petSitterBoardList.do";
    });
</script>
</body>
</html>
