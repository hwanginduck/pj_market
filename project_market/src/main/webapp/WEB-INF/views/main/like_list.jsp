<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
<section class="main">
	<div class="like-content">
		<div class="like-content-box">
			<div class="like-header">
				<input type='checkbox' name='likeitem' value='selectall' onclick='selectAll(this)'/> 
				전체선택
			</div>
			<div class="like-items">
				<c:if test="${empty likelist}">
					<div class="like-item">
						<div class="like-item-textbox">
							<div>찜등록된 상품이 없습니다.</div>
						</div>
					</div>
				</c:if>
				<c:forEach var="like" items="${likelist}">
					<div class="like-item">
						<div class="like-item-img">
							<div class="detail-image-box">
								<div><input type='checkbox' name='likeitem'/></div>
								<img src="<%=request.getContextPath()%>/resources/upload/${like.product_img}">	
							</div>
						</div>
						<div class="like-item-textbox">
							<div class="like-item-name">
								${like.product_name}<br>
								<fmt:formatNumber value='${like.product_price}' pattern='#,### 원' /><br>
								${like.options_name}<br>
								<fmt:formatNumber value='${like.options_price}' pattern='#,### 원' /><br>
							</div>
							<div class="like-item-icon">
								<a class="like-table-btn" onClick="location.href='deletelike.do?likes_num=${like.likes_num}'">
									<img class="like-btn" src="${pageContext.request.contextPath}/resources/img/likeit.png" />
								</a>
								<a class="like-table-btn" onClick="location.href='like_to_cart.do?likes_num=${like.likes_num}'">
									<img class="like-btn" src="${pageContext.request.contextPath}/resources/img/cart.png" />
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>	
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
