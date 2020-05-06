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

<title>WELCOME!!</title>

<!-- Custom fonts for this template-->
<link href="/up/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/up/resources/css/sb-admin-2.min.css" rel="stylesheet">

<style>
#logo {
	width: 20%;
	height: 20%;
}

i {
	font-size:10rem;
	margin-left:35%;
	margin-bottom:5%;
	text-align: center;
	color:#36b9cc;
}

#move {
	margin-top:2%;
	margin-left:44%;
	text-align: center;
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
							<div class="col-lg-2"></div>
							<div class="col-lg-8">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h5 text-gray-700 mb-2">정신 없는 현대인의 바른 습관 권장 사이트</h1>
										 <h1 class="h5 text-gray-700 mb-2"><img id="logo" src="/up/resources/img/upLogo.png"/>에 오신 것을 환영합니다.</h1>
									</div>
									<i class="fas fa-user-circle"></i>
									<div class="text-center"><%=request.getParameter("userId") %> 님, 반갑습니다!</div>
									<div class="text-center">로그인 페이지로 이동합니다.</div>
									<a href="login.do"><button class="btn btn-primary" id="move">이동</button></a>
								</div>
							</div>
						</div>
					</div>
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


</body>
</html>