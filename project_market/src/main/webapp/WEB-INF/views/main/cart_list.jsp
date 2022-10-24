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
						<th colspan="3" id="cart-table-th">Like it!</th>
					</tr>
					
					<!-- 반복문 시작 -->
					<c:forEach var="like" items="${likelist}">
					
					<tr>
						<td rowspan="2" height="150px" width="150px">${like.product_img }</td>
						<td align="left">${like.product_name }</td>
						<td>
							<button class="cart-table-btn" 
							onclick="location.href='likedelete.do?likes_num=${like.likes_num}'">
								<img class="cart-btn" src="${pageContext.request.contextPath}/resources/img/like.png" />
							</button>
						</td>
					</tr>
					<tr >
						<td align="left">
						<fmt:formatNumber value="${like.product_price }" pattern="#,###" />
						</td>
						<td>
							<button class="cart-table-btn" onClick="location.href='cartinsert'">
								<img class="cart-btn" src="${pageContext.request.contextPath}/resources/img/cart.png" />
							</button>
						</td>
					</tr>
					<tr>
						<td id="cart-table-tr" colspan="3">
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
