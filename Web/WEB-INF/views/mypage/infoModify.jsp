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

.btn-file{
            position: relative;
            overflow: hidden;
        }
.btn-file input[type=file] {
            position: absolute;
            top: 0;
                right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
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
									<h1 class="h3 text-gray-900 ">개인정보수정</h1>
								</div>


							</div>

						</div>

						<div class="cardbody ">
						<form action="/up/mypage/infoupdate.do" id="frm" method="post" enctype="multipart/form-data">
							<div class="row   py-5">
								<div
									class="col-2 d-flex align-items-center justify-content-end pl-2" id="pictureHere">
						
									<img class="img-profile size1 rounded-circle"
										src="/up/resources/upload/${sessionScope.loginInfo.renameFile}">

								</div>
								
								<div class="col-3 justify-content-start align-self-end">
									<label for="userPicture" class="btn btn-info btn-file">프로필사진 변경
									<input type="file" name="profile" id="userPicture" style="display: none;"/>
									</label>
									<button class="btn btn-warning mb-2" type="button" id="basicPicture">기본이미지로 변경</button>
									<input type="hidden"  name="basicPicture" id="basicInput"/>
								</div>
								
								
							</div>

								<div class="row mb-4">
									<div class="col-2 ml-5 pl-5">
										<span class="text text-gray-900 mr-5 font-weight-bold">ID</span>
									</div>
									<div class="col-8 ml-0 pl-0">
										<span class="text text-gray-900 h5 ">${sessionScope.loginInfo.userId}</span>
									</div>
								</div>

								<div class="row  mb-4">
									<div class="col-2 ml-5 pl-5">
										<span class="text text-gray-900 mr-5 font-weight-bold">TITLE
										</span>

									</div>
									<div class="col-2 ml-0 pl-0">
										<select class="custom-select" name="title">
											<c:forEach var="tList" items="${data.tList}"
												varStatus="status">
												<option class="text-white"
													style="background:${tList.TColor}">${tList.TName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row  mb-4">
									<div class="col-2 ml-5 pl-5">
										<span class="text text-gray-900 mr-5 font-weight-bold">NAME
										</span>

									</div>
									<div class="col-2 ml-0 pl-0">
										<span class="text text-gray-900 mr-5">${sessionScope.loginInfo.userName}</span>
									</div>
								</div>
								<div class="row  mb-2">
									<div class="col-2 ml-5 pl-5">
										<span class="text text-gray-900 mr-5 font-weight-bold">NICKNAME
										</span>

									</div>
									<div class="col-2 ml-0 pl-0">
										<div class="form-group ">
											<input type="text" id="inputNickName"
												class="form-control form-control-user" name="nick"
												value="${sessionScope.loginInfo.userNickName}" placeholder="Enter a nickname to change" />
										</div>
									</div>
								</div>

								<div class="row  mb-4">
									<div class="col-2 ml-5 pl-5">
										<span class="text text-gray-900 mr-5 font-weight-bold">EMAIL
										</span>

									</div>
									<div class="col-3 ml-0 pl-0">
										<div class="form-group ">
											<!-- <input type="email" class="form-control form-control-user"
												id="exampleInputEmail" value="wjdkdtn7233@naver.com"
												placeholder="Enter email to change"
												aria-describedby="emailHelp" name="email"> -->
											<span class="text text-gray-900 mr-5">${sessionScope.loginInfo.userEmail}
											</span>
										</div>
									</div>
									<div class="col-5 ml-3">
										<span class="bg-gradient-danger text-white" id="infoNick"></span>
									</div>
								</div>
								<div class="row  mb-4">
									<div class="col-4 ml-5 pl-5">
										<button type="submit" class="btn btn-success btn-icon-split">
											<span class="icon text-white-50"> <i
												class="fas fa-check"></i>
											</span> <span class="text">Information Modified Completed</span>
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

	</div>
	<%@ include file="../include/jsRoot.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.0.js"
		integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		
	
	//안내문이 뜨고 다시 닉네임을 수정하기 위해 닉네임 인풋태그를 눌렀을때 안내문을 지워주는 역할
	$('#inputNickName').on('click', function() {
		$('#infoNick').html("");
	});	
	
	
	$('#frm').submit(function(){
		//?=.* 어느자리에 있든? 
		var nick = $('#inputNickName');
		var email = $('#exampleInputEmail');
		//닉네임 검사
		var regExpNick = /^(?=.*\d{1,15})(?=.*[가-힣a-zA-Z]{1,15}).{3,15}$/;
		//닉네임에 특수문자가 있는지 검사
		var regExpNick2 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;

		

		function chk(re, e, msg) {

			if (re.test(e.val())) {

				return true;
			} else {
				$('#infoNick').html(msg);
				e.value = "";
				e.focus();
				return false;
			}
		}

		//닉네임 특수문자 검사
		if (chk(regExpNick2, nick, "")) {
			$('#infoNick').html("<i class='fas fa-exclamation-triangle'></i>" +"닉네임에 특수문자를 포함시킬 수 없습니다.");
			return false;
		}
		
		if (!chk(regExpNick, nick,  //닉네임 검사
				"<i class='fas fa-exclamation-triangle'></i>닉네임은 영문/한글 과 숫자를 포함하여 3자 에서 15자 이내로 기입해주세요.")) {
			return false;
		}
		
		return true;
	});
	
		
	 	
	 
		$('#userPicture').on('change',function (e) {
	        var get_file = e.target.files;
	        console.log(get_file);
	        var image = document.createElement('img');
	        
	        var reader = new FileReader();
	        
	        /* reader 시작시 함수 구현 */
	        reader.onload = (function (aImg) {
	            console.log(1);
	 
	            return function (e) {
	                console.log(3);
	                /* base64 인코딩 된 스트링 데이터 */
	                aImg.src = e.target.result
	            }
	        })(image)
	 
	        if(get_file){
	            /* 
	                get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
	                onload 에 설정했던 return 으로 넘어간다.
	                이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
	            */
	            reader.readAsDataURL(get_file[0]);
	            console.log(2);
	        }
	        //이미지를 넣어주면 기본이미지의 value값은 초기화
	        $('#basicInput').val("");
	        //이미지가 보여지는 곳에 원래 사진 삭제
	        $('#pictureHere').html("");
	        //이미지 모양 클래스 추가
	        image.setAttribute('class','img-profile size1 rounded-circle');
	        //이미지 보여지는 공간에 업로드한 이미지 넣기
	        $('#pictureHere').html(image);
	        
	    })
		
		//기본이미지 변경 버튼 눌렀을떄
		$('#basicPicture').on('click',function(){
			//첨부파일에 있는 파일 리스트 초기화 - 이거 안하면 기본이미지 버튼 눌렀다가 원래박혔던 사진 넣을라해도 안넣어짐 
			$('#userPicture').val("");
			//이미지가 보여지는 곳에 원래 사진 삭제
			$('#pictureHere').html("");
			//기본이미지 넣기
			$('#pictureHere').html('<img class="img-profile size1 rounded-circle" src="/up/resources/upload/unnamed.jpg">');
			//유저가 기본이미지로 정했다는 값 서블릿으로 넘겨주기
			$('#basicInput').val("unnamed.jpg");
			
		});
		
	</script>

</body>
</html>