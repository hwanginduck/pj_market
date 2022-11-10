<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
<section>
	<div>
		<div class="cart-content-box-pj">
			<div class="cart-header-pj">
				<input type="checkbox" name="allChecking" id="allChecking" /> 전체선택
			</div>
			<div class="cart-items-pj">
				<c:if test="${empty list}">
					<div class="cart-item-pj">
						<div class="cart-item-textbox-pj">
							<div>찜등록된 상품이 없습니다.</div>
						</div>
					</div>
				</c:if>
				<!-- 반복문 시작 -->
				<c:forEach var="cart" items="${list}" varStatus="status">
				<input type="hidden" id="forcount" value = '${list}'>
					<div class="cart-item-pj">
						<div class="cart-item-img-pj">
							<div class="detail-image-box-pj">
								<div>
									<input type="checkbox" onClick="itemSum()"
                                     class="chkbox" value="${(cart.product_price + cart.options_price) * cart.cart_count}"/>
								</div>
								<img src="<%=request.getContextPath()%>/resources/upload/${cart.product_img}">
							</div>
						</div>
						<div class="cart-item-textbox-pj">
							<div class="cart-item-name-pj">
								${cart.product_name}<br>
								<input type="number" id ="product_price${status.index}" value = "${cart.product_price}"/>원<br> 
								${cart.options_name}<br>
								<input type="number" id ="options_price${status.index}" value = "${cart.options_price}"/>원<br> 
							</div>
							<div class="cart-item-count-pj">
								<div class="number-input">
									<button
										onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></button>
									<input class="quantity" min="1" id="product_count${status.index}" name="quantity"
										value="${cart.cart_count }" type="number">
									<button
										onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
										class="plus"></button>
								</div>
							</div>
							<div class="cart-item-amount-pj">
								<input id ="total${status.index}">원
							</div>
							<div class="cart-item-icon-pj">
								<button onClick="location.href='deletecart.do?cart_num=${cart.cart_num}'">장바구니 삭제</button>
								<button onClick="location.href=''">구매하기</button>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 반복문 끝 -->
			</div>
				<div class="cart-footer-pj">
					<div class="cart-total-amount-pj" class="total_sum" id="total_sum" > 0 원</div>
					<button class="cart-total-buy-pj" onClick="location.href=''">구매하기</button>
				</div>
			</div>
		</div>
	</section>
<%@ include file="../fix/footer.jsp"%>

