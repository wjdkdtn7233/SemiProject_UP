<%@ page isErrorPage="true"%>
<%
	response.setStatus(200);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404</title>
<script src="/up/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/up/resources/css/sb-admin-2.min.css">
<link rel="stylesheet"
	href="/up/resources/vendor/fontawesome-free/css/all.css">

</head>
<body style="height: 100%; width: 100%;">
	
	<div class="">
		<img class="uplogo" src="/up/resources/img/upLogo.png"
			style="height: 50px; margin: 10px;" alt="up로고">
	</div>
	<div class="container text-center"
		style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="">
			<img class="404" src="/up/resources/img/404.png" alt="404에러 이미지">
		</div>
		<div>
			<button onclick="question_click();"
				class="btn btn-primary btn-icon-split">
				<span class="icon text-white-50" style="padding: .75rem;"> <i
					class="fas fa-arrow-left "></i>
				</span> <span class="text">이전 페이지로 돌아가기</span>
			</button>
		</div>
	</div>

	<script>
		function question_click() {
			window.history.back();
		}
	</script>


</body>

</html>