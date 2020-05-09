<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../include/header.jsp"%>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="../include/mainNav.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<%@ include file="../include/top.jsp"%>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Simple view</h1>
						<div class="input-group-btn">
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown" aria-expanded="false">
								가나다 <span class="caret"></span>
							</button>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">선택 :</div>
								<a class="dropdown-item" href="#">가나다</a> <a
									class="dropdown-item" href="#">달성도</a>
							</div>
						</div>
					</div>

					<div class="card shadow mb-4">
						<div class="card-body">

							<!-- /btn-group -->
							<!-- Topbar Search -->
							<form class="navbar-search">
								<div class="input-group">
									<div class="input-group-btn">
										<div class="customize-input">
											<select
												class="custom-select form-control bg-white custom-radius custom-shadow border-1">
												<option selected>전체</option>
												<option value="1">습관</option>
											</select>
										</div>
									</div>
									&nbsp; <input type="text"
										class="form-control bg-light border-0 small"
										placeholder="내용을 입력해주세요." aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">오늘의 습관</h1>
					</div>
					<div class="row">
						<c:choose>
							<c:when test="${ data.habitList != 0}">
								<c:forEach var="habitList" items="${data.habitList}"
									varStatus="status">
									<div class="col-xl-3 col-md-6 mb-4">
										<div class="card border-left-info shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div
															class="text-xs font-weight-bold text-info text-uppercase mb-1">
															<span> <c:choose>
																	<c:when test="${ habitList.cCode == 1}">
														금연
														</c:when>
																	<c:when test="${ habitList.cCode == 2}">
														금주
														</c:when>
																	<c:when test="${ habitList.cCode == 3}">
														독서
														</c:when>
																	<c:when test="${ habitList.cCode == 4}">
														운동
														</c:when>
																	<c:otherwise>
														카테고리
														</c:otherwise>
																</c:choose>
															</span> / <span>${ habitList.hSubcategory }</span>
														</div>
														<div class="row no-gutters align-items-center">
															<div class="col-auto">
																<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${habitList.cPercent}%</div>
															</div>
															<div class="col">
																<div class="progress progress-sm mr-2">
																	<div class="progress-bar bg-info" role="progressbar"
																		style="width: ${habitList.cPercent}%"
																		aria-valuenow="50" aria-valuemin="0"
																		aria-valuemax="100"></div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<a href="#" class="btn btn-success btn-circle"> <i
															class="fas fa-check"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="container">
									<h1 class="h3 mb-0 text-center text-gray-800">금일의 습관은
										없습니다.</h1>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					
					<br><br>
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">검색결과</h1>
					</div>
					<div class="row">
						<c:choose>
							<c:when test="${ data.habitList != 0}">
								<c:forEach var="habitList" items="${data.habitList}"
									varStatus="status">
									<div class="col-xl-3 col-md-6 mb-4">
										<div class="card border-left-info shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div
															class="text-xs font-weight-bold text-info text-uppercase mb-1">
															<span> <c:choose>
																	<c:when test="${ habitList.cCode == 1}">
														금연
														</c:when>
																	<c:when test="${ habitList.cCode == 2}">
														금주
														</c:when>
																	<c:when test="${ habitList.cCode == 3}">
														독서
														</c:when>
																	<c:when test="${ habitList.cCode == 4}">
														운동
														</c:when>
																	<c:otherwise>
														카테고리
														</c:otherwise>
																</c:choose>
															</span> / <span>${ habitList.hSubcategory }</span>
														</div>
														<div class="row no-gutters align-items-center">
															<div class="col-auto">
																<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${habitList.cPercent}%</div>
															</div>
															<div class="col">
																<div class="progress progress-sm mr-2">
																	<div class="progress-bar bg-info" role="progressbar"
																		style="width: ${habitList.cPercent}%"
																		aria-valuenow="50" aria-valuemin="0"
																		aria-valuemax="100"></div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<a href="#" class="btn btn-success btn-circle"> <i
															class="fas fa-check"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="container">
									<h1 class="h3 mb-0 text-center text-gray-800">금일의 습관은
										없습니다.</h1>
								</div>
							</c:otherwise>
						</c:choose>
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

	<%@ include file="../include/jsRoot.jsp"%>
</body>

</html>
