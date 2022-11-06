var mainJs = {};
this.mainJs = mainJs;
var ANIMATION_EASING = 'easeOutExpo';
var ACTIVE_CLASS = "active";
var headerFixH = 100;


$(document).ready(function () {

  mainJs.setParallaxFloating();
  mainJs.initResvCalendar($(".calendar-container"), 30);

    // slick 슬라이드 main visual
    $('.slick-container.m-visual > .slick-wrapper').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        dots:false,
        arrows:true,
        infinite: true,
        autoplay: true,
        loop:true
    });

})


$(window).on('load', function () {

  mainJs.setSearchOption('.js-search-option');
  mainJs.setCarousel($(".main-carousel"));
  mainJs.setQuantity();

})

/***********************************************************************************************************
 * document.Ready 시 호출
 **********************************************************************************************************/


//메인 예약캘린더 날짜관련 매니징함수
mainJs.calendarMgr = {
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
    mainJs.setCalendarChkInOutDate(calendarEl, startDate, endDate);
    this.chkInDate = '';
    this.chkOutDate = '';

    mainJs.gotoDate(calendarEl, startDate.getMonth(), startDate.getFullYear());
    calendarEl.datepicker('refresh');
    calendarEl.trigger('refresh');

  }
}

/**
 * COMA1000M.html
 * 예약 캘린더
 * https://api.jqueryui.com/datepicker/
 *
 * @param calendarEl (Element)
 */
mainJs.initResvCalendar = function (calendarEl) {
  if (!calendarEl.length) {
    return;
  }
  var option = {};
  calendarEl.empty();

  if (calendarEl.hasClass('cal-single')) {
    var selectedDate = '';
    var promotionDate = [];

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
        "SUN",
        "MON",
        "TUE",
        "WED",
        "THU",
        "FRI",
        "SAT"
      ],
      // minDate: 0,
      minDate: new Date(2020, 7, 25),
      dateFormat: 'yy.mm.dd',
      onChangeMonthYear: function (year, month, inst) {
        setPromotionDate(year, month);
      },
      beforeShowDay: function (date) {
        var calDate = dUtils.getToDate(date);
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
      var i = 20;
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
    var chkInDate = mainJs
      .calendarMgr
      ._getChkInDate();
    var chkOutDate = mainJs
      .calendarMgr
      ._getChkOutDate();
    var clickCnt = 0;
    var resved = false;
    var isOneday = calendarEl.hasClass('oneDay');
    var unSelectableDate = [];

    var startDate = new Date();

    var endDate = new Date(startDate.getFullYear(), startDate.getMonth() + 12, 0);

    calendarEl.on('refresh', function () {
      clickCnt = 0;
      resved = false;
    })
    //checkInOut calendar
    option = {
      defaultDate: startDate,
      tDay: startDate, // .ui-datepicker-today 적용 날짜
      chkInTitle: '체크인',
      chkOutTitle: '체크아웃',
      numberOfMonths: 2,
      //showMonthAfterYear: true,
      showMonthAfterYear: false,
      monthNames: [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
      ],
      /*dayNamesMin: (calendarEl.hasClass('calendarS'))
          ? ["S", "M", "T", "W", "T", "F","S" ]
          : [ "SUN", "MON", "TUE", "WED", "THU", "FRI","SAT"],*/
      dayNamesMin: [ "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT" ] ,
      // minDate: 0, maxDate : '+11m',
      minDate: startDate,
      maxDate: endDate,
      dateFormat: 'yy.mm.dd',
      onChangeMonthYear: function (year, month, inst) {
        //날짜선택 및 달력 월 이동시 호출 setUnselectableDate(year, month);
      },
      beforeShowDay: function (date) {

        var calDate = dUtils.getToDate(date);
        chkInDate = mainJs
          .calendarMgr
          ._getChkInDate();
        chkOutDate = mainJs
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

        var mon = inst.selectedMonth,
          year = inst.selectedYear,
          drawMonth = inst.drawMonth;

        var selectPrevChkIn = false;
        var dateSplit = date.split('.');

        if (chkInDate != '' && date < chkInDate) {
          selectPrevChkIn = true;
        }
        if (resved || (chkInDate != '' && date < chkInDate)) {
          resved = false;
          clickCnt = 0;
          chkInDate = '';
          chkOutDate = '';
          mainJs
            .calendarMgr
            ._setChkInDate('');
          mainJs
            .calendarMgr
            ._setChkOutDate('');
        }

        clickCnt++;
        if (clickCnt > 1) {

          chkOutDate = date;
          mainJs
            .calendarMgr
            ._setChkOutDate(date);
          var ckinDay = dUtils.getDateToDay(chkInDate);
          var ckoutDay = dUtils.getDateToDay(chkOutDate);
          var nightCnt = dUtils.dateDiff(chkInDate, chkOutDate);
          // $("#dateArea").html(
          //     chkInDate + " " + ckinDay + " - " + chkOutDate + " " + ckoutDay + "<span>" +
          //     nightCnt + "박</span>"
          // );
          $("#chkInDate").val(chkInDate.replaceAll(".","-"));
          $("#chkOutDate").val(chkOutDate.replaceAll(".","-"));
          $(".selected-date").html(
            chkInDate + "<em>(" + ckinDay + ")</em><span> - </span>" +
            chkOutDate + "<em>(" + ckoutDay.substring(0, 1) + ")</em>"
          );

          calendarEl.datepicker('option', 'maxDate', endDate);// maxDate 초기화

          var daysDiff = dUtils.dateDiff(chkInDate, chkOutDate);
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
              new Date(calendarEl.datepicker('option', 'maxDate'))
            );
            //객실 및 인원선택 아코디언 open
            if (calendarEl.closest('.checkDate').length) {
              calendarEl
                .closest('li')
                .next('li')
                .find('.btnToggle')
                .trigger('click_checkDate');
            }

          }
        } else {
          chkInDate = date;
          mainJs
            .calendarMgr
            ._setChkInDate(date);

          var _cid = new Date(dateSplit[0], dateSplit[1] - 1, dateSplit[2]);
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
              calendarEl.datepicker('option', 'maxDate')
            );
          } else {
            calendarEl.datepicker('option', 'maxDate', _cid);
          }
        }
        if (drawMonth == new Date(dateSplit[0], dateSplit[1] - 1, dateSplit[2]).getMonth()) {
          mainJs.gotoDate(calendarEl, mon, year);
        } else {
          mainJs.gotoDate(calendarEl, mon - 1, year);
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
      var i = 20;
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
              var _this = $(this);

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
              var _this = $(this);

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
      var round = _round || false;
      trEl
        .find('td')
        .filter(function () {
          var idx = $(this).index();
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
mainJs.gotoDate = function ($j, month, year) {
  $j.each(function (i, el) {
    var inst = $
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
mainJs.setCalendarChkInOutDate = function (calendarEl, minDate, maxDate) {
  calendarEl.datepicker('option', 'minDate', minDate);
  calendarEl.datepicker('option', 'maxDate', maxDate);
  calendarEl.datepicker('option', 'tDay', minDate);
  calendarEl.datepicker('setDate', minDate);
}

/**
 * HURE1000M.html
 * 프로모션코드 입력 영역 show/hide
 *
 * @param shNode (String)
 * @param openBtn (String)
 * @param closeBtn (String)
 */
mainJs.initShowHideForm = function (shNode, openBtn, closeBtn) {
  $(document).on('click', openBtn, function () {
    $(this)
      .siblings(shNode)
      .show();
  })
  $(document).on('click', closeBtn, function () {
    $(this)
      .closest(shNode)
      .hide();
  })
}


/*********************************************************************************************************
 *  window.onLoad 시 호출
 *********************************************************************************************************/


/**
 * 메인 검색 옵션
 * COMA1000M.html
 *
 * @param container(String)
 */
mainJs.setSearchOption = function (container) {
  var searchOption = $(container);
  if (!searchOption.length) {
    return;
  }
  var previousIdx = 0;

  searchOption
    //.find('.selectGroup .selectWrap')
    .find('.select-wrap')
    .on('change', function (e) {
      var opIdx = searchOption
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
  var openSearchOption = function (e) {

    if ($(this).find('.clear-cont').is(':animated')) {
      return;
    }

    $(this)
      .closest(container)
      .next('.dimmed')
      .show();
    $(this)
      .closest(container)
      .find('.clear-cont')
      .hide();

    var con = $(this).siblings('.clear-cont');
    var h = con.outerHeight();

    $(this)
      .closest(container)
    // .css({'margin-top': 210, 'z-index': 999999})

    con.addClass('opened');
    con
      .show()
      .css({'overflow': 'hidden', 'height': 0})
      .stop()
      .animate({
        height: h
      }, 800, ANIMATION_EASING, function () {
        con.css({'overflow': '', 'height': ''})
      })
  }

  $(document).on(
    'click',
    container + ' .js-option-type',
    openSearchOption
  );
  $(document).on(
    'click',
    container + ' .js-option-date',
    openSearchOption
  );
  $(document).on(
    'click',
    container + ' .js-option-quantity',
    openSearchOption
  );
  $(document).on(
    'click',
    container + ' .js-option-dine',
    openSearchOption
  );

  //close
  $(document).on(
    'click.setSearchOption',
    container + ' .clear-cont .btn-close',//,.btnSC',
    function (e) {
      $(this).closeSearchOption(e);
    }
  )

  $.fn.closeSearchOption = function (e) {

    if ($(this).closest(container).find('.main-calendar, .main-quantity').is(':animated')) {
      return;
    }
    if ($(this).hasClass('btnPromo')) {
      return;
    }

    $(this)
      .closest('.clear-cont')
      .removeClass('opened');
    $(this)
      .closest(container)
      .css({'margin-top': '', 'z-index': ''});
    $(this)
      .closest('.clear-cont')
      .css({'overflow': 'hidden'})
      .stop()
      .animate({
        'height': 0,
        'padding-top': 0,
        'padding-bottom': 0
      }, 400, ANIMATION_EASING, function () {
        $(this)
          .closest('.clear-cont')
          .css({'height': '', 'padding-top': '', 'padding-bottom': ''})
          .hide();
      })
  }

  $('html').on('click', function (e) {
    if ($(e.target).hasClass('btn-month')) {
      return;
    }
    if (!$(e.target).closest('.js-search-option').length) {

      searchOption
        .find('.clear-cont.opened .btn-close:visible')
        .each(function () {
          $(this).trigger('click.setSearchOption');
        })
    }
  });

  setSearchOptionList("#diningOptionList", "#selectedDiningOption")
}

/**
 * main carousel
 * COMA1000M.html
 *
 * @param element (Element)
 */
mainJs.setCarousel = function(element) {

  var speed = 400;

  element.each(function(index, item) {

    var item = $(item);
    var carouselOption = {};

    if(item.hasClass("js-center")) {

      carouselOption = {
        centerMode: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        centerPadding: '25px',
        speed: speed
      }


    } else if (item.hasClass("js-syncing")) {

      carouselOption = {
        asNavFor: '.js-slider-for',
        speed: speed
      }
      var sliderFor = item.prev();

      sliderFor.slick({
        fade:true,
        draggable: false,
        speed: speed

      })

    } else{

      carouselOption = {
        speed: speed
      }

    }

    item.slick(carouselOption)

  })

}



mainJs.setParallaxFloating = function() {

  var supportsPassive = false;
  try {
    var opts = Object.defineProperty({}, 'passive', {
      get: function () {
        supportsPassive = true;
      }
    });
    window.addEventListener('testPassive', null, opts);
    window.removeEventListener('testPassive', null, opts);
  } catch (e) {}

  var parallax = document.querySelectorAll('[data-parallax]');

  window.addEventListener('scroll', function () {

    for (var i = 0; i < parallax.length; i++) {
      var parallaxTarget = document.querySelectorAll('[data-parallax-target="' + parallax[i].getAttribute('data-parallax') + '"]');

      var viewportOffset = parallax[i].getBoundingClientRect();
      var visibilityIndex = viewportOffset.top / window.innerHeight * 100;

      for(var j = 0; j < parallaxTarget.length; j++ ) {

        if (visibilityIndex >= -100 && visibilityIndex <= 100) {

          //var parallaxOffset = parseInt(getComputedStyle(parallaxTarget[j]).bottom);
          parallaxOffset = parseInt(parallaxTarget[j].getAttribute("data-parallax-offset"));
          parallaxTarget[j].style.transform = 'translate3d(0, ' + Math.floor(parallaxOffset - (visibilityIndex / 100 * parallaxOffset)) + 'px, 0)';

        }
      }

    }
  }, window.supportsPassive ? {
    passive: true
  } : false);

}

/******************************************************************************************
 * 정식오픈 스크립트
 *******************************************************************************************/


var throttleAndDebounce = function () {
  var throttleCheck,
    debounceCheck;
  return {
    throttle: function (callback, milliseconds) {
      return function () {
        if (!throttleCheck) {
          throttleCheck = setTimeout(function () {
            callback();
            throttleCheck = false;
          }, milliseconds);
        }
      }
    },
    debounce: function (callback, milliseconds) {
      return function () {
        clearTimeout(debounceCheck);
        debounceCheck = setTimeout(function () {
          callback();
        }, milliseconds);
      }
    }
  }
}


mainJs.setCookie = function (name, value) {
  var date = new Date();
  date.setHours(24, 0, 0, 0);
  document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';pat' +
    'h=/';
};

mainJs.deleteCookie = function (name) {
  mainJs.setCookie(name, '', -1);
}

mainJs.getCookie = function (name) {
  var value = document
    .cookie
    .match('(^|;) ?' + name + '=([^;]*)(;|$)');
  return value
    ? value[2]
    : null;
};


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

var dUtils = {
  sep: '.', //구분자
  format: 'yy.mm.dd', //포맷

  /**
   * 현재 조회년월 가져오기 (YYYYMM)
   * @returns {number}
   */
  getToYearMonth: function () {
    var varDate = new Date();

    var varYear = varDate.getFullYear();
    var varMonth = varDate.getMonth() + 1;

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
    var varDate = date
      ? date
      : new Date();

    var varYear = varDate.getFullYear();
    var varMonth = (varDate.getMonth() + 1) < 10
      ? '0' + (
      varDate.getMonth() + 1
    )
      : (varDate.getMonth() + 1);
    var varDay = varDate.getDate() < 10
      ? '0' + varDate.getDate()
      : varDate.getDate();
    var varFullDate = varYear + this.sep + varMonth + this.sep + varDay;

    return varFullDate;
  },

  /**
   * 날짜사이 간격 (1, 2, 3일)
   * @param startDate
   * @param endDate
   * @returns {number}
   */
  dateDiff: function (startDate, endDate) {
    var d1 = dUtils.parseDate(startDate);
    var d2 = dUtils.parseDate(endDate);
    var count = d2 - d1;
    return Math.floor(count / (24 * 3600 * 1000));
  },

  /**
   * 날 더하기
   * @param strDate (string)
   * @param days (number)
   * @returns {string}
   */
  addDays: function (strDate, days) {
    var tempDate = new Date(strDate);
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
    var newDate = new Date();
    if (/*'yy-mm-dd' === format && */
      date !== '') {
      var parts = date.split(this.sep);
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
    var date = new Date(dateStr.replace(/\./gi, "-"));
    // var week = [
    //     '일',
    //     '월',
    //     '화',
    //     '수',
    //     '목',
    //     '금',
    //     '토'
    // ];
    var week = [ 'S', 'M', 'T', 'W', 'T', 'F', 'T']

    var dayOfWeek = week[date.getDay()];
    return dayOfWeek;
  },

  /**
   * 소숫점 지정자리 반올림 (값, 자릿수)
   */
  Round: function (n, pos) {
    var digits = Math.pow(10, pos);
    var sign = 1;
    if (n < 0) {
      sign = -1;
    }
    n = n * sign;
    var num = Math.round(n * digits) / digits;
    num = num * sign;
    return num.toFixed(pos);
  }
};

function Jessture(target) {
  var startX = 0;
  var startY = 0;
  var _this = $(this);
  var UP = this.UP = 'jsUp';
  var DOWN = this.DOWN = 'jsDown';
  var RIGHT = this.RIGHT = 'jsRight';
  var LEFT = this.LEFT = 'jsLeft';
  var MOUSEDOWN = this.MOUSEDOWN = 'jsMouseDown'

  target.on('touchstart , mousedown', function (e) {
    if (e.type == 'mousedown') {
      // input 필드 체크
      if ($(e.target).filter('input').length == 0) {
        e.preventDefault();
      }
      startX = e.pageX;
      startY = e.pageY;
    } else {
      startX = e
        .originalEvent
        .touches[0]
        .pageX;
      startY = e
        .originalEvent
        .touches[0]
        .pageY;
    }
  });

  target.on('touchmove , mousemove', function (e) {
    var endX = 0;
    var endY = 0;
    e.preventDefault();
    if (e.type != 'mousemove') {}
  });
  target.on('touchend , mouseup', function (e) {
    var endX = 0;
    var endY = 0;
    if (e.type == 'mouseup') {
      endX = Number(e.pageX);
      endY = Number(e.pageY);
      e.preventDefault();
    } else {
      endX = Number(e.originalEvent.changedTouches[0].pageX);
      endY = Number(e.originalEvent.changedTouches[0].pageY);
    }
    var disX = Math.abs((startX * startX) - (endX * endX));
    var disY = Math.abs((startY * startY) - (endY * endY));

    if (disX > disY) {
      if (Math.abs(startX - endX) > 70) {
        if (startX < endX) {
          _this.trigger(RIGHT);
        } else {
          _this.trigger(LEFT);
        }
      }
    } else {
      if (disY > 70) {
        if (startY < endY) {
          _this.trigger(DOWN);
        } else {
          _this.trigger(UP);
        }
      }
    }
    startX = 0;
    startY = 0;
  });

  target.on('mousedown', function (e) {
    e.preventDefault();
  })

  this.on = function (evt, func) {
    _this.on(evt, func);
  };
};


/**
 * Quantity
 *
 */
mainJs.setQuantity = function(e) {

  var $quantityWrap = $(".js-quantity-wrap");
  var btnMinus = ".js-quantity-minus";
  var btnPlus = ".js-quantity-plus";
  var maxOfPeople = 4;

  mainJs.addQuantityOption();
  mainJs.removeQuantityOption();
  $quantityWrap.on("click", btnPlus, upQuantity)
  $quantityWrap.on("click", btnMinus, downQuantity)


  function upQuantity(e) {
    var $quantityContainer =  $(this).closest(".quantity-container");

    var numOfAdults = mainJs.getQuantity($quantityContainer.find("[class*='js-adult-quantity']"));
    var numOfChildren = mainJs.getQuantity($quantityContainer.find("[class*='js-children-quantity']"));

    if((numOfAdults + numOfChildren) >= maxOfPeople){
      $("#peopleInfoPopup").addClass("show");
    }else {
      var counting = $(this).prev();
      var currentVal = counting.text();

      currentVal++;

      counting.text(currentVal)
      printSearchOptionQuantity();
    }

  }

  function downQuantity(e) {

    var counting = $(this).next();
    var currentVal = counting.text();

    currentVal--;
    if(currentVal < 0) currentVal = 0;
    counting.text(currentVal)
    printSearchOptionQuantity();
  }

}

/**
 * Get Quantity
 * @param {String} element
 * @returns Number
 */
mainJs.getQuantity = function(el) {

  var quantity;
  var quantityEl = $(el);
  var quantityNum = Number(quantityEl.text()) || Number(quantityEl.val());

  quantity = quantityNum;

  return quantity;
}

function printSearchOptionQuantity() {

  var optionQuantity = $(".js-option-quantity"),
    adultCount = optionQuantity.find(".js-count--adult"),
    childrenCount = optionQuantity.find(".js-count--children"),
    roomsCount = optionQuantity.find(".js-count--room");

  var totalNumOfAdults = 0;
  var totalNumOfChildren = 0;

  var container = $(".js-quantity-wrap .quantity-container");
  var totalNumOfRoom = 0;

  if(container.length >= 1) {
    totalNumOfRoom = container.length;
    for(var i = 0; i < container.length; i++) {
      var numOfAdults = mainJs.getQuantity(".js-adult-quantity" + (i + 1) );
      var numOfChildren = mainJs.getQuantity(".js-children-quantity" + (i + 1) );

      if((numOfAdults + numOfChildren) > 0){
        totalNumOfAdults += numOfAdults;
        totalNumOfChildren += numOfChildren;

        $(container[i]).find("input[type='hidden'][id*='NumAdults']").val(numOfAdults);
        $(container[i]).find("input[type='hidden'][id*='NumChildren']").val(numOfChildren);
      }else {
        totalNumOfRoom--;
      }
    }

  }

  adultCount.text(totalNumOfAdults);
  childrenCount.text(totalNumOfChildren);
  roomsCount.text(totalNumOfRoom);

}

/**
 * DINE 검색옵션 셋팅
 * @param {String} container
 * @param {String} display
 */
function setSearchOptionList(container, display) {

  var list = $(container);
  var frame = $(display);

  var item = list.find("li");

  item.click(function() {

    var selectedVal = $(this).attr("data-option-value")
    frame.text(selectedVal)

  })
}

/**
 * 메인 검색 옵션 객실 추가
 */
mainJs.addQuantityOption = function() {
  var defaultAdults = 2;
  var defaultChildren = 0;
  var optionWrap = $(".js-quantity-wrap");
  var addBtn = optionWrap.find(".btn-add");

  optionWrap.on("click", ".btn-add", function() {

    var html = '';
    var optionContainer = $(".js-quantity-wrap .quantity-container");
    var optionNum = optionContainer.length;
    optionNum += 1

    html += '<div class="quantity-container">';
    html += '  <input type="hidden" id="room' + optionNum+ 'NumAdults" value="'+defaultAdults+'">';
    html += '  <input type="hidden" id="room' + optionNum+ 'NumChildren" value="'+defaultChildren+'">';
    html += '  <div class="quantity-title">';
    html += '    <h6 class="quantity-label">Rooms</h6>';
    html += '    <h3 class="quantity-title__name">Room ' + optionNum + '</h3>';
    html += '  </div>';
    html += '  <div class="quantity-section">';
    html += '    <div class="quantity-group">';
    html += '      <h6 class="quantity-label">Adult</h6>';
    html += '      <div class="quantity js-quantity">';
    html += '        <button type="button" class="btn-minus js-quantity-minus">-</button>';
    html += '        <span class="quantity-count js-adult-quantity' + optionNum + '">'+defaultAdults+'</span>';
    html += '        <button type="button" class="btn-plus js-quantity-plus">+</button>';
    html += '      </div>';
    html += '    </div>';
    html += '    <div class="quantity-group">';
    html += '      <h6 class="quantity-label">Children</h6>';
    html += '      <div class="quantity js-quantity">';
    html += '        <button type="button" class="btn-minus js-quantity-minus" onclick="">-</button>';
    html += '        <span class="quantity-count js-children-quantity' + optionNum + '">'+defaultChildren+'</span>';
    html += '        <button type="button" class="btn-plus js-quantity-plus" onclick="">+</button>';
    html += '      </div>';
    html += '    </div>';
    html += '  </div>';
    html += '</div>';

    if(optionNum > 2) {

      $(this).attr("class", "btn-remove")
      $(this).find("span").text("Sub Room")

    }

    $(html).insertAfter(optionContainer.last());
    printSearchOptionQuantity();
  })
}

/**
 * 메인 검색 옵션 객실 삭제
 */
mainJs.removeQuantityOption = function() {

  var optionWrap = $(".js-quantity-wrap");
  var removeBtn = optionWrap.find(".btn-remove");

  optionWrap.on("click", ".btn-remove", function(e) {

    var optionContainer = optionWrap.find(".quantity-container");
    var optionNum = optionContainer.length;
    var optionLastChild = optionContainer.last();

    optionLastChild.remove();

    optionNum -= 1;

    if(optionNum < 2) {

      $(this).attr("class", "btn-add")
      $(this).find("span").text("Add Room")
    }

    printSearchOptionQuantity();
  })

}