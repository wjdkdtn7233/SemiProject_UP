<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.size11 {
	height:auto;
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
				<div class="container-fluid size11 mb-4">

					<div class="card shadow border-left-primary h-100 w-100 ">
						<div class="card-header">
							<div class="row  ">
								<div class="col-3 ">
									<h1 class="h3 text-gray-900 ">습관 히스토리</h1>
								</div>
							</div>
						</div>
						<div class="cardbody ">

							<div class="card  mb-4">

								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>No</th>
													<th>Category</th>
													<th>Details</th>
													<th>Start date</th>
													<th>end date</th>
													<th>achievement rate</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>No</th>
													<th>Category</th>
													<th>Details</th>
													<th>Start date</th>
													<th>end date</th>
													<th>achievement rate</th>
												</tr>
											</tfoot>
											<tbody>
											<c:set var="count" value="1"/>
											<c:forEach var="historyList" items="${data.historyList}">
											<c:set var="no" value="${count}"/>
												<tr>
													<td>${no}</td>
													<td>
														 <c:choose>
                                             				<c:when test="${ historyList.cCode == 1}">
                                                				금연
                                            				</c:when>
                                             				<c:when test="${ historyList.cCode == 2}">
                                                				금주
                                             				</c:when>
                                             				<c:when test="${ historyList.cCode == 3}">
                                                				독서
                                             				</c:when>
                                             				<c:when test="${ historyList.cCode == 4}">
                                                				운동
                                             				</c:when>
                                             				<c:otherwise>
                                                				카테고리
                                             				</c:otherwise></c:choose>
													</td>
													<td>${historyList.hisSubcategory}</td>
													<td>${historyList.hisStartdate}</td>
													<td>${historyList.hisEndDate}</td>
													<td>${historyList.hisPercent}%</td>
												</tr>
											<c:set var="count" value="${count+1}"/>	
											</c:forEach>
												<tr>
													<td>1</td>
													<td>운동</td>
													<td>하루에 두시간만!!</td>
													<td>20.02.01</td>
													<td>20.04.01</td>
													<td>78%</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
						<!-- /.container-fluid -->

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

	<%@ include file="../include/jsRoot.jsp" %>
</body>
</html>