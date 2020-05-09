<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.userIcons {
	line-height: 80%;
	color: white;
	font-size: 80pt;
}

#mypage-font-size {
	color: white;
	font-size: 15pt;
}

.logo-size-wrapper {
	height: 60px;
	width: 60px;
	background: white;
	border-radius: 100%;
}

.logo-size {
	height: 50px;
	width: 50px;
	object-fit: cover;
	position: relative;
	top: 9px;
}

.size2 {
	height: 8rem;
	width: 8rem;
}
</style>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/up/index/index.do">
		<div class="sidebar-brand-icon logo-size-wrapper">
			<img class="logo-size"
				src="https://cdn.discordapp.com/attachments/704300026628800522/704300563189334036/upLogo_remove_background.png" />
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<!--  <div class="userIcons">
     <i class="fas fa-user-circle"></i>
     </div> -->
	<!--   <a
			class="nav-link collapsed" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie
					Luna</span> <img class="img-profile rounded-circle"
				src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
		</a>  -->


	<!-- Divider -->
	<hr class="sidebar-divider">
	<li  class="nav-item">
	<div class="bg-white py-2  rounded mx-1 mb-2" id="check111">
		<div class="row d-flex justify-content-center">
			<div class="text-gray-900 text-center font-weight-bold h3" style="font-family:Nanum Gothic, sans-serif;" >MY TITLE</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="btn  text-white text-center font-weight-bold font-italic h3 shadow"
		
				style="background:${sessionScope.representationTitle.TColor}; width:200px;">${sessionScope.representationTitle.TName}</div>
		</div>
	</div>
	
	<div class="bg-white py-2  rounded mx-1 mb-2" id="check111">
	<div class="row  d-flex  justify-content-center mb-3"><img
		class="img-profile rounded-circle size2"
		src="/up/resources/upload/${sessionScope.loginInfo.renameFile}">
	</div>
	<hr>
	<div
		class="row  d-flex  justify-content-center  h4 font-weight-bold text-gray-900" style="font-family:Nanum Gothic, sans-serif;" >${sessionScope.loginInfo.userNickName}님
	</div>
	<div
		class="row  d-flex  justify-content-center  h6 text-gray-900 font-weight-bold " style="font-family:Nanum Gothic, sans-serif;" >환영합니다<i class="far fa-laugh ml-1"></i>
	</div>
	</div>
	</li>
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-home"></i> <span>MENU</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h5 class="collapse-header text-gray-700">- U P - 에 오신것을 환영합니다.</h5>
				<a class="collapse-item" href="/up/index/index.do"><i class="fas fa-desktop mr-3"></i>메인페이지</a> <a
					class="collapse-item" href="/up/mypage/mypage.do"><i class="far fa-id-card mr-3"></i>마이페이지</a> <a
					class="collapse-item" href="/up/habit/habitpage.do"><i class="fas fa-chart-pie mr-3"></i>습관페이지</a>

			</div>
		</div></li>

	<br>
	<br>
	<!-- Heading -->
	<div class="sidebar-heading" id="mypage-font-size">
		<i class="far fa-id-card"></i> My Page
	</div>
	<br>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed"
		href="/up/mypage/infopwdcheck.do"> <i class="fas fa-user-circle"></i>
			<span>개인정보 수정</span>
	</a></li>
	<hr class="sidebar-divider">
	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed"
		href="/up/mypage/pwpwdcheck.do"> <i class="fas fa-key"></i> <span>비밀번호
				수정</span>
	</a></li>
	<hr class="sidebar-divider">
	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed"
		href="/up/mypage/habithistory.do"> <i class="fas fa-pencil-alt"></i>
			<span>습관 히스토리</span>
	</a></li>
	<hr class="sidebar-divider">
	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed"
		href="/up/mypage/titlelist.do"> <i class="far fa-list-alt"></i> <span>타이틀
				목록</span>
	</a></li>
	<hr class="sidebar-divider">
	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed"
		href="/up/mypage/memberwithdrawal.do"> <i
			class="fas fa-user-alt-slash"></i> <span>회원 탈퇴</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">


	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>
	<script>
		var titleCode = ${sessionScope.loginInfo.userTitleCode};
		if (titleCode == 0) {
			$('#check111').hide();
		}
	</script>
	<script type="text/javascript">
  WebFontConfig = {
    custom: {
        families: ['Nanum Gothic'],
        urls: ['http://fonts.googleapis.com/earlyaccess/nanumgothic.css']
    }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })(); 
 </script>

</ul>