<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>
</head>
<body>

no :${param.no } <br>
page :${param.page } <br>

<form method=post action="off_delete.do">
<input type="hidden" name="off_num" value="${param.off_num}">
<input type="hidden" name="page" value="${param.page}">

<table border=1 width=400 align=center>
	<caption>공지사항 </caption>
	
	<tr><th>비밀번호</th>
		<td><input type=password name="off_pw" required="required"></td>
	</tr>
	
	<tr><td colspan=2 align=center>
			<input type=submit value="글삭제">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</form>


</body>
</html>