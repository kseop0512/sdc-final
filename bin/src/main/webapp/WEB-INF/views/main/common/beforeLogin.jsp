<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <!-- ======= Book A Table Section ======= -->
  <section id="book-a-table" class="book-a-table section-bg1">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>LOGIN</h2>
        <p>목적을 선택해주세요</p>
      </div>
      <section id="chefs" class="chefs">
        <div class="container" data-aos="fade-up">
          <div class="row" style="justify-content: center;">
  
            <div class="col-lg-4 col-md-6">
              <div class="member" data-aos="zoom-in" data-aos-delay="100" style="background: transparent;border-radius: 260px;">
                <a href="/loginUserFrm.do">
                    <img src="resources/assets/img/before_login-1.png" class="img-fluid" alt="">
                    <div class="member-info">
                        <div class="member-info-content">
                            <h4 style="font-size: 35px;">User</h4>
                            <span>LOGIN</span>
                        </div>
                    </div>
                </a>
              </div>
            </div>
  
            <div class="col-lg-4 col-md-6">
              <div class="member" data-aos="zoom-in" data-aos-delay="200" style="background: transparent;border-radius: 260px;">
                <a href="/loginPartnerFrm.do">
                    <img src="resources/assets/img/before_login-2-1 (1).png" class="img-fluid" alt="">
                    <div class="member-info">
                        <div class="member-info-content">
                            <h4 style="font-size: 35px;">Partner</h4>
                            <span>LOGIN</span>
                        </div>
                    </div>
                </a>
              </div>
            </div>
            
          </div>
        </div>
      </section><!-- End Chefs Section -->
  </section><!-- End Book A Table Section -->
  
  <jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>