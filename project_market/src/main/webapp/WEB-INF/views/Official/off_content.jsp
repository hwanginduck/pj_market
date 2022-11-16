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
			<div class="offwirte-header-pj">상세페이지</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">작성자</div>
				<div class="offwirte-input-pj" style="text-align: left;">${off.off_name}</div>
			</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-condate-col-pj">날짜</div>
				<div class="offwirte-condateprint-pj" style="text-align: left;"><fmt:formatDate value="${off.off_date}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
				<div class="offwirte-condate-col-pj">조회수</div>
				<div class="offwirte-condateprint-pj" style="text-align: left;">${off.off_readcount}</div>
			</div>
			<div class="offwirte-writer-pj">
				<div class="offwirte-writer-col-pj">제목</div>
				<div class="offwirte-input-pj" style="text-align: left;">${off.off_subject}</div>
			</div>
			<div class="offwirte-wricontent-pj">
				<div class="offwirte-wricontent-col-pj">공지사항</div>
				<div class="offwirte-inputcontent-pj" style="text-align: left; line-height: 30px;"><pre>${off.off_content}</pre></div>
			</div>
			<div class="offlist-footer-pj">
				<button type="button" onClick="location.href='off_list.do?page=${page}'"> 목록 </button>
				<button type="button" onClick="location.href='off_updateform.do?off_num=${off.off_num}&page=${page}'">수정</button>
				<button type="button" onClick="location.href='off_deleteform.do?off_num=${off.off_num}&page=${page}'">삭제</button>
			</div>
		</div>
	</form>
</section>
<%@ include file="../fix/footer.jsp"%>