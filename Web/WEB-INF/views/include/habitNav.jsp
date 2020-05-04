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
.logo-size-wrapper{
	height: 60px;
	width: 60px;
	background: white;
	border-radius: 100%;
}
.logo-size {
	height: 50px;
	width: 50px;
	object-fit: cover;
	position:relative;
	top:9px;
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
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
      data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
      aria-controls="collapseTwo"> <i class="fas fa-home"></i> <span>MENU</span>
   </a>
      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
         data-parent="#accordionSidebar">
         <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">UP</h6>
            <a class="collapse-item" href="/up/index/index.do">메인페이지</a> <a
               class="collapse-item" href="/up/mypage/mypage.do">마이페이지</a> <a
               class="collapse-item" href="/up/habit/habitpage.do">습관등록 및 수정</a>

         </div>
      </div></li>	
	
	<br>
	<br>
	<!-- Heading -->
	<div class="sidebar-heading" id="mypage-font-size">
		<i class="far fa-id-card"></i> Habit Page
	</div>
	<br>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed"
		href="/up/mypage/infopwdcheck.do"> <i class="fas fa-user-circle"></i>
			<span>습관 등록</span>
	</a></li>
	<hr class="sidebar-divider">
	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed"
		href="/up/mypage/pwpwdcheck.do"> <i class="fas fa-key"></i> <span>습관 수정</span>
	</a></li>
	

	<!-- Divider -->
	<hr class="sidebar-divider">


	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>


</ul>