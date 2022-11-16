$(function(){
	//전화번호 하이픈(-)표시
	$(".phone1").text( $(".phone1").text().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	$(".phone2").text( $(".phone2").text().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	
	//가격 세자리마다 콤마(,)표시
	const price = $(".price").text();
	const commaPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
	$(".price").text(commaPrice);
	
	//서비스별로 날짜표시 다르게
	const startDate = $(".hidden-startdate").val();
	const endDate = $(".hidden-enddate").val();
	const bookingTime = $(".hidden-bookingtime").val();
	
	let sDate2 = startDate.eq(i).val().split(" (");
	
	if($(".hidden-category").val()=="L"){
		$(".service-date").text();
	}else{
		$(".service-date").text();
	}
	
	
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
});