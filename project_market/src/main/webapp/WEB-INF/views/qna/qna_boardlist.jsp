<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/css/tb.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Q&A BoardPage</title>
</head>
<body>
	${pageContext.request.contextPath }


	<div class="container" align="center">
		<h2 class="text-primary">게시판 목록</h2>

		<c:if test="${empty boardlist}">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>

		<c:if test="${b.board_re_lev != 0}">
			<c:forEach var="k" begin="1" end="${b.board_re_lev}">
							&nbsp;&nbsp;			
						</c:forEach>
		</c:if>

		<c:if test="${not empty boardlist}">
			<c:forEach var="boardlist" items="${boardlist}">
				<table class="table table-striped">
					<tr>
						<td>글번호</td>
						<td>사용자아이디</td>
						<td>상품명</td>
						<td>작성일</td>
						<td>[답변]</td>
					</tr>
					<tr>
						<td>${boardlist.qna_no }</td>

						<!-- ----------------------- ID 마스킹처리하는 구간 ----------------------- -->

						<td><c:set var="name" value="${boardlist.member_id}" /> <c:set
								var="length" value="${fn:length(boardlist.member_id) }" /> <c:set
								var="first" value="${fn:substring(boardlist.member_id, 0, 5) }" />
							<c:set var="last"
								value="${fn:substring(boardlist.member_id, 4, totalLength) }" />

							<c:if test="${!empty  boardlist.member_id}">
								<c:out value="${first}" />
								<c:forEach var="count" begin="6"
									end="${fn:length(boardlist.member_id) }" step="1">*</c:forEach>
							</c:if></td>

						<!-- ----------------------- ID 마스킹처리하는 END ----------------------- -->


						<td>${boardlist.product_num }</td>
						<td>${boardlist.qna_date }</td>
						<td> [수정] </td>
					</tr>
					<th colspan=5><pre> ${boardlist.qna_content } </pre></th>
				</table>
			</c:forEach>
		</c:if>
		<!-- 테이블리스트끝 -->

		<ul class="pagination">
			<c:if test="${page <=1 }">
				<li><a>이전</a></li>
			</c:if>

			<c:if test="${page > 1 }">
				<li><a href="qna_boardlist.do?page=${page-1}">이전</a></li>
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li><a>${a}</a></li>
				</c:if>
				<c:if test="${a != page }">
					<li><a href="qna_boardlist.do?page=${a}">${a}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				<li><a>다음</a></li>
			</c:if>
			<c:if test="${page < maxpage }">
				<li><a href="qna_boardlist.do?page=${page+1}">다음</a></li>
			</c:if>

		</ul>

		<div align="center">
			<a href="qna_writeform.do" class="btn btn-info">문의글 작성</a>
		</div>
	</div>
</body>
</html>