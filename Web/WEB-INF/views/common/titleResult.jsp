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
	  	<c:if test="${data.AcquisitionTitle != null}">
    		
    		swal({
                title: '타이틀 획득!', // 제목
                html: '축하합니다!<br>${data.AcquisitionTitle.TName}<br>${data.AcquisitionTitle.TComment}<br>${data.AcquisitionTitle.TCondition}', // 내용
                type: 'success', // 종류
                confirmButtonText: '확인',
                confirmButtonColor: '#4e73df' // 확인버튼 표시 문구
                
            })
    </c:if>
    
    
    }
    
    init();
    </script>
</body>
</html>