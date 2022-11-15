<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../fix/header.jsp"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/product.css" rel="stylesheet" />
<script>
$( document).ready( function(val) {
	$('#list').load('search_product.do?product_name= ');
	
	$('#search-bar').on('input',function(){

		var product_name = document.getElementById("search-bar").value;
		
		$('#list').load('search_product.do?product_name='+product_name);

	
	});

});

</script>
<section>
<!-- 	<form method="post" action=""> -->
		<div class="product-search-form-pj">
			<div class="product-search-header-pj">수정할 품목 명을 입력하세요.</div>
			<div class="product-search-bar-pj">
				<input type="text" id="search-bar" name="product_name">
			</div>
		</div>

		<div class="productsearch-list-load-pj" id="list"></div>
	<!-- </form> -->
</section>
<%@ include file="../fix/footer.jsp"%>