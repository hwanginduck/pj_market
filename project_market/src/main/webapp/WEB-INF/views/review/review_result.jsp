<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result == 1 }">
	<script>
		alert("리뷰 작성이 완료 되었습니다!");
		location.href = "<%= request.getContextPath()%>/orderList.do";
	</script>
</c:if>

<c:if test="${result != 1 }">
	<script>
		alert("서버 상의 문제로 리뷰 작성이 완료되지 않았습니다.\n 잠시 후 다시 시도해 주세요!")
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2 }">
	<script>
		alert("첨부파일이 10MB를 초과하여 리뷰 등록이 실패하였습니다.");
		history.go(-1);
	</script>
</c:if>

</body>
</html>