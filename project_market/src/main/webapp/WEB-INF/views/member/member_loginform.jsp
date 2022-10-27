<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="member_login" align="center">
  <h2 class="login_title">로그인</h2>
  <form method="post" action="member_login_ok.do"
  		onsubmit="return check()">
   <table id="login_t">
    <tr>
     <th>ID</th>
     <td>
      <input name="member_id" id="member_id" size="20" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="member_pw" id="member_pw" size="20" class="input_box"/>
     </td>
    </tr>
   </table>
    <div id="login_menu">
    <input type="submit" value="로그인" class="input_button" />
    <input type="reset" value="취소" class="input_button"
    		onclick="$('#member_id').focus();" />
    <input type="button" value="회원가입" class="input_button"
    		onclick="location='member_join.do'" />
    <input type="button" value="비번찾기" class="input_button"
    		onclick="pwd_find()" />
    </div>
  </form>
 </div>
</body>
</html>