<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/like.css" rel="stylesheet" />
<%@ include file="../fix/header.jsp" %>

<section>
	<div>
		<div class="like-content-box-pj">
			<div class="like-header-pj">
				<input type='checkbox' name='likeitem' value='selectall' onclick='selectAll(this)'/> 
				전체선택
			</div>
			<div class="like-items-pj">
				<c:if test="${empty likelist}">
					<div class="like-item-pj">
						<div class="like-item-textbox-pj">
							<div>찜등록된 상품이 없습니다.</div>
						</div>
					</div>
				</c:if>
				<c:forEach var="like" items="${likelist}">
					<div class="like-item-pj">
						<div class="like-item-textbox-pj">
							<div class="detail-image-box-pj">
								<div class="likelist-checkbox-pj">
									<input type='checkbox' name='likeitem'/>
								</div>
								<div class="swiper mySwiper">
									<div class="swiper-wrapper">
										<c:forEach var="imglist" items="${fn:split(like.product_img,',')}" begin="0">
											<div 
											class="swiper-slide" 
											style="background-image: url('<%=request.getContextPath()%>/resources/upload/${imglist}');"
											>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						
	
							<div class="like-item-name-pj">
								<div class="likelist-name-pj">${like.product_name}</div>
								<div class="likelist-name-pj"><fmt:formatNumber value='${like.product_price}' pattern='#,### 원' /></div>
								<div class="likelist-option-pj">${like.options_name}</div>
								<div class="likelist-option-price-pj"><fmt:formatNumber value='${like.options_price}' pattern='#,### 원' /></div>
							</div>
							<div class="like-item-icon-pj">
								<button type="button" onClick="location.href='deletelike.do?likes_num=${like.likes_num}'">
									찜 취소하기
								</button>
								<button onClick="location.href='like_to_cart.do?likes_num=${like.likes_num}'">
									장바구니 추가
								</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>	
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

<script src="${path}/resources/js/like.js"></script>


