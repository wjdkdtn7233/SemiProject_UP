<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.size11 {
	height: 600px;
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
					<span class="h2  text-gray-900">비밀번호수정</span>
					<div
						class="row align-items-center justify-content-center h-100 px-3 ml-3 mb-5 text-primary  font-weight-bold text-center text-border-weight">
						<div class="col-5 ">
							<div class="card border-left-primary">
								<div class="card-header">개인정보 확인을 위해 비밀번호를 입력해주세요.</div>
								<div class="card-body">
									<div class="form-group">
									<form action="/up/mypage/passwordmodify.do" method="post" onsubmit="return validata();">
										<input type="password" class="form-control form-control-user checkPwd"
											id="exampleInputPassword" placeholder="Password">
									</div>
									<button type="submit"
										class="btn btn-primary btn-user btn-block">확인</button>
									</form>	
								</div>
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
	  <script src="/up/resources/vendor/sweetalert2/sweetalert2.all.min.js"></script>
    <script src="/up/resources/vendor/sweetalert2/sweetalert2.all.js"></script>
    <script src="/up/resources/vendor/sweetalert2/sweetalert2.js"></script>
    <script src="/up/resources/vendor/sweetalert2/sweetalert2.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	 function validata(){
			
		 var userpwd = '${sessionScope.loginInfo.userPwd}';
			var  pw = $('.checkPwd');
			
			if ( pw.val() == "") {
				swal({
	                title: '비밀번호 확인!', // 제목
	                html: "비밀번호를 입력해주세요.", // 내용
	                type: 'warning', // 종류
	                confirmButtonText: '확인',
	                confirmButtonColor: '#4e73df' // 확인버튼 표시 문구
	                
	            });
			
				return false;
			}

			if ( pw.val() != userpwd) {
				swal({
	                title: '비밀번호 확인!', // 제목
	                html: "비밀번호가 맞지 않습니다. 다시 입력해주세요.", // 내용
	                type: 'warning', // 종류
	                confirmButtonText: '확인',
	                confirmButtonColor: '#4e73df' // 확인버튼 표시 문구
	                
	            });
		
				return false;
			}

			return true;
		}
	</script>
</body>
</html>