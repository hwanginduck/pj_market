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
		<h2 class="text-primary">리뷰 상세정보</h2>
		<table class="table table-bordered">
			<tr>
				<td>제목</td>
				<td>${review_sb}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${member_id}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${board.readcount}</td>
			</tr>
			<tr>
				<td>상품코드</td>
				<td>${product_num}</td>
			</tr>
			<tr>
				<td>옵션코드</td>
				<td>${options_num}</td>
			</tr>
			<tr>
				<td>별점</td>
				<td>${review_star}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre>${review_content}</pre></td>
			</tr>
		</table>
		<a href="${path}/review_boardlist/pageNum/${pageNum}" class="btn btn-info">목록</a>
		<a href="${path}/updateForm/num/${board.num}/pageNum/${pageNum}"
			class="btn btn-info">수정</a> <a
			href="${path}/deleteForm/num/${board.num}/pageNum/${pageNum}"
			class="btn btn-info">삭제</a> <a
			href="${path}/insertForm/nm/${board.num}/pageNum/${pageNum}"
			class="btn btn-info">답변</a>
		<p>
		<form name="frm" id="frm">
			<input type="hidden" name="member.id" value="${member_id}">
			<textarea rows="3" cols="50" name="replytext"></textarea>
			<input type="button" value="확인" id="repInsert">
		</form>
		<div id="slist"></div>
	</div>
</body>
</html>