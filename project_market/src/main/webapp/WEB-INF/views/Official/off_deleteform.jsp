<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../fix/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/official.css" rel="stylesheet" /> 
<section>
	<form method=post action="off_delete.do">
		<input type="hidden" name="off_num" value="${param.off_num}">
		<input type="hidden" name="page" value="${param.page}">
		<div class="offlist-deletecon-pj">
			<div class="offwirte-header-pj">공지사항 삭제</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">비밀번호</div>
				<div class="offwirte-input-pj"><input type=password name="off_pw" required="required"></div>
			</div>
			<div class="offlist-footer-pj">
				<button type="button" onclick="history.go(-1)">이전</button>
				<button type=submit>삭제</button>
				<button type=reset>취소</button>
			</div>
		</div>
	</form>
</section>
<%@ include file="../fix/footer.jsp"%>

