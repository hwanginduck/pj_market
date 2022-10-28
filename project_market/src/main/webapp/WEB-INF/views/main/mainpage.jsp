<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainpage.jsp</title>
</head>
<body>
	
	mainpage.jsp <br>
	메인페이지 입니다. <br>
	
	<!-- 회원가입 버튼 누르면 MemberController로 요청 -->
	<input type="button" value="회원가입" class="input_button" onclick="location='member_join.do'"/>
	
	<!-- 로그인 버튼 누르면 로그인 페이지로 이동 -->
	<input type="button" value="로그인" class="input_button" onclick="location='member_login_go.do'"/>

</body>
</html>