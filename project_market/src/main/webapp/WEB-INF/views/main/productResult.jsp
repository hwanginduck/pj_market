<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1 }">
	<script>
	
	
		alert("찜등록이 되었습니다.");
		history.go(-1);
	</script>
</c:if>



    var fnConfirm = function(qna_re, qna_group) {
        if (confirm('게시글을 삭제합니다.')) {
            location.href="qna_delete.do?qna_re="+qna_re+"&qna_group="+qna_group; 
        }
    }