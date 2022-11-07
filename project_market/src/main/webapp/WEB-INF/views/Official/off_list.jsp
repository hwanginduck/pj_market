<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>

<section class="main-pj">
	<div class="detail-content-pj">

		


		<title>공지사항 목록</title>


		<table border=1 align=center width=700>
			<caption>공지사항 목록</caption>
			<tr>
				<th>번호</th>

				<th>제목</th>

				<th>작성자</th>

				<th>날짜</th>

				<th>조회수</th>
			</tr>

			<!-- 화면 출력 번호 -->
			<c:set var="num" value="${listcount-(page-1)*10 }" />
			<c:forEach var="b" items="${off_list}">
				<tr>
					<td>${num}<c:set var="num" value="${num-1 }" />
					</td>

					<td><a href="off_content.do?no=${b.off_num}&page=${page}"> ${b.off_subject} </a></td>

					<td>${b.off_name}</td>

					<td><fmt:formatDate value="${b.off_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

					<td>${b.off_readcount}</td>
				</tr>

			</c:forEach>

		</table>
		
		<!-- 페이지 처리 -->
		<div class="detail-content-pj">
		<ul class="pagination">
			<c:if test="${listcount > 0 }">

				<!-- 1페이지 이동 -->
				<a href="off_list.do?page=1" style="text-decoration: none"> < </a>

				<!-- 이전블럭으로 이동 -->
				<c:if test="${startPage > 10 }">
					<a href="off_list.do?page=${startPage-10 }">[이전]</a>
				</c:if>

				<!-- 각 블럭에 10개 페이지 출력 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == page}">
							[${i}]
				</c:if>
					<c:if test="${i != page}">
						<a href="off_list.do?page=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				<!-- 다음 블럭으로 이동 -->
				<c:if test="${endPage < pageCount }">
					<a href="off_list.do?page=${startPage+10 }">[다음]</a>
				</c:if>

				<!-- 마지막 페이지로 이동 -->
				<a href="off_list.do?page=${pageCount}" style="text-decoration: none"> > </a>
			</c:if>
		</ul>
		</div>
		
		
		
<a href="off_writeform.do">공지사항 작성</a> <br> 글갯수 : ${listcount }
	</div>
</section>

<%@ include file="../fix/footer.jsp"%>
