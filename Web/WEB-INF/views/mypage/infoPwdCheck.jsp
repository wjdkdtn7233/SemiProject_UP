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

					<div
						class="row align-items-center justify-content-center h-100 px-3 ml-3 mb-5 text-primary  font-weight-bold text-center text-border-weight">
						<div class="col-5 ">
							<div class="card border-left-primary">
								<div class="card-header">개인정보 확인을 위해 비밀번호를 입력해주세요.</div>
								
								<div class="card-body">
								<form action="/up/mypage/infomodify.do" method="post" onsubmit="return formCheck();">
									<div class="form-group">
									
										<input type="password" class="form-control form-control-user checkPwd"
											id="exampleInputPassword" placeholder="Password"/>
									</div>
									<input
										class="btn btn-primary btn-user btn-block" type="submit" value="확인">
									
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

<script src="https://code.jquery.com/jquery-3.5.0.js" integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc=" crossorigin="anonymous"></script>
<script type="text/javascript">



	  
	  function formCheck(){
			
			var pwd = document.querySelector('#exampleInputPassword').value;
			if(pwd == ''){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
	
			//로그인 세션값 가져와서 입력된 패스워드와 비교
			/* if (${sessionScope.loginInfo.MPassword} != pwd) {
				alert('비밀번호가 틀렸습니다.');
				return false;
			} */
			
			return true;
		}

	

</script>
<%@ include file="../include/jsRoot.jsp" %>

</body>
</html>