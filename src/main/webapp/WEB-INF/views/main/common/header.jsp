<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ======= Top Bar ======= -->
<div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex justify-content-center justify-content-md-between">

        <div class="contact-info d-flex align-items-center">
            <i class="bi bi-phone d-flex align-items-center"><span>+1 5589 55488 55</span></i>
            <i class="bi bi-clock d-flex align-items-center ms-4"><span> Mon-Fri: 9AM - 18PM</span></i>
        </div>

        <div class="languages d-none d-md-flex align-items-center">
            <ul>
                <c:choose>
                <c:when test="${not empty sessionScope.m }">
                    <li><a href="/memberMypage.do">마이페이지</a></li>
                </c:when>
                <c:when test="${not empty sessionScope.p }">
                    <li><a href="/partnerMain.do">마이페이지</a></li>
                </c:when>
                <c:when test="${not empty sessionScope.g }">
                    <li><a href="/selectUserList.do">마이페이지</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/memberJoinFrm.do">회원가입</a></li>
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${not empty sessionScope.g }">
					<li><a href="/selectUserList.do">Manager</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/loginManagerFrm.do">Manager</a></li>
				</c:otherwise>
            	</c:choose>
            </ul>
        </div>
    </div>
</div>
<!-- ======= Header ======= -->

<header id="header" class="fixed-top d-flex align-items-cente">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

        <h1 class="logo me-auto me-lg-0"><a href="/"><img class="img-logo" src="/resources/assets/img/logo-15수정본.png"/></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->


        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><a class="nav-link scrollto active" href="/#hero">Home</a></li>
                <li><a class="nav-link scrollto" href="/#about">About</a></li>
                <li><a class="nav-link scrollto" href="/#menu">산책&돌봄서비스</a></li>
                <li><a class="nav-link scrollto" href="/#specials">세부정보</a></li>
                <li><a class="nav-link scrollto" href="/#chefs">훈련사정보</a></li>
                <li><a class="nav-link scrollto" href="/#gallery">갤러리</a></li>
                <li class="dropdown"><a href="#"><span>파트너 찾기</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="javascript:void(0)">펫시터 매칭</a></li>
                        <li><a href="/petSitterList.do">위탁 펫시터 찾기</a></li>
                        <li><a href="/trainerList.do">훈련사 프로필</a></li>
                        <li><a href="/joinPetSitterPartnerFrm.do">파트너(펫시터) 지원</a></li>
                        <li><a href="/joinTrainerPartnerFrm.do">파트너(훈련사) 지원</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#"><span>게시판</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="/homeNoticeList.do?reqPage=1">공지사항</a></li>
                        <li class="dropdown"><a href="#"><span>똑독캣 게시판</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">훈련사 QnA</a></li>
                                <li><a href="#">펫시팅 후기</a></li>
                                <li><a href="#">훈련 후기</a></li>
                                <li><a href="#">위탁 후기</a></li>
                            </ul>
                        </li>
                        <%--<li><a href="/joinPetSitterPartnerFrm.do">파트너(펫시터) 지원</a></li>
                        <li><a href="/joinTrainerPartnerFrm.do">파트너(훈련사) 지원</a></li>--%>
                        <li><a href="/adminMemberList.do">Drop Down 4</a></li>
                    </ul>
                </li>
     <c:choose>
        <c:when test="${not empty sessionScope.m }">
            <li><a class="nav-link scrollto" href="#contact">문의하기</a></li>
         </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
        <a href="/logoutUser.do" class="book-a-table-btn scrollto d-none d-lg-flex">LOGOUT</a>
      </c:when>
      
      <c:when test="${not empty sessionScope.p }">
            <li><a class="nav-link scrollto" href="#contact">문의하기</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
        <a href="/logoutPartner.do" class="book-a-table-btn scrollto d-none d-lg-flex">LOGOUT</a>
      </c:when>

	  <c:when test="${not empty sessionScope.g }">
            <li><a class="nav-link scrollto" href="#contact">문의하기</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
        <a href="/logoutPartner.do" class="book-a-table-btn scrollto d-none d-lg-flex">LOGOUT</a>
      </c:when>

      <c:otherwise>
         <li><a class="nav-link scrollto" href="#contact">문의하기</a></li>
         </ul>
         <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      <!-- .navbar -->
      <a href="/beforeLogin.do" class="book-a-table-btn scrollto d-none d-lg-flex">LOGIN</a>
      </c:otherwise>
	</c:choose>
    </div>
</header><!-- End Header -->
