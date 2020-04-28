<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>UP LOGIN_MAIN</title>

<!-- Custom fonts for this template-->
<link href="/up/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/up/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>	
	.carousel-inner > .carousel-item {
		padding-top : 50%;
	}
	
	
	#logo > img {
		width:8%;
		height:8%;
	}
</style>
</head>
<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<!-- 로그인 옆 이미지 부분 > 명언 슬라이드 -->
							<div class="col-lg-6 d-none d-lg-block">
								<div id="demo" class="carousel slide" data-ride="carousel">
									<div class="carousel-inner"> <!-- 슬라이드 쇼 -->
										<div class="carousel-item active"> <!--가로-->
											<div class="h5 text-center text-gray-700">test sentences1111</div>
											<div class="h6 text-center text-gray-900"><strong>test name</strong></div>
										</div>
										<div class="carousel-item">
											<div class="h5 text-center text-gray-700">test sentences1111</div>
											<div class="h6 text-center text-gray-900"><strong>test name</strong></div>
										</div>
										<div class="carousel-item">
											<div class="h5 text-center text-gray-700">test sentences1111</div>
											<div class="h6 text-center text-gray-900"><strong>test name</strong></div>
										</div>
										<!-- 왼쪽 오른쪽 화살표 버튼 -->
										<a class="carousel-control-prev" href="#demo" data-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<!-- <span>Previous</span> -->
										</a>
										<a class="carousel-control-next" href="#demo" data-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<!-- <span>Next</span> -->
										</a> <!-- / 화살표 버튼 끝 -->
										<!-- 인디케이터 -->
										<ul class="carousel-indicators">
											<li data-target="#demo" data-slide-to="0" class="active"></li>
											<!--0번부터시작-->
											<li data-target="#demo" data-slide-to="1"></li>
											<li data-target="#demo" data-slide-to="2"></li>
										</ul> <!-- 인디케이터 끝 -->
								</div>
							</div>
						<!-- 명언 슬라이드 끝 -->
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome!</h1>
									</div>
									<form class="user">
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												id="exampleInputEmail" aria-describedby="emailHelp"
												placeholder="Enter Email Address...">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="exampleInputPassword" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input" id="customCheck">
												<label class="custom-control-label" for="customCheck">Remember Me</label>
											</div>
										</div>
										<!-- login 성공 시 index(메인 페이지)로 -->
										<a href="/up/index/index.do"
											class="btn btn-primary btn-user btn-block"> Login </a>
										<a href="index.html"
											class="btn btn-kakao btn-user btn-block"> KAKAO Login </a>
										<!-- <a class="btn btn-user btn-block" id="kakao-login-btn">
											<img src="/up/resources/img/kakao_login_btn_simple_medium.png">
										</a> -->
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-id.html">ID 찾기</a> <a
											class="small" href="forgot-password.html">비밀번호 찾기</a>
									</div>
									<div class="text-center">
										<a class="small" href="register.html">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="text-center" id="logo">
					<img src="/up/resources/img/upLogo.png"/>
				</div>
			
			</div>

		</div>

	</div>
	<footer class="sticky-footer">
		<div class="copyright" style="color:#36b9cc; text-align:center;">Copyright 2020 <strong>UP</strong></div>
	</footer>

	<!-- Bootstrap core JavaScript-->
	<script src="/up/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/up/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/up/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- kakao 로그인 -->
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정
		Kakao.init('cc9504f39ca30003c636d3126203e161');
		// 카카오 로그인 버튼을 생성
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				alert(JSON.stringify(authObj));
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		//]]>
	</script>
</body>
</html>