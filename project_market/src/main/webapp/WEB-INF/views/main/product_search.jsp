<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
<section>
	<form method="post" action="search_product.do">
		<div class="product-search-form-pj">
			<div class="product-search-header-pj">수정할 품목 명을 입력하세요.</div>
			<div class="product-search-bar-pj">
				<input type="search" name="product_name">
			</div>
		</div>
	</form>
</section>
<%@ include file="../fix/footer.jsp"%>
