<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 (SDC) | 펫시터, 훈련사, 그루머 예약서비스</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>

</head>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
			<div class="row">
				<div class="col-lg-8">
					<h1>안녕하세요 <span>똑독캣에 오신걸 환영합니다</span></h1>
					<h2>Hello, Welcome to Ddok Dog&Cat!</h2>
					<div class="btns">
						<a href="#menu" class="btn-menu animated fadeInUp scrollto">Our Service</a>
						<a href="login.html" class="btn-book animated fadeInUp scrollto">LOGIN</a>
					</div>
				</div>
				<div class="col-lg-4 d-flex align-items-center justify-content-center position-relative" data-aos="zoom-in" data-aos-delay="200">
					<a href="https://youtu.be/Fugn1NWAJ9Y" class="glightbox play-btn"></a>
				</div>
			</div>
		</div>
	</section><!-- End Hero -->
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>