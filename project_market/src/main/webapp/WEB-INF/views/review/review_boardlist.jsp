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
				<td>Review no</td>
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
				<c:set var="no1" value="${no }"></c:set>
				
				<c:forEach var="boardlist" items="${boardlist }">
					<tr>
						<td>${boardlist.review_no}</td>
							<td><a href="${path }/review_detail"
									class="btn btn-default">
									<c:if test="${board.re_level >0 }">
										<img alt="" src="${path }/images/level.gif" height="2" width="${board.re_level *5 }">
										<img alt="" src="${path }/images/re.gif">
									</c:if> 
									${boardlist.review_sb} 
									<c:if test="${board.readcount > 30 }">
										<img alt="" src="${path }/images/hot.gif">
									</c:if></a></td>
							<td>${boardlist.member_id}</td>
							<td>${boardlist.review_date}</td>
							<td>views</td>
					</tr>
					<c:set var="no1" value="${no1 - 1}"></c:set>
				</c:forEach>
				
		</c:if>
		</table>
	<ul class="pagination">
			<c:if test="${page <=1 }">
				<li><a>이전</a></li>
			</c:if>

			<c:if test="${page > 1 }">
				<li><a href="review_boardlist.do?page=${page-1}">이전</a></li>
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li><a>${a}</a></li>
				</c:if>
				<c:if test="${a != page }">
					<li><a href="review_boardlist.do?page=${a}">${a}</a></li>
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