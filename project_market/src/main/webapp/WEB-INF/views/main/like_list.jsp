<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
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
						<div class="like-item-img-pj">
							<div class="detail-image-box-pj">
								<div><input type='checkbox' name='likeitem'/></div>
								<img src="<%=request.getContextPath()%>/resources/upload/${like.product_img}">	
							</div>
						</div>
						<div class="like-item-textbox-pj">
							<div class="like-item-name-pj">
								${like.product_name}<br>
								<fmt:formatNumber value='${like.product_price}' pattern='#,### 원' /><br>
								${like.options_name}<br>
								<fmt:formatNumber value='${like.options_price}' pattern='#,### 원' /><br>
							</div>
							<div class="like-item-icon-pj">
								<button onClick="location.href='deletelike.do?likes_num=${like.likes_num}'">
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
