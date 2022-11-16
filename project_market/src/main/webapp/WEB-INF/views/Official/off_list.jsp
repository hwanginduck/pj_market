<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../fix/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/official.css" rel="stylesheet" />

<section>
	<div class="offlist-main-pj">
		<div class="offlist-content-pj">
			<div class="offlist-header-pj">공지사항</div>
			<div class="offlist-col-pj">
				<div class="offlist-num-pj">번호</div>
				<div class="offlist-title-pj">제목</div>
				<div class="offlist-writer-pj">작성자</div>
				<div class="offlist-date-pj">날짜</div>
				<div class="offlist-count-pj">조회수</div>
			</div>
			<div class="offlist-listprint-pj">
		<c:set var="num" value="${listcount-(page-1)*10 }" />
		<c:forEach var="b" items="${off_list}">
			<div class="offlist-con-pj">	
				<c:if test="${num <= (listcount-3)}">
					<div class="offlist-num-pj">
						${num}<c:set var="num" value="${num-1 }" />
					</div>
				</c:if>
				<c:if test="${num > (listcount-3)}">
					<div class="offlist-hinum-pj">
						NEW<c:set var="num" value="${num-1 }" />
					</div>
				</c:if>
				<div class="offlist-title-pj">
					<a href="off_content.do?off_num=${b.off_num}&page=${page}">
						${b.off_subject}
					</a>
				</div>
				<div class="offlist-writer-pj">
					${b.off_name}
				</div>
				<div class="offlist-date-pj">
					<fmt:formatDate value="${b.off_date}" pattern="yyyy-MM-dd" />
				</div>
				<div class="offlist-count-pj">
					${b.off_readcount}
				</div>
			</div>
		</c:forEach>
	</div>



<div class="offlist-pagination-center">
	<div class="offlist-pagination-pj">

	<!-- 페이지 처리 -->
			<c:if test="${listcount > 0 }">

				<!-- 1페이지 이동 -->
				<a href="off_list.do?page=1" style="text-decoration: none"> < </a>

				<!-- 이전블럭으로 이동 -->
				<c:if test="${startPage > 10 }">
					<a href="off_list.do?page=${startPage-10 }">이전</a>
				</c:if>

				<!-- 각 블럭에 10개 페이지 출력 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == page}">
							<a>${i}</a>
					</c:if>
					<c:if test="${i != page}">
						<a href="off_list.do?page=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<!-- 다음 블럭으로 이동 -->
				<c:if test="${endPage < pageCount }">
					<a href="off_list.do?page=${startPage+10 }">다음</a>
				</c:if>

				<!-- 마지막 페이지로 이동 -->
				<a href="off_list.do?page=${pageCount}"
					style="text-decoration: none"> > </a>

			</c:if>
		</div>
		</div>
		<div class="offlist-footer-pj">
			<button type="button" onclick="location.href='off_writeform.do'">공지사항 작성</button>
		</div>
		</div>
		</div>
	
	</section>
	<%@ include file="../fix/footer.jsp"%>