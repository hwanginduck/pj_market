<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@ include file="../fix/header.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1 width=400 align=center>
	<caption>상세페이지</caption>
	<tr>
		<td>작성자</td>
		<td>${of_name.name }</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td>
		<fmt:formatDate value=${of.register }
			pattern = "yyyy-MM-dd HH:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${of_readcount.readcount }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${of_subject.subject }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<pre>${of_content.content }</pre>
			${content }
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type = "button" value ="목록" 
			onClick = "location.href='boardlist.do?page=${page}'">
				
			<input type = "button" value ="수정"
			onClick = "location.href='boardupdateform.do?no=${board.no}&page=${page}'">
				
			<input type = "button" value ="삭제"
			onClick = "location.href='boarddeleteform.do?no=${board.no}&page=${page}'">
			
		</td>	
	</tr>
	
</table>

</body>
</html>