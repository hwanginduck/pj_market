<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/review.css" rel="stylesheet" />
<c:set var="session_id" value="${member_id }" />
<section>
	<div class="review-containbox-pj">
		<div class="review-header-pj"> List of Review Boards</div>
		<div class="review-contentbox-pj">
			<div class="review-imglistspace-pj">
				<c:forEach var="b" items="${boardlist}">
					<c:forEach var="imglist" items="${fn:split(b.review_img,',')}" begin="0">
						<img src="<%=request.getContextPath()%>/resources/upload/uploadFiles/${imglist}">
					</c:forEach>
				</c:forEach>
			</div>
			<c:if test="${empty boardlist}">
				데이터가 없습니다.
			</c:if>
		</div>
		<c:set var="num" value="${listcount-(page-1)*5}" />
		<c:forEach var="b" items="${boardlist}">
		<div class="review-contentbox-pj">
			<div class="review-profile-box-pj">
				<div class="review-profile-img-pj">
					<img src="${pageContext.request.contextPath}/resources/img/humen.jpeg">
				</div>
					${b.member_id}<br>
					<c:if test="${b.review_star == 0}">☆☆☆☆☆</c:if>
					<c:if test="${b.review_star == 1}">⭐</c:if>
					<c:if test="${b.review_star == 2}">⭐⭐</c:if>
					<c:if test="${b.review_star == 3}">⭐⭐⭐</c:if>
					<c:if test="${b.review_star == 4}">⭐⭐⭐⭐</c:if>
					<c:if test="${b.review_star == 5}">⭐⭐⭐⭐⭐</c:if>
					<br>
					<fmt:formatDate value="${b.review_date}" pattern="yyyy-MM-dd" /><br>
			</div>
			<div class="reviewlist-productname-pj">상품명${b.product_num }</div>
			<div class="reviewlist-imglist-pj">
				<c:forEach var="imglist" items="${fn:split(b.review_img,',')}" begin="0">
					<img src="<%=request.getContextPath()%>/resources/upload/uploadFiles/${imglist}">
				</c:forEach>
			</div>
			<div class="reviewlist-sb-pj">${b.review_sb }</div>
			<div class="reviewlist-con-pj">
				<pre>${b.review_content }</pre>
			</div>
			<c:if test="${session_id  eq b.member_id }">
				<div class="reviewlist-btnbox-pj">
					<button type="button" class="btn btn-outline-success" onclick="location='review_update.do?review_no=${b.review_no}&product_num=${product_num}'">수정</button>
					<button type="button" class="btn btn-outline-success" onclick="location='review_delete.do?product_num='+${product_num }+'&review_no=${b.review_no}'">삭제</button>
				</div>
			</c:if> 		
		</div>
		</c:forEach>	
		<div>
		</div>
	</div>

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



<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
// 이전페이지
    function Before(page,prduct_num){
    	$.post(
			'${path}/review_boardlist?page=${page-1}&product_num=${product_num}',
			function(data) {
			$('#reviewlist').html(data);
		});
    };
    
    // 선택페이지
    function SelPage(a,prduct_num){
    	var page =  a;
    	$.post(
				'${path}/review_boardlist?page='+page+'&product_num=${product_num}',
				function(data) {
			$('#reviewlist').html(data);
		});
    };
    
    // 다음페이지
    function Next(page,prduct_num){
    	$.post(
				'${path}/review_boardlist?page=${page+1}&product_num=${product_num}',
				function(data) {
			$('#reviewlist').html(data);
		});
    };  
    
</script>
