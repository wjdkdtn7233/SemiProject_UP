<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.size11 {
	height:auto;
}

.size1 {
	height: 7rem;
	width: 7rem;
}
</style>
<%@ include file="../include/header.jsp"%>
<body id="page-top">

	<div id="wrapper">

		<%@ include file="../include/habitNav.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../include/top.jsp"%>
				<div class="container-fluid size11 mb-4">

					<div class="card shadow border-left-primary h-100 w-100 ">
						<div class="card-header">
							<div class="row  ">
								<div class="col-3 ">
									<h1 class="h3 text-gray-900 ">습관 삭제</h1>
								</div>


							</div>

						</div>
						<div class="cardbody ">

						
							<div class="card  mb-4">

								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>No</th>
													<th>Category</th>
													<th>Details</th>
													<th>Start date</th>
													<th>End date</th>
													<th>Day of the week</th>
													<th>Designated time and money</th>
													<th>Delete</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>No</th>
													<th>Category</th>
													<th>Details</th>
													<th>Start date</th>
													<th>End date</th>
													<th>Day of the week</th>
													<th>Designated time and money</th>
													<th>Delete</th>
												</tr>
											</tfoot>
											<tbody>
											
											<c:set var="count" value="1"/>
											<c:forEach var="habitList" items="${data.hList}">
											<c:set var="no" value="${count}"/>
												<tr class="text-gray-900" id="items${no}">
													<input type="hidden" value="${habitList.hNo}"/>
													<td>${no}</td>
												
														<c:if test="${habitList.cCode == 1}"> 
															<td>금연</td>
														</c:if>
														<c:if test="${habitList.cCode == 2}"> 
															<td>금주</td>
														</c:if>
														<c:if test="${habitList.cCode == 3}"> 
															<td>독서</td>
														</c:if>
														<c:if test="${habitList.cCode == 4}"> 
															<td>운동</td>
														</c:if>
													
													<td>${habitList.hSubcategory}</td>
													<td>${habitList.hStartDate}</td>
													<td>${habitList.hEndDate}</td>
													<td>${habitList.hSelectday}</td>
													
													<c:if test="${habitList.hMoney != 0}">
														<td>${habitList.hMoney}원</td>
													</c:if>
													<c:if test="${habitList.hTime != 0}">
														<td>${habitList.hTime}시간</td>
													</c:if>
														<td><button class="btn bg-danger text-white" value="${no}" id="hlist" data-toggle="modal" data-target="#deleteHabit"><i
												class="fas fa-check mr-2"></i>삭제</button></td>
												</tr>
												
												<c:set var="count" value="${count+1}"/>
											</c:forEach>
											
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
						<!-- /.container-fluid -->

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
	
	<div class="modal fade" id="deleteHabit" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">정말 삭제하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">삭제하시면 다시 복수할 수 없습니다.</div>
				<div class="modal-footer">
				<form action="/up/habit/deletehabit.do" method="post" id="frm">
					<input type="hidden" name="hNumber" id="hNumber"/>
					<button class="btn btn-primary" type="submit"
						data-dismiss="modal" id="deleteItem">Yes</button>
				</form>		
					<button class="btn btn-secondary" data-dismiss="modal">Cancel</a>
				</div>
			</div>
		</div>
	</div>

	
	
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>
	<script>
		
		var indexNum = 0;
		var hNo = 0;
		/* $('#hlist').each(function(index,item){
			
			$(item).on('click',function(){
				
				console.log($(item).val());
				indexNum = $(item).val();
				console.log(indexNum);
			})
		
		});
		
		
		$('#deleteItem').on('click',function(){
			
			$('#items'+indexNum).remove();
		
		});
		 */
		
		 
		 document.querySelectorAll('#hlist').forEach(function(e){
			e.addEventListener('click',function(){
				indexNum = e.value;
			}); 
		 });
		
		document.querySelector('#deleteItem').addEventListener('click',function(){
			
			 
			 //location.href = location.href;  //새로고침
			 
			 
			$.ajax({
				url : '/up/habit/deletehabit.do',
				type : 'GET',
				data : document.querySelector('#items'+indexNum).children[0].serialize(),
				// data 받아오는 것이 성공하면(success) 아래 함수 호출
					success : function(data) {

						if (data != '') {
							// 입력한 id와 동일한 값이 있다면
							document.querySelector('#chkIcon').innerHTML = '<div class="btn btn-danger btn-icon-split"><span class="icon text-white-50"><i class="fas fa-exclamation-triangle"></i></span><span class="text">이미 존재하는 아이디입니다.</span></div>';
							idCheckFlag = false;
						} else {
							document.querySelector('#chkIcon').innerHTML = '<div class="btn btn-success btn-icon-split"><span class="icon text-white-50"><i class="fas fa-check"></i></span><span class="text">사용 가능한 아이디입니다.</span></div>';
							idCheckFlag = true;
						}

					}

				});
			 
			document.querySelector('#items'+indexNum).remove();
		
		 });
		 
		
	</script>
	<%@ include file="../include/jsRoot.jsp" %>
</body>
</html>