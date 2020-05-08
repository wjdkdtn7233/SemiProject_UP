<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.size11 {
	width: 100%;
	height: 850px;
}

.bgimg {
	width: 300px;
	height: 320px;
}

.card-color{
	color:#86E57F;
}

.gold {
   color: #DFB84E;
}
.gold-border{
	border:1px solid #DFB84E;
}
</style>
<%@ include file="../include/header.jsp"%>
<body>
	<div class="container-fluid size11  ">
	
		<div class="container">
			<div class="text-center mt-5">
				<img class="indexlog bgimg"
					src="/up/resources/img/001-2.jpg" />
			</div>
		</div>
		
		<br>
		<div class="container">
			<h1 class="h2 text-center text-gray-900 font-weight-bold">습관 종료를 축하합니다 Congratulation!</h1>
		</div>
		<br>
		<div class="container">
			<h1 class="h4 text-center gold font-italic font-weight-bold mb-3">- 한 줄 명언 -</h1>
			<h1 class="h5 text-center text-gray-900  font-italic font-weight-bold"><U>${data.wise}</U></h1>
		</div>
		
		<br>
		<div class="container d-flex justify-content-center">
			<button class="btn btn-info btn-icon-split" onclick="question()">
				<span class="icon text-white-50" style="padding: .75rem;"> <i class="fas fa-arrow-left "></i>
				</span> <span class="text">메인 페이지로 이동</span>
			</button>
		</div>
		<br>
		<hr>
		<br>
		<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-8">
				<h1 class="h4 text-center bg-danger text-white font-weight-bold">그러나 당신이 만약에</h1>
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col-xl-5 col-lg-6 col-md-10 col-sm-10">
				<h1 class="h4 text-center bg-danger text-white font-weight-bold">목표 기간동안  시간낭비를 했다면... </h1>
			</div>
		</div>
		<br>
		<div class="container d-flex justify-content-center">
			<button class="btn btn-danger btn-icon-split"  id="clickTheBotton">
				<span class="icon text-white-50" style="padding: .75rem;"> 
				</span> <span class="text font-weight-bold">What if...?</span>
			</button>
		</div>
			
		</div>
		<br>
		<br>
		<%-- <c:if> --%>
		<div class="container"  id="slideToggle">
			<div class="row text-center">
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 " >
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >이성과 데이트를 했더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#86E57F">번 데이트 가능 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;" >
							<span class=" text-gray-900" > 피시방에 있었다면 </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold " style="color:#00D8FF" >   낭비  </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >영어 단어를 암기했더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4  font-weight-bold"  style="color:#FF0000" >개 암기 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" > 3분 카레를 제조했더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#E5D85C" > 개 제조 </span>
						</div>
					</div>
				</div>	
			</div>
			<br>
			<br>
			<div class="row text-center">
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >자격증을 공부했더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#CEF279"> 개 따기 성공 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;" >
							<span class=" text-gray-900" > 피시방에 있었다면 </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold " style="color:#D1B2FF" >   낭비  </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >알바를 했더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4  font-weight-bold"  style="color:#0054FF" >원 저축 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" > 알바로 번 돈으로 국밥을 사먹었다면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#FFC19E" >   그릇 </span>
						</div>
					</div>
				</div>	
			</div>
			<br>
			<br>
			<div class="row text-center">
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >연애에 성공할 확률은?.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#FFE400">0% ! </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;" >
							<span class=" text-gray-900" >극장에서 영화를 봤더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold " style="color:#3DB7CC" > 편 시청  </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >혼자 코인노래방을 갔더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4  font-weight-bold"  style="color:#D941C5" >곡 부르기 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" > 맘에드는 이성 번호를 땄더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#FF007F" > 개 번호 획득 </span>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<%-- </c:if> --%>
		
		
		
		<%-- <c:if> --%>
		<div class="container"  id="slideToggle2">
			<div class="row text-center">
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 "  id="clickTheBotton">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >국밥을 사먹었더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" id="slideToggle"  style="color:#86E57F">그릇 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;" >
							<span class=" text-gray-900" >BHC 뿌링클치킨을 사먹었더라면</span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold " style="color:#00D8FF" >  마리 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >맥도날드 상하이버거 세트를 사먹었더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4  font-weight-bold"  style="color:#FF0000" >햄최몇 개 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" > 롤에서 지를 수 있는 스킨 갯수.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#E5D85C" >서사급 스킨  개 </span>
						</div>
					</div>
				</div>	
			</div>
			<br>
			<br>
			<div class="row text-center">
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >중국집에서 먹을 수 있는 짬짜면 최대 그릇 수.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#CEF279"> 그릇  </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;" >
							<span class=" text-gray-900" >아프리카BJ에게 쏠 수 있는 별풍선 갯수 </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold " style="color:#D1B2FF" > 개  </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >연애에 성공할 확률은?..</span>
						</div>
						<div class="card-body">	
							<span class="h4  font-weight-bold"  style="color:#0054FF" >0% !</span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" > 아웃백에서 가족들과 외식할수 있는 횟수.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#FFC19E" >  회 </span>
						</div>
					</div>
				</div>	
			</div>
			<br>
			<br>
			<div class="row text-center">
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >사 입을 수 있는 팬티 갯수.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#FFE400"> 개</span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;" >
							<span class=" text-gray-900" >좋아하는 이성과 파스타 최대?.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold " style="color:#3DB7CC" > 그릇  </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" >혼자 코인노래방을 갔더라면.. </span>
						</div>
						<div class="card-body">	
							<span class="h4  font-weight-bold"  style="color:#D941C5" >곡 부르기 </span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
					<div class="card  font-weight-bold shadow">
						<div class="card-header" style="background:#FFD9FA;">
							<span class=" text-gray-900" > 피시방 시간충전 몇시간?.. </span>
						</div>
						<div class="card-body">	
							<span class="h4 font-weight-bold" style="color:#FF007F" > 시간 충전 </span>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<%-- </c:if> --%>
		<br>
		<br>
		

		
	
		<br>
		<br>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.0.js"
	integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
	crossorigin="anonymous"></script>
	<script  type="text/javascript">
	
		function question() {
			location.href = "/up/index/index.do";
		}
		
		$('#slideToggle').hide();
		$('#slideToggle2').hide();
		
		$('#clickTheBotton').click(function(){
			$('#slideToggle').fadeIn();
			$('#slideToggle2').fadeIn();
		});
		
		
	</script>
	<%@ include file="../include/jsRoot.jsp"%>
	
</body>
</html>