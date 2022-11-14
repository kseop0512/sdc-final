/*문의제목 눌렀을때 모달 띄우기*/ 
function modal(){
    $(".modal-modal").show();
    $(".modalmodel-wrap").show();
}

 /* 닫기 버튼 눌렀을때 */
function closeModal(){
    $(".modal-modal").hide();
    $(".modalmodel-wrap").hide();
    $("#detailText").val(""); 
}
