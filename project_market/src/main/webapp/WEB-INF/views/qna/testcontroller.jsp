<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${qlist } <br>
${qlist.qna_no }

<script>

var qna_no = ${qlist.qna_no}

var upform, reform;
function WindowPOP() {
	upform = window.open("qna_updateform.do?qna_no="+qna_no,"mywin01","width=800,height=800"); 
}

function closePOP () {
	upform.close();
}


</script>

<button type="button" id="upform" onClick="WindowPOP()"> 새창열기</button>


</body>
</html>