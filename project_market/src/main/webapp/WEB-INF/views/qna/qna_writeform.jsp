<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 45%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	padding: 10px;
}

th:first-child, td:first-child {
	border-left: none;
}
</style>
<meta charset="UTF-8">
<title>상품문의 작성게시판</title>
</head>
<body>
	<div align=center>
		<table>
			상품문의 게시판 입니다.
			<tr>
				<td align="center">글작성 성공</td>
				<td align="center">글목록 수</td>
				<td align="center">page</td>
				<td align="center">startpage</td>
				<td align="center">endpage</td>
				<td align="center">maxpage</td>
			<tr>
			<tr>
				<td align="center">${result }</td>
				<td align="center">${listcount }</td>
				<td align="center">${page }</td>
				<td align="center">${startpage }</td>
				<td align="center">${endpage }</td>
				<td align="center">${maxpage }</td>
			</tr>
		</table>
	</div>
	<hr>	

	<div align=center>
		<form method="post" action="qna_boardinsert.do"
			onSubmit="return board_check()">
			<input type="hidden" name="qna_re" id="qna_re" size="14" value="0" />
			
			<table border=1>

				<tr>
					<th> Member_id</th>
					<td><input name="member_id" id="member_id" size="14"
						value="ilovemoney2" /></td>
				</tr>

				<tr>
					<th> Product_num</th>
					<td><input name="product_num" id="product_num" size="14"
						value="48" /></td>
				</tr>

				<tr>
					<th> Qna_content</th>
					<td><textarea name="qna_content" id="qna_content" rows="8"
							cols="50" class="input_box">ㅎㅇ</textarea></td>
				</tr>

			</table>


			<input type="submit" value="등록" /> <input type="reset" value="취소" />

		</form>
	</div>
</body>
</html>