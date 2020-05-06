<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../include/header.jsp"%>
<style>
.rowWrapper {
	width: 100%;
	height: 700px;
	background-color: white;
	letter-spacing: 20%;
}

#icon-size {
	font-size: 7rem;
	color: #002266;
}

#icon-size:hover {
	font-size: 7rem;
	color: #486AAE;
}

.print-informationModify {
	font-size: 15pt;
}


.myPage-menu {
	color: #002266;
}

.myPage-bottom {
	text-align: center;
	width: 25%;
	height: 40%;
	margin: 0 auto;
	border-bottom: 2px solid black;
}

.myPage-printmenu {
	text-align: center;
	width: 25%;
	height: 20%;
	margin: 0 auto;
	font-size: 14pt;
}

</style>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="../include/habitNav.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<%@ include file="../include/top.jsp"%>

				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->


					<!-- Content Row -->
					<div class="rowWrapper">
						<div class="card shadow border-left-primary h-100 w-100 ">
							<div class="card-header">
								<div class="text text-left h3 text-gray-900">
									습관 등록
								</div>
							</div>
							<div class="card-body">
							<form action="/up/habit/habitregistrationimple.do" method="post" id="frm">
								<div
									class="row d-flex align-items-center justify-content-start text-center mt-4 mb-5 ">
									<div class="col-2  font-weight-bold" id="icon-size">
										<span class="btn btn-success btn-icon-split w-100 "> <span
										class="text  font-weight-bold">Habit's Title</span></span>
										
									</div>
									<div class="col-5" id="icon-size">
										
										<input type="text" class="form-control form-control-user"  placeholder="Please enter a title"  id="titleName"/>
									</div>

								</div>
								<hr>
								
								
								</form>
							</div>
						</div>
					</div>

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
	<!-- icon-circle 아이콘을 둥글게 만들어줌 
	card-body 카드형태로 만들어줌
	border-left-primary 디브 왼쪽에 파란선
	card-header 쓰면 카드의 윗부분 분리
-->
	<%@ include file="../include/jsRoot.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>	
	   <script src="/up/resources/vendor/datepicker/datepicker.min.js"></script>
    <script src="/up/resources/vendor/datepicker/i18n/datepicker.ko-KR.js"></script>
	<script>
		
    </script>
</body>
</html>