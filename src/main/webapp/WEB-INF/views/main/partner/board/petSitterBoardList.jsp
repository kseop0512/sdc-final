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
                <h2 class="m-0">위탁 펫시터 찾기</h2>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
        <div id="main-content" class="container">
            <div  class="row" >

                <div class="col-lg-8 entries" data-aos="fade-up">
                    <c:forEach items="${list}" var="pb" varStatus="i">
                    <!-- Partner item -->
                    <article class="entry d-flex" onclick="viewDetailPage(${pb.petsitterBoardNo})">
                        <section class="entry-img p-0">
                            <div id="boardCarousel${i.count}" class="carousel slide board-carousel" data-bs-interval="false">
                                <div class="carousel-inner">
                                    <c:set var="images" value="${fn:split(pb.fileList, ',')}"/>
                                    <c:forEach items="${images}" var="file" varStatus="j">
                                        <div class="carousel-item <c:if test="${j.first}">active</c:if>">
                                            <img src="/resources/upload/partner/petsitterFiles/${file}" class="d-block w-100" alt="">
                                        </div>
                                    </c:forEach>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#boardCarousel${i.count}" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#boardCarousel${i.count}" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </section>
                        <section class="p-0">
                            <div class="entry-meta">
                                <ul>
                                    <li class="d-flex align-items-center"><i class="bi bi-pin-map"></i> ${pb.petsitterAddr}</li>
                                    <li class="d-flex align-items-center text-info"><i class="bi bi-emoji-sunglasses"></i> 프로펫시터</li>
                                </ul>
                            </div>
                            <h2 class="entry-title">
                                <a href="javascript:void(0);">${pb.petsitterBoardTitle}</a>
                            </h2>
                            <div class="entry-content">
                                <div class="entry-content--left">
                                    <div class="badges">
                                        <c:set var="options" value="${fn:split(pb.petsitterOption, ',')}"/>
                                        <c:forEach items="${options}" var="option">
                                            <c:if test="${option ne 'N'}">
                                                <span class="badge bg-light text-dark">${option}</span>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="reviews">
                                        <span class="review-count">후기 28</span>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <div class="cover"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry-content--right">
                                    <!-- 금액 정보 -->
                                </div>
                            </div>
                        </section>

                    </article><!-- End Partner item -->
                    </c:forEach>
                    <%--<div class="blog-pagination">
                        ${pageNavi}
                    </div>--%>
                </div><!-- End Partner item -->

                <div class="col-lg-4">
                    <div id="sidebar" class="">

                        <div class="sidebar sidebar__inner js-search-option" >
                            <h3 class="sidebar-title">지역 검색</h3>
                            <div class="sidebar-item search-form addr-wrap">
                                <div class="input-group mb-3">
                                    <input type="text" class="input-keyword form-control" name="centerAddr" id="centerAddr" placeholder="동이름 입력">
                                    <%--                                    <button class="btn btn-outline-secondary" type="button">Button</button>--%>
                                    <input type="hidden" name="lng" id="lng"><!-- 좌표값 -->
                                    <input type="hidden" name="lat" id="lat">
                                </div>
                                <div class="list-group">
                                    <ul class="dropdown-menu" id="placesList"></ul>
                                    <div id="pagination"></div>
                                </div>
                            </div><!-- End sidebar search formn-->

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
                            </div><!-- End sidebar categories-->
                            <h3 class="sidebar-title">검색 키워드</h3>

                            <div class="sidebar-item tags">
                                <ul>
                                    <li>
                                        <input type="checkbox" class="input-chk-btn" name="noPet" id="noPet" value="" <c:if test="${param.noPet eq 'Y'}">checked</c:if> />
                                        <label for="noPet">반려동물 없음</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="input-chk-btn" name="pickup" id="pickup" value="" <c:if test="${param.pickup eq 'Y'}">checked</c:if> />
                                        <label for="pickup">픽업 가능</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="input-chk-btn" name="largePet" id="largePet" value="" <c:if test="${param.largePet eq 'Y'}">checked</c:if> />
                                        <label for="largePet">대형견 가능</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="input-chk-btn" name="yard" id="yard" value="" <c:if test="${param.yard eq 'Y'}">checked</c:if> />
                                        <label for="yard">마당 있음</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="input-chk-btn" name="oldPet" id="oldPet" value="" <c:if test="${param.oldPet eq 'Y'}">checked</c:if>>
                                        <label for="oldPet">노견 케어</label>
                                    </li>
                                </ul>
                            </div><!-- End sidebar tags-->
                            <div class="col-auto d-grid mt-5">
                                <button type="button" class="btn btn-lg btn-basic" onclick="searchBoardList()">펫시터 찾기</button>
                            </div>
                            <div class="side-btn-group">
                                <a href="/petSitterFrm.do" class="btn btn-dark">펫시터 등록</a>
                            </div>
                        </div><!-- End sidebar -->

                    </div>
                </div><!-- End blog sidebar -->

            </div>

        </div>
    </section><!-- End Blog Section -->
    <form action="" id="paramForm" method="post">
        <input type="hidden" name="startDate" value="${param.startDate}">
        <input type="hidden" name="endDate" value="${param.endDate}">
        <input type="hidden" name="lat" value="${param.lat}">
        <input type="hidden" name="lng" value="${param.lng}">
        <input type="hidden" name="noPet" value="${param.noPet}">
        <input type="hidden" name="pickup" value="${param.pickup}">
        <input type="hidden" name="largePet" value="${param.largePet}">
        <input type="hidden" name="yard" value="${param.yard}">
        <input type="hidden" name="oldPet" value="${param.oldPet}">
    </form>
</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/plugin.js"></script>
<script src="/resources/js/common-partner.js"></script>
<script src="/resources/js/sticky-sidebar.js"></script>

<script>

    let start = 1;
    let end = 0;
    let load = true;
    //loadBoardData();
    function loadBoardData() {

        const form = $("#paramForm")[0];
        let formData = new FormData(form);
        const numPerPage = 10;
        start += numPerPage;
        end = start + (numPerPage-1);
        formData.append("start", start);
        formData.append("end", end);
        $.ajax({
            type: "POST",
            url: "/getSitterBoardList.do",
            processData: false,
            contentType: false,
            data: formData,
            success: function(list) {
                if(list.length < numPerPage) {
                    load = false;
                }

                for(let i=0; i<list.length; i++) {

                    let fileArr;

                    if(list[i].fileList != undefined) {
                        fileArr = list[i].fileList.split(",");
                    } else {
                        fileArr = "";
                    }

                    const addr = list[i].petsitterAddr;
                    const title = list[i].petsitterBoardTitle;
                    const optionArr = list[i].petsitterOption.split(",");

                    let itemHtml = "";

                    itemHtml += '<article class="entry d-flex" onclick="">';
                    itemHtml += '    <section class="entry-img p-0">';
                    itemHtml += '        <div id="boardCarousel' + (numPerPage+i+1) + '" class="carousel slide board-carousel add" data-bs-interval="false">';
                    itemHtml += '            <div class="carousel-inner">';
                    for(let j=0; j<fileArr.length; j++) {
                        if(j < 1) {
                            itemHtml += '            <div class="carousel-item active">';
                        } else {
                            itemHtml += '            <div class="carousel-item">';
                        }
                        itemHtml += '                    <img src="/resources/upload/partner/petsitterFiles/' + fileArr[j] + '" class="d-block w-100" alt="">';
                        itemHtml += '                </div>';
                    }
                    itemHtml += '            </div>';
                    itemHtml += '            <button class="carousel-control-prev" type="button" data-bs-target="#boardCarousel' + (numPerPage+i+1) + '" data-bs-slide="prev">';
                    itemHtml += '                <span class="carousel-control-prev-icon" aria-hidden="true"></span>';
                    itemHtml += '                <span class="visually-hidden">Previous</span>';
                    itemHtml += '            </button>';
                    itemHtml += '            <button class="carousel-control-next" type="button" data-bs-target="#boardCarousel' + (numPerPage+i+1) + '" data-bs-slide="next">';
                    itemHtml += '                <span class="carousel-control-next-icon" aria-hidden="true"></span>';
                    itemHtml += '                <span class="visually-hidden">Next</span>';
                    itemHtml += '            </button>';
                    itemHtml += '        </div>';
                    itemHtml += '    </section>';
                    itemHtml += '    <section class="p-0">';
                    itemHtml += '        <div class="entry-meta">';
                    itemHtml += '            <ul>';
                    itemHtml += '                <li class="d-flex align-items-center"><i class="bi bi-pin-map"></i>'+ addr +'</li>';
                    itemHtml += '                <li class="d-flex align-items-center text-info"><i class="bi bi-emoji-sunglasses"></i> 프로펫시터</li>';
                    itemHtml += '            </ul>';
                    itemHtml += '        </div>';
                    itemHtml += '        <h2 class="entry-title">';
                    itemHtml += '            <a href="javascript:void(0)">' + title + '</a>';
                    itemHtml += '        </h2>';
                    itemHtml += '        <div class="entry-content">';
                    itemHtml += '            <div class="entry-content--left">';
                    itemHtml += '                <div class="badges">';
                    for(let j=0; j<optionArr.length; j++) {
                        if(optionArr[j] != "N") {
                            itemHtml += '                    <span class="badge bg-light text-dark">' + optionArr[j] + '</span>';
                        }
                    }
                    itemHtml += '                </div>';
                    itemHtml += '                <div class="reviews">';
                    itemHtml += '                    <span class="review-count">후기 28</span>';
                    itemHtml += '                    <div class="stars">';
                    itemHtml += '                        <i class="bi bi-star-fill"></i>';
                    itemHtml += '                        <i class="bi bi-star-fill"></i>';
                    itemHtml += '                        <i class="bi bi-star-fill"></i>';
                    itemHtml += '                        <i class="bi bi-star-fill"></i>';
                    itemHtml += '                        <i class="bi bi-star-fill"></i>';
                    itemHtml += '                        <div class="cover"></div>';
                    itemHtml += '                    </div>';
                    itemHtml += '                </div>';
                    itemHtml += '            </div>';
                    itemHtml += '            <div class="entry-content--right">';
                    itemHtml += '            </div>';
                    itemHtml += '        </div>';
                    itemHtml += '    </section>';

                    itemHtml += '</article>';

                    $(".entries").append(itemHtml);


                    var appendCarousel = document.querySelectorAll('.board-carousel')[numPerPage+i];

                    var newCarousel = new bootstrap.Carousel(appendCarousel, {
                        interval: false
                    });
                }

                sidebar.updateSticky();


            }


        })


    }


    $(window).scroll(function() {
        const position = $(window).scrollTop();
        const bottom = $(document).height() - $(window).height();

        if(position == bottom){
            if(load) {
                loadBoardData();
            }
        }
    })
    var sidebar = new StickySidebar('#sidebar', {
        containerSelector: '#main-content',
        innerWrapperSelector: '.sidebar__inner',
        topSpacing: 150,
        bottomSpacing: 20,
        resizeSensor: true
    });

    var boardCarousel = document.querySelectorAll('.board-carousel');
    boardCarousel.forEach(function(item,index){
        var newCarousel = new bootstrap.Carousel(item, {
            interval: false
        });
    })

    function searchBoardList() {

        const centerAddr = $("#centerAddr").val();
        let lng = "";
        let lat = "";

        if(centerAddr != "") {
            lng = $("#lng").val();
            lat = $("#lat").val();
            lng != "" ? lng = "&lng="+lng : "";
            lat != "" ? lat = "&lat="+lat : "";
        }

        const startDate = $("#startDate").val() != "" ? "&startDate=" + $("#startDate").val() : "";
        const endDate = $("#endDate").val() != "" ? "&endDate=" + $("#endDate").val() : "";

        const keywords = $(".input-chk-btn");
        let keywordParam = "";
        for(let i=0; i<keywords.length; i++) {
            if(keywords.eq(i).prop("checked")){
                keywordParam += "&" + keywords.eq(i).attr("name") + "=Y";
            }
        }

        window.location = "/petSitterBoardList.do?reqPage=1" + lng + lat + startDate + endDate + keywordParam;
    }

    function viewDetailPage(boardNo) {

        const startDate = $("#startDate").val() != "" ? "&startDate=" + $("#startDate").val() : "";
        const endDate = $("#endDate").val() != "" ? "&endDate=" + $("#endDate").val() : "";

        window.open("/petSitterBoardDetail.do?petsitterBoardNo=" + boardNo + startDate + endDate);
    }

</script>
</body>
</html>
