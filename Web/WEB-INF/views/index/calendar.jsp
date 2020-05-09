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
						<h1 class="h3 mb-0 text-gray-800">Calendar view</h1>
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
												<div id="calendar"></div>
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
    
    <!--This page JavaScript -->
    <script src="/up/resources/calendar/libs/moment/min/moment.min.js"></script>
    <script src="/up/resources/calendar/libs/fullcalendar/dist/fullcalendar.min.js"></script>

	<!-- this page js -->
	<script src="/up/resources/js/calendar/app-style-switcher.js"></script>
	<script src="/up/resources/js/calendar/feather.min.js"></script>
	
	    <script>

	    var btnColor = colorList();
	    var pre = '';
	    var curr = '';
        
        jQuery(document).ready(function() {
            jQuery("#calendar").fullCalendar({
                  defaultDate : "2020-05-01"
                , editable : false // 수정 기능 지원 (false가 편함)
                , eventLimit : true // + more처럼 표현
                // 데이터를 json 방식으로 넣어주기
                , events: [

            	    <c:forEach var='item' items='${data.calHabitList}' varStatus='vs'>
            	    <c:choose>
            	    <c:when test='${vs.first}' ><c:set var = 'pre' value= '${item.hNo}' /></c:when>
            	    <c:otherwise><c:set var = 'curr' value= '${data.calHabitList[vs.index-1].hNo}' /></c:otherwise>
            	    </c:choose>
            	    
					//if('${vs.first}' == ""){
					//	pre = 0;
					//}else{
					//	pre = '${data.calHabitList[vs.index-1].hNo}';
					//}
            	    {
                        id : '${item.hNo}' // 습관번호
                      , title : '${item.hSubcategory}'
                      
                      , start : '${item.hStartDate}'
                      , end : '${item.hEndDate}' // 종료일

                      ,className : colorList()
                    	  
                      
                  },
            	    </c:forEach>
                    

                	

                ]
                /* // ,eventColor: '#378006'
                ,eventClick: function(calEvent, jsEvent, view) {
                    // 여기에 상세 페이지 보여주는 alert 창 보여주기
                    var startDate = new Date(calEvent.start).toLocaleString();
                    if(calEvent.start > calEvent.end){
                        alert('이름: '  + calEvent.title + '\n id: '  + calEvent.id
                    + '\n start: '  + startDate 
                    );
                    }else{
                        var endDate = new Date(calEvent.end).toLocaleString();
                        alert('이름: '  + calEvent.title + '\n id: '  + calEvent.id
                        + '\n start: '  + startDate + '\n end: '  + endDate
                        );
                    }
                } */

            });
            
        });
        
        
        function colorList(){
        	var colorList = [
        		'btn-blue'
        		, 'btn-indigo'
        		, 'btn-purple'
        		, 'btn-pink'
        		, 'btn-red'
        		, 'btn-orange'
        		, 'btn-yellow'
        		, 'btn-green'
        		, 'btn-teal'
        		, 'btn-cyan'
        		, 'btn-gray'
        		, 'btn-gray-dark'
        		, 'btn-primary'
        		, 'btn-secondary'
        		, 'btn-success'
        		, 'btn-info'
        		, 'btn-warning'
        		, 'btn-danger'
        		, 'btn-light'
        		, 'btn-dark'];
        	
        	var idx = Math.floor(Math.random()* ( 20 - 1 + 1 )+1);
        	
        	return colorList[idx];
        	
        	
        }
    </script>
</body>

</html>
