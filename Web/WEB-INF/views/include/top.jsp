<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Topbar -->
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Search -->


	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
	
		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a
			class="nav-link dropdown-toggle" href="#" id="searchDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> <!-- Dropdown - Messages -->
			<div
				class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>
		<li class="nav-item dropdown no-arrow  d-flex align-items-center">

			<span
			class="btn  text-white text-center font-weight-bold font-italic h3"
			id="check111"
			style="background:${sessionScope.representationTitle.TColor}; width:200px;">${sessionScope.representationTitle.TName}</span>
		</li>
		<%-- Kakao share btn --%>
		<a id="kakao-link-btn" href="javascript:sendLink()" title="카카오톡으로 타이틀 공유하기"> <img
		src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style="width: 40px; height: 41px; margin-top: 10px; margin-left: 10px"/>
		</a>
		
		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.loginInfo.userNickName}님
					환영합니다.</span> <img class="img-profile rounded-circle"
				src="/up/resources/upload/${sessionScope.loginInfo.renameFile}" id="profile_img">
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="/up/mypage/mypage.do"> <i
					class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 마이 페이지
				</a> <a class="dropdown-item" href="/up/habit/finishpopup.do"> <i
					class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>개인 정보 수정
				</a> <a class="dropdown-item" href="/up/habit/habitpage.do"> <i
					class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 습관 페이지
				</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					로그아웃
				</a>
			</div></li>

	</ul>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">준비가 되었으면 아래에  "로그아웃" 을 선택하십시오.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<button class="btn btn-primary" data-dismiss="modal"
						onclick="logoutClick()">
						로그아웃</a>
				</div>
			</div>
		</div>
	</div>

</nav>

<script src="https://code.jquery.com/jquery-3.5.0.js"
	integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
	crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	
<%request.getSession().setMaxInactiveInterval(20 * 60);%>
	var loginInfo = '${sessionScope.loginInfo.userId}';
	console.log(loginInfo);

	if (!loginInfo) {
		alert('20분간 요청이 없어 로그아웃 되셨습니다.');
		location.href = "/up/member/login.do";
	}

	var titleCode = ${sessionScope.loginInfo.userTitleCode};
	if (titleCode == 0) {
		$('#ment').text("");
		$('#check111').hide();
	}

	function logoutClick() {
		location.href = "/up/member/login.do";
	}
</script>

<script type="text/javascript">

		// java script SDK key
		Kakao.init('7d8d8fcde6cd667c5516e3c432c6981a')

		function sendLink() {

			Kakao.Link.sendCustom({
				templateId: 24181,
				templateArgs: {
					// 나의 대표타이틀이름 불러와서 적용
					title: '${sessionScope.representationTitle.TName}',
					// 닉네임 불러와서 적용
					userName: '${sessionScope.loginInfo.userNickName}',
					// 이미지 url 불러와서 타이틀 획득 이미지 보여줌, 이미지가 서버상에 있어야 불러올 수 있기때문에
					// 네이버블로그에 타이틀별 이미지를 캡쳐떠서 두고 타이틀 이름에 맞게 뿌려준다아~~
					userTitleUrl: '${sessionScope.representationTitleURL.TURL}'
				}
			})
		}
	
		
		
		
	</script>
