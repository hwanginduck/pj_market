<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A BoardPage</title>
</head>
<body>

<div align=center>
	상품문의 게시판 입니다.<br>
	 글작성 성공 : ${result } <br>
	 글목록 수 : ${listcount } <br>
</div>
<hr>
<div align="center">
		<table border=1>
			<tr>
				<th>qna_no(문의번호)=hidden</th>
				<th>member_id(세션아이디)</th>
				<th>product_num(상품코드)=hidden</th>
				<th>qna_re(게시판리플)=hidden</th>
				<th>qna_content(내용) </th>
				<th>qna_date(작성일)</th>
			</tr>
			<c:if test="${empty boardlist}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			
			<c:if test="${not empty boardlist}">
				<c:forEach var="boardlist" items="${boardlist}">
					<tr>
						<th> ${boardlist.qna_no } </th>
						<th> ${boardlist.member_id } </th>
						<th> ${boardlist.product_num } </th>
						<th> ${boardlist.qna_re } </th>
						<th><pre> ${boardlist.qna_content } </pre></th>
						<th> ${boardlist.qna_date } </th>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<a href="qna_writeform">글쓰기</a><br>
	</div>
	

</body>
</html>