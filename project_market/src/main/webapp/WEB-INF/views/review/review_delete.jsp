<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
    <%@ include file="../fix/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="/js/board.js"></script>
    
    <script>
    	$(document).ready(function(){    		
    		$("#review_star option[value=${review.review_star}]").attr("selected", true);    		
    	});
    </script>
    
<meta charset="UTF-8">
<title>리뷰 수정 게시판</title>
</head>
<body>
<section class="main-pj">
		<div class="detail-content-pj">
${member_id }
${product_num }
${options_num }
 <div class="container" align="center">
<h3 style="font-weight: bold; margin: 30px 0px 30px 0px;">상품 리뷰 수정</h3>

<form action="review_deleteresult" method="post" onsubmit="return board_check()" >
			<input type="hidden" name="member_id" value=${member_id }> 
			<input type="hidden" name="product_num" value="12"> 
			<input type="hidden" name="options_num" value="7"> 
			<input type="hidden" name="review_no" value="${review.review_no}"> 
    

	<table class="table table-striped">
		<tr>
		 <td style="font-weight: bold;" align="center">제목</td>
	       <td>
		<input name="review_sb" id="review_sb" size="14" class="input_box"  align="center"  value="${review.review_sb }"  />
			</td>
		</tr>
		<!--  --><tr>
			<td style="font-weight: bold;" align="center"> 상품 별점</td>
			<td>
			<div>
				<select id="review_star" name="review_star" required="required">
					<option value="">선택하세요</option>
					<option value="0">☆☆☆☆☆</option>
					<option value="1">★☆☆☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="3">★★★☆☆</option>
					<option value="4">★★★★☆</option>
					<option value="5">★★★★★</option>
				</select>	
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" class="btn btn-success" value="리뷰 삭제하기">
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