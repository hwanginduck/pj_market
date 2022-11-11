<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/css/tb.css" rel="stylesheet">

<meta charset="UTF-8">
<title>수정게시판</title>

<style>
input:focus {
	outline: 0;
}
input:
</style>

<script>



</script>

</head>
<body>
	<section class="main-pj">
		<div class="detail-content-pj">
			<h3 align=center>게시글 수정</h3>

			<div id="boardlist">
				<form method="post" action="qna_update.ok" id="update" >
				<input type="hidden" name="product_num" value="${qna.product_num }">
				<div class="1">
					<table class="table table-striped" border=1 style="width: 10%">
						<tr>
							<td width="15%" align="center">사용자아이디</td>
							<td width="15%" align="center">상품명</td>
							<td width="15%" align="center">작성일</td>
						</tr>
						<tr>
							<td width="15%" align="center">${member_id }</td>
							<td width="15%" align="center">${product.product_name }</td>
							<td width="15%" align="center"><fmt:formatDate value="${qna.qna_date}" pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
						<th colspan=3><textarea style="width: 1200px;" name="qna_content"> ${qna.qna_content } </textarea></th>
					</table>
				</div>
				<div class="2" align="center">	
					<input type="button" value="수정" onClick="update(${qna.qna_no}, ${product.product_num })" class="btn btn-info" />
					<input type="button" value="취소" onClick="window.close();" class="btn btn-info" />
				</div>
				</form>
			</div>

		</div>
	</section>
</body>
</html>