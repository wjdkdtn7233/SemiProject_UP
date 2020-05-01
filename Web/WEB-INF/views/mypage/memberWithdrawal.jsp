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
									<h1 class="h3 text-gray-900 ">회원 탈퇴</h1>
								</div>


							</div>

						</div>
						<div class="cardbody ">
							<div class="row ml-5 my-4">
								<div class="col-9">
									<div class="card border-left-danger">
										<div class="card-body shadow">
											<i class="far fa-lightbulb"
												style="color: red; margin-right: 5px"></i> <span
												class="text text-gray-900 "> 고객님의 정보를 확인 후 비밀번호를
												입력하시고 동의 체크 후 회원탈퇴 버튼을 눌러주세요.</span>
										</div>
									</div>
								</div>
							</div>

							<div class="row mb-4 mt-3">
								<div class="col-2  ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">ID
									</span>
								</div>
								<div class="col-3 ml-0 pl-0">
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
							<div class="row  mb-4">
								<div class="col-2 ml-5 pl-5">
									<span class="text text-gray-900 mr-5 font-weight-bold">EMAIL
									</span>

								</div>
								<div class="col-3 ml-0 pl-0">
									<span class="text text-gray-900 mr-5">wjdkdtn7233@naver.com
									</span>
								</div>
							</div>
							<!-- 비밀번호 입력 -->
							<form action="/up/mypage/deletemember.do" method="post"
								onsubmit="return validata();">
								<div class="row  mb-4">
									<div class="col-2 ml-5 pl-5">
										<span class="text text-gray-900 mr-5 font-weight-bold">PASSWORD
										</span>

									</div>
									<div class="col-3 ml-0 pl-0">
										<div class="form-group">
											<input type="password"
												class="form-control form-control-user inputPwd1"
												id="exampleInputPassword" placeholder="Password">
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
												id="exampleInputPassword" placeholder="Password">
										</div>
									</div>
									<!-- 비밀번호 틀렸다는 경고창 div -->
									<div class="col-4 ml-3 px-2">
										<span class="text-white bg-danger" id="info"></span>
										<!-- 이 버튼이 뜨고 누르면 적혀있던 password가 지워짐 -->
									</div>
								</div>
								<div class="row  mb-4 justify-content-center">
									<div class="col-4 mr-5">
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"  data-toggle="modal"
												data-target="#memberLeave"> <label
													class="custom-control-label h6" for="customCheck">Do
													you agree to withdraw from membership?</label>
											</div>
										</div>
									</div>
								</div>
								<!-- 저장 버튼 저장완료되면 alert창 띄우고 마이페이지 메인으로 이동 -->
								<div class="row  mb-4">
									<div class="col-4 ml-5 pl-5">
										<button class="btn btn-success btn-icon-split">
											<span class="icon text-white-50"> <i class="fas fa-check"></i>
											</span> <span class="text">Membership Withdrawal</span>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>





				</div>


			</div>
			<%@ include file="../include/footer.jsp"%>
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>
		</div>
		
		
		
		<!-- 회원탈퇴 Modal-->
	<div class="modal fade" id="memberLeave" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content text-gray-900">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">정말 회원탈퇴를 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">지금 회원탈퇴를 하시게되면 다시 되돌릴 수 없습니다.<br>취소버튼을 누르시면 마이페이지로 돌아갑니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" onclick="checkBox()" type="button"
						data-dismiss="modal">Yes</button>
					<a class="btn btn-primary" href="/up/mypage/mypage.do">Cancel</a>
				</div>
			</div>
		</div>
	</div>







	</div>


	<%@ include file="../include/jsRoot.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function checkBox(){
			$('#customCheck').prop('checked',true);
			$('#info').html("");
		}
	
	
		function validata() {
			var userpwd = '${sessionScope.loginInfo.userPwd}';
			var pwd1 = $('.inputPwd1');
			var pwd2 = $('.inputPwd2');

			pwd1.on('click', function() {
				$('#info').html("");
			});
			pwd2.on('click', function() {
				$('#info').html("");
			});

			if (pwd1.val() == '') {
				$('#info').html(
						"<i class='fas fa-exclamation-triangle'></i>"
								+ " 비밀번호를 입력해주세요.");
				return false;
			}
			if (pwd1.val() != pwd2.val()) {
				$('#info').html(
						"<i class='fas fa-exclamation-triangle'></i>"
								+ " 입력한 비밀번호가 서로 일치하지 않습니다.");
				return false;
			}

			//로그인 세션값 가져와서 입력된 패스워드와 비교
			if (userpwd != pwd1.val()) {
				$('#info').html(
						"<i class='fas fa-exclamation-triangle'></i>"
								+ " 입력한 비밀번호가 틀렸습니다. ");
				return false;
			}

			if (!$('#customCheck').is(':checked')) {
				$('#info').html(
						"<i class='fas fa-exclamation-triangle'></i>"
								+ " 동의란에 체크가 되어있지 않습니다.");
				return false;
			}

			return true;
		}
	</script>
</body>
</html>