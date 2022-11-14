<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>똑독캣 (SDC) | 펫시터, 훈련사, 그루머 예약서비스</title>
    <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    <link rel="stylesheet" href="/resources/css/main/style-partner.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
<div id="preloader"></div>
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="m-0">${detail.pName} 님 위탁 펫시터 프로필</h2>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog board-detail">
        <div id="main-content" class="container">
            <div  class="row" >

                <div class="col-lg-8 entries" data-aos="">
                    <div class="d-flex align-content-center detail-header ">
                        <div class="detail-header__profile">
                            <img src="/resources/upload/partner/profileImg/${detail.profilePath}" alt="">
                        </div>
                        <div class="detail-header__content d-flex flex-column justify-content-center">
                            <p>${detail.petsitterAddr} 펫시터 ${detail.pName} 님</p>
                            <h3>${detail.petsitterBoardTitle}</h3>
                            <div class="badges">
                                <c:set var="options" value="${fn:split(detail.petsitterOption, ',')}"/>
                                <c:forEach items="${options}" var="option">
                                    <c:if test="${option ne 'N'}">
                                        <span class="badge bg-light text-dark">${option}</span>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                    </div>

                    <div id="boardCarousel" class="carousel slide board-detail-carousel mt-5" data-bs-interval="false">
                        <c:set var="images" value="${fn:split(detail.fileList, ',')}"/>
                        <div class="carousel-indicators">
                            <c:forEach items="${images}" var="file" varStatus="j">
                                <button type="button" data-bs-target="#boardCarousel" data-bs-slide-to="${j.index}" <c:if test="${j.first}">class="active" aria-current="true"</c:if>  aria-label="Slide ${j.count}"></button>
                            </c:forEach>
                        </div>
                        <div class="carousel-inner">
                            <c:forEach items="${images}" var="file" varStatus="j">
                                <div class="carousel-item <c:if test="${j.first}">active</c:if>">
                                    <img src="/resources/upload/partner/petsitterFiles/${file}" class="d-block w-100" alt="">
                                </div>
                            </c:forEach>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#boardCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#boardCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <!-- carousel -->

                    <section class="content">
                        <h5 class="mb-3">${detail.pName} 펫시터 님을 소개합니다.</h5>
                        <div class="">
                            ${detail.petsitterAboutMe}
                        </div>
                        <h5 class="mt-5 mb-4">자격증 또는 수료 교육</h5>
                        <div class="d-flex flex-wrap">
                            <c:set var="licenses" value="${fn:split(detail.license, ',')}"/>
                            <c:forEach items="${licenses}" var="license">
                            <p class="me-4"><i class="bi bi-filter-square me-2"></i>${license}</p>
                            </c:forEach>
                        </div>
                        <h5 class="mt-5 mb-4">후기 <small class="text-muted">${detail.reviewCnt}개</small></h5>
                        <c:choose>
                            <c:when test="${detail.reviewCnt gt 0}">

                            </c:when>
                            <c:otherwise>
                                <div class="bg-light p-5 d-flex align-items-center justify-content-center">
                                    <p class="m-0 text-muted">이용 후기가 없습니다.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </section>
                </div><!-- End Partner item -->

                <div class="col-lg-4">
                    <div id="sidebar" class="" >

                        <div class="sidebar sidebar__inner js-search-option">
                            <h3 class="sidebar-title">맡기시는 날짜</h3>
                            <div class="sidebar-item calendar">
                                <div class="js-option-date is-inactive">
                                    <%--                                    <button type="button" class="">달력열기</button>--%>
                                    <div class="input-group mb-2">
                                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-calendar text-muted"></i></span>
                                        <input type="text" id="startDate" name="startDate" class="form-control" placeholder="시작일" value="${param.startDate}">
                                    </div>
                                    <div class="input-group">
                                        <input type="text" id="endDate" name="endDate" class="form-control" placeholder="종료일" value="${param.endDate}">
                                    </div>
                                </div>
                                <div class="reservation-calendar clear-cont">
                                    <div class="calendar-container calendar-sm"></div>
                                </div>
                            </div><!-- End sidebar categorie   s-->
                            <h3 class="sidebar-title">체크인/체크아웃</h3>
                            <div class="sidebar-item d-flex">
                                <div class="col-5">
                                    <select class="form-select select-checkin" aria-label=".select-checkin">
                                        <option selected>체크인</option>
                                        <c:forEach var="i"  begin="9" end="18">
                                            <option value="${i>9?i:'0'}${i>9?'':i}:00">${i>9?i:'0'}${i>9?'':i}:00</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-5 ms-2">
                                    <select class="form-select select-checkout" aria-label=".select-checkout">
                                        <option selected>체크아웃</option>
                                        <c:forEach var="i"  begin="9" end="18">
                                            <option value="${i>9?i:'0'}${i>9?'':i}:00">${i>9?i:'0'}${i>9?'':i}:00</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <h3 class="sidebar-title">위탁장소</h3>
                            <div class="sidebar-item mb-2">
                                <div id="map" style="width:100%;height:350px;"></div>
                                <p class="text-muted text-end mt-1 mb-0">${detail.petsitterAddr}</p>
                            </div><!-- End sidebar categories-->
                            <h3 class="sidebar-title">이용요금</h3>
                            <div class="sidebar-item ">
                                <i class="bi bi-house-heart me-2"></i>1박 35,000
                            </div><!-- End sidebar categories-->
                            <div class="d-grid gap-2">
                                <button type="button" class="btn btn-warning btn-lg">예약 요청</button>
                            </div>
                        </div><!-- End sidebar -->
                    </div>
                </div><!-- End blog sidebar -->
            </div>
        </div>
    </section><!-- End Blog Section -->

</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe0ca6d48cf3c72c89b2f627b0eb544a&libraries=drawing"></script>
<script src="/resources/js/plugin.js"></script>
<script src="/resources/js/common-partner.js"></script>
<script src="/resources/js/sticky-sidebar.js"></script>

<script>
    <c:set var="mLng" value="${detail.lng == null ? '126.8969784' : detail.lng}" />
    <c:set var="mLat" value="${detail.lat == null ? '37.5338151' : detail.lat}" />
    <c:set var="sDate" value="${detail.startDate == null ? '' : detail.startDate}" />
    <c:set var="eDate" value="${detail.endDate == null ? '' : detail.endDate}" />
    let mapLng = ${mLng};
    let mapLat = ${mLat};
    mnDate = "${sDate}";
    mxDate = "${eDate}";
    sDate = "${param.startDate}";
    eDate = "${param.endDate}";

    var sidebar = new StickySidebar('#sidebar', {
        containerSelector: '#main-content',
        innerWrapperSelector: '.sidebar__inner',
        topSpacing: 150,
        bottomSpacing: 20,
        resizeSensor: true
    });

    var boardCarousel = document.querySelectorAll('.board-detail-carousel');
    boardCarousel.forEach(function(item,index){
        var newCarousel = new bootstrap.Carousel(item, {
            interval: false
        });
    })


    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(mapLat, mapLng), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    var imageSrc = '', // 마커이미지의 주소입니다
        imageSize = new kakao.maps.Size(0, 0), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(0, 0)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    //var markerImage = new kakao.maps.MarkerImage( imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(mapLat, mapLng); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage // 마커이미지 설정
    });
    map.setMinLevel(6);
    map.setMaxLevel(8);
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    var content = '<div class="customoverlay" style="position:absolute;top:50%;left:50%;width:150px;height:150px;border-radius:50%;border:2px solid rgba(255,179,71,.8);background:rgba(255,179,71,.55);transform:translate(-50%,-50%)">' +
        '</div>';

    // 커스텀 오버레이가 표시될 위치입니다
    var position = new kakao.maps.LatLng(mapLat, mapLng);

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
        map: map,
        position: position,
        content: content,
        yAnchor: 1
    });



</script>
</body>
</html>
