<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>UP REGISTER</title>

<!-- Custom fonts for this template-->
<link href="/up/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/up/resources/css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" id="coToolbarStyle"
	href="chrome-extension://cjabmdjcfcfdmffimndhafhblfmpjdpe/toolbar/styles/placeholder.css"
	type="text/css">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
#kakao-register {
	color: #fff;
	background-color: #f6c23e;
}

#kakao-register:hover {
	color: #fff;
	background-color: #f5b616;
}

#logo>img {
	width: 8%;
	height: 8%;
	padding-bottom: 5%;
}
</style>
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-12">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create your Account</h1>
							</div>
							<h6 style="color: red; font-size: 10px;">* 표시가 되어있는 부분은 필수
								기재해야 합니다. 이메일 주소는 ID/비밀번호 찾기 시 필요한 정보입니다. 정확히 입력해주세요.</h6>
							<form class="user"
								action="<%=request.getContextPath()%>/member/emailcheck.do"
								method="post" onsubmit="return validate();">
								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<input type="hidden" class="form-control form-control-user"
											id="userId" name="userId" value="${id}">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="userPwd" name="userPwd" placeholder="* Password">
									</div>
									<div class="col-sm-4">
										<input type="password" class="form-control form-control-user"
											id="repeatPwd" name="repeatPwd" placeholder="* Repeat Password">
									</div>
									<div id="chkPwd" style="line-height: 50px; font-size: 1vw;"></div>
								</div>
								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="userName" name="userName" placeholder="* Name">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="userNickName" name="userNickName"  placeholder="Nickname">
									</div>
								</div>
								<div class="form-group row col-sm-8">
									<input type="email" class="form-control form-control-user"
										id="userEmail" name="userEmail" placeholder="* Email Address">
								</div>
								<button type="submit" id="kakao-register"
									class="btn btn-kakao btn-user"
									style="width: 50%; margin-left: 25%"> Register with KAKAO </button>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="login.do">이미 회원가입을 하셨나요?</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="text-center" id="logo">
		<img src="/up/resources/img/upLogo.png" />
	</div>
	<%@include file="../include/footer.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="/up/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/up/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/up/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/up/resources/js/sb-admin-2.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>

	<script>
		//회원가입 성공여부
		<c:if test= "${data.isSuccess == 'false'}">;
		alert('회원 가입에 실패하였습니다.')
		</c:if>

		// 비밀번호 확인용
		$(function() {
			$('#repeatPwd').keyup(function(){ 
				var pwd1=$("#userPwd").val(); 
				var pwd2=$("#repeatPwd").val(); 
				if(pwd1 != "" || pwd2 != ""){ 
					if(pwd1 == pwd2){ 
						$("#chkPwd").html('<div class="btn btn-success btn-icon-split"><span class="icon text-white-50"><i class="fas fa-check"></i></span><span class="text">비밀번호가 일치합니다.</span></div>');
					}else{ 
						$("#chkPwd").html('<div class="btn btn-danger btn-icon-split"><span class="icon text-white-50"><i class="fas fa-exclamation-triangle"></i></span><span class="text">비밀번호가 일치하지 않습니다.</span></div>');
					} 
				} 
			});
		});

		// 비밀번호, 닉네임, 이메일 정규표현식
		function validate() {
			
			var pw = $('#userPwd');
			var name = $('#userName');
			var nick = $('#userNickName');
			var email = $('#userEmail');
			
			//비밀번호 검사
			var regExpPw = /(?=.*\d{1,50})(?=.*[~!@#$%^&*()_+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}/;
			//닉네임 검사
			var regExpNick = /^(?=.*\d{1,15})(?=.*[가-힣a-zA-Z]{1,15}).{3,15}$/;
			//닉네임에 특수문자가 있는지 검사
			var regExpNick2 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
			//이메일 형식 검사
			var regExpEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;


			function chk(re, e, msg) {
				if (re.test(e.val())) {
					// 입력 시, 정규표현식에 위배되는 것이 없는 경우
					return true;
				} else {
					// 정규표현식에 위배되는 경우
					alert(msg);
					e.value = "";
					e.focus();
					return false;
				}
			}
			
			//비밀번호 검사
			//비밀번호는 영문자 숫자 기호문자의 조합으로 8글자 이상 작성해주세요.
			if (!chk(regExpPw, pw, '비밀번호는 영문자 숫자 기호문자의 조합으로 8글자 이상 작성해주세요.')) {
				return false;
			}
			//닉네임 특수문자 검사
			if (chk(regExpNick2, nick, "닉네임에 특수문자를 포함시킬 수 없습니다.")) {
				return false;
			}
			//닉네임 검사
			if (!chk(regExpNick, nick,
					"닉네임은 영문/한글 과 숫자를 포함하여 3자 에서 15자 이내로 기입해주세요.")) {
				return false;
			}
			//이메일 형식인지 검사
			if (!chk(regExpEmail, email, "이메일 형식이 아닙니다.")) {
				return false;
			}
			
			if (id.val() == '' || pw.val() == '' || name.val() == '' || email.val() == ''){
				return false;
			}

			// 아이디 중복검사, 비밀번호 검사까지 완료되면 전송
			return true;
		}
		
	</script>

</body>
</html>