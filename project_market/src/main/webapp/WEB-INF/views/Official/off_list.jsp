<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../fix/header.jsp"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>
	<a href="boardform.do">공지사항 작성</a> <br>
	글갯수 : ${listcount }
	<table border=1 align=center width=700>
		<caption>공지사항 목록</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		
		<!-- 화면 출력 번호 -->
		<c:set var="num" value="${listcount-(page-1)*10 }"/>
		<c:forEach var="b" items="${boardlist}">
		<tr>
			<td>${num}
			<c:set var="num" value="${num-1 }"/>
			</td>
			
			<td>
<a href="off_content?no=${b.no}&page=${page}">			
			${of_subject.subject}
</a>			
			</td>
			
			<td>${of_name.name}
			</td>
			
			<td><fmt:formatDate value="${b.register}"
			pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			
			<td>${of_readcount.readcount}
			</td>
		</tr>
		
		</c:forEach>
		
	</table>
	
<!-- 페이지 처리 -->
<center>
<c:if test="${listcount > 0 }"></c:if>

<!-- 1페이지 이동 -->
<a href="boardlist.do?page=1" style="text-decoration:none"> << </a>

<!-- 이전블럭으로 이동 -->
<c:if test="${startPage > 10 }">
	<a href="boardlist.do?page=${startPage-10 }">[이전]</a>
</c:if>

<!-- 각 블럭에 10개 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
<c:if test="${i == page}">
	[${i}]
</c:if>
<c:if test="${i != page}">
	<a href="boardlist.do?page=${i}">[${i}]</a>
</c:if>
</c:forEach>
<!-- 다음 블럭으로 이동 -->
<c:if test="${endPage < pageCount }">
	<a href="boardlist.do?page=${startPage+10 }">[다음]</a>
</c:if>

<!-- 마지막 페이지로 이동 -->
<a href="boardlist.do?page=${pageCount}" style="text-decoration:none"> >> </a>
</center>

</body>
</html>