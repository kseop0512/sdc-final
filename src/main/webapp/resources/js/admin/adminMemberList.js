//검색하기........
$("#sb").on("click",function(){
	if($("[name=keyword]").val() == ""){
		alert("검색어를 입력해주세요");
		$("#sb").attr("type","button");
	}else{
		$("#sb").attr("type","submit");
	}

});


function selectAll(obj){

	const membertab = $("[name=membertab]").val();	
	console.log(membertab);
	
	location.href="/selectmember.do?membertab="+membertab;

	

}
