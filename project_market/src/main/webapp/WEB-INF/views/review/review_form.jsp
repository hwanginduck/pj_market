<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 게시판</title>
</head>
<body>
<div class="container" align="center">
<h3 style="font-weight: bold; margin: 30px 0px 30px 0px;">상품 리뷰</h3>

<form action="review_insert" method="post" onsubmit="return Check()">
    

	<table class="table">
		<tr>
		 <th>아이디</th>
	       <td>
		<input name="member_id" id="member_id" size="14" class="input_box" />
			</td>
		</tr>
		<tr>
		 <th>글제목</th>
	       <td>
		<input name="review_sb" id="review_sb" size="14" class="input_box" />
			</td>
		</tr>
		
		<tr>
		 <th>상품코드</th>
		 <td>
			<input name="product_num" id="product_num" size="14" class="input_box" />
		</td>
		</tr>
		
		<tr>
		 <th>옵션코드</th>
		 <td>
			<input name="options_num" id="options_num" size="14" class="input_box" />
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
				<textarea id="review_content" name="review_content" rows="10" cols="50" 
				class="input_box">※리뷰 내용은 필수 작성 항목입니다※</textarea>
			</td>
		</tr> 
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="등록" class="input_button">
				<input type="reset" value="취소" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>