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
	<main id="main">
		<section class="content-section" style="width: 100%;margin-top: 80px;padding-top: 120px;background-color: #1a1814;">
			<div class="content-body" style="width: 850px;margin: auto auto 170px;">
				<div class="term-section" style="margin-top: 124px;">
					<h1 style="font-size: 33px;color: #777777;margin-top: 110px;margin-bottom: 71px;">똑독캣 서비스 이용약관</h1>
					<div class="term-contents-section-wrap" style="box-sizing: border-box;">
						<div class="term-contents-section" style="margin-top: 34px;">
							<p style="line-height: 29px;letter-spacing: -0.01em;">제1장 총칙</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">제 1 조 (목적)</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"이 약관은 주식회사 똑독캣(이하 “회사”라 합니다)이 인터넷을 통해 제공되는 ‘똑독캣’ 사이트 등(휴대형 단말기, PC, TV 등의 각종 유무선 장치를 통해 이용하는 경우를 전부 포함함, 이하 “똑독캣”이라 합니다)을 통하여 제공되는 중개서비스 및 기타 정보서비스와 관 련하여 회사와 회원 사이의 권리와 의무, 서비스 이용 절차에 관한 사항을 규정함을 목적으로 합니다."
							</p>
						</div>
						<div class="term-contents-section" style="margin-top: 34px;">
							<p style="line-height: 29px;letter-spacing: -0.01em;">제 2 조 (정의규정) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"① “서비스”라 함은 똑독캣에서 이용할 수 있는 똑독캣 관련 제반 서비스(중개서비스 포함)를 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"② “회원”이라 함은 이 약관을 승인하고 회사와 서비스 이용계약을 체결한 자를 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"③ “이용계약”이라 함은 서비스와 관련하여 회사와 회원 간에 체결하는 계약을 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"④ “아이디(ID)”라 함은 회원의 식별과 회원의 서비스 이용을 위해 필요한 전자우편(e-mail) 주소를 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"⑤ “비밀번호”라 함은 회원이 그 자신의 비밀을 보호하기 위해 회원 본인이 설정한 문자, 숫자 또는 기호 등의 조합을 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"⑥ “펫시팅 서비스”라 함은 반려동물의 소유자를 대신하여 소유자로부터 의뢰를 받아 계약기간 동안 반려동물에 대한 보호, 사료 급여, 목욕, 산책 등의 업무를 수행하는 서비스를 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"⑦ “산책(도그워커) 서비스”라 함은 반려동물의 소유자를 대신하여 소유자로부터 의뢰를 받아 계약기간 동안 반려동물에 대한 산책 업무에 한하여 업무를 수행하는 펫시팅 서비스의 형태를 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"⑧ “교육 서비스”라 함은 반려동물의 소유자를 대신하여 소유자로부터 의뢰를 받아 계약기간 동안 반려 동물에 대한 행동교정 및 교육 등의 업무를 수행하는 서비스를 말합니다. ‘방문교육 서비스’는 훈련 사가 고객의 집으로 직접 방문하여 반려동물에 관한 교육을 진행하는 서비스 형태를 말하고, ‘비대면 영상교육 서비스’는 훈련사가 고객과 비대면으로 영상통화를 하여 반려동물에 관한 교육을 진행하는 서비스 형태를 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"⑨ “펫시터”라 함은 똑독캣를 통해 의뢰하는 반려동물 소유자에게 펫시팅 서비스 상품을 판매하고 해당 펫시팅 서비스를 제공하는 회원을 말합니다."
							</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"⑩ “훈련사”라 함은 똑독캣를 통해 의뢰하는 반려동물 소유자에게 교육 서비스 상품을 판매하고 해당 교육 서비스를 제공하는 회원을 말합니다."
							</p>
						</div>
						<div class="term-contents-section" style="margin-top: 34px;">
							<p style="line-height: 29px;letter-spacing: -0.01em;">제 3 조 (약관의 명시, 효력 및 변경)</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"이 약관은 주식회사 똑독캣(이하 “회사”라 합니다)이 인터넷을 통해 제공되는 ‘똑독캣’ 사이트 등(휴대형 단말기, PC, TV 등의 각종 유무선 장치를 통해 이용하는 경우를 전부 포함함, 이하 “똑독캣”이라 합니다)을 통하여 제공되는 중개서비스 및 기타 정보서비스와 관 련하여 회사와 회원 사이의 권리와 의무, 서비스 이용 절차에 관한 사항을 규정함을 목적으로 합니다."
							</p>
						</div>
						<div class="term-contents-section" style="margin-top: 34px;">
							<p style="line-height: 29px;letter-spacing: -0.01em;">제 4 조 (약관 외 준칙)</p>
							<p style="line-height: 29px;letter-spacing: -0.01em;">
								"이 약관에 명시되지 아니한 사항은 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 기타 관계법령에 따릅니다."
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
    

    

  	</main><!-- End #main -->
	
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
</body>
</html>