<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
<section class="main">
	<div class="main-img">
		<div class="productlist-content">
			<c:if test="${empty productlist}">
				<div style = "padding-left: 350px; font-size: 50px; color: green;">검색된 상품이 없습니다.</div>
			</c:if>
			<c:forEach var="pl" items="${productlist}">
				
				<div style="border: 1; width: 300px; float: left;">
				<div style="padding: 10px;"><img src="<%=request.getContextPath()%>/resources/upload/${pl.product_img}" height="280px" width="280px" /></div>
					<div style="font-size: 30px; color: green;">${pl.product_name}</div>
					<div style="color: #666">${pl.product_sub}</div>
					<div style="font-size: 25px; color: green"><fmt:formatNumber value="${pl.product_price}" pattern="₩#,###" /></div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
