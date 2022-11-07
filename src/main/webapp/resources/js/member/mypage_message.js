//삭제, 읽음 버튼
const deleteBtn = $("#delete");
const readingBtn = $("#reading");

//받은메시지 체크박스
const checkAllR = $("#check-all-r");
const checkR = $(".receive tbody .check-msg");

//보낸메시지 전체체크하는 체크박스
const checkAllS = $("#check-all-s");
const checkS = $(".send tbody .check-msg");

//메시지 전체체크
checkAllR.on("change",function(){
    if($(this).prop("checked")){
        checkR.prop("checked",true);
    }else{
        checkR.prop("checked",false);
    }
});
checkAllS.on("change",function(){
    if($(this).prop("checked")){
        checkS.prop("checked",true);
    }else{
        checkS.prop("checked",false);
    }
});

//메시지 개별체크
checkR.on("change",function(){
    if(!$(this).prop("checked")){
        checkAllR.prop("checked",false);
    }
});
checkS.on("change",function(){
    if(!$(this).prop("checked")){
        checkAllS.prop("checked",false);
    }
});

//탭 클릭에 따라 받은메시지, 보낸메시지 표시
$("#tab-receive").on("click",function(){
	
	getMemberRDm();
	
    $(this).addClass("active-tap");
    $("#tab-send").removeClass();
    $(".send").hide();
    $(".receive").show();
    readingBtn.show();
    $("#msg-filter").show();
});
$("#tab-send").on("click",function(){

	getMemberSDm();
	
    $(this).addClass("active-tap");
    $("#tab-receive").removeClass();
    $(".send").show();
    $(".receive").hide();
    readingBtn.hide();
    $("#msg-filter").hide();
});

//받은메시지 필터 클릭에 따라 읽지않은메시지, 전체메시지 표시
$(".unread").on("click",function(){
    $(".unread").addClass("active-tap");
    $(".receive .read-check").each(function(index,item){
        if($(item).val()==1){
            $(item).siblings().find(".check-msg").attr("disabled", true);
            $(item).parent().hide();
        }
    });
});
$(".all").on("click",function(){
    $(".unread").removeClass("active-tap");
    $(".receive tbody>tr").show();
    $(".receive tbody>tr>td>.check-msg").attr("disabled", false);
});

//받은메시지 읽지않은메시지 굵게 표시
$(function unreadR(){
    const rMsg = $(".receive .td-content>a");
    rMsg.each(function(index, item){
        const readCheck = $(item).parent().siblings(".read-check").val();
        if(readCheck == 0){
            $(item).css("font-weight","bold");
        }
    });
});

//보낸메시지 읽음여부 표시
$(function unreadS(){
    const sMsg = $(".send .td-content>a");
    sMsg.each(function(index, item){
        const readCheck = $(item).parent().siblings(".read-check").val();
        if(readCheck == 0){
            $(item).parent().siblings(".td-readcheck").text("읽지않음");
        }else if(readCheck == 1){
            $(item).parent().siblings(".td-readcheck").text("읽음");
        }
    });
});

//받은메시지 보낸사람 필터 함수
function showAdminMsg(){
    $(".receive .sender-category").each(function(index,item){
        if($(item).val()=="A"){
            $(item).siblings().find(".check-msg").attr("disabled", false);
            $(item).parent().show();
        }else if($(item).val()!="A"){
            $(item).siblings().find(".check-msg").attr("disabled", true);
            $(item).parent().hide();
        }
    });
}
function showPartnerMsg(){
    $(".receive .sender-category").each(function(index,item){
        if($(item).val()=="P"){
            $(item).siblings().find(".check-msg").attr("disabled", false);
            $(item).parent().show();
        }else if($(item).val()!="P"){
            $(item).siblings().find(".check-msg").attr("disabled", true);
            $(item).parent().hide();
        }
    });
}
function showAllMsg(){
    $(".receive .sender-category").each(function(index,item){
        $(item).siblings().find(".check-msg").attr("disabled", false);
        $(item).parent().show();
    });
}

//메시지 상세보기 모달창 함수
function receiveModal(){
    //요소 기본세팅으로 리셋
    $("#receive-msg").show();
    $("#submit-btn").attr("id","reply-btn")
    $("#reply-btn").removeClass("submit-btn");
    $("#reply-btn").prop("type","button");
    $("#reply-btn").val("답장");
    //받은메시지 창 세팅
    $("#msg-modal-title").text("받은메시지");
    $(".msg-modal-content textarea").attr("readonly");
    $(".msg-modal-content textarea").css("height","400px");
    $(".msg-btn-wrap").show();
    $(".msg-sender>span").text("보낸사람");
    $(".msg-date>span").text("받은날짜");
    //이후 모달창 보여주기
    $(".msg-modal").show();
    $(this).keydown(function(event) {
        if ( event.keyCode == 27 || event.which == 27 ) {
            $("#close-btn").click();
        }
    });
}
function sendModal(){
    //보낸메시지 창 세팅
    $("#msg-modal-title").text("보낸메시지");
    $(".msg-modal-content textarea").attr("readonly");
    $(".msg-modal-content textarea").css("height","470px");
    $(".msg-btn-wrap").hide();
    $(".msg-sender>span").text("받는사람");
    $(".msg-date>span").text("보낸날짜");
    //이후 모달창 보여주기
    $(".msg-modal").show();
    $(this).keydown(function(event) {
        if ( event.keyCode == 27 || event.which == 27 ) {
            $("#close-btn").click();
        }
    });
}

//모달창 우측상단 닫기 버튼
$("#close-btn").on("click",function(){
    $("#reply-msg").hide();
    $(".msg-modal").hide();
});
//받은메시지 답장 버튼
$("#reply-btn").on("click",function(){
    $("#receive-msg").hide();
    $("#reply-msg").show();
    $("#reply-msg").focus();
    $(this).val("보내기");
    $(this).attr("id","submit-btn");
    $("#submit-btn").on("click",function(){
        $(this).prop("type","submit");
        $("#reply-msg").hide();
        $(".msg-modal").hide();
    });
});

//메시지 불러오기
function getMemberRDm(){
	const memberId = $("#memberId").val();
	$.ajax({
		url : "/getMemberRDm.do",
		data : {memberId : memberId},
		success: function(data){
			console.log("receiveMsg");
		}
	});
};
function getMemberSDm(){
	const memberId = $("#memberId").val();
	$.ajax({
		url : "/getMemberSDm.do",
		data : {memberId : memberId},
		success: function(data){
			console.log("sendMsg");
		}
	});
};