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
<script src="http://code.jquery.com/jquery-latest.js"></script>


<meta charset="UTF-8">
<title>수정게시판</title>

<style>
input:focus {
	outline: 0;
}
input




:
</style>

<script>
	$(function() {
		$('#Update').click(function() {
			if (!frm.qna_content.value) {
				alert('등록할 내용이 없슴. 내용을 입력하셈');
				frm.qna_content.focus();
				return false;
			}
			
			var frmData = $('form').serialize();
			$.post('qna_update.ok', frmData, function(data) {
			});
			// post Ajax종료
			opener.location.reload();
		    window.close();
		})
		// click이벤트 종료
		
		$('#Reply').click(function() {
			if (!frm.qna_content.value) {
				alert('등록할 내용이 없슴. 내용을 입력하셈');
				frm.qna_content.focus();
				return false;
			}
			
			var frmData = $('form').serialize();
			$.post('qna_boardinsert.do', frmData, function(data) {
			});
			// post Ajax종료
			opener.location.reload();
		    window.close();
		})
	})
</script>

</head>
<body>
	<section class="main-pj">
		<div class="detail-content-pj" align="center">
			<h3 align=center>게시글 수정</h3>
			<form id="frm">
				<input type="hidden" name="member_id" value="${member_id }">
				<input type="hidden" name="product_num" value="${qna.product_num }">
				<input type="hidden" name="qna_no" value="${qna.qna_no }">
 				  
				<table class="table table-striped" border=1 style="width: 10%">
					<tr>
						<td style="width: 220px" align="center">사용자아이디</td>
						<td style="width: 220px" align="center">상품명</td>
						<td style="width: 220px" align="center">작성일</td>
					</tr>
					<tr>
						<td style="width: 220px" align="center">${member_id }</td>
						<td style="width: 220px" align="center">${product.product_name }</td>
						<td style="width: 220px" align="center"><fmt:formatDate value="${qna.qna_date}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
					
					<th colspan=3><textarea style="width: 1200px;" name="qna_content">${qna.qna_content }</textarea></th>
					
				</table>
				<!-- admin 일경우 -->
				<c:if test="${member_id  eq 'admin' }">
				<input type="hidden" name="qna_group" value="${qna.qna_no }">
				<input type="hidden" name="qna_re" value="1" >
				<input type="button" value="관리자답변" id="Reply" class="btn btn-info">
 				 </c:if>
 				 
 				 <!-- 일반일경우 (admin이 아닐경우) -->
 				 <c:if test="${member_id  ne 'admin' }">
 				 <input type="hidden" name="qna_re" value="0">
				 <input type="button" value="수정" id="Update" class="btn btn-info">
 				 </c:if>
 				  
				<input type="button" value="취소" onClick="window.close();" class="btn btn-info">
			</form>
		</div>
	</section>
</body>
</html>