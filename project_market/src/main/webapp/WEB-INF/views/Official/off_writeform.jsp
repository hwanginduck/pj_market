<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>

<form method=post action="off_write.do">
<table border=1 width=400 align=center>
	<caption><h3>공지사항 작성</h3></caption>
	
	<tr><th>작성자명</th>
		<td><input type=text name="off_name" required="required"></td>
	</tr>
	
	<tr><th>비밀번호</th>
		<td><input type=password name="off_pw" required="required"></td>
	</tr>
	
	<tr><th>제목</th>
		<td><input type=text name="off_subject" required="required"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea cols=40 rows=5 name="off_content" required="required"></textarea></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="등록">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</form>

</body>
</html>