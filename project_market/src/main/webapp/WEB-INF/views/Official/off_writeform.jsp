<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../fix/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/official.css" rel="stylesheet" /> 
<section>
	<form method=post action="off_write.do">
		<div class="offwirte-contain-pj">
			<div class="offwirte-header-pj">공지사항 작성</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">작성자</div>
				<div class="offwirte-input-pj"><input type=text name="off_name" required="required"></div>
			</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">비밀번호</div>
				<div class="offwirte-input-pj"><input type=password name="off_pw" required="required"></div>
			</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">제목</div>
				<div class="offwirte-input-pj"><input type=text name="off_subject" required="required"></div>
			</div>
			<div class="offwirte-wricontent-pj">
				<div class="offwirte-wricontent-col-pj">공지사항</div>
				<div class="offwirte-inputcontent-pj"><textarea cols=40 rows=5 name="off_content" required="required"></textarea></div>
			</div>
			<div class="offlist-footer-pj">
				<button type=submit>등록</button>
				<button type=reset>취소</button>
			</div>
		</div>
	</form>
</section>
<%@ include file="../fix/footer.jsp"%>