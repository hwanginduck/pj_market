<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
</head>
<body>
<c:set var="session_id" value="${member_id }" />

	<section class="main-pj">
		<div class="detail-content-pj">
		
		<div class="reviewlist" align="center">
			<h2 class="text-primary">List of Review Boards</h2>
				총 리뷰 수 : ${listcount } <br>
			<input type="hidden" name="member_id" value=${member_id }> 
		    <input type="hidden" name="product_num" value="${product_num }">
				<table class="table table-striped">
					<tr>
						<td align="center">Review No</td>
						<td align="center">Subject</td>
						<td align="center">ID</td>
						<td align="center">Date</td>
						<td align="center">views</td>
					</tr>
					<c:if test="${empty boardlist}">
						<tr>
							<td colspan="5">데이터가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty boardlist}">

						<!-- 화면 출력 번호  변수 정의 -->
						<c:set var="num" value="${listcount-(page-1)*5}" />

						<!-- 반복문 시작 -->
						<c:forEach var="b" items="${boardlist}">

							<tr align="center" valign="middle" bordercolor="#333333"
								onmouseover="this.style.backgroundColor='F8F8F8'"
								onmouseout="this.style.backgroundColor=''">
								<td height="23" style="font-family: Tahoma; font-size: 10pt;">
									<!-- 번호 출력 부분 --> <c:out value="${num}" /> <c:set var="num"
										value="${num-1}" />
								</td>

								<td style="font-family: Tahoma; font-size: 10pt;">
									<div align="center">

						<!-- 제목 출력 부분 -->
				<a href="review_detail.do?review_no=${b.review_no}&page=${page}&product_num=${product_num}">
											${b.review_sb} </a>
											<br>
					 <c:if test="${session_id  eq b.member_id }">
						<input type="button" class="btn btn-outline-success" value="수정"
						onclick="location='review_update.do?review_no=${b.review_no}&product_num=${product_num}'">
							</c:if> 
			    	 <c:if test="${session_id  eq b.member_id }">
						<input type="button" class="btn btn-outline-success" value="삭제"
						onclick="location='review_delete.do?review_no=${b.review_no}'">
							</c:if> 
			</div>
								</td>

								<td style="font-family: Tahoma; font-size: 10pt;">
									<div align="center">${b.member_id}</div>
								</td>
								<td style="font-family: Tahoma; font-size: 10pt;">
									<div align="center">

										<fmt:formatDate value="${b.review_date}"
											pattern="yyyy-MM-dd HH:mm:ss" />

									</div>
								</td>
								<td style="font-family: Tahoma; font-size: 10pt;">
									<div align="center">${b.r_hit}</div>
								</td>
							</tr>

						</c:forEach>
						<!-- 반복문 끝 -->
					</c:if>
				</table>
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

				<div align="center">
					<a href="${path}/review_writeform?product_num=${product_num}" class="btn btn-info">리뷰 글 작성</a>
				</div>
			</div>
		</div>
	</section>

</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
// 이전페이지
    function Before(page,prduct_num){
    	$.post(
			'${path}/review_boardlist?page=${page-1}&product_num=${product_num}',
			function(data) {
			$('#reviewlist').html(data);
			frm.replytext.value = '';
		});
    };
    
    // 선택페이지
    function SelPage(a,prduct_num){
    	var page =  a;
    	$.post(
				'${path}/review_boardlist?page='+page+'&product_num=${product_num}',
				function(data) {
			$('#reviewlist').html(data);
			frm.replytext.value = '';
		});
    };
    
    // 다음페이지
    function Next(page,prduct_num){
    	$.post(
				'${path}/review_boardlist?page=${page+1}&product_num=${product_num}',
				function(data) {
			$('#reviewlist').html(data);
			frm.replytext.value = '';
		});
    };  
    
</script>
</html>