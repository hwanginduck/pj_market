<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../fix/header.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/product.css" rel="stylesheet" />
<section class="main">
<div class="productlist-pj">
		<div class="productlist-header-pj">
			${product_l}의 총 ${listcount} 개의 검색결과 
		</div>
	<div class="productlist-content-pj">
		<c:if test="${empty productlist}">
			<div>검색된 상품이 없습니다.</div>
		</c:if>
		<c:forEach var="pl" items="${productlist}" varStatus="status">
			<div class="productlist-innerbox-pj" onClick="location.href='productdetail.do?product_num=${pl.product_num}&page=${page}';">
				<div class="item-box-pj swiper mySwiper" >
					<div class="item-img-box-pj swiper-wrapper">
						<c:forEach var="imglist" items="${fn:split(pl.product_img,',')}" begin="0">
							<div 
								class="swiper-slide" 
								style="background-image: url('<%=request.getContextPath()%>/resources/upload/${imglist}');"
							>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="productlist-text-box">
					<div class="productlist-name-pj">
						${pl.product_name}
					</div>
					<div>${pl.product_sub}</div>
					<div class="productlist-price-pj">
						<fmt:formatNumber value="${pl.product_price}" pattern="₩#,###" />
					</div>
				</div>
			</div>	
		</c:forEach>
	</div>
		<div class="productlist-pagination-pj">
		<c:if test="${page <=1 }">
			<a>이전</a>
		</c:if>
		<c:if test="${page > 1 }">
	 		<a href="productlist.do?page=${page-1}&product_l=${product_l}">이전</a>
		</c:if>
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == page }">
				<a>${a}</a>
			</c:if>
			<c:if test="${a != page }">
				<a href="productlist.do?page=${a}&product_l=${product_l}">${a}</a>
			</c:if>
			</c:forEach>
			<c:if test="${page >= maxpage }">
				<a>다음</a>
			</c:if>
			<c:if test="${page < maxpage }">
 				<a href="productlist.do?page=${page+1}&product_l=${product_l}">다음</a>
			</c:if>
		</div>
</div>
</section>
<%@ include file="../fix/footer.jsp"%>
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
          },
      });
    </script>