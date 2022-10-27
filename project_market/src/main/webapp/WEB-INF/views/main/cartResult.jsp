<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 2 }">
	<script>
		alert("장바구니에서 삭제 하였습니다.");
		location.href="cart_list.do"
	</script>
</c:if>

<c:if test="${result == 1 }">
	<script>
		alert("장바구니로 등록되었습니다.");
		location.href="cart_list.do"
	</script>
</c:if>
