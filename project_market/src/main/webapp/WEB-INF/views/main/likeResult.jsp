<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1 }">
	<script>
		alert("찜등록이 되었습니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2 }">
	<script>
		alert("찜등록이 실패 하였습니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 3 }">
	<script>
		alert("찜등록을 삭제했습니다.");
		location.href="listlike.do";
	</script>
</c:if>

<c:if test="${result == 4 }">
	<script>
		alert("이미 등록되어 있는 상품입니다.");
		history.go(-1);
	</script>
</c:if>
