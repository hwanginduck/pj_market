<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">List of Review Boards</h2>
		<table class="table table-striped">
			<tr>
				<td>Review no</td>
				<td>Subject</td>
				<td>ID</td>
				<td>Date</td>
				<td>views</td>
			</tr>
			<c:if test="${empty boardlist}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty boardlist}">
				<c:set var="no1" value="${no }"></c:set>
				
				<c:forEach var="boardlist" items="${boardlist }">
					<tr>
						<td>${boardlist.review_no}</td>
						<c:if test="${board.del =='y' }">
							<td colspan="4">삭제된 데이터 입니다</td>
						</c:if>
						<c:if test="${board.del !='y' }">
							<td><a href="${path }/review_detail/num/${board.num}/pageNum/${pp.currentPage}"
									class="btn btn-default"> 
									<c:if test="${board.re_level >0 }">
										<img alt="" src="${path }/images/level.gif" height="2" width="${board.re_level *5 }">
										<img alt="" src="${path }/images/re.gif">
									</c:if> 
									${boardlist.review_sb} 
									<c:if test="${board.readcount > 30 }">
										<img alt="" src="${path }/images/hot.gif">
									</c:if></a></td>
							<td>${boardlist.member_id}</td>
							<td>${boardlist.review_date}</td>
							<td>views</td>
						</c:if>
					</tr>
					<c:set var="no1" value="${no1 - 1}"></c:set>
				</c:forEach>
				
			</c:if>
		</table>
		<form action="${path}/review_boardlist/pageNum/1">
			<select name="search">
				<option value="subject"
					<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
				<option value="content"
					<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
				<option value="writer"
					<c:if test="${search=='writer'}">selected="selected" </c:if>>작성자</option>
				<option value="subcon"
					<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> 
			<input type="text" name="keyword"> 
			<input type="submit" value="확인">
		</form>
		<ul class="pagination">
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/review_boardlist/pageNum/${pp.startPage - 1}?search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/review_boardlist/pageNum/${i}?search=${search}&keyword=${keyword}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/review_boardlist/pageNum/${pp.endPage + 1}?search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/review_boardlist/pageNum/${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/review_boardlist/pageNum/${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/review_boardlist/pageNum/${pp.endPage + 1}">다음</a></li>
				</c:if>
		  </c:if>
		</ul>
		<div align="center">
			<a href="${path}/review_writeform" class="btn btn-info">리뷰 글  작성</a>
		</div>
	</div>
</body>
</html>