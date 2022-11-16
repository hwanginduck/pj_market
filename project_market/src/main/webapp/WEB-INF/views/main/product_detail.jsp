<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">

<%@ include file="../fix/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/product.css" rel="stylesheet" />

<section>
<form name="f" method="post">
	<div class="product-detail-box-pj">
		<div class="product-datail-inner-box-pj">
			<div class="product-datail-img-pj">
			    <div class="product-detail-imageContainer-pj" id="slideShow">
			    <ul class="slides">
					<c:forEach var="img" items="${product_imgArr}" begin="1">
						<li><img src="<%=request.getContextPath()%>/resources/upload/${img}"></li>
					</c:forEach>
				</ul>
				<p class="controller">      
	    		 <span class="prev">&lang;</span>  
	     		 <span class="next">&rang;</span>
	    		</p>
				</div> 
			</div>
			<div class="product-datail-text-pj">
				<input type="hidden" name="product_num" value=${product.product_num }>
				<div class="product-detail-first-box-pj">
					<div class="product-detail-category-pj">${product.product_l} > ${product.product_m}</div>
					<div class="product-detail-name-pj"> ${product.product_name } </div>
					<div class="porduct-detail-starNcount-pj">
						<div class="product-detail-star-pj"> 
							<c:choose>
								<c:when test="${product_star == 5 }"> <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></c:when>
								<c:when test="${product_star == 4 }"> <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></c:when>
								<c:when test="${product_star == 3 }"> <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></c:when>
								<c:when test="${product_star == 2 }"> <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></c:when>
								<c:when test="${product_star == 1 }"> <i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></c:when>
								<c:otherwise><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></c:otherwise>
							</c:choose>
						</div>
						<div class="product-detail-starcount-pj">(${product_starcount })</div>
					</div>
				</div>
				<div class="product-detail-second-box-pj">
					<div class="product-detail-price-pj">
						<%-- <fmt:formatNumber value="${product.product_price}" pattern="###,###,###" /> --%>
						<input id ="old_product_price" type="hidden" value="${product.product_price}">
						<input id ="new_product_price" readonly="readonly" 
						value="<fmt:formatNumber value="${product.product_price}" pattern="###,###,###" />">원
					</div>
					<div class="product-detail-option-pj">
						<select name="options_num" id="options_price">
							<c:forEach var="ol" items="${optionslist}" varStatus="status">
								<option value="${ol.options_num}">${ol.options_name}
									<fmt:formatNumber value="${ol.options_price}" pattern="+#,###" />
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="product-detail-sub-pj">
					 	${product.product_sub}
					 </div>
				 </div>
				<div class="product-detail-clc-pj">
					<input type="number" id="product_count"name="cart_count" min="1" value="1">
					<button type="submit" onclick="javascript: form.action='product_to_cart.do'">
						장바구니 추가
					</button>
					<button type="submit" onClick="javascript: form.action='insertlike.do'">
						찜 추가
					</button>
				</div>
				<div class="product-detail-buy-pj">
						<button type="submit">구매하기</button>
				</div>
			</div>
		</div>
		<div class="product-detail-content-pj">
			<c:forEach var="content" items="${product_contentArr}" begin="1">
				<img src="<%=request.getContextPath()%>/resources/upload/${content}">
			</c:forEach>
		</div>
	</div>
	</form>

		<input type="hidden" name="product_num" value=${product.product_num }>
		
			<div class="detail-content-pj">
				<div>
					 <ul class="nav nav-tabs nav-justified">
						<li class="nav-item"><a href="#" class="nav-link" style="text-decoration: none;">상품상세</a></li>
						<li class="nav-item"><a href="#reviewlist"  class="nav-link" style="text-decoration: none;">리뷰</a></li>
						<li class="nav-item"><a href="#qnalist"  class="nav-link" style="text-decoration: none;">상품문의</a></li>
						<li class="nav-item"><a href="#p_index"  class="nav-link" style="text-decoration: none;">배송/교환/반품안내</a></li>
					</ul> 

					<div  id="reviewlist"></div>
					<div  id="qnalist"></div>
					<div  id="p_index"></div>
				</div>
			</div>

</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="${path}/resources/js/product_detail.js"></script>
<script>
$(function () {
	var product_num = '${product.product_num}'
	
		$('#reviewlist').load('review_boardlist');
		$('#qnalist').load('qna_boardlist.do?product_num=' + product_num);
		$('#p_index').load('p_index.do');
	});
// 상단 스크립트 매뉴로 페이지 로드함수.
function move1(product_num) {
	$('#list').load('qna_boardlist.do?product_num='+product_num);
}

function move2(y) {
	$('#list').load('review_boardlist');
}
</script>
<%@ include file="../fix/footer.jsp" %>
