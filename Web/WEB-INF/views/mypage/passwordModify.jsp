<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
</style>
<%@ include file="../include/header.jsp"%>
<body id="page-top">

	<div id="wrapper">

		<%@ include file="../include/mypageNav.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../include/top.jsp"%>
				<div class="container-fluid size11">

					<div class="card shadow border-left-primary h-100 w-100 ">
						<div class="card-header">
							<div class="row  ">
								<div class="col-3 ">
									<h1 class="h3 text-gray-900 ">비밀번호수정</h1>
								</div>


							</div>

						</div>
						<form action="/up/mypage/pwdcheck.do" method="post" onsubmit="return validata();">
						<div class="cardbody ">

							<div class="row mb-4 mt-5">
								<div class="col-2  ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">ID
									</span>
								</div>
								<div class="col-8 ml-0 pl-0">
									<span class="text text-gray-900 h5 ">wjdkdtn</span>
								</div>
							</div>

							<div class="row  mb-4">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">NAME
									</span>

								</div>
								<div class="col-2 ml-0 pl-0">
									<span class="text text-gray-900 mr-5">정상훈 </span>
								</div>
							</div>
							<!-- 비밀번호 입력 -->
							<div class="row  mb-4">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">PASSWORD
									</span>

								</div>
								<div class="col-3 ml-0 pl-0">
									<div class="form-group">
										<input type="password"
											class="form-control form-control-user inputPwd1"
											id="exampleInputPassword" placeholder="Password" name="newPwd"/>
									</div>
								</div>
							</div>
							<!-- 비밀번호 확인 -->
							<div class="row  mb-4">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">REPEAT
										PASSWORD </span>

								</div>
								<div class="col-3 ml-0 pl-0">
									<div class="form-group">
										<input type="password"
											class="form-control form-control-user inputPwd2"
											id="exampleInputPassword" placeholder="Password"/>
									</div>
								</div>
								<!-- 비밀번호 틀렸다는 경고창 div -->
								<div class="col-5 ml-3 px-2">
										 <span class="text-white text center bg-danger" id="info"></span>
									<!-- 이 버튼이 뜨고 누르면 적혀있던 password가 지워짐 -->
								</div>
							</div>
							<!-- 저장 버튼 저장완료되면 alert창 띄우고 마이페이지 메인으로 이동 -->
							<div class="row  mb-4">
								<div class="col-4 ml-5 pl-5">
									<button  class="btn btn-success btn-icon-split" id="submitBtn" type="submit"> <span
										class="icon text-white-50"> <i class="fas fa-check"></i>
									</span> <span class="text">Password Modified Completed</span>
									</button>
								</div>
							</div>
						</div>
						</form>
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
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function validata() {
			//?=.* 어느자리에 있든? 
			var input1 = $('.inputPwd1');
			var input2 = $('.inputPwd2');

			var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$/;
			$('.inputPwd1').on('click', function() {
				$('#info').html("");
			});

			$('.inputPwd2').on('click', function() {
				$('#info').html("");
			});
			

			function chk(re, e, msg) {

				if (re.test(e.val())) {

					return true;
				} else {
					$('#info').html("<i class='fas fa-exclamation-triangle'></i>" +msg);
					e.value = "";
					e.focus();
					return false;
				}
			}

			//닉네임 검사
			if (!chk(regExpPw, input1, "비밀번호는 영문,숫자,특수기호를 포함한 8자리 이상으로 입력해주세요.")) {
				return false;
			}

			if (!chk(regExpPw, input2, "비밀번호는 영문,숫자,특수기호를 포함한 8자리 이상으로 입력해주세요.")) {
				return false;
			}

			if (input1.val() != input2.val()) {
				$('#info').html("<i class='fas fa-exclamation-triangle'></i>" +"입력한 비밀번호가 서로 맞지 않습니다.");
				return false;
			}
			
			/* if( input1.val() == 현재 사용중인 비밀번호 ){
				alert('현재 사용중인 비밀번호와 같습니다.');
				return false;
			} */
			
			return true;
		}
	</script>
</body>
</html>