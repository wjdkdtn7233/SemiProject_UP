<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="/up/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="/up/resources/vendor/datepicker/datepicker.min.css">
<!-- Custom styles for this template-->
<link href="/up/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link
	href="/up/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js"></script>
<script type="text/javascript">
  WebFontConfig = {
    custom: {
        families: ['Nanum Gothic'],
        urls: ['http://fonts.googleapis.com/earlyaccess/nanumgothic.css']
    }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })(); 
 </script>
<style>

 
.container-fluid-background {
	background-color: #EFF3FC;
	font-family: "Nanum Gothic", sans-serif;
}

.indexlog {
	height: 120px !important;
	width: 140px !important;
}

.contentlog {
	height: 30px !important;
	width: 35px !important;
}

.gold {
	color: #F0BD36;
}

.blue {
	color: #283666;
}

</style>
</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="../include/mainNav.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content" class="container-fluid-background">

				<%@ include file="../include/top.jsp"%>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="container">
						<div class="text-center">
							<img class="indexlog"
								src="https://cdn.discordapp.com/attachments/704300026628800522/704300563189334036/upLogo_remove_background.png" />
						</div>
					</div>
					<br>
					<div class="container">

						<h1 class="h5  text-center font-weight-bold gold">
							<i class="fas fa-chevron-left"></i> &nbsp;Unfulfilled
							Potential&nbsp; <i class="fas fa-chevron-right"></i>
						</h1>

					</div>
					<br>
					<div class="container">
						<h1 class="h5 text-gray-700 font-weight-bold text-center">당신의 발현되지 못한 잠재력을</h1>
					</div>
					<div class="container">
						<h1 class="h5 text-gray-700  font-weight-bold text-center">이끌어 드립니다</h1>
					</div>
					<div class="container">
						<h1 class="h5 text-gray-700 font-weight-bold text-center">- - - - - - - - - - - -
							- - -</h1>
					</div>
					<br>
					<div class="container gold">
						<h1 class="h5 text-center font-weight-bold">
							<i class="fas fa-quote-left "> </i>
							습관이란 인간으로 하여금 그 어떤 일도 할 수 있게
							만들어 준다 <i class="fas fa-quote-right"></i>
						</h1>
					</div>
					<div class="container gold">
						<h1 class="h6 text-center font-weight-bold">- 도스토예프스키</h1>
					</div>
					<br>
					<div class="container">
						<h1 class="h6 text-center text-gray-700">어릴 적부터 우리는 좋은 습관을
							만들기 위해 많은 노력을 합니다</h1>
					</div>
					<div class="container">
						<h1 class="h6 text-center text-gray-700">세상에는 습관에 대한 많은 명언들이
							있고, 성공한 많은 사람들이 자신의 성공 비결을 습관에서 나온다고 말합니다</h1>
					</div>

					<div class="container">
						<h1 class="h6 text-center text-gray-700">습관의 중요성에 대한 글들이 만연하고
							실제로 알고 있음에도 그것을 실천하기는 매우 어렵습니다</h1>
					</div>
					<div class="container">
						<h1 class="h6 text-center text-gray-700">왜냐하면 우리는 무의적으로 눈에
							보이는 보상과 결과가 있어야 강한 동기부여가 되며</h1>
					</div>
					<div class="container">
						<h1 class="h6 text-center text-gray-700">실천에 옮기는 힘이 커지기 때문입니다</h1>
					</div>
					<div class="container">
						<h1 class="h6 text-center text-gray-700">좋은 습관을 들이고 싶은 당신에게</h1>
					</div>
					<div class="container">
						<h1 class="h6 text-center text-gray-700">
							저희 <img class="contentlog"
								src="https://cdn.discordapp.com/attachments/704300026628800522/704300563189334036/upLogo_remove_background.png" />
							팀이 다음과 같은 기술로 당신의 동기부여가 되어드리겠습니다
						</h1>
					</div>
					<br>
					<div class="container">
						<h1 class="h5 text-gray-700 font-weight-bold text-center">- - - - - - - - - - - -
							- - -</h1>
					</div>
					<br>
					<div class="container">
						<div class="row blue">

							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 py-2 text-center">
									<div class="card-body">
									<i class="fas fa-folder-plus fa-5x py-2"></i>
										<h1 class="h5">습관</h1>
										<h1 class="h5">등록하기</h1>

									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 py-2 text-center">
									<div class="card-body">
										<i class="far fa-id-card fa-5x py-2"></i>

										<h1 class="h5">마이페이지</h1>
										<h1 class="h5">확인하기</h1>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 py-2 text-center">
									<div class="card-body">
										<i class="fas fa-chart-bar fa-5x py-2"></i>

										<h1 class="h5">한눈으로</h1>
										<h1 class="h5">보기</h1>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 py-2 text-center">
									<div class="card-body">
									<i class="fas fa-scroll fa-5x py-2"></i>
										<h1 class="h5">타이틀</h1>
										<h1 class="h5">획득하기</h1>
									</div>
								</div>
							</div>
						</div>
					</div>

					<br>
					<div class="container">
						<h1 class="h5 text-gray-700 font-weight-bold text-center">- - - - - - - - - - - -
							- - -</h1>
					</div>
					<br>
					<div class="container">
						<h1 class="h6 text-center text-gray-700">
							당신의 성공을 <img class="contentlog"
								src="https://cdn.discordapp.com/attachments/704300026628800522/704300563189334036/upLogo_remove_background.png" />
							팀이 응원합니다.
						</h1>
					</div>
					<br> <br>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="../include/footer.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/jsRoot.jsp"%>
</body>

</html>
