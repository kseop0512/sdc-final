<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<style>
.img_btn-wrap{
	display: flex;
	justify-content: center;
    min-height: 100vh;
    align-items: center;
}
.img_btn-wrap>button{
	margin-right: 40px;
	margin-left: 40px;
}
.btn-img{
	position:relative;
	margin: 20px;
	background: none;
	border: 10px solid #ccc;
	border-radius: 20px;
	cursor: pointer;
	width: 300px;
	height: 300px;
}
.petType{
	font-size: 20px;
	font-weight: bolder;
	display: block;
	padding-top: 225px;
}
.text-active{
	font-size: 60px;
	font-weight: bolder;
	display: block;
	color: white;
	position: relative;
	transition-duration: 0.6s;
}

.petBtn1.active {
	background: transparent url("/resources/img/maltipoo.jpg") center / 100% no-repeat;
	transition-duration: 0.3s;
}
.petBtn1{
	background: url("/resources/img/dog.png") center / 70% no-repeat;
	transition-duration: 0.3s;
	
}
.petBtn1.active::before{
	content:'';
	display:block;
	position:absolute;
	width:100%;
	height:100%;
	top:0;
	left:0;
	background:rgba(0,0,0,0.2);
	z-index: 0;
}
.petBtn2.active {
	background: transparent url("/resources/img/1652337370806_0.jpg") center / 100% no-repeat;
	background-size: cover;
	transition-duration: 0.4s;
}
.petBtn2.active::before{
	content:'';
	display:block;
	position:absolute;
	width:100%;
	height:100%;
	top:0;
	left:0;
	background:rgba(0,0,0,0.2);
	z-index: 0;
}
.petBtn2{
	background: url("/resources/img/cat.png") center / 70% no-repeat;
	transition-duration: 0.4s;
}
</style>
<body>
	<div class="img_btn-wrap">
		<button type="button" class="btn-img petBtn1" onclick="location.href='/petDogAddFrm.do'"><span class="petType textSpan1">강아지</span></button>
		<button type="button" class="btn-img petBtn2" onclick="location.href='/petCatAddFrm.do'"><span class="petType textSpan2">고양이</span></button>
	</div>
<script>
	$(".petBtn1").hover(function(){
		$(this).addClass("active");
		$(".textSpan1").addClass("text-active");
		$(".textSpan1").removeClass("petType");
	}, function(){
		$(this).removeClass("active")
		$(".textSpan1").removeClass("text-active");
		$(".textSpan1").addClass("petType");
	});
	
	$(".petBtn2").hover(function(){
		$(this).addClass("active");
		$(".textSpan2").addClass("text-active");
		$(".textSpan2").removeClass("petType");
	}, function(){
		$(this).removeClass("active");
		$(".textSpan2").removeClass("text-active");
		$(".textSpan2").addClass("petType");
	});
</script>
</body>
</html>