<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../fix/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/official.css" rel="stylesheet" /> 
<section>
	<form method=post action="off_update.do">
		<input type="hidden" name="off_num" value="${off.off_num}">
		<input type="hidden" name="page" value="${page}">
		<div class="offwirte-contain-pj">
			<div class="offwirte-header-pj">공지사항 수정</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">작성자</div>
				<div class="offwirte-input-pj"><input type=text name="off_name" required="required"value =${off.off_name } autofocus="autofocus"></div>
			</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">비밀번호</div>
				<div class="offwirte-input-pj"><input type=password name="off_pw" required="required"></div>
			</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">제목</div>
				<div class="offwirte-input-pj"><input type=text name="off_subject" required="required" value = "${off.off_subject }"></div>
			</div>
			<div class="offwirte-wricontent-pj">
				<div class="offwirte-wricontent-col-pj">공지사항</div>
				<div class="offwirte-inputcontent-pj"><textarea cols=40 rows=5 name="off_content" required="required">${off.off_content}</textarea></div>
			</div>
			<div class="offlist-footer-pj">
				<button type="button" onclick="history.go(-1)">이전</button>
				<button type=submit>글수정</button>
				<button type=reset>취소</button>
			</div>
		</div>
	</form>
</section>
<%@ include file="../fix/footer.jsp"%>