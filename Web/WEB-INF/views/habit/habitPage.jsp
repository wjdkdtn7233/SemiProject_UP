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

	letter-spacing: 20%;
}
.wappers{
	background-image: url("/up/resources/img/habit-bg1.png");
	background-size:cover;
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
.ligth-bg:hover{
	background-image:url("/up/resources/img/light.png");
	background-size:cover;
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
						<div class="card shadow border-left-primary h-100 w-100 wappers ">
							<div class="myPage-menu">
								<br>
								<div class="myPage-bottom">
									<h1
										class="display-5 text-center font-weight-bold text-gray-900">습관 페이지</h1>
									<br>
								</div>
								<br>
								<div
									class="myPage-printmenu display-5 text-center font-weight-bold text-gray-900">메뉴를
									선택해주세요</div>
							</div>
							<div class="card-body">
								<div
									class="row d-flex align-items-center justify-content-around text-center h-100">
									<div class="col-4">
									<a href="/up/habit/habitregistration.do">
										<div id="icon-size">
										<i class="fas fa-folder-plus"></i>
										<div class="text h5 mt-3 font-weight-bold">습관 등록</div>
										</div>
									</a>
									</div>
									<div class="col-4">
									<a href="/up/habit/habitremove.do">
									<div id="icon-size">
										<i class="fas fa-tools"></i>
										<div class="text h5 mt-3 font-weight-bold">습관 목록 및 삭제</div>
									</div>	
									</a>
									</div>

								</div>
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
</body>
</html>