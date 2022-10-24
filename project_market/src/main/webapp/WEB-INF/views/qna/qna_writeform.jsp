<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/board.js"></script> 

<meta charset="UTF-8">
<title>상품문의 작성게시판</title>
</head>
<body>

  <form method="post" action="qna_boardinsert" onSubmit="return board_check()">
   <table border=1>
   
    <tr>
     <th>아이디member_id</th>
     <td>
     <input name="member_id" id="member_id" size="14" value="kiki"/>
     </td>
    </tr>
    
    <tr>
     <th>상품코드(product_num) "PRODUCT테이블" 조회해서 그 값을 전달해서 입력해야함</th>
     <td>
      <input name="product_num" id="product_num" size="14" value="48" />
     </td>
    </tr>
    
    <tr>
     <th>댓글여부(qna_re) "QNA테이블" </th>
     <td>
      <input name="qna_re" id="qna_re" size="14" value="0" />
     </td>
    </tr>
    
    <tr>
     <th>내용(qna_content)</th>
     <td>
     <textarea name="qna_content"  id="qna_content" rows="8" cols="50"
      class="input_box">ㅎㅇ</textarea>
     </td>
    </tr>
    
   </table>
   
   
    <input type="submit" value="등록"  />
    <input type="reset" value="취소"    onclick="$('#board_name').focus();" /> 
  
  </form>
</body>
</html>