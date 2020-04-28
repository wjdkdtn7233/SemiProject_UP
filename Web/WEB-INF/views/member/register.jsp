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
<style>	
	#kakao-register {
		color:#fff;
		background-color:#f6c23e;
	}
	
	#kakao-register:hover {
		color:#fff;
		background-color:#f5b616;
	}
	
	#logo > img {
		width:8%;
		height:8%;
		padding-bottom:5%;
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
							<h6 style="color: red; font-size: 10px;">* 표시가 되어있는 부분은 필수 기재해야 합니다. 이메일 주소는 ID/비밀번호 찾기 시 필요한 정보입니다. 정확히 입력해주세요.</h6>
							<form class="user">
								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="userId" placeholder="* ID">
									</div>
									<span class="col-sm-4" style="line-height:50px; font-size:1vw;" onclick="idCheck()">
										<i class="fas fa-search"></i>     ID CHECK     
										<span id="idCheckMsg">사용 가능한 ID 입니다.</span> <!-- id 중복 체크 -->
									</span>
								</div>
								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="userPwd" placeholder="* Password">
									</div>
									<div class="col-sm-4">
										<input type="password" class="form-control form-control-user"
											id="repeatPwd" placeholder="* Repeat Password">
									</div>
									<span id="pwdCheckMsg" style="line-height:50px; font-size:1vw;">비밀번호가 동일하지 않습니다.</span> <!-- 비밀번호 체크 -->
								</div>
								<div class="form-group row">
									<div class="col-sm-4 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="userName" placeholder="Name">
									</div>
								</div>
								<div class="form-group row col-sm-8">
									<input type="email" class="form-control form-control-user"
										id="userEmail" placeholder="* Email Address">
								</div>
								<a href="emailcheck.do" class="btn btn-primary btn-user" style="width:50%; margin-left:25%">submit</a>
								<hr>
								<a href="index.html" id="kakao-register" class="btn btn-kakao btn-user" style="width:50%; margin-left:25%">
									Register with KAKAO
								</a>
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
		<img src="/up/resources/img/upLogo.png"/>
	</div>
	<%@include file="../include/footer.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="/up/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/up/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/up/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/up/resources/js/sb-admin-2.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.0.js" integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc=" crossorigin="anonymous"></script>
	
	<script>
	
		var idCheckFlag = false;
		
		//회원가입 성공여부
		<c:if test= "${data.isSuccess == 'false'}">;
			alert('회원 가입에 실패하였습니다.')
		</c:if>
		
		function idCheck() {
			$.ajax({
				url : '/up/member/idcheck.do',
				type : 'GET',
				data : $('#userId').serialize(),
				// data 받아오는 것이 성공하면(success) 아래 함수 호출
				success : function(data) {
					
					if(data != '') {
						// 입력한 id와 동일한 값이 있다면
						document.querySelector('#idCheckMsg').textContent = '';
						document.querySelector('#idCheckMsg').textContent = data + '는 이미 존재하는 아이디입니다.'
						idCheckFlag = false;
					} else {
						document.querySelector('#idCheckMsg').textContent = '';
						document.querySelector('#idCheckMsg').textContent = '사용 가능한 아이디입니다.'
						idCheckFlag = true;
					}
					
				}
				
			});
		}
		
		function validate() {
			var pw = document.getElementById('userPwd');
			var regExpPw = /(?=.*\d{1,50})(?=.*[~!@#$%^&*()_+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}/;
			
			function chk(re,e,msg) {
				if(re.test(e.value)) {
					// 비밀번호 입력 시, 정규표현식에 위배되는 것이 없는 경우
					return true;
				} else {
					// 정규표현식에 위배되는 경우
					alert(msg);
					e.value = "";
					e.focus();
					return false;
				}
			}
			
			if(!idCheckFlag) {
				alert("아이디 중복 검사를 해주세요.");
				return false;
			}
			
			//비밀번호 검사
			//비밀번호는 영문자 숫자 기호문자의 조합으로 8글자 이상 작성해주세요.
			if(!chk(regExpPw, pw, '비밀번호는 영문자 숫자 기호문자의 조합으로 8글자 이상 작성해주세요.')) {
				return false;
			}
			
			// 아이디 중복검사, 비밀번호 검사까지 완료되면 전송
			return true;
		}
	
	</script>

</body>
</html>