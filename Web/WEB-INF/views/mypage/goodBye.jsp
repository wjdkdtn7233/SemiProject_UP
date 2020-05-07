<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.size11 {
	width: 100%;
	height: 850px;
}

#bgimg {
	width: 100%;
	height: 100%;
}
</style>
<%@ include file="../include/header.jsp"%>
<body id="page-top">
	<div class="container-fluid size11  ">
		
		<br>
		<br>
		<br>
		<div class="container">
			<div class="text-center mt-5">
				<img class="indexlog"
					src="https://cdn.discordapp.com/attachments/704300026628800522/704300563189334036/upLogo_remove_background.png" />
			</div>
		</div>
		<br> <br>
		<br>

		<div class="container">
			<h1 class="h1 text-center text-gray-900 font-weight-bold">지금까지
				저희 UP을 사랑해 주셔서 진심으로 감사드립니다.</h1>
		</div>
		<br>
		<br>
		<div class="container d-flex justify-content-center">
			<button onclick="question_click();"
				class="btn btn-warning btn-icon-split">
				<span class="icon text-white-50" style="padding: .75rem;"> <i
					class="fas fa-arrow-left "></i>
				</span> <span class="text">로그인 페이지로 이동</span>
			</button>
		</div>

		
	
		<br>
		<br>
		<div class="container">
			<div class="text-center">
				<img class="indexlog" style="width: 200px; height: 150px;"
					src="/up/resources/img/png-transparent-typography-calligraphy-poster-thank-you-text-logo-monochrome.png" />
			</div>
		</div>
	</div>
	<br>
	

	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/jsRoot.jsp"%>
	<script>
		function question_click() {
			location.href = "/up/member/login.do";
		}
	</script>
</body>
</html>