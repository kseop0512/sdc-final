$(function(){
	console.log($("#listLength").val());

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
			sSpan.eq(i).html(sDate+"&emsp;~&emsp;"+eDate);
			sSpan.eq(i).parent().attr("colspan","2");
			eSpan.eq(i).parent().remove();
		//2. 방문돌봄/훈련 (*bookingTime값O endDate값X)
		}else{
			let time = start.eq(i).val().split(",");
			if(time.length == 1){
				//2-1. 예약시간 한 시간만 있는 경우
				let timeCnt = 1;
				start.eq(i).val(time[0]);
				end.eq(i).val(time[0]);
				sSpan.eq(i).html(sDate);
				eSpan.eq(i).html("<b>"+time[0]+"</b><br>(총 "+time.length+"시간 이용)");
			}else{
				//2-2. 예약시간 여러 시간인 경우
				let timeCnt = time.length;
				//쉼표 기준으로 예약시간 잘라서 hidden input에 다시 반영
				start.eq(i).val(time[0]);
				end.eq(i).val(time[1]);
				sSpan.eq(i).html(sDate);
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
			$(".update-review [name=memberNo]").val(data.memberNo);
			$(".update-review [name=pNo]").val(data.pNo);
			$(".update-review [name=petNo]").val(data.petNo);
			$(`.update-review .star span`).css({ width: `${data.reviewRate * 19}%` });
			$("#u-rate").val(`${data.reviewRate}`)
			$(".update-review [name=reviewRate]").val(data.reviewRate);
			$(".update-review [name=reviewContent]").text(data.reviewContent);
		}
	});
	$(".update-review ").show();
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