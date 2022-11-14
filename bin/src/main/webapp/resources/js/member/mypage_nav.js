/* 리모컨 메뉴가 푸터에서 멈추는 함수 */
$(function stopAtFooter() {
    const win = $(window);
    const footerH = $('#footer').outerHeight();
    const mypageNav = $('#mypage-nav');
    win.on('scroll', function () {
        const sT = win.scrollTop();
        let val = $(document).height() - win.height() - footerH;
        if (sT >= val){
            mypageNav.addClass('on');
        }else{
            mypageNav.removeClass('on');
        }
    });
});