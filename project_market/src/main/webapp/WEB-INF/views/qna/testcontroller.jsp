<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta charset="UTF-8">

<script>
	function mytest() {
		var ql = $('#qnaboard').serialize();
		alert(ql);
				$.ajax({
					url : "ok.do",
					type : "POST",
					data : { 'qnaboard' : $('#qnaboard').serialize() },
					success : function(responseData) {
						//var jsObj = JSON.parse(responseData); 
						//JSON 데이터를 JSObj객체로 변환해주는 메서드 parse !!
						//jQuery 버젼을 올려서 필요 없음			 
						if (!responseData) {
							alert("데이터전송실패");
							return false;
						}

						var html = "";
						html += "<form id='ajax'>";
						html += "글번호 <input name='qna_no' value='"+responseData.qna_no+"'>";
						html += "상품번호 <input name='qna_num' value='"+responseData.qna_num+"'>";
						html += "리플유무 <input name='qna_re' value='"+responseData.qna_re+"'>";
						html += "날짜 <input name='qna_content' value='"+responseData.qna_content+"'>";
						html += "내용 <input name='qna_date' value='"+responseData.qna_date+"'>";
						html += "그룹번호 <input name='qna_group' value='"+responseData.qna_group+"'>";
						html += "</form>";
						$("#name").val("");

						$("#container").html(html);
					}
				}); // Ajax end
	}
</script>

</head>
<body>

	${qlist }
	<br> ${qlist.qna_no }

	<form id="qnaboard">
		<input name="qna_no" id="qna_no" value="${qlist.qna_no }"> <input name="product_num" id="product_num" value="${qlist.product_num }">
		<input name="qna_re" id="qna_re" value="${qlist.qna_re }"> <input name="qna_content" id="qna_content" value="${qlist.qna_content }">
		<input name="qna_date" id="qna_date" value="${qlist.qna_date }"> <input name="qna_group" id="qna_group" value="${qlist.qna_group }">
		<br> <br> <br> <br> <br> <br> <input type="button" onClick="mytest()" value="AJAX전송딸깍">
	</form>

	<div id="container"></div>



</body>
</html>