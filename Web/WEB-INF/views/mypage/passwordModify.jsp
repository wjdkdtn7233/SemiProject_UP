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
										<input type="password" class="form-control form-control-user"
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
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" placeholder="Password">
									</div>
								</div>
								<!-- 비밀번호 틀렸다는 경고창 div -->
								<div class="col-4 ml-3 px-2">
									<button class="btn btn-danger btn-icon-split">
										<span class="icon text-white-50"> <i
											class="fas fa-trash"></i>
										</span> <span class="text">Passwords do not match</span>
									</button>
									<!-- 이 버튼이 뜨고 누르면 적혀있던 password가 지워짐 -->
								</div>
							</div>
							<!-- 저장 버튼 저장완료되면 alert창 띄우고 마이페이지 메인으로 이동 -->
							<div class="row  mb-4">
								<div class="col-4 ml-5 pl-5">
									<a href="#" class="btn btn-success btn-icon-split"> <span
										class="icon text-white-50"> <i class="fas fa-check"></i>
									</span> <span class="text">Password Modified Completed</span>
									</a>
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


	<%@ include file="../include/jsRoot.jsp" %>
</body>
</html>