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
	
	const splitDate = startDate.split(" (");
	const startDateL = splitDate[0];
	const splitTime = bookingTime.split(",");
	
	if(endDate==""){
		$(".service-date").text(startDateL+" 이용시간대("+bookingTime+") 총 "+splitTime.length+"시간 이용");
		const td = "<td></td>";
		td.text(bookingTime+" 총 "++);
		$(".td-service-date").append().html("<th>이용시간대</th>");
	}else{
		$(".service-date").text(startDate+" ~ "+endDate);
	}
});