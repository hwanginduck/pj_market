<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/cart.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
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
						<div class="cart-item-textbox-pj">
								<div class="cart-checkbox-pj">
									<input type="checkbox" onClick="itemSum()"
                	                    class="chkbox" value="${(cart.product_price + cart.options_price) * cart.cart_count}"/>
								</div>
							<div class="cart-item-img-pj">
								<div class="swiper mySwiper">
									<div class="swiper-wrapper">
										<c:forEach var="imglist" items="${fn:split(cart.product_img,',')}" begin="0">
											<div 
											class="swiper-slide" 
											style="background-image: url('<%=request.getContextPath()%>/resources/upload/${imglist}');"
											>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="cart-item-name-pj">
								<div class="cart-productname-pj">${cart.product_name}</div>
								<input type="hidden" id ="product_price${status.index}" value = "${cart.product_price}"/>
								 <div><fmt:formatNumber value='${cart.product_price}' pattern='#,### 원' /></div>
								<div class="cart-optionsname-pj">${cart.options_name}</div>
								<input type="hidden" id ="options_price${status.index}" value = "${cart.options_price}"/>
								<div class="cart-optionsprice-pj"><fmt:formatNumber value='${cart.options_price}' pattern='#,### 원' /></div>
							</div>
							<div class="cart-item-count-pj">
								<div class="number-input">
									<button class="minus"></button>
									<input class="quantity" min="1" id="product_count${status.index}" name="quantity"
										value="${cart.cart_count }" type="number">
									<button class="plus"></button>
								</div>
							</div>
							<div class="cart-item-amount-pj">
								<input id ="total${status.index}" readonly="readonly">원
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
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script src="${path}/resources/js/cart.js"></script>
