<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑독캣 (SDC) | 펫시터, 훈련사, 그루머 예약서비스</title>
<jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
<style>
	.contact .moonui {
  width: 100%;
}

.contact .moonui .form-group {
  padding-bottom: 8px;
}

.contact .moonui .validate {
  display: none;
  color: red;
  margin: 0 0 15px 0;
  font-weight: 400;
  font-size: 13px;
}

.contact .moonui .error-message {
  display: none;
  color: #fff;
  background: #ed3c0d;
  text-align: center;
  padding: 15px;
  font-weight: 600;
}

.contact .moonui .sent-message {
  display: none;
  color: #fff;
  background: #18d26e;
  text-align: center;
  padding: 15px;
  font-weight: 600;
}

.contact .moonui .loading {
  display: none;
  text-align: center;
  padding: 15px;
}

.contact .moonui .loading:before {
  content: "";
  display: inline-block;
  border-radius: 50%;
  width: 24px;
  height: 24px;
  margin: 0 10px -6px 0;
  border: 3px solid #ffb347;
  border-top-color: #1a1814;
  -webkit-animation: animate-loading 1s linear infinite;
  animation: animate-loading 1s linear infinite;
}

.contact .moonui input,
.contact .moonui textarea {
  border-radius: 0;
  box-shadow: none;
  font-size: 14px;
  background: #0c0b09;
  border-color: #625b4b;
  color: white;
}

.contact .moonui input::-moz-placeholder,
.contact .moonui textarea::-moz-placeholder {
  color: #a49b89;
}

.contact .moonui input::placeholder,
.contact .moonui textarea::placeholder {
  color: #a49b89;
}

.contact .moonui input:focus,
.contact .moonui textarea:focus {
  border-color: #ffb347;
}
.contact .moonui input.is-invalid:focus,
.contact .moonui textarea.is-invalid:focus {
  border-color: #dc3545;
}
.contact .moonui input.is-invalid{
  border-color: #dc3545;
}
.contact .moonui input {
  height: 44px;
}

.contact .moonui textarea {
  padding: 10px 12px;
}

.contact .moonui button[type=submit] {
  background: #ffb347;
  border: 0;
  padding: 10px 35px;
  color: #1a1814;
  transition: 0.4s;
  border-radius: 50px;
}

.contact .moonui button[type=submit]:hover {
  background: #d3af71;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
			<div class="row">
				<div class="col-lg-8">
				<c:choose>
					<c:when test="${not empty sessionScope.m }">
						<h1>안녕하세요  ${sessionScope.m.memberName }님 <span>똑독캣에 오신걸 환영합니다</span></h1>
					</c:when>
					<c:when test="${not empty sessionScope.p }">
						<h1>안녕하세요  ${sessionScope.p.PName }님 <span>똑독캣에 오신걸 환영합니다</span></h1>
					</c:when>
					<c:when test="${not empty sessionScope.g }">
						<h1>안녕하세요  ${sessionScope.g.adminId }님 <span>똑독캣에 오신걸 환영합니다</span></h1>
					</c:when>
					<c:when test="${not empty sessionScope.koko }">
						<h1>안녕하세요  ${sessionScope.ko.nickname }님 <span>똑독캣에 오신걸 환영합니다</span></h1>
					</c:when>
					<c:otherwise>
						<h1>안녕하세요  <span>똑독캣에 오신걸 환영합니다</span></h1>
					</c:otherwise>
				</c:choose>	
					<h2>Hello, Welcome to Ddok Dog&Cat!</h2>
					<div class="btns">
						<a href="#menu" class="btn-menu animated fadeInUp scrollto">Our Service</a>
						<a href="#chefs" class="btn-book animated fadeInUp scrollto">INFO</a>
					</div>
				</div>
				<div class="col-lg-4 d-flex align-items-center justify-content-center position-relative" data-aos="zoom-in" data-aos-delay="200">
					<a href="https://youtu.be/Fugn1NWAJ9Y" class="glightbox play-btn"></a>
				</div>
			</div>
		</div>
	</section><!-- End Hero -->
	
	<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
            <div class="about-img">
              <img src="resources/assets/img/DC9.jpg" alt="">
            </div>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <h3>반려생활 파트너</h3>
            <p class="fst-italic">
              반려가족의 하루에 똑독캣이 함께할게요
            </p>
            <ul>
              <li><i class="bi bi-check-circle"></i> 펫시터가 집으로 와요!</li>
              <li><i class="bi bi-check-circle"></i> 훈련사의 체계적 교육!</li>
              <li><i class="bi bi-check-circle"></i> 직접 방문하여 함께 산책!</li>
            </ul>
            <p>
              똑독캣의 실시간 케어 시스템으로 반려동물의 삶의 질을 높여줍니다.
              방문 훈련 / 비대면 화상 훈련을 예약하고 우리 아이 성향 맟춤 솔루션을 받아보세요!
              경험많은 전문시터들이 함께 산책하며 아이들의 즐거운 산책을 책임질게요!
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->
    <!-- ======= Menu Section ======= -->
    <section id="menu" class="menu section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>산책&돌봄&훈련 서비스</h2>
          <p>원하시는 서비스를 선택해주세요</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="menu-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-starters">위탁</li>
              <li data-filter=".filter-salads">훈련</li>
              <li data-filter=".filter-specialty">패키지</li>
            </ul>
          </div>
        </div>

        <div class="row menu-container" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-6 menu-item filter-starters">
            <img src="resources/assets/img/menu/WELC.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="/petSitterBoardList.do">위탁 1Day</a><span>₩35,000</span>
            </div>
            <div class="menu-ingredients">
              1박(산책 + 돌봄)기준
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-specialty">
            <img src="resources/assets/img/menu/logo-15수정본.jpg" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">똑독캣 패키지 1</a><span>₩가격 상담</span>
            </div>
            <div class="menu-ingredients">
              위탁 + 훈련 교육(60분)으로 이뤄진 패키지
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-starters">
            <img src="resources/assets/img/menu/WELC.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="/petSitterBoardList.do">위탁 2Day</a><span>₩69,000</span>
            </div>
            <div class="menu-ingredients">
              2박(산책 + 돌봄)기준
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-salads">
            <img src="resources/assets/img/menu/DC16.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="/oneTrainer.do?tBoardNo=TBOARD-102">신조이 훈련사 - 방문 교육 (60분)</a><span>₩120,000</span>
            </div>
            <div class="menu-ingredients">
               직접 현장에서 핸들링 및 코치 가능 / 산책 또는 야외 교육이 필요한 경우 / 공격성으로 직접 핸들링이 힘든 경우 / 오랜 시간(60분)집중적인 교육

            </div>
          </div>

          <div class="col-lg-6 menu-item filter-specialty">
            <img src="resources/assets/img/menu/logo-15수정본.jpg" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">똑독캣 패키지 2</a><span>₩가격 상담</span>
            </div>
            <div class="menu-ingredients">
              위탁 + 훈련 교육(60분)으로 이뤄진 패키지
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-starters">
            <img src="resources/assets/img/menu/WELC.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="/petSitterBoardList.do">위탁 3Day</a><span>₩100,000</span>
            </div>
            <div class="menu-ingredients">
              3박(산책 + 돌봄)기준
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-salads">
            <img src="resources/assets/img/menu/DC16.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="/oneTrainer.do?tBoardNo=TBOARD-101">김광섭 훈련사 - 방문 교육 (60분)</a><span>₩120,000</span>
            </div>
            <div class="menu-ingredients">
              직접 현장에서 핸들링 및 코치 가능 / 산책 또는 야외 교육이 필요한 경우 / 공격성으로 직접 핸들링이 힘든 경우 / 오랜 시간(60분)집중적인 교육
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-salads">
            <img src="resources/assets/img/menu/DC16.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="/oneTrainer.do?tBoardNo=TBOARD-100">신혜규 훈련사 - 방문 교육 (60분)</a><span>₩120,000</span>
            </div>
            <div class="menu-ingredients">
              직접 현장에서 핸들링 및 코치 가능 / 산책 또는 야외 교육이 필요한 경우 / 공격성으로 직접 핸들링이 힘든 경우 / 오랜 시간(60분)집중적인 교육
            </div>
          </div>
          
          <div class="col-lg-6 menu-item filter-salads">
            <img src="resources/assets/img/menu/DC16.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="/oneTrainer.do?tBoardNo=TBOARD-141">김사딕 훈련사 - 방문 교육 (60분)</a><span>₩120,000</span>
            </div>
            <div class="menu-ingredients">
              직접 현장에서 핸들링 및 코치 가능 / 산책 또는 야외 교육이 필요한 경우 / 공격성으로 직접 핸들링이 힘든 경우 / 오랜 시간(60분)집중적인 교육
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-specialty">
            <img src="resources/assets/img/menu/logo-15수정본.jpg" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">똑독캣 패키지 3</a><span>₩가격 상담</span>
            </div>
            <div class="menu-ingredients">
             위탁 + 훈련 교육(60분)으로 이뤄진 패키지
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Menu Section -->

    <!-- ======= Specials Section ======= -->
    <section id="specials" class="specials">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Service</h2>
          <p>똑독캣의 서비스를 골라보세요</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">산책 서비스</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-2">돌봄 서비스</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-3">훈련 서비스</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tab-4">위탁 서비스</a>
              </li>
            </ul>
          </div>
          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>언제 어디서든 똑독캣을 부르세요</h3>
                    <p class="fst-italic">강아지의 삶에 가장 중요한 산책을 바쁜 일상으로 인해 자주 미루셨나요?
                      이제는 똑독캣 펫시터에게 강아지의 안전하고 즐거운 산책을 맡겨보세요</p>
                    <p>언제 어디서든 원하시는 방법으로 '똑독캣' 방문 펫시터 서비스를 예약할 수 있어요</p>
                    <a href="/petSitterList.do" id="jasehi" class="btn-book animated fadeInUp scrollto jasehi">
                      <div style="width: 170px;height: 59px;border: 1px solid #333333;margin-top: 50px;display: flex;justify-content: center;align-items: center;">
                        <p style="font-size: 17px;color: #cda45e;font-weight: 600;letter-spacing: -0.2px;margin-bottom: 0;">자세히 보기</p>
                        <img src="resources//assets/img/arrow_right.png" style="width: 20px;height: 17px;margin-left: 15px;">
                      </div>
                    </a>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/WELC.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-2">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>언제 어디서든 똑독캣을 부르세요</h3>
                    <p class="fst-italic">혼자 남겨진 반려동물을 생각하며, 외출을 망설인 적이 있으신가요?
                      이제는 똑독캣 펫시터에게 맡기고, 여러분의 소중한 일상을 마음 편히 보내세요</p>
                    <p>언제 어디서든 원하시는 방법으로 '똑독캣' 방문 펫시터 서비스를 예약할 수 있어요</p>
                    <a href="/petSitterList.do" id="jasehi" class="btn-book animated fadeInUp scrollto jasehi">
                      <div style="width: 170px;height: 59px;border: 1px solid #333333;margin-top: 50px;display: flex;justify-content: center;align-items: center;">
                        <p style="font-size: 17px;color: #cda45e;font-weight: 600;letter-spacing: -0.2px;margin-bottom: 0;">자세히 보기</p>
                        <img src="resources//assets/img/arrow_right.png" style="width: 20px;height: 17px;margin-left: 15px;">
                      </div>
                    </a>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/DC8.jpg" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-3">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>내 반려견은 왜 이런 행동을 할까요?</h3>
                    <p class="fst-italic">반려견과 보호자님 모두의 행복한 동행을 위해
                      똑독캣 든든한 교육 파트너가 되어드립니다.</p>
                    <p>KKF/KKC 3급 이상 경력 인증, 자격증 및 서류 사전 검증 등 믿을 수 있는 훈련사를 만나보세요</p>
                    <a href="/trainerList.do" id="jasehi" class="btn-book animated fadeInUp scrollto jasehi">
                      <div style="width: 170px;height: 59px;border: 1px solid #333333;margin-top: 50px;display: flex;justify-content: center;align-items: center;">
                        <p style="font-size: 17px;color: #cda45e;font-weight: 600;letter-spacing: -0.2px;margin-bottom: 0;">자세히 보기</p>
                        <img src="resources//assets/img/arrow_right.png" style="width: 20px;height: 17px;margin-left: 15px;">
                      </div>
                    </a>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/sadic-1.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-4">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>다른곳에 맡기고 싶다면 위탁 서비스를 이용해보세요</h3>
                    <p class="fst-italic">행복한 하루를 선물하세요</p>
                    <p>여행, 출장, 늦은 퇴근에도 걱정마세요! 가족같은 펫시터가 내 아이와 함께합니다</p>
                    <a href="/petSitterList.do" id="jasehi" class="btn-book animated fadeInUp scrollto jasehi">
                      <div style="width: 170px;height: 59px;border: 1px solid #333333;margin-top: 50px;display: flex;justify-content: center;align-items: center;">
                        <p style="font-size: 17px;color: #cda45e;font-weight: 600;letter-spacing: -0.2px;margin-bottom: 0;">자세히 보기</p>
                        <img src="resources//assets/img/arrow_right.png" style="width: 20px;height: 17px;margin-left: 15px;">
                      </div>
                    </a>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/latte-2-1.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Specials Section -->

    
    <!-- ======= Trainer Section ======= -->
    <section id="chefs" class="chefs">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>이달의 펫시터&훈련사</h2>
          <p>Our Proffesional Trainer</p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="100">
              <img src="resources/assets/img/chefs/trainer-1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김사딕 훈련사</h4>
                  <span>Master Trainer</span>
                  <span>KKC 인증 1급 훈련사</span>
                  <span>KKF 인증 1등 훈련사</span>
                  <span>반려동물관리사 1급</span>
                  <span>반려견행동상담사 1급</span>
                  <span>핸들러 2급</span>
                </div>
                <div class="social">
                  <a href="/oneTrainer.do?tBoardNo=TBOARD-141"><i class="bi bi-twitter"></i></a>
                  <a href="/oneTrainer.do?tBoardNo=TBOARD-141"><i class="bi bi-facebook"></i></a>
                  <a href="/oneTrainer.do?tBoardNo=TBOARD-141"><i class="bi bi-instagram"></i></a>
                  <a href="/oneTrainer.do?tBoardNo=TBOARD-141"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="200">
              <img src="resources/assets/img/chefs/trainer-2-2.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>신조이 훈련사</h4>
                  <span>Master Trainer</span>
                  <span>KKF 인증 1등 훈련사</span>
                  <span>반려동물행동상담사 2급 자격증 보유</span>
                  <span>전문 훈련사 자격증 보유</span>
                  <span>강아지 반려 경험(12년) 인증 완료</span>
                  <span>고양이 반려 경험(7년) 인증 완료</span>
                </div>
                <div class="social">
                  <a href="/oneTrainer.do?tBoardNo=TBOARD-102"><i class="bi bi-twitter"></i></a>
                  <a href="/oneTrainer.do?tBoardNo=TBOARD-102"><i class="bi bi-facebook"></i></a>
                  <a href="/oneTrainer.do?tBoardNo=TBOARD-102"><i class="bi bi-instagram"></i></a>
                  <a href="/oneTrainer.do?tBoardNo=TBOARD-102"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="300">
              <img src="resources/assets/img/chefs/trainer-3-3.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>섭섭 펫시터</h4>
                  <span>Petsitter</span>
                  <span>펫시터 전문가 교육 수료</span>
                  <span>반려동물행동교정사 2급 자격증 보유</span>
                  <span>동물간호복지사 자격증 보유</span>
                  <span>강아지 반려 경험(16년) 인증 완료</span>
                  <span>고양이 반려 경험(11년) 인증 완료</span>
                </div>
                <div class="social">
                  <a href="/petSitterBoardDetail.do?petsitterBoardNo=43"><i class="bi bi-twitter"></i></a>
                  <a href="/petSitterBoardDetail.do?petsitterBoardNo=43"><i class="bi bi-facebook"></i></a>
                  <a href="/petSitterBoardDetail.do?petsitterBoardNo=43"><i class="bi bi-instagram"></i></a>
                  <a href="/petSitterBoardDetail.do?petsitterBoardNo=43"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Chefs Section -->

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>이용후기</h2>
          <p>핫한 똑독캣 후기</p>
        </div>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  아 증말 대박이에요! 우리 아이가 아주 만족했고 저 또한 이 서비스를 다시 이용할 예정이에요. Thank you!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                <h3>Saul Goodman</h3>
                <h4>User</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  훈련사님이 다녀가신 후로 배운대로 교육을 꾸준하게하다보니 분리불안이 많이 없어졌어요!!평상시에는 제가 집에서 어딜가든 따라다니고 뒤에있었는데 이제는 제가 밥을먹던 설거지를하던 저렇게 자기집에서 쳐다보기만해욬ㅋㅋㅋㅋㅋㅋㅋ너무감사합니다ㅜㅜ정말 많은 도움이 되었어요:)!!!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                <h3>이*진</h3>
                <h4>User</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
			                  쌤은 친절하게 자세하게. 잊지않게 잘 설명해주시고.
					아이와 맞춰서 진행해주시니 시간이 가는줄도 모르고 교육을 받았어요
					짧은 시간에 아이가 좋아진 모습이 보이고 행복해하는 모습에서 쌤이 아이에게 맞는 교육을 해주시는구나 느낄수있었습니다
					진심으로 감사드립니다
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                <h3>김*라</h3>
                <h4>User</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  별별 방법을 다 써도 사료를 안먹거나 바닥에 뿌려놓고 먹는둥 마는둥 했었는데 선생님께서 단 1분만에 매직을 보여주셨어요..! 진짜 그동안 뭘한건가 싶더라고여ㅎㅎ 뿐만아니라 짖음 행동도 그동안 몰랐던 저희 강아지의 성향 파악과 동시에 문제해결까지 바로 할 수 있도록 알려주셔서 너무 감사했습니다 ㅠㅠ 이사오면서 분리불안이 걱정되어 신청한거였는데 그 이상으로 도움이 많이 되었어요! 분리불안은 앞으로 알려주신 방법으로 일관되고 침착하게 잘 해보도록 할게요 :) 정말정말 돈이 아깝지 않은 시간이었어요! 너무너무감사함니다 ^^
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                <h3>김*환</h3>
                <h4>User</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  사실 유튜브나 방송등 강아지 훈련 관련에 대해 많이 알아봤었고, 공부도 많이했다고 생각했어요. 하지만 강아지마다 성향과 성격이 모두 다르기에 전문가 선생님의 솔루션을 들어보고자 신청을 하게 되었습니다!
성급하지 않게 하나하나 초코의 문제점과 성향을 파악해주시고, 거기에 대한 솔루션을 제시해주셨는데 제가 완전히 잘못알고있던 부분이 많더라구요! 선생님께서 시간도 일찍 와주셔서 감사했습니다.. (때문에 커피사러갈 시간도없어서 빈손으로 가신게 맘에 걸리지만요..ㅎ) 솔루션 카드도 꼼꼼히 작성해주시고, 앞으로의 방향성까지 알려주셔서 너무 좋은 시간이였습니다. 훈련사님께서 말씀이 조심스럽지만 재밌게 해주셔서 즐거운 시간이였고, 무엇보다 감사한 시간이였습니다! 또 수업으로 만나뵙고싶네요!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                <h3>안*영</h3>
                <h4>User</h4>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->

    <!-- ======= Gallery Section ======= -->
    <section id="gallery" class="gallery">

      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Gallery</h2>
          <p>똑독캣 당신의 반려동물과 함께하는 추억을 남겨드립니다</p>
        </div>
      </div>

      <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-0">

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="resources/assets/img/gallery/DC16-1.png" class="gallery-lightbox" data-gall="gallery-item">
                <img src="resources/assets/img/gallery/DC16-1.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="resources/assets/img/gallery/DC12.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="resources/assets/img/gallery/DC12.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="resources/assets/img/gallery/alexandru-zdrobau-_STvosrG-pw-unsplash.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="resources/assets/img/gallery/alexandru-zdrobau-_STvosrG-pw-unsplash.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="resources/assets/img/gallery/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="resources/assets/img/gallery/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="resources/assets/img/gallery/karsten-winegeart-Qb7D1xw28Co-unsplash.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="resources/assets/img/gallery/karsten-winegeart-Qb7D1xw28Co-unsplash.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="resources/assets/img/gallery/alexander-andrews-KfPwby-UisA-unsplash.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="resources/assets/img/gallery/alexander-andrews-KfPwby-UisA-unsplash.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="resources/assets/img/gallery/latte-1.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="resources/assets/img/gallery/latte-1.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="resources/assets/img/DC4.jpg" class="gallery-lightbox" data-gall="gallery-item">
                <img src="resources/assets/img/DC4.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Gallery Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Contact</h2>
          <p>Contact Us</p>
        </div>
      </div>

      <div data-aos="fade-up">
        <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.901491847199!2d126.8947843503652!3d37.533819333660716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec3afcd675b%3A0x1d3b8e50a735e00a!2z7J2066CI67mM65Sp!5e0!3m2!1sko!2skr!4v1666313599817!5m2!1sko!2skr" frameborder="0" allowfullscreen></iframe>
      </div>

      <div class="container" data-aos="fade-up">

        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Location:</h4>
                <p>서울 영등포구 선유동2로 57 이레빌딩, 19F</p>
              </div>

              <div class="open-hours">
                <i class="bi bi-clock"></i>
                <h4>Open Hours:</h4>
                <p>
                  Monday-Friday:<br>
                  09:00 AM - 18:00 PM
                </p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>DdokDokCat@gmail.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Call:</h4>
                <p>+1 5589 55488 55s</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">
			
			<c:choose>
			<c:when test="${not empty sessionScope.m }">
            <form action="/mainQnaWrite.do" method="post" role="form" class="moonui">
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="dmType" id="dmType" placeholder="문의유형 -> [0 : 결제/취소, 1: 예약/취소  , 2: 기타문의] 숫자로 적어주세요" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="dmContent" rows="8" placeholder="똑독캣에게  문의 할 내용을 적어주세요" required></textarea>
              </div>
              <div class="form-group mt-3">
              	<input type="hidden" name="sender" value="${sessionScope.m.memberId }">
              	<input type="hidden" name="senderCategory" value="M">
              </div>
              <div class="text-center"><button type="submit">문의하기</button></div>
            </form>
			</c:when>
			<c:when test="${not empty sessionScope.p }">
            <form action="/mainQnaWrite.do" method="post" role="form" class="moonui">
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="dmType" id="dmType" placeholder="문의유형 -> [0 : 결제/취소, 1: 예약/취소  , 2: 기타문의] 숫자로 적어주세요" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="dmContent" rows="8" placeholder="똑독캣에게  문의 할 내용을 적어주세요" required></textarea>
              </div>
              <div class="form-group mt-3">
              	<input type="hidden" name="sender" value="${sessionScope.p.PId }">
              	<input type="hidden" name="senderCategory" value="P">
              </div>
              <div class="text-center"><button type="submit">문의하기</button></div>
            </form>
			</c:when>
			<c:otherwise>
			<form action="/mainQnaWrite.do" method="post" role="form" class="moonui">
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="dmType" id="dmType" placeholder="문의유형 -> [0 : 결제/취소, 1: 예약/취소  , 2: 기타문의] 숫자로 적어주세요" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="dmContent" rows="8" placeholder="똑독캣에게  문의 할 내용을 적어주세요" required style="margin-bottom: 20px;"></textarea>
              </div>
              <div class="text-center">
              	<!--  <button type="submit">문의하기</button> -->
              	<a href="/beforeLogin.do" style="background: #cda45e;border: 0;padding: 10px 35px;color: #fff;transition:0.4s;border-radius: 50px;" type="submit">문의하기</a>
              </div>
			</c:otherwise>
			</c:choose>
			
          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->
	
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>