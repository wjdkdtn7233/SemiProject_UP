<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">

<link rel="stylesheet" href="/up/resources/css/calendar.min.css" />
<link rel="stylesheet"
	href="/up/resources/calendar/fullcalendar.min.css">

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

					<c:forEach var="habitList" items="${data.habitList}"
						varStatus="status">
						<div class="row">
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-info shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-info text-uppercase mb-1">
													<span id="category">카테고리</span> / <span id="habit">습관1</span>
												</div>
												<div class="row no-gutters align-items-center">
													<div class="col-auto">
														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
													</div>
													<div class="col">
														<div class="progress progress-sm mr-2">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: 50%" aria-valuenow="50" aria-valuemin="0"
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
						</div>
					</c:forEach>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="">
									<div class="row">
										<div class="col-lg-1"></div>
										<div class="col-lg-10">
											<div class="card-body b-l calender-sidebar">
												<div id="calendar" class="fc fc-unthemed fc-ltr">
													<div class="fc-toolbar fc-header-toolbar">
														<div class="fc-left">
															<div class="fc-button-group">
																<button type="button"
																	class="fc-prev-button fc-button fc-state-default fc-corner-left"
																	aria-label="prev">
																	<span class="fc-icon fc-icon-left-single-arrow"></span>
																</button>
																<button type="button"
																	class="fc-next-button fc-button fc-state-default fc-corner-right"
																	aria-label="next">
																	<span class="fc-icon fc-icon-right-single-arrow"></span>
																</button>
															</div>
														</div>
														<div class="fc-center">
															<h2>May 2020</h2>
														</div>
														<div class="fc-right">
															<button type="button"
																class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
																disabled="">today</button>
														</div>
														<div class="fc-clear"></div>
													</div>
													<div class="fc-view-container" style="">
														<div class="fc-view fc-month-view fc-basic-view" style="">
															<table class="">
																<thead class="fc-head">
																	<tr>
																		<td class="fc-head-container fc-widget-header">
																			<div class="fc-row fc-widget-header">
																				<table class="">
																					<thead>
																						<tr>
																							<th class="fc-day-header fc-widget-header fc-sun"><span>Sun</span></th>
																							<th class="fc-day-header fc-widget-header fc-mon"><span>Mon</span></th>
																							<th class="fc-day-header fc-widget-header fc-tue"><span>Tue</span></th>
																							<th class="fc-day-header fc-widget-header fc-wed"><span>Wed</span></th>
																							<th class="fc-day-header fc-widget-header fc-thu"><span>Thu</span></th>
																							<th class="fc-day-header fc-widget-header fc-fri"><span>Fri</span></th>
																							<th class="fc-day-header fc-widget-header fc-sat"><span>Sat</span></th>
																						</tr>
																					</thead>
																				</table>
																			</div>
																		</td>
																	</tr>
																</thead>
																<tbody class="fc-body">
																	<tr>
																		<td class="fc-widget-content">
																			<div class="fc-scroller fc-day-grid-container"
																				style="overflow: hidden; height: auto;">
																				<div class="fc-day-grid fc-unselectable">
																					<div
																						class="fc-row fc-week fc-widget-content fc-rigid">
																						<div class="fc-bg">
																							<table class="">
																								<tbody>
																									<tr>
																										<td
																											class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
																											data-date="2020-04-26"></td>
																										<td
																											class="fc-day fc-widget-content fc-mon fc-other-month fc-past"
																											data-date="2020-04-27"></td>
																										<td
																											class="fc-day fc-widget-content fc-tue fc-other-month fc-past"
																											data-date="2020-04-28"></td>
																										<td
																											class="fc-day fc-widget-content fc-wed fc-other-month fc-past"
																											data-date="2020-04-29"></td>
																										<td
																											class="fc-day fc-widget-content fc-thu fc-other-month fc-past"
																											data-date="2020-04-30"></td>
																										<td
																											class="fc-day fc-widget-content fc-fri fc-past"
																											data-date="2020-05-01"></td>
																										<td
																											class="fc-day fc-widget-content fc-sat fc-past"
																											data-date="2020-05-02"></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																						<div class="fc-content-skeleton">
																							<table>
																								<thead>
																									<tr>
																										<td
																											class="fc-day-top fc-sun fc-other-month fc-past"
																											data-date="2020-04-26"><span
																											class="fc-day-number">26</span></td>
																										<td
																											class="fc-day-top fc-mon fc-other-month fc-past"
																											data-date="2020-04-27"><span
																											class="fc-day-number">27</span></td>
																										<td
																											class="fc-day-top fc-tue fc-other-month fc-past"
																											data-date="2020-04-28"><span
																											class="fc-day-number">28</span></td>
																										<td
																											class="fc-day-top fc-wed fc-other-month fc-past"
																											data-date="2020-04-29"><span
																											class="fc-day-number">29</span></td>
																										<td
																											class="fc-day-top fc-thu fc-other-month fc-past"
																											data-date="2020-04-30"><span
																											class="fc-day-number">30</span></td>
																										<td class="fc-day-top fc-fri fc-past"
																											data-date="2020-05-01"><span
																											class="fc-day-number">1</span></td>
																										<td class="fc-day-top fc-sat fc-past"
																											data-date="2020-05-02"><span
																											class="fc-day-number">2</span></td>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td class="fc-event-container" colspan="2"></td>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<div
																						class="fc-row fc-week fc-widget-content fc-rigid">
																						<div class="fc-bg">
																							<table class="">
																								<tbody>
																									<tr>
																										<td
																											class="fc-day fc-widget-content fc-sun fc-past"
																											data-date="2020-05-03"></td>
																										<td
																											class="fc-day fc-widget-content fc-mon fc-past"
																											data-date="2020-05-04"></td>
																										<td
																											class="fc-day fc-widget-content fc-tue fc-past"
																											data-date="2020-05-05"></td>
																										<td
																											class="fc-day fc-widget-content fc-wed fc-past"
																											data-date="2020-05-06"></td>
																										<td
																											class="fc-day fc-widget-content fc-thu fc-past"
																											data-date="2020-05-07"></td>
																										<td
																											class="fc-day fc-widget-content fc-fri fc-today "
																											data-date="2020-05-08"></td>
																										<td
																											class="fc-day fc-widget-content fc-sat fc-future"
																											data-date="2020-05-09"></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																						<div class="fc-content-skeleton">
																							<table>
																								<thead>
																									<tr>
																										<td class="fc-day-top fc-sun fc-past"
																											data-date="2020-05-03"><span
																											class="fc-day-number">3</span></td>
																										<td class="fc-day-top fc-mon fc-past"
																											data-date="2020-05-04"><span
																											class="fc-day-number">4</span></td>
																										<td class="fc-day-top fc-tue fc-past"
																											data-date="2020-05-05"><span
																											class="fc-day-number">5</span></td>
																										<td class="fc-day-top fc-wed fc-past"
																											data-date="2020-05-06"><span
																											class="fc-day-number">6</span></td>
																										<td class="fc-day-top fc-thu fc-past"
																											data-date="2020-05-07"><span
																											class="fc-day-number">7</span></td>
																										<td class="fc-day-top fc-fri fc-today "
																											data-date="2020-05-08"><span
																											class="fc-day-number">8</span></td>
																										<td class="fc-day-top fc-sat fc-future"
																											data-date="2020-05-09"><span
																											class="fc-day-number">9</span></td>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td></td>
																										<td class="fc-event-container" colspan="2"></td>
																										<td></td>
																										<td></td>
																										<td class="fc-event-container"></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<div
																						class="fc-row fc-week fc-widget-content fc-rigid">
																						<div class="fc-bg">
																							<table class="">
																								<tbody>
																									<tr>
																										<td
																											class="fc-day fc-widget-content fc-sun fc-future"
																											data-date="2020-05-10"></td>
																										<td
																											class="fc-day fc-widget-content fc-mon fc-future"
																											data-date="2020-05-11"></td>
																										<td
																											class="fc-day fc-widget-content fc-tue fc-future"
																											data-date="2020-05-12"></td>
																										<td
																											class="fc-day fc-widget-content fc-wed fc-future"
																											data-date="2020-05-13"></td>
																										<td
																											class="fc-day fc-widget-content fc-thu fc-future"
																											data-date="2020-05-14"></td>
																										<td
																											class="fc-day fc-widget-content fc-fri fc-future"
																											data-date="2020-05-15"></td>
																										<td
																											class="fc-day fc-widget-content fc-sat fc-future"
																											data-date="2020-05-16"></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																						<div class="fc-content-skeleton">
																							<table>
																								<thead>
																									<tr>
																										<td class="fc-day-top fc-sun fc-future"
																											data-date="2020-05-10"><span
																											class="fc-day-number">10</span></td>
																										<td class="fc-day-top fc-mon fc-future"
																											data-date="2020-05-11"><span
																											class="fc-day-number">11</span></td>
																										<td class="fc-day-top fc-tue fc-future"
																											data-date="2020-05-12"><span
																											class="fc-day-number">12</span></td>
																										<td class="fc-day-top fc-wed fc-future"
																											data-date="2020-05-13"><span
																											class="fc-day-number">13</span></td>
																										<td class="fc-day-top fc-thu fc-future"
																											data-date="2020-05-14"><span
																											class="fc-day-number">14</span></td>
																										<td class="fc-day-top fc-fri fc-future"
																											data-date="2020-05-15"><span
																											class="fc-day-number">15</span></td>
																										<td class="fc-day-top fc-sat fc-future"
																											data-date="2020-05-16"><span
																											class="fc-day-number">16</span></td>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td></td>
																										<td></td>
																										<td class="fc-event-container"></td>
																										<td></td>
																										<td class="fc-event-container"></td>
																										<td></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<div
																						class="fc-row fc-week fc-widget-content fc-rigid">
																						<div class="fc-bg">
																							<table class="">
																								<tbody>
																									<tr>
																										<td
																											class="fc-day fc-widget-content fc-sun fc-future"
																											data-date="2020-05-17"></td>
																										<td
																											class="fc-day fc-widget-content fc-mon fc-future"
																											data-date="2020-05-18"></td>
																										<td
																											class="fc-day fc-widget-content fc-tue fc-future"
																											data-date="2020-05-19"></td>
																										<td
																											class="fc-day fc-widget-content fc-wed fc-future"
																											data-date="2020-05-20"></td>
																										<td
																											class="fc-day fc-widget-content fc-thu fc-future"
																											data-date="2020-05-21"></td>
																										<td
																											class="fc-day fc-widget-content fc-fri fc-future"
																											data-date="2020-05-22"></td>
																										<td
																											class="fc-day fc-widget-content fc-sat fc-future"
																											data-date="2020-05-23"></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																						<div class="fc-content-skeleton">
																							<table>
																								<thead>
																									<tr>
																										<td class="fc-day-top fc-sun fc-future"
																											data-date="2020-05-17"><span
																											class="fc-day-number">17</span></td>
																										<td class="fc-day-top fc-mon fc-future"
																											data-date="2020-05-18"><span
																											class="fc-day-number">18</span></td>
																										<td class="fc-day-top fc-tue fc-future"
																											data-date="2020-05-19"><span
																											class="fc-day-number">19</span></td>
																										<td class="fc-day-top fc-wed fc-future"
																											data-date="2020-05-20"><span
																											class="fc-day-number">20</span></td>
																										<td class="fc-day-top fc-thu fc-future"
																											data-date="2020-05-21"><span
																											class="fc-day-number">21</span></td>
																										<td class="fc-day-top fc-fri fc-future"
																											data-date="2020-05-22"><span
																											class="fc-day-number">22</span></td>
																										<td class="fc-day-top fc-sat fc-future"
																											data-date="2020-05-23"><span
																											class="fc-day-number">23</span></td>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td rowspan="2"></td>
																										<td class="fc-event-container"></td>
																										<td rowspan="2"></td>
																										<td rowspan="2"></td>
																										<td rowspan="2"></td>
																										<td rowspan="2"></td>
																										<td rowspan="2"></td>
																									</tr>
																									<tr>
																										<td class="fc-event-container"></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<div
																						class="fc-row fc-week fc-widget-content fc-rigid">
																						<div class="fc-bg">
																							<table class="">
																								<tbody>
																									<tr>
																										<td
																											class="fc-day fc-widget-content fc-sun fc-future"
																											data-date="2020-05-24"></td>
																										<td
																											class="fc-day fc-widget-content fc-mon fc-future"
																											data-date="2020-05-25"></td>
																										<td
																											class="fc-day fc-widget-content fc-tue fc-future"
																											data-date="2020-05-26"></td>
																										<td
																											class="fc-day fc-widget-content fc-wed fc-future"
																											data-date="2020-05-27"></td>
																										<td
																											class="fc-day fc-widget-content fc-thu fc-future"
																											data-date="2020-05-28"></td>
																										<td
																											class="fc-day fc-widget-content fc-fri fc-future"
																											data-date="2020-05-29"></td>
																										<td
																											class="fc-day fc-widget-content fc-sat fc-future"
																											data-date="2020-05-30"></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																						<div class="fc-content-skeleton">
																							<table>
																								<thead>
																									<tr>
																										<td class="fc-day-top fc-sun fc-future"
																											data-date="2020-05-24"><span
																											class="fc-day-number">24</span></td>
																										<td class="fc-day-top fc-mon fc-future"
																											data-date="2020-05-25"><span
																											class="fc-day-number">25</span></td>
																										<td class="fc-day-top fc-tue fc-future"
																											data-date="2020-05-26"><span
																											class="fc-day-number">26</span></td>
																										<td class="fc-day-top fc-wed fc-future"
																											data-date="2020-05-27"><span
																											class="fc-day-number">27</span></td>
																										<td class="fc-day-top fc-thu fc-future"
																											data-date="2020-05-28"><span
																											class="fc-day-number">28</span></td>
																										<td class="fc-day-top fc-fri fc-future"
																											data-date="2020-05-29"><span
																											class="fc-day-number">29</span></td>
																										<td class="fc-day-top fc-sat fc-future"
																											data-date="2020-05-30"><span
																											class="fc-day-number">30</span></td>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<div
																						class="fc-row fc-week fc-widget-content fc-rigid">
																						<div class="fc-bg">
																							<table class="">
																								<tbody>
																									<tr>
																										<td
																											class="fc-day fc-widget-content fc-sun fc-future"
																											data-date="2020-05-31"></td>
																										<td
																											class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
																											data-date="2020-06-01"></td>
																										<td
																											class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																											data-date="2020-06-02"></td>
																										<td
																											class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																											data-date="2020-06-03"></td>
																										<td
																											class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																											data-date="2020-06-04"></td>
																										<td
																											class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																											data-date="2020-06-05"></td>
																										<td
																											class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																											data-date="2020-06-06"></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																						<div class="fc-content-skeleton">
																							<table>
																								<thead>
																									<tr>
																										<td class="fc-day-top fc-sun fc-future"
																											data-date="2020-05-31"><span
																											class="fc-day-number">31</span></td>
																										<td
																											class="fc-day-top fc-mon fc-other-month fc-future"
																											data-date="2020-06-01"><span
																											class="fc-day-number">1</span></td>
																										<td
																											class="fc-day-top fc-tue fc-other-month fc-future"
																											data-date="2020-06-02"><span
																											class="fc-day-number">2</span></td>
																										<td
																											class="fc-day-top fc-wed fc-other-month fc-future"
																											data-date="2020-06-03"><span
																											class="fc-day-number">3</span></td>
																										<td
																											class="fc-day-top fc-thu fc-other-month fc-future"
																											data-date="2020-06-04"><span
																											class="fc-day-number">4</span></td>
																										<td
																											class="fc-day-top fc-fri fc-other-month fc-future"
																											data-date="2020-06-05"><span
																											class="fc-day-number">5</span></td>
																										<td
																											class="fc-day-top fc-sat fc-other-month fc-future"
																											data-date="2020-06-06"><span
																											class="fc-day-number">6</span></td>
																									</tr>
																								</thead>
																								<tbody>
																									<tr>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</div>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
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

	<%@ include file="../include/jsRoot.jsp"%>

	<!-- this page js -->
	<script src="/up/resources/js/calendar/app-style-switcher.js"></script>
	<script src="/up/resources/js/calendar/feather.min.js"></script>
	<script src="/up/resources/js/calendar/pages/calendar/cal-init.min.js"></script>
</body>

</html>
