<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/css/tb.css" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<script type="text/javascript">

	// 게시물 삭제 확인
    var fnConfirm = function(qna_re, qna_group) {
        if (confirm('게시글을 삭제합니다.')) {
            location.href="qna_delete.do?qna_re="+qna_re+"&qna_group="+qna_group; 
        }
    }
    
/* 	// 이전페이지
    function Before(page,prduct_num){
    	$.post(
				'${path}/qna_boardlist.do?page=${page-1}&product_num=${product_num}',
				function(data) {
			$('#boardlist').html(data);
			frm.replytext.value = '';
		});
    };
    
    // 선택페이지
    function SelPage(a,prduct_num){
    	var page =  a;
    	$.post(
				'${path}/qna_boardlist.do?page='+page+'&product_num=${product_num}',
				function(data) {
			$('#boardlist').html(data);
			frm.replytext.value = '';
		});
    };
    
    // 다음페이지
    function Next(page,prduct_num){
    	$.post(
				'${path}/qna_boardlist.do?page=${page+1}&product_num=${product_num}',
				function(data) {
			$('#boardlist').html(data);
			frm.replytext.value = '';
		});
    }; */
   
</script>

<meta charset="UTF-8">
<title>Q&A BoardPage</title>
</head>
<body>
	
	<c:set var ="session_id" value="${member_id }"/>
	<c:set var ="admin_user" value ="admin" />
	<c:out value ="${session_id }" />
	

	<div align="center" id="boardlist" >
		<h2 class="text-primary">게시판 목록</h2>

		<c:if test="${empty boardlist}">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>

		<c:if test="${not empty boardlist}">
			<c:forEach var="bl" items="${boardlist}">
				<table class="table table-striped">
					<tr>
						<td width="100" align="left">
						<c:if test="${bl.member_id ne 'admin' }">	<img src="${pageContext.request.contextPath}/resources/img/q.JPG"> </c:if>
						</td>
						<td width="250" align="left">사용자아이디</td>
						<td width="250" align="left">상품명</td>
						<td width="250" align="left">작성일</td>
						<td width="100" align="left">
						<c:if test="${session_id  eq bl.member_id }"> <input type="button" onClick="fnConfirm(${bl.qna_re }, ${bl.qna_group })" value="삭제">
						</c:if>
						</td>
					</tr>
					<tr>
						<td><c:if test="${bl.qna_re eq 1 }"><img src="${pageContext.request.contextPath}/resources/img/a.JPG"></c:if></td>

						<!-- ----------------------- ID 마스킹처리하는 구간 ----------------------- -->
						
						<td>
							<c:set var="name" value="${bl.member_id}" />
							<c:set var="admin" value="${'관리자' }" />
							<c:set var="length" value="${fn:length(name) }" />
							<c:set var="first" value="${fn:substring(name, 0, 3) }" />
							<c:set var="last" value="${fn:substring(name, 4, totalLength) }" />

							<c:if test="${!empty name and name ne 'admin'}">
								<c:out value="${first}" />
								<c:forEach var="count" begin="4" end="${fn:length(name) }" step="1">*</c:forEach>
							</c:if>
							
							<c:if test="${!empty name and name eq 'admin'}">
								<c:out value="${admin}" />
							</c:if>
						</td>

						<!-- ----------------------- ID 마스킹처리하는 END ----------------------- -->

						<td>${bl.product_num }</td>
						<td><fmt:formatDate value="${bl.qna_date}"
							pattern="yyyy-MM-dd HH:mm"/></td>
						<td>
							<c:if test="${session_id  eq bl.member_id }">	<input type="button" onClick="location.href='qna_updateform.do?qna_no=${bl.qna_no }'" value="수정"> </c:if>
							<c:if test="${session_id  eq admin_user }">	 	<input type="button" onClick="location.href='qna_writeform.do?qna_no=${bl.qna_no }&product_num=${bl.product_num}&qna_group=${bl.qna_group}'" value="답변" ></c:if>
							
						</td>
					</tr>
					
					<th colspan=5><pre style="width:1200px;"> ${bl.qna_content } </pre></th>
				</table>
			</c:forEach>
		
		</c:if>
		
	
		<!-- 테이블리스트끝 -->

		<ul class="pagination">
			<c:if test="${page <=1 }">
				<li><a>이전 </a></li>
			</c:if>

			<c:if test="${page > 1 }">
<%-- 				<li><a href="qna_boardlist.do?page=${page-1}&product_num=${product_num }">이전</a></li> --%>
				<li><a onClick="Before(${page},${product_num })">이전</a></li>
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li><a>${a}</a></li>
				</c:if>
				<c:if test="${a != page }">
					<%-- <li><a href="qna_boardlist.do?page=${a}&product_num=${product_num }">${a}</a></li> --%>
					<li><a onClick="SelPage(${a },${product_num })">${a}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				<li><a>다음</a></li>
			</c:if>
			<c:if test="${page < maxpage }">
<%-- 				<li><a href="qna_boardlist.do?page=${page+1}&product_num=${product_num }">다음</a></li> --%>
				<li><a onClick="Next(${page},${product_num })">다음</a></li>
			</c:if>

		</ul>
		
			<!-- 문의글 작성 폼태그 -->
		<form method="post" action="qna_boardinsert.do">
		<table class="table table-striped">
		<tr>
			<td>질문선택	</td>
			<td>상품명	</td>
			<td>아이디	</td>
			<td>4	</td>
			
		</tr>
		<tr>
			<td>ex)배송	</td>
			<td>ex)id	</td>
			<td>ex)16	</td>
			<td>14	</td>
		</tr>
			<th colspan=5><pre><textarea rows="3" cols="50" name="qna_content" style="display: block;margin: 4px 79px 0 10px;"></textarea></pre></th>
		</table>
			<input type="button" value="확인" class="btn btn-info"/>
		</form>
		
		<%-- <div align="center">
			<a href="qna_writeform.do?product_num=${product_num  }" class="btn btn-info">문의글 작성</a>
		</div> --%>
	</div>
</body>
</html>