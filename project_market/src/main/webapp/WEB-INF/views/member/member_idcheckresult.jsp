<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:if test="${result == 1 }">			<!-- 중복 ID -->
	<script>
		alert("중복 아이디 입니다.")
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == -1 }">
	<script>
		alert("사용 가능한 아이디 입니다.")
		history.go(-1);
	</script>
</c:if>