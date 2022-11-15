<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="header.jsp"%>
	<%@ include file="../fix/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
</head>
<body>

<section class="main-pj">
		<div class="detail-content-pj">
		
<div class="container" align="center">

<div class="vf-wide700-card">
<h3 style="font-weight: bold; margin: 30px 0px 30px 0px;">Review Detail</h3>
<table class="table table-bordered">
		<tr>
			<th>상품명</th>
			<td style="font-weight: bold;" align="center"> ${product.product_name }</td>
			<th>옵션명</th>
			<td style="font-weight: bold;" align="center">${options_name }</td>
		</tr>
		<tr>
			<th>별 점</th>
			<td>
				<c:if test="${review.review_star == 0}">☆☆☆☆☆</c:if>
				<c:if test="${review.review_star == 1}">⭐</c:if>
				<c:if test="${review.review_star == 2}">⭐⭐</c:if>
				<c:if test="${review.review_star == 3}">⭐⭐⭐</c:if>
				<c:if test="${review.review_star == 4}">⭐⭐⭐⭐</c:if>
				<c:if test="${review.review_star == 5}">⭐⭐⭐⭐⭐</c:if>
			</td>
			<th style="font-weight: bold;" align="center">조회수</th>
			<td >${review.r_hit }</td>
			<th style="font-weight: bold;" align="center">작성일</th>
			<td>
				<fmt:formatDate value="${review.review_date }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<th style="font-weight: bold;" align="center">제목</th>
			<td colspan="3">${review.review_sb }</td>
		</tr>
		<tr>
			<th style="font-weight: bold;" align="center">리뷰 사진 </th>
			<td colspan="5" align="center">
			
				<c:forEach var="img" items="${review_img }">
					<img src="./resources/upload/uploadFiles/${img}" width="80%"><br>
				</c:forEach>				
			</td>
		</tr>
		
		<tr>
		 	<th style="font-weight: bold;" align="center">내용 </th>
			<td colspan="5">
			
			<div class="vf-card" height=100px>
				${review.review_content}
			</div>
				
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;">
				 <input type="button" class="btn btn-outline-success" value="수정"
				onclick="location='review_update.do?review_no=${review.review_no}&product_num=${product.product_num}'">
				 <input type="button" class="btn btn-outline-success" value="삭제"
				onclick="location='review_delete.do?review_no=${review.review_no}'">
				<input type="button" class="btn btn-success" value="리뷰 목록"
				onclick="location='review_boardlist.do?&product_num=${product.product_num}'">
			</td>
		</tr>
	</table>

</div>
</div>
</div>
</section>
</body>
</html>
<%@ include file="../fix/footer.jsp"%>