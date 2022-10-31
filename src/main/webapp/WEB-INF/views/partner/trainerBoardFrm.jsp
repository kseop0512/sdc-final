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
    		<div class="row php-email-form">
	    		<div class="section-title">
	    			<p>게시글 작성</p>
	    		</div>
				<form action="/uploadTrainerBoard.do" method="post" encytype="multipart/data-form">
				<div class="col col-md-6 form-group">
	                <label for="pId">제목 <span class="text-warning">*</span></label>
	                <input type="text" name="pId" class="form-control" id="pId" placeholder="name@example.com" required>
	            </div>
				<textarea id="summernote"></textarea>
				</form>
    		</div>
		</div>
	</section>
	</main>
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script src="/resources/js/partnerScripts.js"></script>
</body>
</html>
