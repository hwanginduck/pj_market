<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:if test="${result eq 1}">
	<script>
	alert("글수정 성공");
	location.href="off_list.do?page=${page}";		// 목록페이지 
//	location.href="boardcontent.do?no=${board.no}&page=${page}";	//상세 페이지
	</script>
</c:if>
	
<c:if test="${result ne 1}">
	<script>
		alert("글수정 실패");
		history.go(-1);
	</script>
	
	</c:if>


</body>
</html>