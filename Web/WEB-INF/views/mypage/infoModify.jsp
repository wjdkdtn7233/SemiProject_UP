<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.size11 {
	height: 650px;
}

.size1 {
	height: 7rem;
	width: 7rem;
}
</style>
<%@ include file="../include/header.jsp"%>
<body id="page-top">

	<div id="wrapper">

		<%@ include file="../include/mypageNav.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../include/top.jsp"%>
				<div class="container-fluid size11">

					<div class="card shadow border-left-primary h-100 w-100 ">
						<div class="card-header">
							<div class="row  ">
								<div class="col-3 ">
									<h1 class="h3 text-gray-900 ">개인정보수정</h1>
								</div>


							</div>

						</div>
						<div class="cardbody ">
							<div class="row   py-5">
								<div
									class="col-2 d-flex align-items-center justify-content-end pl-2">
									<img class="img-profile size1 rounded-circle"
										src="https://source.unsplash.com/QAB-WJcbgJk/60x60">

								</div>

								<div class="col-3 justify-content-start align-self-end">
									<a href="#" class="btn btn-primary "><span class="text">Change
											profile picture</span> </a>
								</div>
							</div>

							<div class="row mb-4">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">ID
									</span>
								</div>
								<div class="col-8 ml-0 pl-0">
									<span class="text text-gray-900 h5 ">wjdkdtn</span>
								</div>
							</div>
							<div class="row  mb-4">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">TITLE
									</span>

								</div>
								<div class="col-2 ml-0 pl-0">
									<select class="custom-select">
										<option>타이틀1</option>
										<option>타이틀2</option>
										<option>타이틀3</option>
										<option>타이틀4</option>
										<option>타이틀5</option>
									</select>
								</div>
							</div>
							<div class="row  mb-4">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">NAME
									</span>

								</div>
								<div class="col-2 ml-0 pl-0">
									<span class="text text-gray-900 mr-5">정상훈 </span>
								</div>
							</div>
							<div class="row  mb-2">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">NICKNAME
									</span>

								</div>
								<div class="col-2 ml-0 pl-0">
									<div class="form-group ">
										<input type="text" class="form-control form-control-user"
											value="huni" placeholder="Enter a nickname to change"
											aria-describedby="emailHelp"">
									</div>
								</div>
							</div>
							<div class="row  mb-4">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">EMAIL
									</span>

								</div>
								<div class="col-3 ml-0 pl-0">
									<div class="form-group ">
										<input type="email" class="form-control form-control-user"
											id="exampleInputEmail" value="wjdkdtn7233@naver.com"
											placeholder="Enter email to change"
											aria-describedby="emailHelp"">
									</div>
								</div>
							</div>
							<div class="row  mb-4">
								<div class="col-4 ml-5 pl-5">
									<a href="#" class="btn btn-success btn-icon-split"> <span
										class="icon text-white-50"> <i class="fas fa-check"></i>
									</span> <span class="text">Information Modified Completed</span>
									</a>
								</div>
							</div>
						</div>
					</div>





				</div>


			</div>
			<%@ include file="../include/footer.jsp"%>
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>
		</div>

	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="../../example/vendor/jquery/jquery.min.js"></script>
	<script src="../../example/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../../example/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../example/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../../example/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../../example/js/demo/chart-area-demo.js"></script>
	<script src="../../example/js/demo/chart-pie-demo.js"></script>
</body>
</html>