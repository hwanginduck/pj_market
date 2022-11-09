<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/css/tb.css" rel="stylesheet">

<script src="${path}/resources/js/product.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<script type="text/javascript">

    // AJAX글쓰기
    $(function() {
    	$('#reInsert').click(function() {
    		if(!frm.qna_content.value){
    			alert('등록할 내용이 없슴. 내용을 입력하셈');
    			frm.qna_content.focus();
    			return false;
    		}
    	// #reInsert 종료
    		var frmData = $('#frmList').serialize();
    		/* var frmData = 	'member_id=' + frm.member_id.value +
    						'&product_num' + frm.product_num.value +
    						'&qna_re' + frm.qna_re.value +
    						'&qna_group' + frm.qna_group.value +
    						'&qna_content' + frm.qna_content.value; */
			$.post('qna_boardinsert.do',
					frmData,
					function (data) {
						$('#boardlist').html(data);
						frm.qna_content.value=''; // 입력후 댓글입력창 초기화
					});
    			// post Ajax종료
    	$('#boardlist').load('qna_boardlist.do?product_num=${product_num}&product_name=${product_name}')
			})
		// click이벤트 종료
		
	
		
	})
    
    var delbtn = function() {
    	var frmData = $('form').serialize();
        if (confirm('게시글을 삭제합니다.')) {
           console.log(frmData);
        }
    }
    
    
	// 게시물 삭제 확인
//     var delbtn = function(qna_re, qna_group) {
//         if (confirm('게시글을 삭제합니다.')) {
//             location.href="qna_delete.do?qna_re="+qna_re+"&qna_group="+qna_group; 
//         }
//     }

	
	
    
 	// 이전페이지
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
    };  
    
    
   
</script>

<meta charset="UTF-8">
<title>Q&A BoardPage</title>
</head>
<body>
	<!-- 관리자유무에 따라 답변 버튼 활성화, 접속자에 따라 자신이 작성한 글 수정가능 -->
	<c:set var="session_id" value="${member_id }" />
	<c:set var="admin_user" value="admin" />


	<div align="center" id="boardlist">
		<h2 class="text-primary">게시판 목록</h2>

		<c:if test="${empty boardlist}">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>

		<c:if test="${not empty boardlist}">
			<c:forEach var="bl" items="${boardlist}">
			<form id="frmList" name="frmList">
				<table class="table table-striped">
					<tr>
						<td width="100" align="left"><c:if test="${bl.member_id ne 'admin' }">
								<img src="${pageContext.request.contextPath}/resources/img/q.JPG">
							</c:if></td>
						<td width="250" align="left">사용자아이디</td>
						<td width="250" align="left">상품명</td>
						<td width="250" align="left">작성일</td>
						<td width="100" align="left">
						<c:if test="${session_id  eq bl.member_id }"> <input type="button" onClick="delbtn()" value="삭제">
								<%-- <c:if test="${session_id  eq bl.member_id }"> <input type="button" id="delButton" value="삭제"> --%>
						</c:if>
						</td>
					</tr>
					<tr>
						<td><c:if test="${bl.qna_re eq 1 }">
								<img src="${pageContext.request.contextPath}/resources/img/a.JPG">
							</c:if></td>

						<!-- ----------------------- ID 마스킹처리하는 구간 ----------------------- -->

						<td><c:set var="name" value="${bl.member_id}" /> <c:set var="admin" value="${'관리자' }" /> <c:set var="length" value="${fn:length(name) }" /> <c:set var="first" value="${fn:substring(name, 0, 3) }" /> <c:set var="last" value="${fn:substring(name, 4, totalLength) }" /> <c:if test="${!empty name and name ne 'admin'}">
								<c:out value="${first}" />
								<c:forEach var="count" begin="4" end="${fn:length(name) }" step="1">*</c:forEach>
							</c:if> <c:if test="${!empty name and name eq 'admin'}">
								<c:out value="${admin}" />
							</c:if></td>

						<!-- ----------------------- ID 마스킹처리하는 END ----------------------- -->

						<td>${product_name }</td>
						<td><fmt:formatDate value="${bl.qna_date}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td><c:if test="${session_id  eq bl.member_id }">
								<input type="button" onClick="location.href='qna_updateform.do?qna_no=${bl.qna_no }'" value="수정">
							</c:if> <c:if test="${session_id  eq admin_user }">
								<input type="button" onClick="location.href='qna_writeform.do?qna_no=${bl.qna_no }&product_num=${bl.product_num}&qna_group=${bl.qna_group}'" value="답변">
							</c:if></td>
					</tr>

					<th colspan=5><pre style="width: 1200px;"> ${bl.qna_content } </pre></th>
				</table>
			</form>
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

		<!-- <form method="post" action="qna_boardinsert.do"> -->
		<form id="frm" name="frm">
			<table class="table table-striped">
				<input type="hidden" name="member_id" id="member_id" size="14" value="${member_id }" />
				<input type="hidden" name="product_num" id="product_num" size="14" value="${product_num }" />

				<c:if test="${member_id eq 'admin' }">
					<input type="hidden" name="qna_re" id="qna_re" value="1">
				</c:if>
				<c:if test="${member_id ne 'admin' }">
					<input type="hidden" name="qna_re" id="qna_re" value="0">
				</c:if>

				<c:if test="${member_id eq 'admin' }">
					<input type="hidden" name="qna_group" id="qna_group" size="14" value="${qna_no }" />
				</c:if>
				<c:if test="${member_id ne 'admin' }">
					<input type="hidden" name="qna_group" id="qna_group" size="14" value="0" />
				</c:if>
				<tr>
					<td>상품명</td>
					<td>상품코드</td>
					<td>아이디</td>
					<td></td>
				</tr>
				<tr>
					<td>(상품명) ${product_name }</td>
					<td>(상품코드) ${product_num }</td>
					<td>(아이디) ${member_id }</td>
					<td></td>
				</tr>
				<th colspan=5><pre>
						<textarea rows="3" cols="50" name="qna_content" style="display: block; margin: 4px 79px 0 10px;"></textarea>
					</pre></th>
			</table>
			<input type="button" value="확인인" id="reInsert" class="btn btn-info" />
		</form>
	</div>

</body>
</html>