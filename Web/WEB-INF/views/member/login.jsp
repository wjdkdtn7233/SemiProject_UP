<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="up.member.controller.MemberController"%>
<%@ page import="java.util.List"%>
<%
	
%>

<%request.getSession().invalidate();%>
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
.carousel-inner>.carousel-item {
	padding-top: 50%;
}

#logo>img {
	width: 8%;
	height: 8%;
	padding-bottom: 5%;
}

#kakao-login {
	color: #fff;
	background-color: #f6c23e;
}

#kakao-register:hover {
	color: #fff;
	background-color: #f5b616;
}

strong {
	color: #DFB84E;
}

i {
	position: relative;
	left: 0.5rem;
	right: 0.5rem;
}

#quotetest_l {
	position: relative;
	left: 3.5rem;
	top: 5rem;
	font-size: 250%;
}

#quotetest_r {
	position: absolute;
	top: 21rem;
	left: 21.5rem;
	font-size: 250%;
}

#wiseList {
	padding-left:25px;
	padding-right:25px;
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
									<div class="carousel-inner">
										<i id="quotetest_l" class="fas fa-quote-left"
											style="color: #DFB84E"></i>
										<div class="carousel-item active">
											<!--가로-->
											<div id="wiseList" class="h5 text-center text-gray-700">
											</div>
											<div class="h6 text-center">
												<strong>Welcome to UP</strong>
											</div>
										</div>
										<c:forEach items="${data.wiseList}" var="wiseList">
											<div class="carousel-item">
												<!--가로-->
												<div id="wiseList" class="h6 text-center text-gray-600">
													${wiseList}</div>
												<div class="h6 text-center text-gray-900">
													<strong>- 오늘의 명언 -</strong>
												</div>
											</div>
										</c:forEach>
										<!-- 왼쪽 오른쪽 화살표 버튼 -->
										<a class="carousel-control-prev" href="#demo"
											data-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<!-- <span>Previous</span> -->
										</a> <a class="carousel-control-next" href="#demo"
											data-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<!-- <span>Next</span> -->
										</a>
										<!-- / 화살표 버튼 끝 -->
									</div>
									<i id="quotetest_r" class="fas fa-quote-right"
										style="color: #DFB84E"></i>
								</div>
								<!-- 명언 슬라이드 끝 -->
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome!</h1>
									</div>
									<form class="user"
										action="<%=request.getContextPath()%>/member/loginimple.do"
										method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="userId" name="userId" placeholder="Enter your ID...">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="userPwd" name="userPwd"
												placeholder="Enter your password...">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember
													Me</label>
											</div>
										</div>
										<!-- login 성공 시 index(메인 페이지)로 -->
										<button type="submit"
											class="btn btn-primary btn-user btn-block">Login</button>
										<a onclick="kakaoLogin()" id="kakao-login"
											class="btn btn-kakao btn-user btn-block">KAKAO Login </a>
										<!-- <a class="btn btn-user btn-block" id="kakao-login-btn">
											<img src="/up/resources/img/kakao_login_btn_simple_medium.png">
										</a> -->
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgotid.do">ID 찾기 |</a> <a class="small"
											href="forgotpwd.do">비밀번호 찾기</a>
									</div>
									<div class="text-center">
										<a class="small" href="register.do">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="text-center" id="logo">
					<img src="/up/resources/img/upLogo.png" /> <br>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="/up/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/up/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/up/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/up/resources/js/sb-admin-2.min.js"></script>

	<!-- kakao 로그인 -->
	<script type='text/javascript'>
		<c:if test= "${data.isSuccess == 'false'}">;
		alert('로그인에 실패하였습니다. 아이디 또는 비밀번호를 확인하세요.')
		</c:if>
		
		var id;

		function kakaoLogin() {
			// 사용할 앱의 JavaScript 키를 설정
			Kakao.init('cc9504f39ca30003c636d3126203e161');
			// 카카오 로그인 버튼을 생성
			Kakao.Auth.login({
				success : function(v) {
					/* alert("데이터 획득 성공"); */
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(res) {
							//access_token : 사용자 토큰
							//refresh_token : 새로고침 토큰
							//properties.nickname : 사용자 이름
							//properties.id : 고유 아이디
							//kakao_account.profile.nickname : 사용자 이름
							//kakao_account.profile.profile_image_url : 프로필 이미지
							//kakao_account.email : 사용자 이메일
							//connected_at : 로그인 시간
							id = res.id;

							$.ajax({
								url : "/up/member/kakaoidcheck.do",
								type : 'POST',
								data : {
									"id" : id,
								},
								success : function(data) {
									/* alert(data); */
									if(data == '') {
										//값이 없다면 register
										location.href="/up/member/kakaoregister.do?id=" + id;
									} else {
										//값이 있다면 login
										location.href="/up/member/kakaologin.do?id=" + id;
									}
								}

							});

						},
						fail : function(error) {
							console.log(error);
						}
					});
				},
				fail : function(err) {
					alert(JSON.stringify(err));
					alert("카카오톡 로그인 실패");
				}
			});
		};
	</script>
</body>
</html>