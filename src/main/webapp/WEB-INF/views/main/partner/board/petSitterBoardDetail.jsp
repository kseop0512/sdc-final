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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <style>
        .msg-modal{
            position: fixed;
            width: 500px;
            top: 10%;
            left: 50%;
            transform: translateX(-50%);
            background-color: #fff;
            color: #000;
            border-radius: 20px;
            box-shadow: 0px 0px 5px 5px rgba(0, 0, 0, 0.2);
            z-index: 999;
        }
        /* 모달창 헤드 */
        .msg-modal-head{
            /*height: 40px;*/
            padding:13px 15px 10px 20px;
            background-color: #ffb347;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            overflow: hidden;
        }
        #msg-modal-title{
            float: left;
            color: #fff;
            font-size: 20px;
        }
        .modal-close{
            cursor:pointer;
        }
        /* 모달창 컨텐츠 */
        .msg-modal-content{
            padding: 20px 30px;
        }
        .msg-modal-content input[type=text]{
            border: 0;
            background-color: transparent;
            color: #000;
        }
        .msg-modal-content textarea{
            width: 100%;
            height: 400px;
            resize: none;
            padding: 15px;
            border-radius: 15px;
            font-size: 15px;
        }
        .msg-modal-content input:focus, .msg-modal-content textarea:focus{
            outline: none;
        }
        .msg-info>span{
            font-weight: bold;
            padding-right: 10px;
        }
        .msg-info>input{
            margin-left: 5px;
        }
        .msg-modal-content>.msg-sender{
            margin-bottom: 10px;
        }
        /* 모달창 답장버튼 */
        .msg-modal-content>.msg-btn-wrap{
            display: flex;
            justify-content: center;
            margin: 0;
        }
        .msg-btn-wrap>input{
            width: 130px;
            height: 55px;
            border: 0;
            border-radius: 15px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            background-color: #ffb347;
            text-align: center;
        }
        .msg-btn-wrap>input:hover{
            cursor: pointer;
            background-color: #ffcc33;
            color: #000;
            transition-duration: 0.8s;
        }
    </style>
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
                                    <select class="form-select select-checkin" name="selectCheckIn" aria-label=".select-checkin">
                                        <option value="" selected>체크인</option>
                                        <c:forEach var="i"  begin="9" end="18">
                                            <option value="${i>9?i:'0'}${i>9?'':i}:00">${i>9?i:'0'}${i>9?'':i}:00</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-5 ms-2">
                                    <select class="form-select select-checkout" name="selectCheckOut" aria-label=".select-checkout">
                                        <option value="" selected>체크아웃</option>
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
                            <c:choose>
                                <c:when test="${not empty pList}">
                                    <h3 class="sidebar-title">나의 반려동물</h3>
                                    <div class="sidebar-item">
                                        <select class="form-select select-pet" name="selectPet" aria-label=".select-pet">
                                            <c:forEach items="${pList}" var="pi" varStatus="i">
                                                <option value="${pi.petNo}">${pi.petName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </c:when>
                                <c:when test="${not empty sessionScope.m}">
                                    <h3 class="sidebar-title">나의 반려동물</h3>
                                    <div class="sidebar-item">
                                        <p class="m-0 p-2 d-flex align-items-center justify-content-center bg-light"><small>등록된 반려동물이 없습니다.</small></p>
                                    </div>
                                </c:when>
                            </c:choose>

                            
                            <h3 class="sidebar-title">이용요금</h3>
                            <div class="sidebar-item ">
                                <i class="bi bi-house-heart me-2"></i>1박 35,000
                            </div><!-- End sidebar categories-->
                            <div class="sidebar-item d-none">
                                <dl class="d-flex justify-content-between border-bottom border-secondary">
                                    <dt>합계 금액</dt>
                                    <dd class="total-amount">0</dd>
                                </dl>
                                <dl class="d-flex justify-content-between">
                                    <dt class="total-days text-muted"></dt>
                                    <dd class="this-amount text-muted"></dd>
                                </dl>
                            </div>
                            <c:choose>
                                <c:when test="${empty sessionScope.p and not empty sessionScope.m}">
                                    <div class="d-grid gap-2">
                                        <c:if test="${fn:length(pList) gt 0}">
                                            <button type="button" class="btn btn-warning btn-lg" onclick="requestReservation()">예약 요청</button>
                                        </c:if>
                                        <c:if test="${fn:length(pList) lt 1}">
                                            <button type="button" class="btn btn-warning btn-lg" disabled>반려동물을 등록하세요</button>
                                        </c:if>
                                    </div>

                                </c:when>
                                <c:otherwise>
                                    <div class="d-grid gap-2">
                                        <button type="button" class="btn btn-warning btn-lg" disabled>이용자 로그인이 필요합니다</button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${not empty sessionScope.m}">
                                <div class="side-btn-group">
                                    <button type="button" class="btn btn-dark " onclick="showContactUs()">문의하기</button>
                                </div>
                            </c:if>

                        </div><!-- End sidebar -->
                    </div>
                </div><!-- End blog sidebar -->
            </div>
        </div>
    </section><!-- End Blog Section -->
    <!-- 문의하기 modal -->
    <div class="msg-modal d-none">
        <div class="msg-modal-head d-flex justify-content-between align-items-center">
            <span id="msg-modal-title">문의하기</span>
            <span class="modal-close fs-3"><i class="bi bi-x-circle"></i></span>
        </div>
        <form action="/insertPartnerDm.do" method="post" id="dmForm">
            <div class="msg-modal-content">
                <div class="msg-info msg-sender">
                    <span><span class="text-muted me-1">From:</span> ${sessionScope.m.memberId}</span>
                    <input type="hidden" name="sender" value="${sessionScope.m.memberId}">
                </div>
                <div class="msg-info msg-date mb-3">
                    <span><span class="text-muted me-1">To:</span> ${detail.pName} 펫시터 님</span>
                    <input type="hidden" name="receiver" value="${detail.pNo}">
                </div>
                <div class="msg-content position-relative">
                    <textarea id="reply-msg" name="dmContent" placeholder="" required></textarea>
                    <small class="text-muted note-placeholder" style="position:absolute;top:20px;left:20px;"> 내용을 입력해주세요.<br>※ 광고, 도배, 욕설, 비방 등<br>서비스와 무관한 내용 작성시<br>신고 및 무통보 삭제될 수 있습니다.</small>
                </div>
                <div class="msg-btn-wrap mt-4">
                    <input type="hidden" name="pBoardNo" value="<c:out value="${param.petsitterBoardNo}"/>">
                    <input type="submit" id="submit-btn" value="문의하기">
                </div>
            </div>
        </form>
    </div>
    <!-- // 문의하기 modal -->
</main>
<!-- payment Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <i class="bi bi-journal-check fs-3"></i>
                <h4 class="modal-title text-center w-100" id="paymentModalLabel">예약 요청</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <article class="row g-2 pt-3 pb-4 border-bottom">
                    <h5 class="text-dark">이용자 정보</h5>

                    <div class="col-md-6">
                        <label for="memberName" class="form-label">이름</label>
                        <input type="text" class="form-control member-name" id="memberName" name="memberName" value="">
                        <input type="hidden" id="memberId" name="memberId"/>
                    </div>
                    <div class="col-md-6">
                        <label for="memberPhone" class="form-label">전화번호</label>
                        <input type="text" class="form-control member-phone" id="memberPhone" name="memberPhone" value="">
                    </div>
                    <div class="col-12">
                        <label for="specialRequest" class="form-label">요청사항 <small class="text-muted">(간단한 요청사항)</small></label>
                        <textarea class="form-control" id="specialRequest" rows="3" name="specialRequest"></textarea>
                    </div>
                </article>
                <article class="row g-2 pt-3 pb-3 border-bottom">
                    <h5 class="mt-3 mb-3 text-dark">파트너 정보<input type="hidden" class="p-no" name="pNo"/></h5>
                    <dl class="row mb-0">
                        <dt class="col-sm-4">이름</dt>
                        <dd class="col-sm-8 partner-name"></dd>

                        <dt class="col-sm-4">주소</dt>
                        <dd class="col-sm-8 partner-addr"></dd>

                        <dt class="col-sm-4 text-nowrap">자격증/수료 교육</dt>
                        <dd class="col-sm-8 partner-license"></dd>

                        <dt class="col-sm-4 text-nowrap"><span class="text-primary">SDC</span> 파트너 인증일</dt>
                        <dd class="col-sm-8 partner-approve-date"></dd>
                    </dl>
                </article>
                <article class="row g-2 pt-3 pb-3">
                    <h5 class="d-flex align-items-center mt-3 mb-3 text-dark">결제정보 / 수단 <i class="bi bi-credit-card fs-4 ms-2"></i></h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <tr>
                                <th>예약일</th>
                                <td colspan="2" class="check-in-out"></td>
                            </tr>
                        </table>
                        <table class="table align-middle">
                            <thead>
                            <tr>
                                <th scope="col">상품정보</th>
                                <th scope="col">예약일 수</th>
                                <th scope="col">금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>위탁돌봄<br>(산책, 실내놀이 포함)</td>
                                <td class="total-days"></td>
                                <td class="total-amount"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <input type="radio" class="btn-check" name="paymentMethod" id="paymentMethod1" value="가상계좌" >
                        <label class="btn payment-toss" for="paymentMethod1">가상계좌</label>
                        <input type="radio" class="btn-check" name="paymentMethod" id="paymentMethod2" value="카드"  checked>
                        <label class="btn payment-toss" for="paymentMethod2">간편결제</label>
                    </div>
                </article>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-warning" id="payment-button">결제/예약요청</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe0ca6d48cf3c72c89b2f627b0eb544a&libraries=drawing"></script>
<script src="/resources/js/plugin.js"></script>
<script src="/resources/js/common-partner.js"></script>
<script src="/resources/js/sticky-sidebar.js"></script>
<script src="https://js.tosspayments.com/v1"></script>
<script>
    function showContactUs() {
        const msgModal = $(".msg-modal");
        const closeBtn = msgModal.find(".modal-close");
        const msgContent = msgModal.find(".msg-content");
        const msgArea = msgModal.find("textarea");
        msgModal.removeClass("d-none");
        msgContent.on("click", function() {
            $(this).find("textarea").focus();
        });
        msgArea.on({
            "focus" : function() {
                $(".note-placeholder").addClass("d-none");
            },
            "focusout" : function (){
                if($(this).val() == "") {
                    $(".note-placeholder").removeClass("d-none");
                }
            }
        })
        closeBtn.on("click", function() {
            msgArea.val("").focusout();
            msgModal.addClass("d-none");
        })
    }
    var tossPayments = TossPayments("test_ck_5mBZ1gQ4YVX72jPObvZ3l2KPoqNb");
    var button = document.getElementById("payment-button");

    var orderId = new Date().getTime();
    let total;
    button.addEventListener("click", function () {

        $("body").append("<div id='preloader'></div>");

        const getValue = function(name) {
            return $("[name=" + name + "]").val();
        }

        $.ajax({
            type: "POST",
            url: "/reservePetSitter.do",
            data: {
                memberId : getValue("memberId"),
                pNo : getValue("pNo"),
                petNo : getValue("selectPet"),
                bookingPhone : getValue("memberPhone"),
                startDate : getValue("startDate") + " " + getValue("selectCheckIn"),
                endDate : getValue("endDate") + " " + getValue("selectCheckOut"),
                specialRequest : getValue("specialRequest"),
                price : total
            },
            success: function(result){
                $("#preloader").remove();
                if(result > 0) {
                    var method = document.querySelector('input[name=paymentMethod]:checked').value; // "카드" 혹은 "가상계좌"

                    var paymentData = {
                        amount: total,
                        orderId: orderId,
                        orderName: "SDC 서비스",
                        customerName: "SDC",
                        successUrl: window.location.origin + "/paymentSuccess.do",
                        failUrl: window.location.origin + "/paymentFail.do",
                    };

                    if (method === '가상계좌') {
                        paymentData.virtualAccountCallbackUrl = window.location.origin + '/virtual-account/callback'
                    }

                    tossPayments.requestPayment(method, paymentData);

                } else {
                    alert("예약실패\n 관리자에게 문의하세요.");
                }
            },
            error : function(request, status, error) {
                $("#preloader").remove();
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        })

    });

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

    $("#startDate").on("change", function() {
        setTotalAmount();
    })

    function setTotalAmount() {
        const amount = 35000;
        const selDateDiff = dUtils.dateDiff($("#startDate").val(), $("#endDate").val());
        total = amount * selDateDiff;
        const wonTotal = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        const totalAmount = $(".total-amount"),
            totalDays = $(".total-days"),
            thisAmount = $(".this-amount");
        if(total > 0) {
            totalAmount.closest(".sidebar-item").removeClass("d-none");
            totalAmount.text(wonTotal);
            totalDays.text(selDateDiff + "박 비용");
            thisAmount.text(wonTotal);
        } else {
            totalAmount.closest(".sidebar-item").addClass("d-none");
        }
    }
    setTotalAmount();

    function requestReservation() {
        const getObj = function(name) {
            return $("[name=" + name + "]");
        }

        if(getObj("startDate").val() == "" || getObj("endDate").val() == "") {
            alert("날짜를 선택하세요.");
            return;
        }
        if(getObj("selectCheckIn").val() == "" || getObj("selectCheckOut").val() == "") {
            alert("체크인 / 체크아웃 시간을 선택하세요.");
            return;
        }

        var paymentEl = document.getElementById('paymentModal');
        var paymentModal = new bootstrap.Modal(paymentEl, {
            keyboard: false
        });
        paymentEl.addEventListener('show.bs.modal', function (event) {
            const modal = $(event.target);
            modal.find(".member-name").val("${sessionScope.m.memberName}");
            modal.find("#memberId").val("${sessionScope.m.memberId}");
            modal.find(".member-phone").val("${sessionScope.m.memberPhone}");
            modal.find(".p-no").val("${detail.pNo}");
            modal.find(".partner-name").text("${detail.pName}");
            modal.find(".partner-addr").text("${detail.petsitterAddr}");
            modal.find(".partner-license").text("${detail.license}");
            modal.find(".partner-approve-date").text("${detail.approveDate}");
            modal.find(".partner-approve-date").text("${detail.approveDate}");

            const checkIn = $("#startDate").val(),
                checkOut = $("#endDate").val();
            const checkInTime = $(".select-checkin").val(),
                checkOutTime = $(".select-checkout").val();
            const amount = 35000;
            const selDateDiff = dUtils.dateDiff(checkIn, checkOut);
            const total = amount * selDateDiff;
            const wonTotal = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            const checkInOut = checkIn + " (" + dUtils.getDateToDay(checkIn) + ") " + checkInTime + " ~ " + checkOut + " (" + dUtils.getDateToDay(checkOut) + ") " + checkOutTime;

            modal.find(".check-in-out").text(checkInOut);
            modal.find(".total-days").text(selDateDiff + "박");
            modal.find(".total-amount").text(wonTotal);

        })
        paymentModal.show();
    }



    var sidebar = new StickySidebar('#sidebar', {
        containerSelector: '#main-content',
        innerWrapperSelector: '.sidebar__inner',
        topSpacing: 110,
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
