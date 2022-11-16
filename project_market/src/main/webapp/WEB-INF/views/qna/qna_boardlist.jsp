<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/bootstrap.min..js"></script>



<meta charset="UTF-8">
<title>Q&A BoardPage</title>
</head>
<body>
	<!-- 관리자유무에 따라 답변 버튼 활성화, 접속자에 따라 자신이 작성한 글 수정가능 -->
	<c:set var="session_id" value="${member_id }" />
	<c:set var="admin_user" value="admin" />
	session_id : ${session_id } <br>
	admin_user : ${admin_user } <br>
<%-- 	<c:if test=${session_id eq admin_user }>같음</c:if> --%>
	
<section class="main-pj">
	<div class="detail-content-pj">

	<div align="center" id="boardlist">
		<div>
		<h2 class="">상품문의</h2>
		</div>
		<c:if test="${empty boardlist}">
			<tr>
				<td colspan="5">작성된 문의글이 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${not empty boardlist}">
			<c:forEach var="bl" items="${boardlist}" varStatus="status">
			<form id="${bl.qna_no }" name="${bl.qna_no }">
				<input type="hidden" id="qna_group" 	name="qna_group" value="${bl.qna_group }" />
				<input type="hidden" id="qna_re"		name="qna_re" 	value="${bl.qna_re }" />
				<input type="hidden" id="product_num" 	name="product_num" value="${product.product_num }">
				<table class="table table-striped" style="size: auto; border-radius: 8px;">
					<tr>
						<td width="" align="left"><c:if test="${bl.member_id ne 'admin' }">
								<img src="${pageContext.request.contextPath}/resources/img/q.JPG">
							</c:if></td>
						<td style="width: 220px" align="left">사용자아이디</td>
						<td style="width: 220px" align="left">상품명</td>
						<td style="width: 220px" align="left">작성일</td>
						<td style="width: 220px" align="left">
						<c:if test="${session_id  eq bl.member_id }"> <button type="button" id="${status.index }" onClick="delbtn(${status.index })" class="btn btn-info" value="${bl.qna_no }" >삭제</button>
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

						<td>${product.product_name }</td>
						<td><fmt:formatDate value="${bl.qna_date}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td>

								<!-- 세션 아이디랑, 작성자 아이디랑 같을경우 수정버튼 활성화 -->						
							<c:if test="${session_id  eq bl.member_id }">
								<button type="button" onClick="WindowPOP(${bl.qna_no},${product.product_num })" class="btn btn-info" value="">수정</button>
							</c:if> 
							<c:if test="${member_id eq 'admin'and bl.qna_re ne 1 }">
								<button type="button" onClick="WindowPOP(${bl.qna_no},${product.product_num })" class="btn btn-info" value="">답변</button>
							</c:if>
						</td>
					</tr>

					<th colspan=5><pre style="width: 1160px;"> ${bl.qna_content } </pre></th>
				</table>
			</form>
			</c:forEach>
		</c:if>


		<!-- 테이블리스트끝 -->
	<div>
		<ul class="pagination">
			<c:if test="${page <=1 }">
				<li><a>이전 </a></li>
			</c:if>

			<c:if test="${page > 1 }">
				<li><a onClick="Before(${page},${product_num })">이전</a></li>
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li><a>${a}</a></li>
				</c:if>
				<c:if test="${a != page }">
					<li><a onClick="SelPage(${a },${product_num })">${a}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				<li><a>다음</a></li>
			</c:if>
			<c:if test="${page < maxpage }">
					<li><a onClick="Next(${page},${product_num })">다음</a></li>
			</c:if>

		</ul>
	</div>
		<!-- 문의글 작성 폼태그 -->

		<!-- <form method="post" action="qna_boardinsert.do"> -->
		<div style="overflow: auto;">
		<form id="frm" name="frm">
			<table class="table table-striped" style="size: auto;">
				<input type="hidden" name="member_id" id="member_id"  value="${member_id }" />
				<input type="hidden" name="product_num" id="product_num" value="${product_num }" />

				<c:if test="${member_id eq 'admin' }">
					<input type="hidden" name="qna_re" id="qna_re" value="1">
				</c:if>
				<c:if test="${member_id ne 'admin' }">
					<input type="hidden" name="qna_re" id="qna_re" value="0">
				</c:if>

				<c:if test="${member_id eq 'admin' }">
					<input type="hidden" name="qna_group" id="qna_group"  value="${qna_no }" />
				</c:if>
				<c:if test="${member_id ne 'admin' }">
					<input type="hidden" name="qna_group" id="qna_group"  value="0" />
				</c:if>
				<tr>
					<td style="width: 220px">상품명</td>
					<td style="width: 220px">상품코드</td>
					<td style="width: 220px">아이디</td>
					<td style="width: 220px"></td>
				</tr>
				<tr>
					<td>(상품명) 	${product.product_name }</td>
					<td>(상품코드) ${product_num }</td>
					<td>(아이디)	${member_id }</td>
					<td></td>
				</tr>
				<th colspan=5>
					<pre>
						<textarea rows="4" cols="153" name="qna_content" style="display: block; margin: 3px 3px 0 10px; border: none; outline: none; resize: none;"></textarea>
					</pre></th>
			</table>
			<input type="button" value="확인" id="reInsert" class="btn btn-info" />
		</form>
		</div>
	</div>
	</div>
	</section>

</body>

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
    		var frmData = $('form').serialize();
    		/* var frmData = 'member_id=' + frm.member_id.value +
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
    	$('#boardlist').load('qna_boardlist.do?product_num=${product_num}')
			})
		// click이벤트 종료
	})
 </script>
 
 <script>   
 
 	function delbtn (btn){
	var btnval = document.getElementById(btn).value; // 130? qna_no 랑 같은 값을 가짐
 		var frmData = $('#'+btnval).serialize();
        	  if (confirm('게시글을 삭제합니다.')) {
	             $.ajax({
    			      	   url : "qna_delete.do",
          	   				type : "POST",
          	   				data : 
          		   			frmData,
          		   			success : function(data) {
          			   		$('#boardlist').html(data);
          			   		alert("삭제완료");
          		   },
          	   error : function(e) {
          		   alert("오류");
          	   }
             })
          }
 	}
      
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

<script> // 팝업창으로 댓글 수정하기
	
	var upform, reform;
	
	function WindowPOP(qna_no, product_num) {
		upform = window.open("qna_updateform.do?qna_no="+qna_no+"&product_num="+product_num , 'mywin01', 'width=1250, height=300'); 
	}
	
	function closePOP () {
		upform.close();
	}

</script>
</html>