<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
<section class="main">
	<div class="main-img">
		<div class="cart-content">
			<form>
				<div class="cart-table">
				<table width="1000px">
					<tr>
						<th colspan="4" id="cart-table-th">Cart!</th>
					</tr>
					
					<!-- 반복문 시작 -->
					<c:forEach var="cart" items="${cartlist}">
					
					<tr>
						<td rowspan="2" height="150px" width="150px">${cart.product_img }</td>
						<td align="left">${cart.product_name }</td>
						<td align="left">${cart.options_name }</td>
						<td>
							<img class="cart-btn" src="${pageContext.request.contextPath}/resources/img/plus.png" onclick='count("plus")' />
							<!-- <input type='button' onclick='count("plus")' value='+'/> -->
							<span class="cart-count"id='result'>${cart.cart_count }</span>
							<img class="cart-btn" src="${pageContext.request.contextPath}/resources/img/minus.png" onclick='count("minus")' />
							<!-- <input type='button' onclick='count("minus")' value='-'/> -->
						</td>
					</tr>
					<tr >
						<td align="left">
						<fmt:formatNumber value="${cart.product_price }" pattern="#,###" />
						</td>
						<td align="left">
						<fmt:formatNumber value="${cart.options_price }" pattern="#,###" />
						</td>
						<td>
							<button class="cart-table-btn" onClick="location.href='cartinsert'">
								<img class="cart-btn" src="${pageContext.request.contextPath}/resources/img/minus_cart.png" />
							</button>
						</td>
					</tr>
					<tr>
						<td id="cart-table-tr" colspan="4">
					</tr>
					
					</c:forEach>
					<!-- 반복문 끝 -->	
				
				</table>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
