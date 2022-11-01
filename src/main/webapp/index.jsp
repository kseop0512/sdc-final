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

    <!-- ======= Why Us Section ======= 
    <section id="why-us" class="why-us">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Why Us</h2>
          <p>우리 똑독캣을 선택하는 이유</p>
        </div>

        <div class="row">

          <div class="col-lg-4">
            <div class="box" data-aos="zoom-in" data-aos-delay="100">
              <span>01</span>
              <h4>Lorem Ipsum</h4>
              <p>Ulamco laboris nisi ut aliquip ex ea commodo consequat. Et consectetur ducimus vero placeat</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in" data-aos-delay="200">
              <span>02</span>
              <h4>Repellat Nihil</h4>
              <p>Dolorem est fugiat occaecati voluptate velit esse. Dicta veritatis dolor quod et vel dire leno para dest</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in" data-aos-delay="300">
              <span>03</span>
              <h4> Ad ad velit qui</h4>
              <p>Molestiae officiis omnis illo asperiores. Aut doloribus vitae sunt debitis quo vel nam quis</p>
            </div>
          </div>

        </div>

      </div>
    </section> End Why Us Section -->

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
              <li data-filter=".filter-starters">산책&돌봄</li>
              <li data-filter=".filter-salads">훈련</li>
              <li data-filter=".filter-specialty">패키지</li>
            </ul>
          </div>
        </div>

        <div class="row menu-container" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-6 menu-item filter-starters">
            <img src="resources/assets/img/menu/WELC.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">산책/돌봄 30분</a><span>₩38,000</span>
            </div>
            <div class="menu-ingredients">
              30분 (방문 산책 + 방문 돌봄)
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-specialty">
            <img src="resources/assets/img/menu/logo-15수정본.jpg" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">똑독캣 패키지 1</a><span>₩109,000</span>
            </div>
            <div class="menu-ingredients">
              산책/돌봄 30분 + 영상 교육(60분)으로 이뤄진 패키지
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-starters">
            <img src="resources/assets/img/menu/WELC.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">산책/돌봄 60분</a><span>₩54,000</span>
            </div>
            <div class="menu-ingredients">
              60분 (방문 산책 + 방문 돌봄)
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-salads">
            <img src="resources/assets/img/menu/DC16.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">영상 교육 (60분)</a><span>₩80,000</span>
            </div>
            <div class="menu-ingredients">
              방문 교육 대비 부담없는 비용 / 거주지에 외부인 방문이 불편하신 분 / 자유롭게 원하는 스케줄에 교육 가능 / 짧은 시간(60분)내에 효율적인 교육

            </div>
          </div>

          <div class="col-lg-6 menu-item filter-specialty">
            <img src="resources/assets/img/menu/logo-15수정본.jpg" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">똑독캣 패키지 2</a><span>₩200,000</span>
            </div>
            <div class="menu-ingredients">
              산책/돌봄 60분 + 방문 교육(100분)으로 이뤄진 패키지
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-starters">
            <img src="resources/assets/img/menu/WELC.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">산책/돌봄 120분</a><span>₩100,000</span>
            </div>
            <div class="menu-ingredients">
              120분 (방문 산책 + 방문 돌봄)
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-salads">
            <img src="resources/assets/img/menu/DC16.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">방문 교육 (100분)</a><span>₩150,000</span>
            </div>
            <div class="menu-ingredients">
              직접 현장에서 핸들링 및 코치 가능 / 산책 또는 야외 교육이 필요한 경우 / 공격성으로 직접 핸들링이 힘든 경우 / 오랜 시간(100분)집중적인 교육
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-salads">
            <img src="resources/assets/img/menu/DC16.png" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">종합 교육</a><span>₩210,000</span>
            </div>
            <div class="menu-ingredients">
              영상 교육 (60분) + 방문 교육 (100분)
            </div>
          </div>

          <div class="col-lg-6 menu-item filter-specialty">
            <img src="resources/assets/img/menu/logo-15수정본.jpg" class="menu-img" alt="">
            <div class="menu-content">
              <a href="#">똑독캣 패키지 3</a><span>₩300,000</span>
            </div>
            <div class="menu-ingredients">
              2회에 나눠 진행되는 산책/돌봄 120분 + 영상 교육 (60분) + 방문 교육 (100분)
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
                      이제는 와요 펫시터에게 강아지의 안전하고 즐거운 산책을 맡겨보세요</p>
                    <p>언제 어디서든 원하시는 방법으로 '똑독캣' 방문 펫시터 서비스를 예약할 수 있어요</p>
                    <a href="#" id="jasehi" class="btn-book animated fadeInUp scrollto jasehi">
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
                    <a href="#" id="jasehi" class="btn-book animated fadeInUp scrollto jasehi">
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
                    <a href="#" id="jasehi" class="btn-book animated fadeInUp scrollto jasehi">
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
                    <p class="fst-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                    <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                    <a href="#" id="jasehi" class="btn-book animated fadeInUp scrollto jasehi">
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
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="200">
              <img src="resources/assets/img/chefs/trainer-2-2.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>박춘자 펫시터</h4>
                  <span>Petsitter</span>
                  <span>펫시터 전문가 교육 수료</span>
                  <span>반려동물행동상담사 2급 자격증 보유</span>
                  <span>전문 펫시터 자격증 보유</span>
                  <span>강아지 반려 경험(12년) 인증 완료</span>
                  <span>고양이 반려 경험(7년) 인증 완료</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="300">
              <img src="resources/assets/img/chefs/trainer-3-3.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>안드레유</h4>
                  <span>Petsitter</span>
                  <span>펫시터 전문가 교육 수료</span>
                  <span>반려동물행동교정사 2급 자격증 보유</span>
                  <span>동물간호복지사 자격증 보유</span>
                  <span>강아지 반려 경험(16년) 인증 완료</span>
                  <span>고양이 반려 경험(11년) 인증 완료</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Chefs Section -->

    <!-- ======= Book A Table Section ======= 
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Reservation</h2>
          <p>Book a Table</p>
        </div>

        <form action="forms/book-a-table.php" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">
          <div class="row">
            <div class="col-lg-4 col-md-6 form-group">
              <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="phone" id="phone" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group mt-3">
              <input type="text" name="date" class="form-control" id="date" placeholder="Date" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group mt-3">
              <input type="text" class="form-control" name="time" id="time" placeholder="Time" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group mt-3">
              <input type="number" class="form-control" name="people" id="people" placeholder="# of people" data-rule="minlen:1" data-msg="Please enter at least 1 chars">
              <div class="validate"></div>
            </div>
          </div>
          <div class="form-group mt-3">
            <textarea class="form-control" name="message" rows="5" placeholder="Message"></textarea>
            <div class="validate"></div>
          </div>
          <div class="mb-3">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your booking request was sent. We will call back or send an Email to confirm your reservation. Thank you!</div>
          </div>
          <div class="text-center"><button type="submit">Book a Table</button></div>
        </form>

      </div>
    </section> End Book A Table Section -->

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>이용후기</h2>
          <p>실시간 똑독캣 후기</p>
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
                <h4>Ceo &amp; Founder</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                <h3>Sara Wilsson</h3>
                <h4>Designer</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                <h3>Jena Karlis</h3>
                <h4>Store Owner</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                <h3>Matt Brandon</h3>
                <h4>Freelancer</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="resources/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                <h3>John Larson</h3>
                <h4>Entrepreneur</h4>
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

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="이름" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="문의제목" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="8" placeholder="문의내용" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">문의하기</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->
	
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>