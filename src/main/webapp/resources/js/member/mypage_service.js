$(function(){
	//실제 DB의 bookingTime, 예약일 값 담을 hidden input
	const start = $(".input-start-time");
	const end = $(".input-end-time");
	const startDate = $(".input-start-date");
	const endDate = $(".input-end-date");
	
	//화면표시값 입력할 span태그
	let sSpan = $(".span-start-date");
	let eSpan = $(".span-end-date");	
	
	//span태그에 화면표시값 입력하기 'yy/mm/dd (hh:mi)'
	for(let i=0;i<start.length;i++){
		//날짜 값 담는 변수
		let sDate = startDate.eq(i).val();
		let eDate = endDate.eq(i).val();
		//1. 위탁돌봄 (*bookingTime값X endDate값O)
		if(start.eq(i).val()==""){
			sSpan.eq(i).html(sDate+"&ensp;~&ensp;"+eDate);
			sSpan.eq(i).parent().attr("colspan","2");
			eSpan.eq(i).parent().remove();
		//2. 방문돌봄/훈련 (*bookingTime값O endDate값X)
		}else{
			let sDate2 = startDate.eq(i).val().split(" (");
			let time = start.eq(i).val().split(",");
			if(time.length == 1){
				//2-1. 예약시간 한 시간만 있는 경우
				let timeCnt = 1;
				start.eq(i).val(time[0]);
				end.eq(i).val(time[0]);
				sSpan.eq(i).html(sDate2[0]);
				eSpan.eq(i).html("<b>"+time[0]+"</b><br>(총 "+time.length+"시간 이용)");
			}else{
				//2-2. 예약시간 여러 시간인 경우
				let timeCnt = time.length;
				//쉼표 기준으로 예약시간 잘라서 hidden input에 다시 반영
				start.eq(i).val(time[0]);
				end.eq(i).val(time[1]);
				sSpan.eq(i).html(sDate2[0]);
				eSpan.eq(i).html("<b>"+time[0]+"</b> , <b>"+time[time.length-1]+"</b><br>(총 "+time.length+"시간 이용)");
			}
		}
	}
	
	//펫번호로 펫이름 조회해서 span태그에 입력하기
	for(let i=0;i<$("#listLength").val();i++){
		const petNo = $(".input-pet").eq(i).val();
		$.ajax({
			url : "/getPetName.do",
			data : {petNo : petNo},
			success: function(petName){
				$(".span-pet").eq(i).text(petName);
			}
		});
	}
	
	//파트너번호로 파트너이름 조회해서 span태그에 입력하기
	for(let i=0;i<$("#listLength").val();i++){
		const pNo = $(".input-partner").eq(i).val();
		$.ajax({
			url : "/getPartnerName.do",
			data : {pNo : pNo},
			success: function(pName){
				$(".span-partner").eq(i).text(pName);
			}
		});
	}
	
	//가격 세자리마다 콤마(,)표시
	for(let i=0;i<$("#listLength").val();i++){
		const price = $(".input-price").eq(i).val();
		const commaPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
		$(".span-price").eq(i).text(commaPrice);
	}
	
	//후기작성한 서비스는 예약번호로 후기평점 가져오기
	for(let i=0;i<$("#listLength").val();i++){
		if($(".input-cancle-review").eq(i).val() == '1'){
			const bookingNo = $(".input-booking-no").eq(i).val();
			$.ajax({
				url : "/getReviewRate.do",
				data : {bookingNo : bookingNo},
				success: function(reviewRate){
					if(reviewRate == 1){
						$(".td-cancle-review").eq(i).children("a").text("★☆☆☆☆");
					}else if(reviewRate == 2){
						$(".td-cancle-review").eq(i).children("a").text("★★☆☆☆");
					}else if(reviewRate == 3){
						$(".td-cancle-review").eq(i).children("a").text("★★★☆☆");
					}else if(reviewRate == 4){
						$(".td-cancle-review").eq(i).children("a").text("★★★★☆");
					}else if(reviewRate == 5){
						$(".td-cancle-review").eq(i).children("a").text("★★★★★");
					}
				}
			});
		}
	}
});

//모달창 우측상단 닫기 버튼
$(".close-btn").on("click",function(){
    $(".review-modal").hide();
});

//후기작성submit 버튼
$("#insert-btn").on("click",function(){
	if($(".insert-review [name=reviewRate]").val()==0){
		alert("별을 드래그해서 평점을 입력해주세요.");
	}else{
		$(this).attr("type","submit");
	}
});

//후기작성 모달창 띄우는 함수
function writeReview(bookingNo, memberNo, pNo, petNo){
	$(".insert-review [name=bookingNo]").val(bookingNo);
	$(".insert-review [name=memberNo]").val(memberNo);
	$(".insert-review [name=pNo]").val(pNo);
	//파트너번호로 파트너이름 조회해서 입력하기
	$.ajax({
		url : "/getPartnerName.do",
		data : {pNo : pNo},
		success: function(pName){
			$(".insert-review .d-p-name").text("["+pName+"] 님의 서비스는 어떠셨나요?");
		}
	});
	$(".insert-review [name=petNo]").val(petNo);
	$(".insert-review ").show();
	$(this).keydown(function(event) {
        if ( event.keyCode == 27 || event.which == 27 ) {
            $(".close-btn").click();
        }
    });
}

//후기작성 평점 드래그 이벤트
const drawStarI = (target) => {
  $(`.insert-review .star span`).css({ width: `${target.value * 19}%` });
  $("#i-rate").val(`${target.value}`);
}

//후기수정 모달창 띄우는 함수
function viewReview(bookingNo){
	$(".update-review [name=bookingNo]").val(bookingNo);
	$.ajax({
		url : "/selectOneReview.do",
		data : {bookingNo : bookingNo},
		success: function(data){
			$(".update-review [name=reviewNo]").val(data.reviewNo);
			
			//파트너번호로 파트너이름 조회해서 입력하기
			$.ajax({
				url : "/getPartnerName.do",
				data : {pNo : data.pno},
				success: function(pName){
					console.log(pName);
					$(".update-review .d-p-name").text("["+pName+"] 님의 서비스");
				}
			});
			
			$(".span-review-date").text("후기작성일 : "+data.reviewDate);
			
			//등록한 사진 썸네일 표시
			$('#Preview-u').empty();
			if(data.fileList.length>0){
				$('.review-photo').show();
				$(".review-modal").removeClass("file-empty");
				for(let i=0;i<data.fileList.length;i++){
	                var str = '<li class="ui-state-default">';
	                str += '<img src="/resources/upload/review/'+ data.fileList[i].imgPath + '" title="' + data.fileList[i].imgName + '" width=90 height=90>';
	                $(str).appendTo('#Preview-u');
				}
			}else{
				$('.review-photo').hide();
				$(".review-modal").addClass("file-empty");
			}
			
			//평점 표시
			$(`.update-review .star span`).css({ width: `${data.reviewRate * 19}%` });
			$("#u-rate").val(`${data.reviewRate}`);
			$(".update-review [name=reviewRate]").val(data.reviewRate);
			
			$(".update-review [name=reviewContent]").text(data.reviewContent);
		}
	});
	$(".update-review").show();
	$(this).keydown(function(event) {
        if ( event.keyCode == 27 || event.which == 27 ) {
            $(".close-btn").click();
        }
    });
}

//후기수정 평점 드래그 이벤트
const drawStarU = (target) => {
  $(`.update-review .star span`).css({ width: `${target.value * 19}%` });
  $("#u-rate").val(`${target.value}`);
}

//후기수정submit 버튼
$("#update-btn").on("click",function(){
	if($(".update-review [name=reviewRate]").val()==0){
		alert("별을 드래그해서 평점을 입력해주세요.");
	}else{
		$(this).attr("type","submit");
	}
});

//후기작성 시 사진첨부
$(function () {
    //드래그 앤 드롭
    $(".sortable").sortable();

    //이미지 등록
    $("#AddImgs").change(function (e) {
        //div 내용 비워주기
        $('#Preview-i').empty();
        var files = e.target.files;
        var arr = Array.prototype.slice.call(files);
        
        if(files.length>3){
        	alert('사진은 최대 3개까지 첨부가능합니다.');
        	$("#AddImgs").val("");  //파일 초기화
        	return false;
        }
        
        //업로드 가능 파일인지 체크
        for (var i = 0; i < files.length; i++) {
            if (!checkExtension(files[i].name, files[i].size)) {
                return false;
            }
        }
        preview(arr);
        
        console.log(files);
        console.log(files.length);
        
        function checkExtension(fileName, fileSize) {
            var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            var maxSize = 20971520;  //20MB
            if (fileSize >= maxSize) {
                alert('이미지 크기가 초과되었습니다.');
                $("#AddImgs").val("");  //파일 초기화
                return false;
            }
            if (regex.test(fileName)) {
                alert('확장자명을 확인해주세요.');
                $("#AddImgs").val("");  //파일 초기화
                return false;
            }
            return true;
        }

        function preview(arr) {
            arr.forEach(function (f) {
                //div에 이미지 추가
                var str = '<li class="ui-state-default">';
                //str += '<span>'+fileName+'</span><br>';

                //이미지 파일 미리보기
                if (f.type.match('image.*')) {
                    //파일을 읽기 위한 FileReader객체 생성
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                        str += '<img src="' + e.target.result + '" title="' + f.name + '" width=90 height=90>';
                        str += '<span class="delBtn">x</span>';
                        str += '</li>';
                        $(str).appendTo('#Preview-i');
                    }
                    reader.readAsDataURL(f);
                }
            });
        }
    });
	
    //이미지 삭제
    $("#Preview-i").on("click",".delBtn",function(){
        $(this).parent("li").remove();
    });
});