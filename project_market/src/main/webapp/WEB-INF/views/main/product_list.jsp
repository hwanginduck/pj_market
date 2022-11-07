<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>

<section class="main">
	<div class="productlist-content-pj">
		<c:if test="${empty productlist}">
			<div>검색된 상품이 없습니다.</div>
		</c:if>
		<c:forEach var="pl" items="${productlist}">
			<div class="item-box-pj">
				<div class="item-img-box-pj">
					<a href="productdetail.do?product_num=${pl.product_num}&page=${page}">
						<img
							src="<%=request.getContextPath()%>/resources/upload/${pl.product_img}" 
						/>
					</a>
				</div>
				<div class="item-text-box">
					<div>
						<a style="text-decoration: none;" href="productdetail.do?product_num=${pl.product_num}&page=${page}">
							${pl.product_name}
						</a>
					</div>
					<div>${pl.product_sub}</div>
					<div>
						<fmt:formatNumber value="${pl.product_price}" pattern="₩#,###" />
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
