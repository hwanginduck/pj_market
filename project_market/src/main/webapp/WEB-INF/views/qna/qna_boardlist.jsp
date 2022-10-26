<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<style>
  table {
    width: 65%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 10px;
  }
  th:first-child, td:first-child {
    border-left: none;
  }
</style>


<meta charset="UTF-8">
<title>Q&A BoardPage</title>
</head>
<body >

<div align=center>
<table>
	상품문의 게시판 입니다.
	<tr>
	 	<td align="center">글작성 성공</td>
	 	<td align="center">글목록 수 </td>
	 	<td align="center">page</td>
	 	<td align="center">startpage </td>
	 	<td align="center">endpage </td>
	 	<td align="center">maxpage </td>
	 <tr>
	 <tr>
	 	<td align="center"> ${result } </td>
	 	<td align="center"> ${listcount } </td>
	 	<td align="center"> ${page } </td>
	 	<td align="center"> ${startpage } </td>
	 	<td align="center"> ${endpage } </td>
	 	<td align="center"> ${maxpage } </td>
	 </tr>
</table>
</div>
<hr>
<div align="center">
		<table>
			<tr>
				<th style="font-family: Tahoma; font-size: 11pt;" width="8%" height="26"> QNA_NO</th>
				<th>Member_id</th>
				<th>Product_num</th>
				<th>Qna_date</th>
			</tr>
			<c:if test="${empty boardlist}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			
					<c:if test="${b.board_re_lev != 0}"> 
						<c:forEach var="k" begin="1" end="${b.board_re_lev}">
							&nbsp;&nbsp;			
						</c:forEach>
					</c:if>
			
			<c:if test="${not empty boardlist}">
				<c:forEach var="boardlist" items="${boardlist}">
					<tr>
						<th> ${boardlist.qna_no } 		</th>
						
						<!-- ----------------------- ID 마스킹처리하는 구간 ----------------------- -->
						
							<th> 
							<c:set var="name" 			value="${boardlist.member_id}" />
							<c:set var="totalLength" 	value="${fn:length(boardlist.member_id) }" />
							<c:set var="first"     		value="${fn:substring(boardlist.member_id, 0, 2) }" />
							<c:set var="last"    		value="${fn:substring(boardlist.member_id, 4, totalLength) }" />
							
							<c:if test="${!empty  boardlist.member_id}">
								<c:out value="${first}**${last}"/>
							</c:if>
						  	</th> 
						  	
						 <!-- ----------------------- ID 마스킹처리하는 END ----------------------- -->	
					
						  	
						<th> ${boardlist.product_num } 	</th>
						<th> ${boardlist.qna_date } 	</th>
					</tr>
					<th colspan=5><pre> ${boardlist.qna_content } </pre></th>
				</c:forEach>
			</c:if>
		</table>
		<a href="qna_writeform">글쓰기</a><br>
	</div>
	

</body>
</html>