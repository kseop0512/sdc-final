//검색하기........
$("#sb").on("click",function(){
	if($("[name=keyword]").val() == ""){
		alert("검색어를 입력해주세요");
		$("#sb").attr("type","button");
	}else{
		$("#sb").attr("type","submit");
	}

});

