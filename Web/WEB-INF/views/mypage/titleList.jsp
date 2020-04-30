<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.titleSize {
	height: 3rem;
	width: 8rem;
}

.carousel-item {
	height: 30vh;
	min-height: 350px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.indicators-color {
	background-color: #D9E5FF !important;
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


					<div class="card shadow  h-100 w-100 ">
						<div class="card-header">
							<div class="row  ">
								<div class="col-3 ">
									<h1 class="h3 text-gray-900 ">타이틀 목록</h1>
								</div>


							</div>

						</div>

						<div class="cardbody ">
							<div class="row mt-3 ml-5 text-left text-gray-900 ">
								<ul>
									<li>특정조건을 완수하면 관련된 타이틀을 획득할 수 있습니다 .</li>
									<li>획득한 타이틀은 개인정보 수정란에서 설정할 수 있습니다 .</li>
									<li>다양한 타이틀을 획득하고 자랑해보세요 !</li>
								</ul>
								<div class="col10"></div>
							</div>
							<div id="carouselExampleIndicators"
								class="carousel slide indicators-color" data-interval="false"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<!-- 반복문 걸어주기 -->
									<c:forEach var="titleList" items="${data.titleList}" varStatus="status">
										<c:if test="${status.last}">
											<c:set var="num" value="${titleList.TCode/3}"/>
											<fmt:parseNumber var="parseNum" value="${num}" integerOnly="true"/>
										</c:if>
									</c:forEach>
									<c:forEach var="i" begin="1" end="${parseNum + 1}">	
											<c:if test="${i==1}">
												<li data-target="#carouselExampleIndicators"
													data-slide-to="${i-1}" class="active"></li>
											</c:if>
											<c:if test="${i!= 1}">
												<li data-target="#carouselExampleIndicators"
													data-slide-to="${i-1}"></li>
											</c:if>
										<!-- 
									<li data-target="#carouselExampleIndicators" data-slide-to="0"
										class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
									</c:forEach>
								</ol>
								<div class="carousel-inner " role="listbox">
									<!-- Slide One - Set the background image for this slide in the line below -->
									<c:forEach var="tList" items="${data.titleList}" varStatus="status">
										<c:if test="${tList.TCode%3 == 1 }">
											
											<c:if test="${tList.TCode == 1 }">
												<div class="carousel-item active">
												<div class="row h-100 align-items-center justify-content-center">
											</c:if>
											<c:if test="${tList.TCode != 1 }">
												<div class="carousel-item">
												<div class="row h-100 align-items-center justify-content-center">
											</c:if>
															
										</c:if>
										<!-- 반복문 걸어주기 -->
											<div class="col-3 mx-2">
												<div class="card shadow ">
													<div class="card-body ">
														<div class="row mb-3">
															<div
																class="col-12  titleSize text-center text-white justify-content-center " style="background:${tList.TColor}">
																<span class="mt-3 h5 align-middle"
																	style="position: relative; top: 10px">${tList.TName}</span>
															</div>
														</div>
														<div class="row mb-3">
															<div class="col-12 text-gray-900 text-center">
																<span>${tList.TComment}</span>
															</div>
														</div>
														<div class="row mb-3 ">
															<div class="col-12 text-gray-900 text-center">
																<span>습득조건 -> </span><span class="ml-3">${tList.TCondition}</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										<c:if test="${tList.TCode%3 == 0}">
											</div>
										</div>	
										</c:if>
										<c:if test="${tList.TCode%3 != 0}">
											<c:if test="${status.last}">
												</div>
											</div>	
											</c:if>
										</c:if>
							</c:forEach>

						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
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


	<%@ include file="../include/jsRoot.jsp"%>
</body>
</html>