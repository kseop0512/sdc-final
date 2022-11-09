<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>똑독캣 (SDC) | 강아지 전문 훈련사 예약하기</title>
    <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    <link href="/resources/css/partner/trainerStyles.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
    <script src="/resources/summernote/summernote-lite.js"></script>
    <script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
</head>
<style>
	table th{
		width: 25%;
		text-align: center;
	}
	*{
		vertical-align: middle;
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<main id="main">
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">
			<div class="justify-content">
				<h1>훈련사 게시글 작성</h1>
				<hr>
				<h4>본인을 어필하는 예약 상세페이지를 작성해보세요!</h4>
			</div>
		</div>
	</section>	
	<section class="inner-page">
    	<div class="container">
    	
    		<div class="row ">
	    		<div class="section-title">
	    			<p>훈련사 찾기 등록</p>
	    		</div>
				<!-- 요기부터 css 못건드리겠어요 -->
				<form action="/uploadTrainerBoard.do" method="post" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<th>제목</th>
							<td><input type="text" name="boardTitle" class="form-control" required></td>
						</tr>
						<tr>
							<th>대표 경력</th>
							<td><textarea name="topExp" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th>전문분야</th>
							<td><input type="text" name="profField" class="form-control" placeholder="ex. 공격성 교육 전문, 소/중형견 전문"></td>
						</tr>
						<tr>
							<th>조건검색(해쉬태그)</th>
							<td><input type="text" name="hashTag" class="form-control" placeholder="ex. #반려견전문가 #행동교정 전문가"></td>
						</tr>
						<tr>
							<th>방문지역</th>
							<td><textarea name="visitArea" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th>자기소개</th>
							<td><textarea id="summernote" name="aboutMe" required></textarea>
						</tr>
						<tr>
							<th>첨부파일<br>(3개 올려주세요)</th>
							<td>
								<div class="file-group">
									<div class="input-group">
										<input type="file" class="form-control add-file" name="boardFile" multiple aria-label="Upload">
										<button class="btn btn-outline-danger" type="button" onclick="deleteFile(this)">삭제</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th colspan="2">
							<input type="submit" value="훈련사 찾기 등록" class="btn btn-dark btn-lg uploadBtn" style="width: 100%;">
							<input type="hidden" name="pNo" value="${sessionScope.p.PNo }">
							<input type="hidden" name="trainerName" value="${sessionScope.p.PName }">
							<input type="hidden" name="trainerImg" value="${sessionScope.p.profilePath }">
							
							</th>
						</tr>
					</table>
				</form>
				<!-- 요기까지... ㅠㅠ -->
    		</div>
		</div>
	</section>
	</main>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script src="/resources/js/partnerScripts.js"></script>
	<script>
	let files=[];
	$(document).ready(function(){
		$("#summernote").summernote({
			height: 200,
			minHeight: null,
			maxHeight: null,
			focus: true,
			lang: "ko-KR",
			placeholder: '자기소개글을 작성해주세요'
		});
		$(".file-group").on("change", ".add-file", function(e) {
            const idx = $(".add-file").index(this);
            const str = $(this).val();
            const fileName = str.split('\\').pop().toLowerCase();

            const ext =  fileName.split('.').pop().toLowerCase();

            if($.inArray(ext, ['jpg', 'pdf', 'png', 'jpeg', 'gif']) == -1) {
                alert(ext+'파일은 업로드 하실 수 없습니다.');
                $(this).val("");
                return;
            }

            //files = [];
            if($(".add-file").length == (idx+1) && $(".add-file").length < 3) {

                $(this).parent().after("<div class='input-group mt-3'><input type='file' class='form-control add-file' name='boardFile' aria-label='Upload'> <button class='btn btn-outline-danger' type='button' id='' onclick='deleteFile(this)'>삭제</button></div>")
                files.push(e.target.files[0]);
            } else {
                files[idx] = e.target.files[0];
            }
            $(this).addClass("has-file");
            fileSetting();
        })
	}); 
	</script>
</body>
</html>
