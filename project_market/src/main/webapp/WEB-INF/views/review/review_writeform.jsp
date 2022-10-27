<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="/js/board.js"></script>
	
<meta charset="UTF-8">
<title>리뷰 작성 게시판</title>
</head>
<body>

<div class="container" align="center">
<h3 style="font-weight: bold; margin: 30px 0px 30px 0px;">상품 리뷰</h3>

<form action="review_insertresult" method="post" onsubmit="return board_check()">
			<input type="hidden" name="ref" value="${ref}"> 
			<input type="hidden" name="re_step" value="${re_step}"> 
			<input type="hidden" name="re_level" value="${re_level}"> 
			<input type="hidden" name="pageNum" value="${pageNum}">
    

	<table class="table table-striped">
		<tr>
		 <th>회원 아이디</th>
	       <td>
		<input name="member_id" id="member_id" size="14" class="input_box" value="테스트값" />
			</td>
		</tr>
		<tr>
		 <th>글 제목</th>
	       <td>
		<input name="review_sb" id="review_sb" size="14" class="input_box" value="테스트값"  />
			</td>
		</tr>
		<tr>
		 <th>상품코드</th>
		 <td>
			<input name="product_num" id="product_num" size="14" class="input_box" value="테스트값" />
		</td>
		</tr>
		
		<tr>
		 <th>옵션코드</th>
		 <td>
			<input name="options_num" id="options_num" size="14" class="input_box" value="테스트값" />
		</td>
		</tr>
		
		<tr>
			<td style="font-weight: bold;" align="center">별 점</td>
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
			<td colspan="2">
				<textarea id="review_content" name="review_content" rows="10" cols="50" >※리뷰 내용은 필수 작성 항목입니다※</textarea>
			</td>
		</tr> 
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" class="btn btn-success" value="등록">
				<input type="reset" class="btn btn-outline-success"  value="취소" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>