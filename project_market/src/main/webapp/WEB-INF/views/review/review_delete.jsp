<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
    <%@ include file="../fix/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="/js/board.js"></script>
    
    
<meta charset="UTF-8">
<title>리뷰 삭제 게시판</title>
</head>
<body>
<section class="main-pj">
		<div class="detail-content-pj">
 <div class="container" align="center">
<h3 style="font-weight: bold; margin: 30px 0px 30px 0px;">상품 리뷰 삭제</h3>

<form action="review_deleteresult" method="post" onsubmit="return board_check()" >
			<input type="hidden" name="member_id" value=${member_id }> 
			<input type="hidden" name="review_no" value="${review.review_no}"> 

	<table class="table table-striped">
		<tr>
		 <td style="font-weight: bold;" align="center">제목</td>
	       <td>
		<input name="review_sb" id="review_sb" size="14" class="input_box"  align="center"  value="${review.review_sb }"  />
			</td>
		</tr>
		<tr>
		 <td style="font-weight: bold;" align="center">아이디</td>
	       <td>
		<input name="member_id" id="member_id" size="14" class="input_box"  align="center"  value="${member_id }"  />
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" class="btn btn-success" value="리뷰 삭제하기" onclick="location='review_boardlist.do?&review.review_no=${review.review_no}'" >
				<input type="reset" class="btn btn-outline-success"  value="취소" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
</form>
</div> 
</div>
</section>
</body>
</html>
<%@ include file="../fix/footer.jsp"%>