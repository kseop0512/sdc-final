$(function(){
	for(let i=0;i<$("#listLength").val();i++){
		const reviewRate = $(".input-review-rate").eq(i).val();
		if(reviewRate == 1){
			$(".input-star").eq(i).val("★☆☆☆☆");
		}else if(reviewRate == 2){
			$(".input-star").eq(i).val("★★☆☆☆");
		}else if(reviewRate == 3){
			$(".input-star").eq(i).val("★★★☆☆");
		}else if(reviewRate == 4){
			$(".input-star").eq(i).val("★★★★☆");
		}else if(reviewRate == 5){
			$(".input-star").eq(i).val("★★★★★");
		}
	}
});