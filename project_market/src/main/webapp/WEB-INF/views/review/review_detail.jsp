<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
</head>
<body>


<div class="container" align="center">

<div class="vf-wide700-card">
<h3 style="font-weight: bold; margin: 30px 0px 30px 0px;">리뷰 상세</h3>
<table class="table table-bordered">
		<tr>
			<th>상품코드</th>
			<td>${reviw.product_num }</td>
			<th>별 점</th>
			<td>
				<c:if test="${review.review_star == 0}">☆☆☆☆☆</c:if>
				<c:if test="${review.review_star == 1}">★☆☆☆☆</c:if>
				<c:if test="${review.review_star == 2}">★★☆☆☆</c:if>
				<c:if test="${review.review_star == 3}">★★★☆☆</c:if>
				<c:if test="${review.review_star == 4}">★★★★☆</c:if>
				<c:if test="${review.review_star== 5}">★★★★★</c:if>
			</td>
		</tr>
		
		<tr>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${review.review_date }" pattern="yyyy-MM-dd"/>
			</td>
			<th>조회수</th>
			<td>${review.r_hit }</td>
		</tr>
		<tr>
			
		</tr>
		
		<tr>
			<th>제 목</th>
			<td colspan="3">${review.review_sb }</td>
		</tr>
		
		<tr>
			<td colspan="4">
			
			<div class="vf-card" height=100px>
				${review.review_content}
			</div>
				
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;">
				<input type="button" class="btn btn-outline-success" value="수정"
				onclick="location='review_update.do'">
				<input type="button" class="btn btn-outline-success" value="삭제"
				onclick="location='review_delete.do?r_no=${review.review_no}'">
				<input type="button" class="btn btn-success" value="목록으로"
				onclick="location='review_boardlist.do'">
			</td>
		</tr>
	</table>

</div>
</div>
</body>
</html>