<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>리뷰 게시판 목록</title>
    <link rel="stylesheet" href="./css/bbs.css" type="text/css">
</head>
<body>

	 리뷰 게시판 입니다.<br>
	 글작성 성공 : ${result } <br>
	 글목록 수 : ${listcount } <br>
	 
	 
	<!-- 게시판 리스트 -->
	<div id="bbslist_wrap">
		<h2 class="bbslist_title">게시판 목록</h2>
		<div id="bbslist_c">글 개수 : ${listcount}</div>

		<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 11pt;" width="8%"
					height="26">
					<div align="center">아이디</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="47%">
					<div align="center">글 제목</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">상품코드</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="17%">
					<div align="center">상품옵션</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">글 내용</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">작성일</div>
				</td>
			</tr>

			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="b" items="${boardlist}">
			
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					<!-- 번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">						
						
					<c:if test="${b.board_re_lev != 0}"> 
						<c:forEach var="k" begin="1" end="${b.board_re_lev}">
							&nbsp;&nbsp;			
						</c:forEach>
						<img src="./images/AnswerLine.gif">	
					</c:if>					
						
					<%-- <!-- 제목 출력 부분 -->	
					<a href="board_cont.do?board_num=${b.board_num}&page=${page}&state=cont">
							${r.review_sb}
					</a> --%>
					</div>
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.member_id}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.review_sb}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.product_num}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.options_num}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.review_content}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.review_date}</div>
				</td>
			</tr>
			
			</c:forEach>
			<!-- 반복문 끝 -->			
		</table>
		

		<div id="bbslist_paging">			
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="review_boardlist.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="review_boardlist.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="review_boardlist.do?page=${page+1}">[다음]</a>
			</c:if>			
			
		</div>
		<div id="bbslist_w">
			<input type="button" value="글쓰기" class="input_button"
				onclick="location='review_writeform.do?page=${page}'">
		</div>
		
	</div>
</body>
</html>