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
			<th>상품코드</th>
			<td>${review.product_num }</td>
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
			<th>조회수</th>
			<td>${review.r_hit }</td>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${review.review_date }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			
		</tr>
		
		<tr>
			<th>제목</th>
			<td colspan="3">${review.review_sb }</td>
		</tr>
		<tr>
			<th>리뷰 사진 </th>
			<td colspan="5">
								<img src="<%=request.getContextPath()%>/resources/upload/${review.review_img}" width="100%">
							</td>
		</tr>
			
			<%-- 	<c:if test="${empty review_img}">
       				&nbsp;
       			</c:if>
				<c:if test="${!empty review_img}">
					<img src="/project_market/upload/${review.review_img}">
					<img src="D:/sts-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/project_market/upload/${review.review_img}">
		  		<IMG src="${path}/resources/upload/${review_img}"/>
					<IMG src="<%=request.getContextPath() %>/upload/${review_img}">
					<IMG src="/project_market/upload/${review_img}">
				</c:if> --%>
			
		
		<tr>
		 	<th>내용 </th>
			<td colspan="5">
			
			<div class="vf-card" height=100px>
				${review.review_content}
			</div>
				
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;">
				 <input type="button" class="btn btn-outline-success" value="수정"
				onclick="location='review_update.do?review_no=${review.review_no}'">
				 <input type="button" class="btn btn-outline-success" value="삭제"
				onclick="location='review_delete.do?review_no=${review.review_no}'">
				<input type="button" class="btn btn-success" value="리뷰 목록"
				onclick="location='review_boardlist.do'">
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