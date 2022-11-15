<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/product.css" rel="stylesheet" />

<section>
	<div class="product-searchlist-box-pj">
		<div class="product-searchlist-header-pj">
			검색결과 : ${count} 개 항목 검색
		</div>
		<div class="product-searchlist-contentbox-pj">
			<div class="product-search-column-pj">
				<div class="product-column-num-pj">
					상품번호
				</div>
				<div class="product-column-large-pj">
					대분류
				</div>
				<div class="product-column-m-pj">
					중분류
				</div>
				<div class="product-column-name-pj">
					상품이름
				</div>
				<div class="product-column-sub-pj">
					상품요약
				</div>
			</div>
			<c:if test="${empty searchlist}">
				검색된 상품이 없습니다.
			</c:if>
			<!-- 반복문 시작 -->
			<c:forEach var="search" items="${searchlist}">
				<div class="productsearch-click-pj" onClick="location.href='product_update_form.do?product_num=${search.product_num }'">
					<div class="product-column-num-pj">
						${search.product_num}
					</div>
					<div class="product-column-large-pj">
						${search.product_l}
					</div>
					<div class="product-column-m-pj">
						${search.product_m}
					</div>
					<div class="product-column-name-pj">
						${search.product_name}
					</div>
					<div class="product-column-sub-pj">
						${search.product_sub}
					</div>
				</div>
			</c:forEach>
				<!-- 반복문 끝 -->
		</div>
		<div class="productsearch-footer-pj">
		</div>
	</div>
</section>


