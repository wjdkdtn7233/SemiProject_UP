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
					</div>

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
    
    <!--This page JavaScript(calendar) -->
    <script src="/up/resources/calendar/libs/moment/min/moment.min.js"></script>
    <script src="/up/resources/calendar/libs/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="/up/resources/js/calendar/pages/calendar/cal-init.min.js"></script>

	<!-- this page js -->
	<script src="/up/resources/js/calendar/app-style-switcher.js"></script>
	<script src="/up/resources/js/calendar/feather.min.js"></script>

	    <script>
	    
       /*  var colorArray = ['#e83e8c'
        		, '#6610f2'
        		, '#6f42c1'
        		, '#20c9a6'
        		, '#e74a3b'
        		, '#orange'
        		, '#yellow'
        		, '#1cc88a'
        		, '#4e73df'
        		, '#36b9cc'
        		, '#858796'
        		, '#5a5c69'
        		, '#4e73df'
        		, '#858796'
        		, '#1cc88a'
        		, '#36b9cc'
        		, '#f6c23e'
        		, '#e74a3b'
        		, '#f8f9fc'
        		, '#5a5c69']; */
        

        jQuery(document).ready(function() {
            jQuery("#calendar").fullCalendar({
                  defaultDate : "2020-05-01"
                , editable : false // 수정 기능 지원 (false가 편함)
                , eventLimit : true // + more처럼 표현
                // 데이터를 json 방식으로 넣어주기
                , events: [
            	   
              	    <c:forEach var='item' items='${data.calHabitList}' varStatus="vs">
            	    {
                        id : '${item.hNo}' // 습관번호
                      , title : '${item.hSubcategory}'
                      , textColor : '#eaecf4' 
                      , backgroundColor : '#028c6a'
                      , start : '${item.hStartDate}'
                      , end : '${item.hEndDate}' // 종료일
		                  	  
                    }
            	    <c:if test="${!vs.last}">
            	    ,
            	    </c:if>
            	    
                    
              	    </c:forEach>
                ]
            });
        });
      
    </script>
</body>

</html>
