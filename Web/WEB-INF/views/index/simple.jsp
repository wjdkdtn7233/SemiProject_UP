<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../include/mainheader.jsp"%>



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
					<div>
						<div
							class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">Habit view</h1>
						</div>

						<div class="card shadow mb-4">
							<div class="card-body">
								<!-- /btn-group -->
								<!-- Topbar Search -->
								<form action="/up/index/searchhabit.do" method="post" id="frm">
									<div class="input-group">
										<div class="input-group-btn">
											<div class="customize-input">
												<select name="select" id="select"
													class="custom-select form-control bg-white custom-radius custom-shadow border-1">
													<option selected value="h_subcategory">전체</option>
													<option value="c_name">습관</option>
												</select>
											</div>
										</div>
										&nbsp; <input type="text" name="searchContent"
											id="searchContent"
											class="form-control bg-light border-0 small"
											placeholder="내용을 입력해주세요." aria-label="Search"
											aria-describedby="basic-addon2" />
										<div class="input-group-append">
											<button class="btn btn-primary" type="submit">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<c:forEach var="habitList" items="${data.habitList}"
							varStatus="status">
							<c:if test="${status.index == 0}">

								<div
									class="d-sm-flex align-items-center justify-content-between mb-4">
									<h1 class="h3 mb-0 text-gray-800">오늘의 습관</h1>
								</div>

								<div class="row">
							</c:if>

							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-info shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class=" font-weight-bold  text-gray-900 text-uppercase mb-1">
													<div class="row mb-2 no-gutters align-items-center">
														<span>카테고리 / &nbsp;</span>
														<span  class="text-info"> <c:choose>
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
														</span>
													</div>
													<div class="row mb-2 no-gutters align-items-center">
													<span>습관 제목 / &nbsp; </span> <span class="text-info">${ habitList.hSubcategory }</span>
													</div>
													<div class="row mb-2 no-gutters align-items-center">
													<span>선택 요일 / &nbsp;</span><span class="text-info">${ habitList.hSelectday }</span>
													</div>
													<div class="row mb-2 no-gutters align-items-center">
													<span>시작 날짜 / &nbsp;</span><span class="text-info">${ habitList.hStartDate }</span>
													</div>
													<div class="row mb-2 no-gutters align-items-center">
													<span>종료 날짜 / &nbsp;</span><span class="text-info">${ habitList.hEndDate }</span>
													</div>
												</div>
												<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 font-weight-bold text-gray-800">달성률 / ${habitList.cPercent}%</div>
												</div>
												</div>
													<div class="col">
														<div class="progress progress-sm mr-2">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: ${habitList.cPercent}%" aria-valuenow="50"
																aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
											
											</div>
											<form action="/up/index/updatehabit.do" method="post"
												class="habitCheck">
												<div class="col-auto">
													<input type="hidden" name="habitNo" value="${habitList.hNo}" />
														<input type="hidden" name="cStateNo" value="${habitList.cStateNo}" />
														<input type="hidden" name="habitYN" id="habitYN" value="${habitList.hCheckYN}" />
														<input type="hidden" name="habitMoney" id="habitMoney" value="${habitList.hMoney}" />
														<input type="hidden" name="habitTime" id="habitTime" value="${habitList.hTime}" />
														<input type="hidden" name="habitPercent" id="habitPercent" value="${habitList.cPercent}" />
														<input type="hidden" name="habitEnd" id="habitEnd" value="${habitList.hEndDate}" />
														<input type="hidden" name="habitCountall" id="habitCountall" value="${habitList.cCountall}" />
													<c:if test="${habitList.hCheckYN == 'n'}">
														<button class="btn btn-circle habitButtonCheck" id="habitCheckBT" type="submit">
															<i class="fas fa-check"></i>
														</button>
													</c:if>
													<c:if test="${habitList.hCheckYN == 'y'}">
														<button class="btn btn-circle habitButtonCheck2" id="habitCheckBT" type="submit">
															<i class="fas fa-check"></i>
														</button>
													</c:if>
													
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${status.last}">
					</div>
					</c:if>
					</c:forEach>

					<c:forEach var="searchList" items="${data.searchList}" varStatus="status">
						<c:if test="${status.index == 0}">
							<div
								class="d-sm-flex align-items-center justify-content-between mb-4">
								<h1 class="h3 mb-0 text-gray-800">검색된 습관</h1>
							</div>
						<div class="row">
						</c:if>

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
												<div
													class=" font-weight-bold  text-gray-900 text-uppercase mb-1">
													<div class="row mb-2 no-gutters align-items-center">
														<span>카테고리 / &nbsp;</span>
														<span  class="text-info"> <c:choose>
															<c:when test="${ searchList.cCode == 1}">
																금연
															</c:when>
															<c:when test="${ searchList.cCode == 2}">
																금주
															</c:when>
															<c:when test="${ searchList.cCode == 3}">
																독서
															</c:when>
															<c:when test="${ searchList.cCode == 4}">
																운동
															</c:when>
															<c:otherwise>
																카테고리
															</c:otherwise>
														</c:choose>
														</span>
													</div>
													<div class="row mb-2 no-gutters align-items-center">
													<span>습관 제목 / &nbsp; </span> <span class="text-info">${ searchList.hSubcategory }</span>
													</div>
													<div class="row mb-2 no-gutters align-items-center">
													<span>선택 요일 / &nbsp;</span><span class="text-info">${ searchList.hSelectday }</span>
													</div>
													<div class="row mb-2 no-gutters align-items-center">
													<span>시작 날짜 / &nbsp;</span><span class="text-info">${ searchList.hStartDate }</span>
													</div>
													<div class="row mb-2 no-gutters align-items-center">
													<span>종료 날짜 / &nbsp;</span><span class="text-info">${ searchList.hEndDate }</span>
													</div>
												</div>
												<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 font-weight-bold text-gray-800">달성률 / ${searchList.cPercent}%</div>
												</div>
												</div>
													<div class="col">
														<div class="progress progress-sm mr-2">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: ${searchList.cPercent}%" aria-valuenow="50"
																aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
											
											</div>
									</div>
								</div>
							</div>
						</div>
						<c:if test="${status.last}">
						</div>
						</c:if>
				</c:forEach>
				
			</div>
			<!-- Bar Chart -->
			<div class="var">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">그래프</h6>
					</div>
					<div class="card-body">
						<div class="chart-bar">
							<canvas id="myBarChart"></canvas>
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
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.all.min.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.all.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.min.js"></script>
	<%@ include file="../include/jsRoot.jsp"%>
	
	<!-- Page level plugins -->
	<script src="/up/resources/vendor/chart.js/Chart.min.js"></script>
	<!-- 바그래프 js  -->
	<script type="text/javascript">
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	function number_format(number, decimals, dec_point, thousands_sep){
		return number;
	}
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: [
				<c:forEach var='habitList' items='${data.habitList}' varStatus="vs">
				'${habitList.hSubcategory}'
				<c:if test="${!vs.last}">,</c:if>
        	    <c:if test="${vs.last}">
      	    	<c:set var="maxlabels" value="${vs.index}" />
        	    </c:if>
          	    </c:forEach>
          	  	<c:forEach var='searchList' items='${data.searchList}' varStatus="vs">
				'${searchList.hSubcategory}'
				<c:if test="${!vs.last}">,</c:if>
      	    	<c:if test="${vs.last}">
      	    	<c:set var="maxlabels" value="${vs.index}" />
        	    </c:if>
        	    </c:forEach>
				
			],
			datasets: [{
				label: "success",
				backgroundColor: "#4e73df",
				hoverBackgroundColor: "#2e59d9",
				borderColor: "#4e73df",
				data: [
					<c:forEach var='habitList' items='${data.habitList}' varStatus="vs">
					
					<c:if test="${vs.first}">
					<c:set var="maxData" value="${habitList.cCount}" />
					</c:if>
					${habitList.cCount}
	        	    <c:if test="${habitList.cCount > maxData}">
	        	    <c:set var="maxData" value="${habitList.cCount}" />
	        	    </c:if>
	        	    
	          	    </c:forEach>
	          	  	<c:forEach var='searchList' items='${data.searchList}' varStatus="vs">
	          	  	
	          	  	<c:if test="${vs.first}">
					<c:set var="maxData" value="${searchList.cCount}" />
					</c:if>
					${searchList.cCount}
	        	    <c:if test="${searchList.cCount > maxData}">
	        	    <c:set var="maxData" value="${searchList.cCount}" />
	        	    </c:if>
	        	    
	          	    </c:forEach>
				]
			}/* ,{
				label: "fail",
				backgroundColor: "#F7464A",
				overBackgroundColor: "#fb314a",
				borderColor: "#F7464A",
				data: [4215, 5312, 6251, 7841, 9821, 14984]
			} */]
//			datasets-end
		},
	//  data-end
		options: {
			maintainAspectRatio: false,
			layout: {
				padding: {
					left: 10,
					right: 25,
					top: 25,
					bottom: 0
				}
			},
	    scales: {
	    	xAxes: [{
	        time: {
	        	unit: 'habit'
	        },
	        gridLines: {
	        	display: true,
	        	drawBorder: true
	        },
	        ticks: {
	        	maxTicksLimit: ${maxlabels}+1
	        },
	        	maxBarThickness: 10,
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: ${maxData}+1,
	          maxTicksLimit: 10,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return number_format(value);
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
	        }
	      }
	    },
	  }
	});

	
	</script>

	<script type="text/javascript">
		$("#frm").submit(function() {
			var input = $("#searchContent").val();

			//검색어 검사
			var regExptitle = /^[가-힣a-zA-Z0-9\s]{2,15}$/;

			function chk(re, e, msg) {
				if (re.test(e)) {
					return true;
				} else {
					e.value = "";
					return false;
				}
			}

			if (!chk(regExptitle, input, //검색어 검사
			"")) {
				swal({
					title : "검색어 확인!", // 제목
					html : "올바른 검색어를 <br>최소 2자 에서 15자 이내로 기입해주세요.", // 내용
					type : "warning", // 종류
					confirmButtonText : "확인",
					confirmButtonColor : "#4e73df", // 확인버튼 표시 문구
				});

				return false;
			}

			return true;
		});

		document.querySelectorAll('.habitCheck').forEach(
			function(v) {
			v.addEventListener('submit',function(event) {
					var check = v.children[0].children[2].value;
					/* 습관이 n상태일경우 습관 체크를할수 있도록 해줌 */

					if (check == 'y') {
						/* setTimeout(function() {
							swal(
									{
									title : "확인", // 제목
									html : "정말로 체크를 <br>해제하시겠습니까?", // 내용
									type : "warning", // 종류
									confirmButtonText : "확인",
									confirmButtonColor : "#4e73df", // 확인버튼 표시 문구
									showCancelButton : true, // 취소버튼 표시 여부
									cancelButtonText : '취소',
									cancelButtonColor : '#4e73df' // 취소버튼 표시 문구
									}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
										if (result.value) { // 확인 버튼이 눌러진 경우
											swal('체크해제',
												'습관 체크를 해제하셨습니다.',
												'success');
											/* v.children[0].children[3].style.background = "#1cc88a";
											v.children[0].children[3].onmouseover = function() {
												v.children[0].children[3].style.boxShadow = "0 0 0 0.2rem rgba(62, 208, 156, 0.5)";
											}
											v.children[0].children[3].onmouseout = function() {
												v.children[0].children[3].style.boxShadow = "none";
											} */
			
											/* $("#habitCheckBT").csubmitss('backgroundColor', '#1cc88a');
											$('#habitCheckBT').hover(function(){
												$(this).css('box-shadow','0 0 0 0.2rem rgba(62, 208, 156, 0.5)');
											}, function() {
												$(this).css('box-shadow','none');
											}); */
											return true;
										} else if (result.dismiss == 'cancel') { // 취소버튼이 눌러진 경우
											swal('취소',
												'이전화면으로 되돌아갑니다.',
												'error');
											event.preventDefault();
										}
									});
						}, 3000); */
							return true;
						} else {
							return true;
						}
				});
			});
	</script>
</body>

</html>