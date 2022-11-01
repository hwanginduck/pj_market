<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">List of Review Boards</h2>
		총갯수 : ${listcount } <br>
		<table class="table table-striped">
			<tr>
				<td>Review No</td>
				<td>Subject</td>
				<td>ID</td>
				<td>Date</td>
				<td>views</td>
			</tr>
			<c:if test="${empty boardlist}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty boardlist}">
				
				<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="b" items="${boardlist}">
			
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					<!-- 번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">						
						
					<%-- <c:if test="${b.board_re_lev != 0}"> 
						<c:forEach var="k" begin="1" end="${b.board_re_lev}">
							&nbsp;&nbsp;			
						</c:forEach>
						<img src="./images/AnswerLine.gif">	
					</c:if>		 --%>			
						
					<!-- 제목 출력 부분 -->	
					<a href="review_detail.do?review_no=${b.review_no}&page=${page}&state=cont">
							${b.review_sb}
					</a>
					</div>
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.member_id}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					
					<fmt:formatDate value="${b.review_date}"
						 pattern="yyyy-MM-dd HH:mm:ss"/>					
					
					</div>
				</td>
				<%-- <td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.board_readcount}</div>
				</td> --%>
			</tr>
			
			</c:forEach>
			<!-- 반복문 끝 -->			
				</c:if>
		</table>
	<ul class="pagination">
			<c:if test="${page <=1 }">
				<li><a>이전&nbsp;</a></li>
			</c:if>

			<c:if test="${page > 1 }">
				<li><a href="review_boardlist.do?page=${page-1}">이전</a>&nbsp;</li>
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li><a>${a}</a></li>
				</c:if>
				<c:if test="${a != page }">
					<li><a href="review_boardlist.do?page=${a}">${a}</a>&nbsp;</li>
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				<li><a>다음</a></li>
			</c:if>
			<c:if test="${page < maxpage }">
				<li><a href="review_boardlist.do?page=${page+1}">다음</a></li>
			</c:if>

		</ul>

		<div align="center">
			<a href="${path}/review_writeform" class="btn btn-info">리뷰 글  작성</a>
		</div>
	</div>
</body>
</html>