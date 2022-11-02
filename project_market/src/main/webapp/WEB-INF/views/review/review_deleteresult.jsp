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
		alert("리뷰가 삭제 되었습니다!");
		location.href = "review_boardlist";
	</script>
</c:if>

<c:if test="${result == 2 }">
	<script>
		alert("리뷰가 삭제 되지 못했습니다. \n 잠시 후 다시 시도해 주세요!")
		history.go(-1);
	</script>
</c:if>

</body>
</html>