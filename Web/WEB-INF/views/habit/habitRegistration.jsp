<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../include/header.jsp"%>
<style>
.rowWrapper {
	width: 100%;
	height: 700px;
	background-color: white;
	letter-spacing: 20%;
}

#icon-size {
	font-size: 7rem;
	color: #002266;
}

#icon-size:hover {
	font-size: 7rem;
	color: #486AAE;
}

.print-informationModify {
	font-size: 15pt;
}


.myPage-menu {
	color: #002266;
}

.myPage-bottom {
	text-align: center;
	width: 25%;
	height: 40%;
	margin: 0 auto;
	border-bottom: 2px solid black;
}

.myPage-printmenu {
	text-align: center;
	width: 25%;
	height: 20%;
	margin: 0 auto;
	font-size: 14pt;
}

</style>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="../include/habitNav.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<%@ include file="../include/top.jsp"%>

				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->


					<!-- Content Row -->
					<div class="rowWrapper">
						<div class="card shadow border-left-primary h-100 w-100 ">
							<div class="card-header">
								<div class="text text-left h3 text-gray-900">
									습관 등록
								</div>
							</div>
							<div class="card-body">
							<form action="/up/habit/habitregistrationimple.do" method="post" id="frm">
								<div
									class="row d-flex align-items-center justify-content-start text-center mt-4 mb-5 ">
									<div class="col-2  font-weight-bold" id="icon-size">
										<span class="btn btn-success btn-icon-split w-100 "> <span
										class="text  font-weight-bold">Habit's Title</span></span>
										
									</div>
									<div class="col-5" id="icon-size">
										
										<input type="text" class="form-control form-control-user"  placeholder="Please enter a title"  id="titleName"/>
									</div>

								</div>
								<hr>
								
								<div class="row d-flex align-items-center justify-content-start text-center mb-5 mt-5">
									<div class="col-2">
										<span class="btn btn-info btn-icon-split w-100  font-weight-bold"> <span
										class="text">CATEGORY</span></span>
									</div>
									<div class="col-2">
										<select class="custom-select" id="selectCategory" name="selectCategory">
											<option class="text-gray-900 " >운동</option>
											<option class="text-gray-900 " >금주</option>
											<option class="text-gray-900 " >금연</option>
											<option class="text-gray-900 " >공부</option>
											<option class="text-gray-900 " >독서</option>
										</select>
									</div>	
								</div>
								<div class="row d-flex align-items-center justify-content-start text-center  mb-5 ">
									<div class="col-2">
										<span class="btn btn-info btn-icon-split w-100  font-weight-bold"> <span
										class="text">SET THE PERIOD</span></span>
									</div>
									<div class="col-1">
										 <span
										class="text">STRAT DATE</span>
									</div>
									<div class="col-2">
                						
                						
                                		<div class="card  border-bottom-info" style="height:70px">
											<div class="card-body">
												<span class="font-weight-bold text-gray-900" id="searchStartDate"></span>
											</div>
										</div>

                						
									</div>
									<div class="col-1">
										 <span
										class="text">END DATE</span>
									</div>
									<div class="col-2">
										<div class="card border-bottom-info" style="height:70px">
											<div class="card-body ">
												<span class="font-weight-bold text-gray-900" id="searchEndDate"></span>
											</div>
										</div>
                						
									</div>	
									<div class="col-1">
										<div class="custom-control custom-radio">
                                    		<input type="radio" name="dateType" id="dateType5" class="custom-control-input" onclick="setSearchDate(1)"/>
                                    		<label for="dateType5" class="custom-control-label">1개월</label>
                               			 </div>
                          
									</div>
									<div class="col-1">
										<div class="custom-control custom-radio">
                                    		<input type="radio" name="dateType" id="dateType6" class="custom-control-input" onclick="setSearchDate(3)"/>
                                    		<label for="dateType6" class="custom-control-label">3개월</label>
                                		</div>
									</div>
									<div class="col-1">
										<div class="custom-control custom-radio">
                                    		<input type="radio" name="dateType" id="dateType7" class="custom-control-input" onclick="setSearchDate(6)"/>
                                    		<label for="dateType7" class="custom-control-label">6개월</label>
                                		</div>
									</div>
								</div>
								<div class="row d-flex align-items-center justify-content-start text-center  mb-5 ">
									<div class="col-2">
										<span class="btn btn-info btn-icon-split w-100  font-weight-bold"> <span
										class="text">DAY OF THE WEEK</span></span>
									</div>
									<div class="col-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox" value="일" class="custom-control-input">
											<label class="custom-control-label" for="jb-checkbox">일</label>
										</div>
									</div>
									<div class="col-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox1" value="월" class="custom-control-input">
											<label class="custom-control-label" for="jb-checkbox1">월</label>
										</div>
									</div>
									<div class="col-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox2" value="화" class="custom-control-input">
											<label class="custom-control-label" for="jb-checkbox2">화</label>
										</div>
									</div>
									<div class="col-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox3" value="수" class="custom-control-input">
											<label class="custom-control-label" for="jb-checkbox3">수</label>
										</div>
									</div>
									<div class="col-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox4" value="목" class="custom-control-input">
											<label class="custom-control-label" for="jb-checkbox4">목</label>
										</div>
									</div>
									<div class="col-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox5" value="금" class="custom-control-input">
											<label class="custom-control-label" for="jb-checkbox5">금</label>
										</div>
									</div>
									<div class="col-1">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox6" value="토" class="custom-control-input">
											<label class="custom-control-label" for="jb-checkbox6">토</label>
										</div>
									</div>
									<input type="hidden" id="selectDay" />
								</div>
								<div class="row d-flex align-items-center justify-content-start text-center  mb-5 " id="otherHere">
									<div class="col-2">
										<span class="btn btn-info btn-icon-split w-100  font-weight-bold"> <span
										class="text">OTHER SETTINGS</span></span>
									</div>
									
									
											<div class="col-1" id="goalTime1" style="display:block">
												<span class="text">목표 시간</span>
											</div>
											<div class="col-3" id="goalTime2" style="display:block">
												<input type="text" id="goalTime2Input" class="form-control form-control-user"  placeholder="시 단위로 적어주세요." />
											</div>
											<div class="col-1 text-left" id="goalTime3"  style="display:block" >
												<span class="text-gray-900">시간</span>
											</div>
											
										
										
											<div class="col-2" id="money1" style="display:none">
												<span class="text">하루평균 절약 금액</span>
											</div>
											<div class="col-3" id="money2"  style="display:none">
												<input type="text" id="money2Input" class="form-control form-control-user"  placeholder="원 단위로 금액을 입력해주세요." />
											</div>
											<div class="col-1  text-left" id="money3" style="display:none">
												<span class="text-gray-900">원</span>
											</div>
										
											<div class="col-3">
												<span class="bg-gradient-danger text-white" id="info"></span>
											</div>
										
								</div>
								
								<div class="row d-flex align-items-center justify-content-start my-5">
									<div class="col-2">
										<button type="submit" class="btn  btn-icon-split  text-white font-weight-bolder" style="background:#E8D9FF">
											<span class="icon text-white-50"> <i
												class="fas fa-check"></i>
											</span> <span class="text">습관 등록</span>
										</button>
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="../include/footer.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- icon-circle 아이콘을 둥글게 만들어줌 
	card-body 카드형태로 만들어줌
	border-left-primary 디브 왼쪽에 파란선
	card-header 쓰면 카드의 윗부분 분리
-->
	<%@ include file="../include/jsRoot.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>	
	   <script src="/up/resources/vendor/datepicker/datepicker.min.js"></script>
    <script src="/up/resources/vendor/datepicker/i18n/datepicker.ko-KR.js"></script>
	<script>
		$('#money2, #goalTime2').on('click',function(){
			$('#info').html("");
			
		});
	
	
		
		var selectValue = $('#selectCategory');
		console.log(selectValue.val());
		
		selectValue.on('click',function(){
			
			if(selectValue.val()=="운동"||selectValue.val()=="독서"||selectValue.val()=="공부"){
				$('#money1, #money2, #money3').css('display','none');
				$('#goalTime1, #goalTime2, #goalTime3').css('display','block');
				
			}
			if(selectValue.val()=="금주"||selectValue.val()=="금연"){
				$('#money1, #money2, #money3').css('display','block');
				$('#goalTime1, #goalTime2, #goalTime3').css('display','none');
			}
		});
	

		
		$('#frm').submit(function(){
			
			var goalTime2 = $('#goalTime2Input');
			var money2 = $('#money2Input');
			
			//숫자만 가능 공백도 불가능
			var regExpNumber =/^[0-9]{1,1000}$/g;
			

			function chk(re, e, msg) {

				if (re.test(e.val())) {

					return true;
				} else {
				
					$('#info').html(msg);
					e.value = "";
					e.focus();
					return false;
				}
			}

			if(!$('#titleName').val()){
				$('#info').html("<i class='fas fa-exclamation-triangle'></i>Habit's title을 입력해주세요.");
				return false;
			}
			
			if(!$('#dateType5').is(':checked') && !$('#dateType6').is(':checked') && !$('#dateType7').is(':checked') ){
				$('#info').html("<i class='fas fa-exclamation-triangle'></i>기간을 설정해주세요.");
				return false;
			}
				
			if(!$('#jb-checkbox').is(':checked') && !$('#jb-checkbox1').is(':checked') && !$('#jb-checkbox2').is(':checked')
					 && !$('#jb-checkbox3').is(':checked') && !$('#jb-checkbox4').is(':checked')  && !$('#jb-checkbox5').is(':checked')  && !$('#jb-checkbox6').is(':checked')	){
				$('#info').html("<i class='fas fa-exclamation-triangle'></i>요일을 설정해 주세요.");
				return false;
			}
			
			var selectDay = "";
			
			if($('#jb-checkbox').is(':checked')){
				
				selectDay += $('#jb-checkbox').val();
			}
			if($('#jb-checkbox1').is(':checked')){
				
				selectDay += $('#jb-checkbox1').val();
			}
			if($('#jb-checkbox2').is(':checked')){
				
				selectDay += $('#jb-checkbox2').val();
			}
			if($('#jb-checkbox3').is(':checked')){
		
				selectDay += $('#jb-checkbox3').val();
			}
			if($('#jb-checkbox4').is(':checked')){
		
				selectDay += $('#jb-checkbox4').val();
			}
			if($('#jb-checkbox5').is(':checked')){
		
				selectDay += $('#jb-checkbox5').val();
			}
			if($('#jb-checkbox6').is(':checked')){
				
				selectDay += $('#jb-checkbox6').val();
			}
			
			$('#selectDay').val('selectDay');
			console.log(selectDay);
			
			if(selectValue.val()=="운동"||selectValue.val()=="독서"||selectValue.val()=="공부"){
				if (!chk(regExpNumber, goalTime2, 
				"<i class='fas fa-exclamation-triangle'></i>숫자만 기입해 주세요.")) {
					console.log(goalTime2);
				return false;
				}
			}else{
				if (!chk(regExpNumber, money2,  
				"<i class='fas fa-exclamation-triangle'></i>숫자만 기입해 주세요.")) {
				
				return false;
				}
			}
			
			
			return true;
		});	
		
		
         
         function setSearchDate(start){

             var num = start;
            

             var today = new Date();
             var today2 = new Date();
             
             
            /*  var year = today.getFullYear();
             var month = today.getMonth() + 1;
             var day = today.getDate(); */
             
            
            
         	
             today.setMonth(today.getMonth() + num);
             today.setDate(today.getDate() + 1);
            
         
         	 
         	
         	 
         	function getFormatDate(date){
         	    var year = date.getFullYear();     
         	    
         	    var month = ( date.getMonth()+1);   //M
         	    if(month < 10){
         	    	month = "0"+month;
         	    } //month 두자리로 저장
         	   
         	    var day = date.getDate();                   //d
         	   if(day < 10){
         		  day = "0"+day;
        	    }        //day 두자리로 저장
        	    
         	    return  year +""+ month+""  + day;
         	}
			
         	
        	
        	
        	
            $('#searchStartDate').text(getFormatDate(today2));
            $('#searchEndDate').text(getFormatDate(today));

         }
    </script>
</body>
</html>