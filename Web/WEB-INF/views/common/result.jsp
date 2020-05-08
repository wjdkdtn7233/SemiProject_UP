<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.all.min.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.all.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.js"></script>
	<script src="/up/resources/vendor/sweetalert2/sweetalert2.min.js"></script>
	<script>
	init = function(){
		//print alert message
	 
	<c:if test="${data.alertMsg != null}">
	swal({
		
        title: '알림',
        <c:if test="${data.AcquisitionTitle != null}">
        	html: '${data.alertMsg}<br><h3 style="color:#B0E095">타이틀을 획득하였습니다.<br>마이페이지->개인정보수정 에서 확인해주세요.</h3>',
		</c:if>
        <c:if test="${data.AcquisitionTitle == null}">
        	html: '${data.alertMsg}',
		</c:if>
        type: 'success'
    }).then(function (result) { // 버튼이 눌러졌을 경우의 콜백 연결
        if (result.value) { // 확인 버튼이 눌러진 경우
        	
    	
    		<c:if test="${data.url != null}">
				location.href="<c:out value="${data.url}"/>";
			</c:if>
            
        	<c:if test="${data.back != null}">
    		history.back();
    		</c:if>
    		
        }else{
        	<c:if test="${data.url != null}">
				location.href="<c:out value="${data.url}"/>";
			</c:if>
        
    		<c:if test="${data.back != null}">
				history.back();
			</c:if>
        }
    });
		
		
	</c:if>
	
	
	};

	
	init();
</script>
</body>
</html>