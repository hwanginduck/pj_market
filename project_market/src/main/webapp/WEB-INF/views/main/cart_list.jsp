<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
<section class="main">
	<div class="main-img">
		<div class="cart-content">
			<form>
				<div class="cart-table" style="width: 800px; float: left; margin-left: 200px">
				<table width="800px">
					<tr>
						<td id="cart-table-th">
							<input class="cart-checkbox" type="checkbox">
						</td>
						<th colspan="4" id="cart-table-th">${member_id }'s Shopping Cart</th>
					</tr>
					<c:if test="${empty cartlist}">
							<tr>
								<td colspan="5">데이터가 없습니다</td>
							</tr>
						</c:if>
					
					<!-- 반복문 시작 -->
					<c:forEach var="cart" items="${cartlist}" varStatus="status">
					<tr>
						<td rowspan="3">
							<input class="cart-checkbox" type="checkbox">
						</td>
					</tr>
					<tr>
						<td rowspan="2" height="150px" width="150px">${cart.product_img }</td>
						<td align="left">${cart.product_name }</td>
						<td align="left">${cart.options_name }</td>
						<td>
							<img class="cart-btn" src="${pageContext.request.contextPath}/resources/img/plus.png" 
								name = plus${status.index} onclick='count("plus${status.index}","${status.index}")' />
							<span class="cart-count"id='result${status.index}'>${cart.cart_count }</span>
							<img class="cart-btn" src="${pageContext.request.contextPath}/resources/img/minus.png"
								name= minus${status.index} onclick='count("minus${status.index}","${status.index}")' />
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
							<button class="cart-table-btn" onClick="location.href='cart_list.do?cart_num=${cart.cart_num}'">
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
				<div style="float:left; margin-left: 100px;">
					<div class="cart-right-table">
						<table width="500px">
							<tr>
								<th id="cart-table-th">${member_id }'s Receipt</th>
							</tr>
							<tr>
								<td>
									<button type="button" class="buy-button">구매하기</button>
								</td>
							</tr>
					
								
					</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
