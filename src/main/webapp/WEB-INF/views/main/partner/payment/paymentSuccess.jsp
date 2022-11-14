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
        title: "예약완료",
        text: "위탁 펫시터 예약이 완료 되었습니다.\n마이페이지에서 확인 가능합니다.",
        icon: "success"
    }).then(function(){
        location.href = "/petSitterBoardList.do";
    });
</script>
</body>
</html>
