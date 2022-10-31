<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>수정게시판</title>

</head>
<body>

	<hr>
	<h3 align=center> 게시글 수정 </h3>
	<hr>	

	<div align=center>
		<form method="post" action="qna_boardupdate.ok">
	
			
			qna_no :<input name="qna_no" id="qna_no" size="14" value="${qnaboard.qna_no }" /> <br>
			member_id :<input name="member_id" id="member_id" size="14" value="${qnaboard.member_id }" /> <br>
			product_num :<input name="product_num" id="product_num" size="14" value="${qnaboard.product_num }" /> <br>
			qna_re : <input name="qna_re" id="qna_re" size="14" value=${qnaboard.qna_re } /> <br>
			qna_content:<input name="qna_content" id="qna_content" size="14" value="${qnaboard.qna_content }" /> <br>
			
			<input type="submit" value="수정" /> <input type="reset" value="취소" />

		</form>
	</div>
</body>
</html>