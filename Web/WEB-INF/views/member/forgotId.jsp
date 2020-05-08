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

<title>FINDING ID</title>

<!-- Custom fonts for this template-->
<link href="/up/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/up/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- popup -->
<link rel="stylesheet"
	href="/up/resources/vendor/sweetalert2/sweetalert2.min.css" />
<link rel="stylesheet"
	href="/up/resources/vendor/datepicker/datepicker.min.css" />

<style>
#logo>img {
	width: 8%;
	height: 8%;
	padding-bottom: 5%;
}

#userEmail {
	display: inline-block;
	margin-right: -30%;
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
										<h1 class="h4 text-gray-900 mb-2">회원 ID를 잊어버리셨나요?</h1>
										<p class="mb-4">회원가입 당시 입력하셨던 이메일 주소를 작성해주세요.</p>
										<p class="mb-4">만약 보내기 클릭 후에도 메일이 도착하지 않았다면, 작성하신 이메일 주소를
											확인하고 다시 이메일 보내기를 클릭하세요</p>
									</div>
									<form class="user"
										action="<%=request.getContextPath()%>/member/findid.do">
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												id="userEmail" name="userEmail" aria-describedby="emailHelp"
												placeholder="Enter your Email Address...">
											<span id="check" class="col-sm-2"
												style="line-height: 50px; font-size: 1vw;">
												<i class="fas fa-search"></i> EMAIL CHECK
											</span>
										</div>
										<button class="btn btn-primary btn-user btn-block">
											메일 보내기</button>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="register.do">회원가입</a>
									</div>
									<div class="text-center">
										<a class="small" href="login.do">이미 회원가입을 하셨나요?</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
	<div class="text-center" id="logo">
		<img src="/up/resources/img/upLogo.png" />
	</div>
	<%@include file="../include/footer.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="/up/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/up/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/up/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/up/resources/js/sb-admin-2.min.js"></script>

	<!-- 날짜와 팝업 js -->
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.all.min.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.all.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.min.js"></script>
	<script src="/up/resources/vendor/datepicker/datepicker.min.js"></script>
	<script src="/up/resources/vendor/datepicker/i18n/datepicker.ko-KR.js"></script>

	<script>
		$("#check").click(function() {

			$.ajax({
				url : '/up/member/sendmailcheck.do',
				type : 'GET',
				data : {
					'userEmail' : $('#userEmail').val(),
				},
				// data 받아오는 것이 성공하면(success) 아래 함수 호출
				success : function(data) {

					if (data != '') {
						swal({
							title : '',
							html : '존재하는 이메일 입니다. <br/> 해당 이메일로 ID를 발송하시겠습니까?',
							type : 'question'
						});
					} else {
						swal({
							title : '', // 제목
							html : '존재하지 않는 이메일 입니다.<br/>메일 주소를 확인해주세요.', // 내용
							type : 'error', // 종류
							showCloseButton : true, // 닫기 버튼 표시 여부
							confirmButtonText : '확인', // 확인버튼 표시 문구
							confirmButtonColor : '#a00' // 확인버튼 색상 - 레드
						});
					}

				}
			})

		});
	</script>

</body>
</html>