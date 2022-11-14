<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>똑독캣 (SDC) | 펫시터, 훈련사, 그루머 예약서비스</title>
    <script></script>
    <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    <style>
        .contact .php-email-form input[type=radio],
        .contact .php-email-form input[type=checkbox] {
            height:1em;
        }
        #preview{height:120px;object-fit: contain}
        #auth{display:flex;flex-direction:row-reverse;position:absolute;bottom:-25px;right:0;}
        .input-group .btn-check-mailcode{position:absolute;top:50%;right:5px;transform:translateY(-50%);}
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
<main id="main">
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h2>지원서 작성</h2>
                <ol>
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>펫시터 지원하기</li>
                </ol>
            </div>
        </div>
    </section>
    <!-- ======= Book A Table Section  ======= -->
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact" style="">
        <div class="container" data-aos="">
            <div class="row justify-content-center">
                <form action="/joinPartner.do" id="" name="" method="post" enctype="multipart/form-data">
                <div class="col-lg-10 mt-lg-0">
                    <!-- <form action="forms/contact.php" method="post" role="form" class="php-email-form"> -->
                    <div class="row php-email-form">
                        <div class="col col-md-8 mb-5">
                            <label for="">지원 유형 <span class="text-warning">*</span></label>
                            <div class="row mt-3">
                                <div class="col">
                                    <input type="checkbox" class="btn-check" name="partnerType" id="partnerType1" value="L">
                                    <label class="btn col-md-12 btn-outline-secondary" for="partnerType1">위탁돌봄</label>
                                </div>
                                <div class="col">
                                    <input type="checkbox" class="btn-check" name="partnerType" id="partnerType2" value="V">
                                    <label class="btn col-md-12 btn-outline-secondary" for="partnerType2">방문돌봄</label>
                                </div>
                                <input type="hidden" name="category" value="">
                            </div>
                        </div>
                        <div class="section-title">
                            <!-- <h2>파트너 지원</h2> -->
                            <p>1. 기본정보</p>
                        </div>
                        <div class="col col-md-12 form-group">
                            <label for="pId">지원자 이메일 <span class="text-warning">*</span></label>
                            <div class="input-group align-items-center position-relative">

                                <input type="text" name="pId" class="form-control" id="pId" placeholder="name@example.com" required>

                                <div class="input-group-append position-relative w-25 d-none">
                                    <input type="text" class="form-control form-auth-code w-100">
                                    <div id="auth" style="display:none;">
                                        <span id="timeZone" class="text-nowrap ms-2"></span>
                                        <span id="authMsg" class="text-nowrap"></span>
                                    </div>
                                    <button class="btn btn-sm btn-warning btn-check-mailcode" type="button">확인</button>
                                </div>
                                <div class="input-group-append position-relative ms-2">
                                    <button class="btn btn-secondary btn-check-mail" type="button" onclick="checkPartnerMail(this)">인증번호 받기 </button>
                                </div>
                            </div>
                        </div>
                        <dfiv class="col-md-6 form-group mt-3">
                            <label for="pPw">비밀번호 <span class="text-warning">*</span></label>
                            <input type="password" class="form-control" name="pPw" id="pPw" placeholder="8~20자 영문 대 소문자, 숫자, 특수문자" required>
                        </dfiv>
                        <div class="col-md-6 form-group mt-3">
                            <label for="rePw">비밀번호 확인<span class="text-warning">*</span></label>
                            <input type="password" class="form-control" id="rePw" placeholder="비밀번호 확인" required>
                        </div>
                        <div class="col-md-6 form-group mt-3">
                            <label for="pName">이름 <span class="text-warning">*</span></label>
                            <input type="text" name="pName" class="form-control" id="pName" placeholder="" required>
                        </div>
                        <div class="col-md-6 form-group mt-3">
                            <label for="pDob">생년월일 <span class="text-warning">*</span> <small class="text-muted">03년 생부터 (만 18세이상)지원이 가능합니다.</small></label>
                            <input type="text" name="pDob" class="form-control" id="pDob" placeholder="예) 19940101" required>
                        </div>
                        <div class="col-md-6 form-group mt-3">
                            <label for="pPhone">연락처 <span class="text-warning">*</span></label>
                            <input type="text" class="form-control" name="pPhone" id="pPhone" placeholder="'-' 제외" required>
                        </div>
                        <div class="col-md-6 form-group mt-3">
                            <label for="pAddr">거주지 주소 <span class="text-warning">*</span></label>
                            <div class="input-group align-items-center">
                                <input type="text" class="form-control" name="pAddr" id="pAddr" placeholder="" required readonly>
                                <div class="input-group-append ms-2">
                                    <button class="btn btn-secondary btn-addr-search" type="button" onclick="">검색</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 form-group mt-3">
                            <label for="">성별 <span class="text-warning">*</span></label>
                            <div class="row">
                                <div class="col">
                                    <input type="radio" class="btn-check" name="pGender" id="gender1" value="M">
                                    <label class="btn col-md-12 btn-outline-secondary" for="gender1">남자</label>
                                </div>
                                <div class="col">
                                    <input type="radio" class="btn-check " name="pGender" id="gender2" value="F">
                                    <label class="btn col-md-12 btn-outline-secondary" for="gender2">여자</label>
                                </div>
                            </div>

                        </div>

                    </div>

                    <%--
                    <div class="row mt-5 php-email-form">

                        <div class="section-title">
                            <!-- <h2>파트너 지원</h2> -->
                            <p>2. 활동 정보</p>
                        </div>

                        <div class="col col-md-12 form-group">
                            <label for="">활동 가능한 일 수 <span class="text-warning">*</span></label>
                            <div class="col mt-3">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="workAvail" id="workAvail1" value="option1" checked>
                                    <label class="form-check-label" for="workAvail1">주말 포함한 30일 모두 가능합니다.</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="workAvail" id="workAvail2" value="option2">
                                    <label class="form-check-label" for="workAvail2">평균 20일 이상 가능합니다.</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="workAvail" id="workAvail3" value="option3">
                                    <label class="form-check-label" for="workAvail3">평균 20일 이하 가능합니다.</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="workAvail" id="workAvail4" value="option4">
                                    <label class="form-check-label" for="workAvail4">주말만 가능합니다.</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group mt-4">
                            <label for="name">활동 가능한 시간대<span class="text-muted">(중복 선택가능)</span><span class="text-warning">*</span></label>
                            <div class="col mt-3">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="timeAvail" id="timeAvail1" value="option1" checked>
                                    <label class="form-check-label" for="timeAvail1">모두 가능합니다.</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="timeAvail" id="timeAvail2" value="option2">
                                    <label class="form-check-label" for="timeAvail2">오전 타임(오전 8:00 ~ 오후 12:00)</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="timeAvail" id="timeAvail3" value="option3">
                                    <label class="form-check-label" for="timeAvail3">오후 타임(오후 12:00 ~ 오후 6:00)</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="timeAvail" id="timeAvai4" value="option4">
                                    <label class="form-check-label" for="timeAvai4">저녁 타임(오후 06:00 ~ 오후 10:00)</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="timeAvai" id="timeAvai5" value="option4">
                                    <label class="form-check-label" for="timeAvai5">직접입력</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    --%>
                    <div class="row mt-5 php-email-form">
                        <div class="section-title">
                            <!-- <h2>파트너 지원</h2> -->
                            <p>2. 반려 경험 및 경력</p>
                        </div>

                        <div class="col col-md-12 form-group">
                            <label for="">자격증 또는 교육수료 <span class="text-warning">*</span></label>
                            <div class="col mt-3">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="license" id="license1" value="반려동물행동교정사 자격증">
                                    <label class="form-check-label" for="license1">반려동물행동교정사 자격증</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="license" id="license2" value="반려동물관리사 1급 자격증">
                                    <label class="form-check-label" for="license2">반려동물관리사 1급 자격증</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="license" id="license3" value="반려동물행동상담사 2급 자격증">
                                    <label class="form-check-label" for="license3">반려동물행동상담사 2급 자격증</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="license" id="license4" value="반려동물목욕관리사 2급 자격증">
                                    <label class="form-check-label" for="license4">반려동물목욕관리사 2급 자격증</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="license" id="license5" value="전문 펫시터 자격증">
                                    <label class="form-check-label" for="license5">전문 펫시터 자격증</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="license" id="license6" value="펫시터 전문가 교육 수료">
                                    <label class="form-check-label" for="license6">펫시터 전문가 교육 수료</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="license" id="license7" value="펫시터 직업 훈련 교육 수료">
                                    <label class="form-check-label" for="license7">펫시터 직업 훈련 교육 수료</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 form-group mt-3">
                            <label for="">펫시터 활동 경력 <span class="text-warning">*</span></label>
                            <div class="col mt-3">
                                <textarea class="form-control" id="workExp" name="workExp" rows="4"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-5 php-email-form">
                        <div class="section-title">
                            <p>3. 기타 정보</p>
                        </div>

                        <div class="col col-md-12 form-group">
                            <label for="applyMotive">지원동기 <span class="text-warning">*</span></label>
                            <div class="col mt-3">
                                <textarea class="form-control" id="applyMotive" name="applyMotiv" rows="4"></textarea>
                            </div>
                        </div>

                        <div class="col-md-12 form-group mt-4">
                            <label for="">프로필 사진 <span class="text-warning">*</span></label>
                            <%--<div class="col mt-3">
                                <input type="file" name="profile" onchange="">
                                <img src="" alt="" id="preview">
                            </div>--%>
                            <div class="col-6 mb-3 mt-3">
                                <label for="profile" class="form-label d-none"></label>
                                <input class="form-control h-auto" type="file" name="profile" id="profile">
                            </div>
                            <div class="col-auto">
                                <img src="" alt="" id="preview">
                            </div>
                        </div>

                        <div class="col-md-12 form-group mt-4">
                            <label for="">동의 사항 <span class="text-warning">*</span></label>
                            <div class="col mt-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="agreement" id="agreement1" value="c1">
                                    <label class="form-check-label" for="agreement1">개인정보 <a href="javascript:void(0)">수집/이용에 동의</a>합니다.</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="agreement" id="agreement2" value="c2">
                                    <label class="form-check-label" for="agreement2">지원서에 기재된 내용은 모두 본인이 작성하였으며, 사실과 다름없을을 확인했습니다.</label>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="row mt-5 php-email-form">
                        <div class="section-title">
                            <p>채용 절차 안내</p>
                        </div>
                        <div id="resume" class="resume">
                            <div class="col col-md-12 form-group">
                                <div class="col-lg-6">
                                    <!-- <h3 class="resume-title">Sumary</h3> -->
                                    <div class="resume-item">
                                        <h4>서류 심사</h4>
                                        <p>
                                            <em>서류 합격자 한해서 입력하신 메일로 메일 발송해 드립니다.</em>
                                        </p>
                                        <p class="text-muted">* 사용가능한 메일 주소로 꼭 입력해주새요.</p>
                                    </div>
                                    <div class="resume-item">
                                        <h4>자체 테스트 <span class="text-warning">*</span></h4>
                                        <p>
                                            <em>자체 테스트 실시 후 결과에 따른 점수가 반영됩니다.</em>
                                        </p>
                                        <button type="button" class="btn btn-primary">테스트 시작</button>
                                    </div>
                                    <div class="resume-item">
                                        <h4>펫시터 등록</h4>
                                        <p>
                                            <em>본인 인증, 관리자 승인 메일을 받으신 분들만 SDC 펫시터로 활동할 수 있습니다.</em>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center php-email-form border-top pt-5 mt-5">
                    <button type="submit" class="btn-complete">지원서 보내기</button>
                </div>
                </form>
            </div>
        </div>
        </div>
    </section><!-- End Contact Section -->

</main>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/common-partner.js"></script>

</body>
</html>
