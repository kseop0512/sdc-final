

$(".btn-addr-search").on("click", function() {

    new daum.Postcode({
        oncomplete: function(data) {
            $("#pAddr").val(data.address);
        }
    }).open();
})

$(document).ready(function() {

    const INVALID_CLASS = "is-invalid";
    $(".form-control").on({
        "change" : function() {
            const input = $(this);
            const inputVal = input.val();
            const inputId = input.attr("id");

            const confirmValue = function(regex, str){
                if(regex.test(inputVal)){
                    input.removeClass(INVALID_CLASS);
                    // comment.text("");
                    // validation = true;
                } else {
                    input.addClass(INVALID_CLASS);
                    // comment.text(str);
                    // validation = false;
                    input.focus();
                }
            }
            if(inputId == "pId") {

                const pId = inputVal;
                const msg = input.closest(".form-group").find(".msg-validation");
                const idRef = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                confirmValue(idRef);

                $.ajax({
                    url : "/validationPartnerId.do",
                    data : {pId : pId},
                    async : false,
                    success: function(result) {
                        console.log(result);
                        if(result>0) {
                            input.removeClass(INVALID_CLASS);
                            msg.text("");
                        } else {
                            input.addClass(INVALID_CLASS);
                            msg.text("중복된 아이디입니다.");
                        }
                    }
                })

            } else if (inputId == "pPw" || inputId == "rePw") {
                const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
                confirmValue(pwReg);
                if(pwReg.test(inputVal) && $("[id=pPw]").val() == inputVal && $("[id=rePw]").val() == inputVal ) {
                    $("[id=rePw]").removeClass("is-invalid");
                } else {
                    if($("[id=rePw]").val() != "") {
                        $("[id=rePw]").addClass("is-invalid");
                        input.focus();
                    }
                }

            } else if (inputId == "pDob") {
                const dobRef = /^(19[0-9][0-9]|200[0-3])(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
                confirmValue(dobRef);
            } else if (inputId == "pPhone") {
                const phoneRef = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
                confirmValue(phoneRef)
            }

        }
    });

    $(".btn-complete").on("click", function() {

        let isValid = true;
        $(".form-control").not(".form-auth-code").each(function(index, item) {

            if($(item).val() == "" || $(item).hasClass(INVALID_CLASS)) {
                $(item).focus();
                isValid = false;
                return false;
            }
        });

        if(isValid === false) {return};
        if(mailAuth == false) {
            alert("메일 인증은 필수입니다.")
        }else if($("[name=pGender]:checked").length < 1) {
            $("[name=pGender]").focus();
            return;
        } else if ($("[name=license]:checked").length < 1) {
            $("[name=license]").eq(0).focus();
            return;
        } else if($("[name=agreement]:checked").length < 2) {
            alert("동의 사항은 모두 필수 체크 항목입니다.");
            return;
        }

    })

    $("[name=profile]").on("change", function(e) {
        const str = $(this).val();
        const fileName = str.split('\\').pop().toLowerCase();
        //checkFileName(fileName);

        const ext =  fileName.split('.').pop().toLowerCase();
        if($.inArray(ext, ['jpg', 'pdf', 'png', 'jpeg', 'gif']) == -1) {
            alert(ext+'파일은 업로드 하실 수 없습니다.');
            $(this).val("");
            return;
        }

        //파일명에 특수문자 체크
        const pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
        if(pattern.test(fileName) ){
            //alert("파일명에 허용된 특수문자는 '-', '_', '(', ')', '[', ']', '.' 입니다.");
            alert('파일명에 특수문자를 제거해주세요.');
            $(this).val("");
            return;
        }

        if (e.target.files && e.target.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(e.target.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    })


    $("[name=partnerType]").on("change", function() {
        const category = $("[name=category]");

        if($("[name=partnerType]:checked").length < 2) {
            category.val($(this).val());
        } else {
            category.val("VL");
        }
    })
})

function readURL(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('preview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('preview').src = "";
    }
}

function checkFileName(str){

    //1. 확장자 체크
    const ext =  str.split('.').pop().toLowerCase();
    if($.inArray(ext, ['bmp' , 'hwp', 'jpg', 'pdf', 'png', 'xls', 'zip', 'pptx', 'xlsx', 'jpeg', 'doc', 'gif']) == -1) {

        //alert(ext);
        alert(ext+'파일은 업로드 하실 수 없습니다.');
    }

    //2. 파일명에 특수문자 체크
    const pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
    if(pattern.test(str) ){
        //alert("파일명에 허용된 특수문자는 '-', '_', '(', ')', '[', ']', '.' 입니다.");
        alert('파일명에 특수문자를 제거해주세요.');
    }
}

let mailAuth = false;
let mailCode;
function checkPartnerMail(btn) {
    const emailInput = $("[name=pId]");
    if(emailInput.val() != "" && !emailInput.hasClass("is-invalid")) {
        const email = emailInput.val();
        //console.log(email)
        $.ajax({
            url : "/sendIdCheckMail.do",
            data: {email : email},
            success : function(result) {
                // console.log(result);
                if(result != "") {
                    mailCode = result;
                    mailAuth = false;
                    if(intervalId != undefined) {
                        clearInterval(intervalId);
                    }
                    $(".form-auth-code").parent().removeClass("d-none");
                    $("#auth").show()
                    authTime();
                    $(".btn-check-mailcode").attr("onclick", "checkAuthCode()");
                } else {
                    mailAuth = false;
                    alert("인증번호 발송 실패했습니다.")
                }
            }
        })
    }
}

let intervalId;
function authTime() {
    $("#timeZone").html("<span id='min'>3</span> : <span id='sec'>00</span>");
    intervalId = window.setInterval(function() {
        timeCount();
    }, 1000)
}

function timeCount() {
    const min = Number($("#min").text());
    const sec = $("#sec").text();

    if(sec == "00") {
        if (min == "00") {
            mailCode = null;
            clearInterval(intervalId);
        } else {
            $("#min").text(min-1);
            $("#sec").text(59);
        }
    } else {
        const newSec = Number(sec)-1;
        if(newSec < 10) {
            $("#sec").text("0" + newSec);
        } else {
            $("#sec").text(newSec);
        }
    }
}

function checkAuthCode(){
    const inputValue = $(".form-auth-code").val();
    if(mailCode != null) {

        if(inputValue == mailCode) {
            $("#authMsg").text("인증성공");
            $("#authMsg").removeClass("text-danger");
            $("#authMsg").addClass("text-success");
            clearInterval(intervalId);
            $("#timeZone").hide();
            mailAuth = true;
        } else {
            $("#authMsg").text("인증실패");
            $("#authMsg").removeClass("text-success");
            $("#authMsg").addClass("text-danger");
        }
    } else {
        $("#authMsg").text("인증시간만료");
        $("#authMsg").css("color","red");
    }
}
/*
function resetAuth(){
    mailCode = null;
    mailAuth = false;
    clearInterval(intervalId);
    $("[name=pId]").val("");
    $(".form-auth-code").val("");
    $("#timeZone").show().empty();
    $("#authMsg").text("");
    //$(".form-auth-code").parent().addClass("d-none");
    $(".btn-check-mail").attr("onclick", "checkPartnerMail(this)");
}
*/



const sdcJs = {};
this.sdcJs = sdcJs;
const ANIMATION_EASING = 'easeOutExpo';
const ACTIVE_CLASS = "active";

$(function() {
    sdcJs.initResvCalendar($(".calendar-container"), 30);
})
$(window).on("load", function() {
    sdcJs.setSearchOption('.js-search-option');
})
//메인 예약캘린더 날짜관련 매니징함수
sdcJs.calendarMgr = {
    chkInDate: '',
    chkOutDate: '',
    _getChkInDate: function () {
        return this.chkInDate;
    },
    _getChkOutDate: function () {
        return this.chkOutDate;
    },
    _setChkInDate: function (date) {
        this.chkInDate = date;
    },
    _setChkOutDate: function (date) {
        this.chkOutDate = date;
    },
    _resetDate: function (calendarEl, startDate, endDate) {
        sdcJs.setCalendarChkInOutDate(calendarEl, startDate, endDate);
        this.chkInDate = '';
        this.chkOutDate = '';

        sdcJs.gotoDate(calendarEl, startDate.getMonth(), startDate.getFullYear());
        calendarEl.datepicker('refresh');
        calendarEl.trigger('refresh');

    }
}


/**
 * 예약 캘린더
 * https://api.jqueryui.com/datepicker/
 *
 * @param initResvCalendar (Element)
 */
sdcJs.initResvCalendar = function (calendarEl) {
    if (!calendarEl.length) {
        return;
    }
    let option = {};
    calendarEl.empty();

    if (calendarEl.hasClass('cal-single')) {
        let selectedDate = '';
        let promotionDate = [];

        option = {
            defaultDate: new Date(2022, 1, 20),
            tDay: new Date(2022, 1, 20),
            chkInTitle: '선택 됨',
            numberOfMonths: 1,
            showMonthAfterYear: true,
            monthNames: [
                "01",
                "02",
                "03",
                "04",
                "05",
                "06",
                "07",
                "08",
                "09",
                "10",
                "11",
                "12"
            ],
            dayNamesMin: [
                "일",
                "월",
                "화",
                "수",
                "목",
                "금",
                "토"
            ],
            // minDate: 0,
            minDate: new Date(2020, 7, 25),
            dateFormat: 'yy.mm.dd',
            onChangeMonthYear: function (year, month, inst) {
                setPromotionDate(year, month);
            },
            beforeShowDay: function (date) {
                const calDate = dUtils.getToDate(date);
                // select
                if (selectedDate == calDate) {
                    $('.calNotiCont').hide();
                    if (promotionDate.indexOf(calDate) != -1) {
                        $('.calNotiCont').show();
                        return [true, 'sel is-start promotion'];
                    }
                    return [true, 'sel is-start'];
                }
                //promotion
                if (promotionDate.indexOf(calDate) != -1) {
                    return [true, 'promotion'];
                }

                return [true];
            },
            onSelect: function (date, inst) {
                selectedDate = date;
                //다이닝 경우 선택 시 default 클래스 삭제
                $('.default').removeClass('default');
            }
        };
        function setPromotionDate(year, month) {
            //date push
            promotionDate = [];
            //test dummy
            let i = 20;
            while (i < 30) {
                promotionDate.push(year + '.' + lpad(month, 2, 0) + '.' + i);
                i++;
            }
        }
        calendarEl.datepicker(option);
        //초기 프로모션 데이트 설정
        setPromotionDate(
            calendarEl.datepicker('getDate').getFullYear(),
            calendarEl.datepicker('getDate').getMonth() + 1
        );
        calendarEl.datepicker('refresh');
    } else {
        let chkInDate = sdcJs
            .calendarMgr
            ._getChkInDate();
        let chkOutDate = sdcJs
            .calendarMgr
            ._getChkOutDate();
        let clickCnt = 0;
        let resved = false;
        const isOneday = calendarEl.hasClass('oneDay');
        let unSelectableDate = [];

        const startDate = new Date();

        const endDate = new Date(startDate.getFullYear(), startDate.getMonth() + 2, 0);

        calendarEl.on('refresh', function () {
            clickCnt = 0;
            resved = false;
        })
        //checkInOut calendar
        option = {
            defaultDate: startDate,
            tDay: startDate, // .ui-datepicker-today 적용 날짜
            //startTitle: 'start',
            //endTitle: 'end',
            numberOfMonths: 2,
            showMonthAfterYear: true,

            monthNames: [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월"
            ],
            /*dayNamesMin: (calendarEl.hasClass('calendarS'))
                ? ["S", "M", "T", "W", "T", "F","S" ]
                : [ "SUN", "MON", "TUE", "WED", "THU", "FRI","SAT"],*/
            dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ] ,
            // minDate: 0, maxDate : '+11m',
            //minDate: startDate,
            minDate:new Date(2022, 11 - 1, 11),
            //maxDate: endDate,
            maxDate: "+2M",
            dateFormat: 'yy.mm.dd',
            yearSuffix: '년',
            onChangeMonthYear: function (year, month, inst) {
                //날짜선택 및 달력 월 이동시 호출 setUnselectableDate(year, month);
            },
            beforeShowDay: function (date) {

                const calDate = dUtils.getToDate(date);
                chkInDate = sdcJs
                    .calendarMgr
                    ._getChkInDate();
                chkOutDate = sdcJs
                    .calendarMgr
                    ._getChkOutDate();
                // 체크인
                if (chkInDate == calDate) {
                    return [true, 'sel is-start ui-datepicker-unselectable ui-state-disabled'];
                }

                // 체크아웃
                if (chkOutDate == calDate) {
                    return [true, 'sel is-end'];
                }

                // 선택제한 날짜
                if (unSelectableDate.indexOf(calDate) != -1) {
                    if (clickCnt == 0 || resved) {
                        return [true, 'tdDefault'];
                    }
                    if (clickCnt == 1 && chkInDate > calDate) {
                        return [true, 'tdDefault'];
                    }
                }

                // 중간 날짜 선택
                return [
                    true,
                    (calDate > chkInDate && calDate < chkOutDate)
                        ? 'sel is-ing'
                        : ''
                ];

            },
            onSelect: function (date, inst) {
                const mon = inst.selectedMonth,
                    year = inst.selectedYear,
                    drawMonth = inst.drawMonth;

                let selectPrevChkIn = false;
                const dateSplit = date.split('.');
                if (chkInDate != '' && date < chkInDate) {
                    selectPrevChkIn = true;
                }
                if (resved || (chkInDate != '' && date < chkInDate)) {
                    resved = false;
                    clickCnt = 0;
                    chkInDate = '';
                    chkOutDate = '';
                    sdcJs
                        .calendarMgr
                        ._setChkInDate('');
                    sdcJs
                        .calendarMgr
                        ._setChkOutDate('');
                }

                clickCnt++;
                if (clickCnt > 1) {

                    chkOutDate = date;
                    sdcJs
                        .calendarMgr
                        ._setChkOutDate(date);
                    const ckinDay = dUtils.getDateToDay(chkInDate);
                    const ckoutDay = dUtils.getDateToDay(chkOutDate);
                    const nightCnt = dUtils.dateDiff(chkInDate, chkOutDate);
                    $("#startDate").val(chkInDate.replaceAll(".","-"));
                    $("#endDate").val(chkOutDate.replaceAll(".","-"));
                    $(".selected-date").html(
                        chkInDate + "<em>(" + ckinDay + ")</em><span> - </span>" +
                        chkOutDate + "<em>(" + ckoutDay.substring(0, 1) + ")</em>"
                    );

                    calendarEl.datepicker('option', 'maxDate', "+2M");// maxDate 초기화

                    const daysDiff = dUtils.dateDiff(chkInDate, chkOutDate);
                    // var startDate = new Date(); var endDate = new Date(startDate.getFullYear(),
                    // startDate.getMonth() + 12, 0);
                    if (daysDiff > 0) {
                        calendarEl.datepicker('setDate', chkOutDate);

                        calendarEl.datepicker(
                            'option',
                            'minDate',
                            new Date(calendarEl.datepicker('option', 'minDate'))
                        );
                        calendarEl.datepicker(
                            'option',
                            'maxDate',
                            //new Date(calendarEl.datepicker('option', 'maxDate'))
                            "+2M"
                        );

                    }
                } else {
                    chkInDate = date;
                    sdcJs
                        .calendarMgr
                        ._setChkInDate(date);

                    const _cid = new Date(dateSplit[0], dateSplit[1] - 1, dateSplit[2]);
                    if (isOneday) {
                        _cid.setDate(_cid.getDate() + 1);
                    } else {
                        _cid.setDate(_cid.getDate() + 30);
                    }
                    calendarEl.datepicker('setDate', chkInDate);
                    // calendarEl.datepicker('option' , 'minDate', 0);
                    calendarEl.datepicker(
                        'option',
                        'minDate',
                        calendarEl.datepicker('option', 'minDate')
                    );
                    if (_cid > endDate) {
                        calendarEl.datepicker(
                            'option',
                            'maxDate',
                            //calendarEl.datepicker('option', 'maxDate')
                            _cid
                        );
                    } else {
                        calendarEl.datepicker('option', 'maxDate', _cid);
                    }
                }
                if (drawMonth == new Date(dateSplit[0], dateSplit[1] - 1, dateSplit[2]).getMonth()) {
                    sdcJs.gotoDate(calendarEl, mon, year);
                } else {
                    sdcJs.gotoDate(calendarEl, mon - 1, year);
                }
                if (chkInDate != '' && chkOutDate != '') {
                    resved = true;
                }
            }
        };

        calendarEl.datepicker(option);
        /**
         * 선택제한 더미데이터
         */
        function setUnselectableDate(year, month) {
            //date push
            unSelectableDate = [];
            //test dummy
            let i = 20;
            while (i < 25) {
                unSelectableDate.push(year + '.' + lpad(month, 2, 0) + '.' + i);
                i++;
            }
        }
        if (calendarEl.hasClass('oneDay')) {
            setUnselectableDate(
                calendarEl.datepicker('getDate').getFullYear(),
                calendarEl.datepicker('getDate').getMonth() + 2
            );
            calendarEl.datepicker('refresh');
        }
        $(document).on(
            'mouseover',
            '.calendar tbody td:not(".ui-datepicker-unselectable")',
            function (e) {

                if (chkInDate != '') {
                    var chkInCalendarIdx = $('.is-start')
                        .closest('.cal-inner')
                        .index();

                    var calendarIdx = $(e.currentTarget)
                        .closest('.cal-inner')
                        .index();
                    var currentTr = $(e.currentTarget).closest('tr');
                    var currentTd = $(e.currentTarget);
                    var startTr = $('.is-start').closest('tr');
                    var startTd = $('.is-start');
                    var chkInRightCalendar = false;

                    if (chkOutDate != '') {
                        return;
                    }
                    if ((chkInCalendarIdx == calendarIdx && currentTd.index() <= startTd.index()) || (chkInCalendarIdx == calendarIdx && currentTr.index() < startTr.index())) {
                        calendarEl
                            .find('.cal-inner:eq(' + calendarIdx + ') tbody tr td')
                            .each(function (idx, itm) {
                                $(this).removeClass('sel is-ing is-ing-eng');
                            })
                        startTd.addClass('sel');
                    }
                } else {
                    return;
                }

                if (chkOutDate != '') {
                    return;
                }
                if (chkInCalendarIdx == 1) {
                    chkInRightCalendar = true;
                } else if (currentTr.closest('.calRight').length && chkInCalendarIdx == 0) {
                    calendarEl
                    .find('.calLeft tbody tr')
                    .each(function (idx, itm) {
                        if (idx == startTr.index()) {
                            setTdState(startTr, startTd.index(), 6);
                        } else if (idx > startTr.index()) {
                            setTdState($(itm), 0, 6);
                        }
                    })

                    chkInRightCalendar = true;
                    startTr = $('.calRight tbody tr:eq(0)');
                    startTd = startTr
                        .find('td[data-handler="selectDay"]')
                        .eq(0);

                } else if (currentTr.closest('.calLeft').length && chkInCalendarIdx == 0) {
                    calendarEl
                        .find('.calRight tbody tr td')
                        .removeClass('is-ing is-ing-eng sel');
                } else {
                    return;
                }

                if (chkInRightCalendar) {

                    calendarEl
                    .find('.calRight .calendar tbody tr')
                    .each(function () {
                        const _this = $(this);

                        if (_this.index() < startTr.index() || _this.index() > currentTr.index() || calendarIdx == 0) {
                            return;
                        }

                        if (_this.index() == startTr.index() && _this.index() == currentTr.index()) {
                            //start1
                            if (currentTd.index() < startTd.index() || currentTr.index() < startTr.index()) {
                                tdIdx = -1;
                            } else {
                                tdIdx = currentTd.index()
                            };
                            setTdState(startTr, startTd.index(), tdIdx, true);
                            return;
                        } else if (_this.index() == startTr.index() && _this.index() != currentTr.index()) {
                            //start2
                            setTdState(startTr, startTd.index(), startTr.find('td').length - 1);
                            return;
                        }

                        if (_this.index() >= startTr.index() && _this.index() < currentTr.index()) {
                            //ing
                            setTdState(
                                calendarEl.find('.calendar').eq(calendarIdx).find('tbody tr').eq(_this.index()),
                                0,
                                6
                            );
                            return;
                        }

                        if (_this.index() > startTr.index() && _this.index() == currentTr.index()) {
                            //end
                            setTdState(
                                calendarEl.find('.calendar').eq(calendarIdx).find('tbody tr').eq(_this.index()),
                                0,
                                currentTd.index(),
                                true
                            );
                            return;
                        }

                    })
                } else {
                    calendarEl
                    .find('.calLeft .calendar tbody tr')
                    .each(function () {
                        const _this = $(this);

                        if (_this.index() < startTr.index() || _this.index() > currentTr.index()) {
                            return;
                        }

                        if (_this.index() == startTr.index() && _this.index() == currentTr.index()) {
                            if (currentTd.index() < startTd.index() || currentTr.index() < startTr.index()) {
                                tdIdx = -1;
                            } else {
                                tdIdx = currentTd.index()
                            };
                            setTdState(startTr, startTd.index(), tdIdx, true);
                            return;
                        } else if (_this.index() == startTr.index() && _this.index() != currentTr.index()) {
                            setTdState(startTr, startTd.index(), startTr.find('td').length - 1);
                            return;
                        }

                        if (_this.index() >= startTr.index() && _this.index() < currentTr.index()) {
                            setTdState(
                                calendarEl.find('.calendar').eq(calendarIdx).find('tbody tr').eq(_this.index()),
                                0,
                                _this.find('td').length - 1
                            );
                            return;
                        }

                        if (_this.index() > startTr.index() && _this.index() == currentTr.index()) {
                            setTdState(
                                calendarEl.find('.calendar').eq(calendarIdx).find('tbody tr').eq(_this.index()),
                                0,
                                currentTd.index(),
                                true
                            );

                            return;
                        }

                    })
                }
            }
        )
        function setTdState(trEl, start, end, _round) {
            const round = _round || false;
            trEl
                .find('td')
                .filter(function () {
                    const idx = $(this).index();
                    if (end == -1) {
                        $(this).removeClass('is-ing-eng');
                        return;
                    }
                    if (idx >= start && idx < end) {
                        $(this).removeClass('is-ing-eng');
                        $(this).addClass('sel is-ing');
                    } else {
                        $(this).removeClass('sel is-ing is-ing-eng');
                    }
                    if (idx == end) {
                        $(this).addClass('sel is-ing is-ing-eng');
                    }
                    if (idx == 6 && !round) {
                        $(this).removeClass('is-ing-eng');
                    }
                })
            trEl
                .nextAll('tr')
                .find('td')
                .removeClass('sel is-ing is-ing-eng');
        }

        $('.calWrap').css('width', '');
    }
}
sdcJs.gotoDate = function ($j, month, year) {
    $j.each(function (i, el) {
        const inst = $
            .datepicker
            ._getInst(el);
        inst.drawMonth = inst.selectedMonth = month;
        inst.drawYear = inst.selectedYear = year;
        $
            .datepicker
            ._notifyChange(inst);
        $
            .datepicker
            ._adjustDate(el);
    });
}

/**
 * 달력 날짜 세팅
 *
 * @param calendarEl (요소)
 * @param minDate (시작일)
 * @param maxDate (종료일)
 *
 */
sdcJs.setCalendarChkInOutDate = function (calendarEl, minDate, maxDate) {
    calendarEl.datepicker('option', 'minDate', minDate);
    calendarEl.datepicker('option', 'maxDate', maxDate);
    calendarEl.datepicker('option', 'tDay', minDate);
    calendarEl.datepicker('setDate', minDate);
}


/**
 * 좌측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 */
function lpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen
        ? str.substring(0, padLen)
        : str;
    return str;
}
const dUtils = {
    sep: '.', //구분자
    format: 'yy.mm.dd', //포맷

    /**
     * 현재 조회년월 가져오기 (YYYYMM)
     * @returns {number}
     */
    getToYearMonth: function () {
        const varDate = new Date();

        const varYear = varDate.getFullYear();
        let varMonth = varDate.getMonth() + 1;

        if (varMonth < 10) {
            varMonth = '0' + varMonth;
        }

        return varYear + '' + varMonth;
    },

    /**
     * yyyy-mm-dd 형식 변환
     * @param date (Date)
     * @return {string}
     */
    getToDate: function (date) {
        const varDate = date
            ? date
            : new Date();

        const varYear = varDate.getFullYear();
        const varMonth = (varDate.getMonth() + 1) < 10
            ? '0' + (
            varDate.getMonth() + 1
        )
            : (varDate.getMonth() + 1);
        const varDay = varDate.getDate() < 10
            ? '0' + varDate.getDate()
            : varDate.getDate();
        const varFullDate = varYear + this.sep + varMonth + this.sep + varDay;

        return varFullDate;
    },

    /**
     * 날짜사이 간격 (1, 2, 3일)
     * @param startDate
     * @param endDate
     * @returns {number}
     */
    dateDiff: function (startDate, endDate) {
        const d1 = dUtils.parseDate(startDate);
        const d2 = dUtils.parseDate(endDate);
        const count = d2 - d1;
        return Math.floor(count / (24 * 3600 * 1000));
    },

    /**
     * 날 더하기
     * @param strDate (string)
     * @param days (number)
     * @returns {string}
     */
    addDays: function (strDate, days) {
        const tempDate = new Date(strDate);
        return tempDate.setDate(tempDate.getDate() + days);
        //return this.getToDate(tempDate);
    },

    /**
     * Date 변환
     * @param format
     * @param date
     * @returns {Date}
     */
    parseDate: function (date, format) {
        let newDate = new Date();
        if (/*'yy-mm-dd' === format && */
            date !== '') {
            const parts = date.split(this.sep);
            newDate = new Date(parts[0], parts[1] - 1, parts[2]);
        }
        return newDate;
    },

    /**
     * 요일 구하기
     * @param date
     * @returns (string)
     */
    getDateToDay: function (dateStr) {
        const date = new Date(dateStr.replace(/\./gi, "-"));
        const week = [ 'S', 'M', 'T', 'W', 'T', 'F', 'T']

        const dayOfWeek = week[date.getDay()];
        return dayOfWeek;
    },

    /**
     * 소숫점 지정자리 반올림 (값, 자릿수)
     */
    Round: function (n, pos) {
        const digits = Math.pow(10, pos);
        let sign = 1;
        if (n < 0) {
            sign = -1;
        }
        n = n * sign;
        let num = Math.round(n * digits) / digits;
        num = num * sign;
        return num.toFixed(pos);
    }
};

/**
 * 펫시터 검색 옵션
 * petSitterList.do
 *
 * @param container(String)
 */
sdcJs.setSearchOption = function (container) {
    const searchOption = $(container);
    if (!searchOption.length) {
        return;
    }
    let previousIdx = 0;

    searchOption
        //.find('.selectGroup .selectWrap')
        .find('.select-wrap')
        .on('change', function (e) {
            const opIdx = searchOption
                .find('.select-wrap select option')
                .index(searchOption.find('.select-wrap select option:selected'));
            $('.search-option__container div[role="area"]')
                .eq(opIdx)
                .show();
            $('.search-option__container div[role="area"]')
                .not(":eq(" + opIdx + ")")
                .hide();

            searchOption
                .find(
                    '.search-option__container div[role="area"]:eq(' + previousIdx + ') .clear-cont .btn-close'
                )
                .trigger('click.setSearchOption');

            searchOption
                .find(
                    '.search-option__container div[role="area"]:eq(' + opIdx + ') .clear-cont:eq(0)'
                )
                .removeAttr('style')
                .addClass('opened')
                .show();
            previousIdx = opIdx;
        })

    //open
    const openSearchOption = function (e) {

        // $(this)
        //     .closest(container)
        //     .find('.clear-cont')
        //     .hide();

        const con = $(this).siblings('.clear-cont');
        const h = con.outerHeight();

        $(this).removeClass("is-inactive").addClass("is-active").closest(container);
        // .css({'margin-top': 210, 'z-index': 999999})

        con.addClass('opened');
        con.show()
    }

    $(document).on(
        'click',
        container + ' .js-option-date.is-inactive',
        openSearchOption
    );

    //close
    $(document).on(
        'click.setSearchOption',
        container + ' .js-option-date.is-active',
        function (e) {
            $(this).closeSearchOption(e);
        }
    )

    $.fn.closeSearchOption = function (e) {

        $(this)
            .removeClass("is-active")
            .addClass("is-inactive")
        $(this)
            .next()
            .removeClass('opened');
        /*$(this)
            .closest(container)
            .css({'margin-top': '', 'z-index': ''});*/
        $(this)
            .next()
            .hide();
    }

    $('html').on('click', function (e) {
        if ($(e.target).hasClass('btn-month')) {
            return;
        }

        if (!$(e.target).closest('.js-option-date').length) {

            searchOption
            .find('.js-option-date.is-active')
            .each(function () {
                $(this).trigger('click.setSearchOption');
            });

        }
    });


}

/**
 * 검색 주소 데이터출력
 */
let saveAddr = "";
$(".input-keyword").on("keyup", delay(function(){
    const dong = $(this).val();
    if(dong.length > 1) {
        $.ajax({
            url:'https://dapi.kakao.com/v2/local/search/address.json?query=' + dong,
            type:'GET',
            headers: {'Authorization' : 'KakaoAK 9438a9cb718e9c47deea17d5deb352a2'},
            success:function(data){
                const documents = data.documents;
                const meta = data.meta;
                const listGroup = $(".addr-wrap .list-group");
                const dropdown = listGroup.find(".dropdown-menu");

                dropdown.empty();
                listGroup.addClass("is-active");
                if(saveAddr != dong.trim()) {
                    $("[name=lng]").val("");
                    $("[name=lat]").val("");
                }
                let emptyHtml = "";
                if(meta.total_count > 0) {
                    for(let i=0; i<documents.length; i++) {
                        // 행정명 주소
                        if(documents[i].address != null) {
                            const addressName = documents[i].address;
                            if(addressName.region_3depth_name == "" && addressName.region_3depth_h_name == ""){
                                continue;
                            }
                        }
                        // 도로명 주소
                        if(documents[i].road_address != null) {
                            const roadAddress = documents[i].road_address;
                            if(roadAddress.road_name == ""){
                                continue;
                            }
                        }
                        let liHtml = "<li><a class='dropdown-item' href='javascript:void(0)' data-addr-lng='" + documents[i].x + "' data-addr-lat='" + documents[i].y + "' onclick='selectAddr(this)'><i class='bi bi-geo-alt me-2'></i>" + documents[i].address_name + "</a></li>";
                        dropdown.append(liHtml);
                    }
                    if(listGroup.find(">ul>li").length<1) {
                        emptyHtml = "<li><span class='dropdown-item-text'>검색 결과가 없습니다.</span></li>";
                        dropdown.append(emptyHtml);
                    }
                } else {

                    emptyHtml = "<li><span class='dropdown-item-text'>검색 결과가 없습니다.</span></li>";
                    dropdown.append(emptyHtml);
                }
                $("#main").click(function(e) {
                    if(listGroup.has(e.target).length === 0){
                        dropdown.empty();
                        listGroup.removeClass("is-active");
                    }
                    $(this).off("click");
                });
            },
            error : function(e){

            }
        });
    }
}, 500));

function selectAddr(obj) {
    const selectedAddr = $(obj).text();
    const inputAddr = $(".addr-wrap .input-keyword");
    const dropdown = $(obj).closest(".dropdown-menu");
    const listGroup = $(obj).closest(".list-group");
    const lng = $(obj).attr("data-addr-lng");
    const lat = $(obj).attr("data-addr-lat");
    inputAddr.val(selectedAddr);
    saveAddr = selectedAddr;
    $("[name=lng]").val(lng);
    $("[name=lat]").val(lat);
    dropdown.empty();
    listGroup.removeClass("is-active");

}


function delay(callback, ms) {
    var timer = 0;
    return function() {
        var context = this, args = arguments;
        clearTimeout(timer);
        timer = setTimeout(function () {
            callback.apply(context, args);
        }, ms || 0);
    };
}
