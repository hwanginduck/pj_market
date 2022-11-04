<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result == 1 }">
	<script>
		alert("리뷰 수정이 완료 되었습니다!");
		location.href = "review_boardlist";
	</script>
</c:if>

<c:if test="${result == 0 }">
	<script>
		alert("리뷰 수정이 실패했습니다!");
		history.go(-1);
	</script>
</c:if>


</body>
</html>