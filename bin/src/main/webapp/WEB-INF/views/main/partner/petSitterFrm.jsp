<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>똑독캣 (SDC) | 펫시터, 훈련사, 그루머 예약서비스</title>
    <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>

    <link rel="stylesheet" href="/resources/css/main/style-partner.css">
    <link href="/resources/css/partner/trainerStyles.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <%--<section id="breadcrumbs" class="breadcrumbs">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="m-0">펫시터 등록</h2>
            </div>
        </div>
    </section>--%><!-- End Breadcrumbs -->
    <section class="section-title">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <h1 class="mb-5 mt-3 ">펫시터 프로필 작성하기 <i class="bi bi-house-fill"></i></h1>
                </div>
            </div>
        </div>
    </section>
    <section id="blog" class="partner-frm overflow-visible">

        <div class="container">
            <div  class="row justify-content-center" >
                <div class="col-xl-8" >
                    <form action="" method="post" id="boardRegisterFrm" class="row g-3" enctype="multipart/form-data">
                        <div class="col-12">
                            <label for="petsitterBoardTitle" class="form-label col-form-label-lg">제목 <span class="text-warning">*</span></label>
                            <input type="text" class="form-control form-control-lg" name="petsitterBoardTitle" id="petsitterBoardTitle" placeholder="게시물 제목 입니다.">
                            <%--파트너 번호--%>
                            <input type="hidden" name="pNo" value="P-1023">

                        </div>
                        <div class="col-12 mt-4">
                            <label for="petsitterAboutMe" class="form-label col-form-label-lg">자기소개 <span class="text-warning">*</span></label>
                            <textarea name="petsitterAboutMe" class="summernote" id="petsitterAboutMe"></textarea>
                        </div>
                        <div class="col-12 mt-4">
                            <label for="" class="form-label col-form-label-lg">파트너 환경 / 서비스 <span class="text-warning">*</span> <small class="text-muted">(한가지 이상 선택)</small></label>
                            <div class="col">
                                <input type="checkbox" class="btn-check" name="noPet" id="option1" value="Y" autocomplete="off">
                                <label class="btn btn-outline-secondary me-2" for="option1">반려동물 없음</label>
                                <input type="checkbox" class="btn-check" name="pickup" id="option2" value="Y" autocomplete="off">
                                <label class="btn btn-outline-secondary me-2" for="option2">픽업 가능</label>
                                <input type="checkbox" class="btn-check" name="largePet" id="option3" value="Y" autocomplete="off">
                                <label class="btn btn-outline-secondary me-2" for="option3">대형견 가능</label>
                                <input type="checkbox" class="btn-check" name="yard" id="option4" value="Y" autocomplete="off">
                                <label class="btn btn-outline-secondary me-2" for="option4">마당 있음</label>
                                <input type="checkbox" class="btn-check" name="oldPet" id="option5" value="Y" autocomplete="off">
                                <label class="btn btn-outline-secondary me-2" for="option5">노견 케어</label>
                            </div>

                        </div>
                        <div class="col-7">
                            <label for="petsitterAddr" class="form-label col-form-label-lg">주소 <span class="text-warning">*</span></label>
                            <div class="mb-3 addr-wrap">
                                <input type="text" class="input-keyword form-control form-control-lg" name="petsitterAddr" id="petsitterAddr" placeholder="위탁 장소 주소 (동 이름 입력)" >
                                <input type="hidden" name="lng" id="lng"><!-- 좌표값 -->
                                <input type="hidden" name="lat" id="lat">
                                <div class="list-group">
                                    <ul class="dropdown-menu" id="placesList"></ul>
                                    <div id="pagination"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-5">
                            <label for="petsitterAddrDetail" class="form-label col-form-label-lg">상세주소 <span class="text-warning">*</span></label>
                            <input type="text" class="form-control form-control-lg" name="petsitterAddrDetail" id="petsitterAddrDetail">
                        </div>

                        <div class="col-12 file-group">
                            <label for="" class="form-label col-form-label-lg">위탁 장소 사진 첨부 <span class="text-warning">*</span> <small class="text-muted">(사진 1개이상 첨부)</small></label>
                            <input type="file" name="partnerFile" id="partnerFile" class="file-multiple d-none" multiple>

<%--                        <input class="form-control form-control-lg add-file" id="" name="" type="file" >--%>
                            <div class="input-group">
                                <input type="file" class="form-control add-file" aria-label="Upload">
                                <button class="btn btn-outline-danger" type="button" onclick="deleteFile(this)">삭제</button>
                            </div>
                        </div>
                        <div class="col-12 mt-4">
                            <label for="" class="form-label col-form-label-lg">활동 기간 <span class="text-warning">*</span></label>
                            <div class="js-search-option">
                                <div class="js-option-date input-group is-inactive d-flex row g-0">
                                    <div class="col-6">
                                        <div class="input-group">
                                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-calendar text-muted"></i></span>
                                            <input type="text" id="startDate" name="startDate" class="form-control" placeholder="활동 가능한 기간을 선택해주세요" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group">
                                            <input type="text" id="endDate" name="endDate" class="form-control" placeholder="" >
                                        </div>
                                    </div>
                                </div>

                                <div class="reservation-calendar clear-cont">
                                    <div class="calendar-container calendar-sm position-left-top d-flex justify-content-center overflow-auto shadow"></div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="col-12 mt-4">
                            <label for="" class="form-label col-form-label-lg">활동 시간대 <span class="text-warning">*</span> <small class="text-muted">(활동 가능 시간 09:00 ~ 18:00)</small></label>
                            <div class="d-flex">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="activityTime" id="amTime" value="AM">
                                    <label class="form-check-label" for="amTime">
                                        오전만
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="activityTime" id="pmTime" value="PM">
                                    <label class="form-check-label" for="pmTime">
                                        오후만
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="activityTime" id="allTime" value="ALL">
                                    <label class="form-check-label" for="allTime">
                                        하루종일
                                    </label>
                                </div>
                            </div>

                        </div>--%>
                        <div class="col-12 d-grid mt-5">
                            <button type="button" class="btn btn-dark btn-lg" onclick="confirmBoardRegisterFrm()">펫시터 등록</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </section>

</main>
<!-- 등록 확인 모달 -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-labelledby="submitModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="submitModalLabel">작성완료</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                위탁 펫시터 프로필을 등록 하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="submitBoardRegisterFrm()">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 등록 완료 모달 -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">등록완료</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                위탁 펫시터 등록이 완료되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 등록 실패 모달 -->
<div class="modal fade" id="failedModal" tabindex="-1" aria-labelledby="failedModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="failedModalLabel">등록실패</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                등록되지 않았습니다.<br>
                관리자에게 문의하세요.
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
<script src="/resources/js/plugin.js"></script>
<script src="/resources/js/common-partner.js"></script>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/kakao.js"></script>
<%--<script
        type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe0ca6d48cf3c72c89b2f627b0eb544a&libraries=services"
></script>
<script src="/resources/js/map.js"></script>--%>
<script>

    let files = [];
    $(document).ready(function(){
        $(".summernote").summernote({
            height: 200,
            minHeight: null,
            maxHeight: null,
            focus: true,
            lang: "ko-KR",
            placeholder: '자기소개글을 작성해주세요'
        });

        $(".file-group").on("change", ".add-file", function(e) {
            const idx = $(".add-file").index(this);
            const str = $(this).val();
            const fileName = str.split('\\').pop().toLowerCase();

            const ext =  fileName.split('.').pop().toLowerCase();

            if($.inArray(ext, ['jpg', 'pdf', 'png', 'jpeg', 'gif']) == -1) {
                alert(ext+'파일은 업로드 하실 수 없습니다.');
                $(this).val("");
                return;
            }

            //files = [];
            if($(".add-file").length == (idx+1) && $(".add-file").length < 3) {

                $(this).parent().after("<div class='input-group mt-3'><input type='file' class='form-control add-file' id='' aria-label='Upload'> <button class='btn btn-outline-danger' type='button' id='' onclick='deleteFile(this)'>삭제</button></div>")
                files.push(e.target.files[0]);
            } else {
                files[idx] = e.target.files[0];
            }
            $(this).addClass("has-file");
            fileSetting();
        })
    });

    const submitModal = new bootstrap.Modal(document.getElementById('submitModal'), {
        keyboard: false
    });
    const failedModal = new bootstrap.Modal(document.getElementById('failedModal'), {
        keyboard: false
    });
    const successModalEl = document.getElementById('successModal');
    const successModal = new bootstrap.Modal(successModalEl, {
        keyboard: false
    });

    function deleteFile(btn) {
        const delBtn = $(btn);
        const inputFile = delBtn.prev();

        if(inputFile.val() == "") {
           return;
        } else {
            inputFile.val("");
            const fileLength = $(".add-file.has-file").length;
            if(fileLength > 2){
                delBtn.closest(".file-group").append("<div class='input-group mt-3'><input type='file' class='form-control add-file' id='' aria-label='Upload'> <button class='btn btn-outline-danger' type='button' id='' onclick='deleteFile(this)'>삭제</button></div>");
            }
            delBtn.closest(".input-group").remove();

            files.splice(fileLength - 1,1);

            fileSetting();
        }
    }

    function fileSetting() {
        //input[type=file] value 는 보안상 변경이 불가능
        //input[type=file] 변경용 객체 필요
        const dataTransfer = new DataTransfer();
        for(let i=0;i<files.length;i++) {
            dataTransfer.items.add(files[i]);
        }
        $("#partnerFile").prop("files", dataTransfer.files);
        const fi = $("#partnerFile")[0].files;

    }

    function confirmBoardRegisterFrm() {

        if($("[name=petsitterBoardTitle]").val().length < 5) {
            alert("제목은 최소 5자 입니다.");
            $("[name=petsitterBoardTitle]").focus();
            return;
        }else if($("[name=petsitterAboutMe]").val().length == ""){
            alert("자기소개는 필수 항목 입니다.");
            return;
        } else if($(".btn-check:checked").length < 1) {
            alert("파트너 환경 / 서비스 항목 한가지 이상 선택해주세요.");
            return;
        } else if($("#lng").val() == "" || $("#lat").val() == ""){
            alert(" 주소를 올바르게 입력하세요.");
            return;
        } else if($("[name=petsitterAddrDetail]").val() == "") {
            alert("상세 주소는 필수항목입니다.");
            return;
        } else if(files.length < 1) {
            alert("사진은 한장이상 첨부하셔야 합니다.");
            return;
        } else if($("#startDate").val() == "" || $("#endDate").val() == "") {
            alert("활동 기간을 선택하세요.");
            return;
        }

        submitModal.show();

    }

    function submitBoardRegisterFrm() {
        submitModal.hide();
        const loader = $("<div id='preloader'></div>");
        $("body").append(loader);
        const form = $("#boardRegisterFrm")[0];
        const formData = new FormData(form);

        console.log(formData);
        console.dir(formData);
        $.ajax({
            type: "POST",
            url: "/petSitterBoardRegist.do",
            enctype: 'multipart/form-data',
            cache: false,
            processData: false,
            contentType: false,

            data: formData,
            success: function(res) {
                loader.remove();
                if(res > 2) {
                    successModal.show();
                    successModalEl.addEventListener('hidden.bs.modal', function (event) {
                        window.location = "/petSitterList.do";
                    });
                } else {
                    submitModal.hide();
                    failedModal.show();
                }
            }
        })
    }

</script>
</body>
</html>
