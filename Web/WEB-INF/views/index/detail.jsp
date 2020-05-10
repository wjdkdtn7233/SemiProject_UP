<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

				<!-- container-fluid -->
				<div class="container-fluid">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Detail view</h1>
					</div>
					<div class="card shadow mb-4">
							<div class="card-body">
								<!-- /btn-group -->
								<!-- Topbar Search -->
								<form action="/up/index/searchdeatailhabit.do" method="post" id="frm">
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
					<!-- detail-content -->

					<!-- card-start -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h5 class="m-0 font-weight-bold text-primary text-center">습관1</h5>
						</div>
						<div class="card-body">
							<div class="row py-4">
								<div class="col-xl-6 col-md-6 mb-6">
									<div class="card border-left-info shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center py-2">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-success text-uppercase mb-1">달성율</div>
													<div class="row no-gutters align-items-center">
														<div class="col-auto">
															<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
														</div>
														<div class="col">
															<div class="progress progress-sm mr-2">
																<div class="progress-bar bg-success" role="progressbar"
																	style="width: 50%" aria-valuenow="50" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-auto">
													<i class="fas fa-laugh-beam fa-2x text-gray-300"></i>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-xl-6 col-md-6 mb-6">
									<div class="card border-left-info shadow h-100 py-2">
										<div class="card-body">
											<h1 class="h5">습관 시작일 : 2020년 01월 03일</h1>
											<h1 class="h5 py-2">습관 종료일 : 2020년 12월 31일</h1>
											<h1 class="h5">
												종료일까지 <span class="h2">D - 365 </span>일 남음
											</h1>
										</div>
									</div>
								</div>

							</div>
							<!-- card end -->

							<!-- Bar Chart -->
							<div class="var">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
									</div>
									<div class="card-body">
										<div class="chart-bar">
											<canvas id="myBarChart"></canvas>
										</div>
										<hr>
										Styling for the bar chart can be found in the
										<code>/up/resources/js/demo/chart-bar-demo.js</code>
										file.
									</div>
								</div>
							</div>
							<div class="var">
								<div class="card shadow mb-4">
									<!-- Card Header - Dropdown -->
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="chart-pie pt-4">
											<canvas id="myPieChart"></canvas>
										</div>
										<hr>
										Styling for the donut chart can be found in the
										<code>/js/demo/chart-pie-demo.js</code>
										file.
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End of detail-content -->
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

	<!-- Page level plugins -->
	<script src="/up/resources/vendor/chart.js/Chart.min.js"></script>
	
	<!-- 원형그래프 js -->
	<script type="text/javascript">
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	// Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: ["Success", "Fail"],
	    datasets: [{
	      data: [60, 40],
	      backgroundColor: ['#4e73df', '#F7464A'],
	      hoverBackgroundColor: ['#2e59d9', '#fb314a'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
	</script>
	
	<!-- 바그래프 js  -->
	<script type="text/javascript">
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

/* 	function number_format(number, decimals, dec_point, thousands_sep) {
	  // *     example: number_format(1234.56, 2, ',', ' ');
	  // *     return: '1 234,56'
	  number = (number + '').replace(',', '').replace(' ', '');
	  var n = !isFinite(+number) ? 0 : +number,
	    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	    s = '',
	    toFixedFix = function(n, prec) {
	      var k = Math.pow(10, prec);
	      return '' + Math.round(n * k) / k;
	    };
	  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
	  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	  if (s[0].length > 3) {
	    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	  }
	  if ((s[1] || '').length < prec) {
	    s[1] = s[1] || '';
	    s[1] += new Array(prec - s[1].length + 1).join('0');
	  }
	  return s.join(dec);
	} */
	function number_format(number, decimals, dec_point, thousands_sep){
		
		return number;
	}
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ["January", "February", "March", "April", "May", "June"],
			datasets: [{
				label: "success",
				backgroundColor: "#4e73df",
				hoverBackgroundColor: "#2e59d9",
				borderColor: "#4e73df",
				data: [4215, 5312, 6251, 7841, 9821, 14984]
			},{
				label: "fail",
				backgroundColor: "#F7464A",
				overBackgroundColor: "#fb314a",
				borderColor: "#F7464A",
				data: [4215, 5312, 6251, 7841, 9821, 14984]
			}]
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
	        	unit: 'month'
	        },
	        gridLines: {
	        	display: true,
	        	drawBorder: true
	        },
	        ticks: {
	        	maxTicksLimit: 6
	        },
	        	maxBarThickness: 25,
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: 15000,
	          maxTicksLimit: 5,
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
	
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.all.min.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.all.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.min.js"></script>
	<%@ include file="../include/jsRoot.jsp"%>

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
	</script>
</body>

</html>
