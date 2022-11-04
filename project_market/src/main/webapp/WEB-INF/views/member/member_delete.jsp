<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="./js/jquery.js"></script>
<script>
 function check(){
	 if($.trim($("#pwd").val())==""){
		 alert("비밀번호를 입력하세요.");
		 $("#pwd").val("").focus();
		 return false;
	 }
 }
</script>
</head>
<body>
 <div id="del_wrap">
  <h2 class="del_title">회원탈퇴</h2>
  <form method="post" action="member_del_ok.do" onsubmit="return check()">
    <table id="del_t">
     <tr>
      <th>회원아이디</th>
      <td>
      ${d_id}
      </td>
     </tr>
     
     <tr>
      <th>회원이름</th>
      <td>${d_name}</td>
     </tr>
     
     <tr>
      <th>비밀번호</th>
      <td>
      <input type="password" name="member_pw" id="member_pw" size="14" 
      			class="input_box" />
      </td>
     </tr>
    </table>
    
    <div id="del_menu">
     <input type="submit" value="탈퇴" class="input_button" />
     <input type="reset" value="취소" class="input_button"
     	onclick="$('#member_pw').focus();" />
    </div>
  </form>
 </div>
</body>
</html>