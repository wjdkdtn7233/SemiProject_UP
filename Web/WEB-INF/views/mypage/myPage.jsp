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

.myPage-menu {
	color: #002266;
}

.myPage-bottom {
	text-align: center;
	width: 25%;
	height: 20%;
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

.iconWrapper {
	
}

#icon-size {
	position: relative;
	top: 150px;
	font-size: 7rem;
	float: left;
	margin-left: 10%;
	text-align: center;
	color: #002266;
}

#icon-size:hover {
	position: relative;
	top: 150px;
	font-size: 7rem;
	float: left;
	margin-left: 10%;
	text-align: center;
	color: #486AAE;
}

.print-informationModify {
	font-size: 15pt;
}

</style>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="../include/mypageNav.jsp"%>
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
						<div>
							<hr>
						</div>
						<div class="myPage-menu">
							<br>
							<div class="myPage-bottom">
								<h1 class="display-5 text-center font-weight-bold text-gray-900">마이페이지</h1>
								<br>
							</div>
							<br>
							<div
								class="myPage-printmenu display-5 text-center font-weight-bold text-gray-900">메뉴를
								선택해주세요</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xl-12 col-lg-7">
								<div class="iconWrapper shadow">
									<div class="col-xl col-md-3 col-lg-3 col-sm-3">
										<a href="infoPwdCheck.jsp"><div id="icon-size">
											<i class="fas fa-user-circle mb-3"></i>
											<div class="print-informationModify">개인정보 수정</div>

										</div></a>
									</div>
									<div class="col-xl col-md-3 col-lg-3 col-sm-3">
										<a href="pwPwdCheck.jsp"><div id="icon-size">
											<i class="fas fa-key mb-3"></i>
											<div class="print-informationModify">비밀번호 수정</div>
										</div></a>
									</div>
									<div class="col-xl col-md-3 col-lg-3 col-sm-3">
										<a href="habitHistory.jsp"><div id="icon-size">
											<i class="fas fa-pencil-alt mb-3"></i>
											<div class="print-informationModify">습관히스토리</div>
										</div></a>
									</div>
									<div class="col-xl col-md-3 col-lg-3 col-sm-3">
										<a href="titleList.jsp"><div id="icon-size">
											<i class="far fa-list-alt mb-3"></i>
											<div class="print-informationModify">타이틀 목록</div>
										</div></a>
									</div>
									<div class="col-xl col-md-3 col-lg-3 col-sm-3">
										<a href="memberWithdrawal.jsp"><div id="icon-size">
											<i class="fas fa-user-alt-slash mb-3"></i>
											<div class="print-informationModify">회원 탈퇴</div>
										</div></a>
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
	<!-- icon-circle 아이콘을 둥글게 만들어줌 
	card-body 카드형태로 만들어줌
	border-left-primary 디브 왼쪽에 파란선
	card-header 쓰면 카드의 윗부분 분리
-->
	<%@ include file="../include/jsRoot.jsp" %>
</body>
</html>