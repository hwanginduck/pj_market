<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../fix/header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/main.css" rel="stylesheet" />
<section>
	<div>
		<div class="category-link-pj">
			카테고리별 제품 찾기
		</div>
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide" onclick="location.href='productlist.do?product_l=조명'">
					<img src="${pageContext.request.contextPath}/resources/img/category_1.png">
				</div>
				<div class="swiper-slide" onclick="location.href='productlist.do?product_l=홈액세서리'">
					<img src="${pageContext.request.contextPath}/resources/img/category_2.png">
				</div>
				<div class="swiper-slide" onclick="location.href='productlist.do?product_l=홈오피스'">
					<img src="${pageContext.request.contextPath}/resources/img/category_3.png">
				</div>
				<div class="swiper-slide" onclick="location.href='productlist.do?product_l=소파'">
					<img src="${pageContext.request.contextPath}/resources/img/category_4.png">
				</div>
				<div class="swiper-slide" onclick="location.href='productlist.do?product_l=침대매트리스'">
					<img src="${pageContext.request.contextPath}/resources/img/category_5.png">
				</div>
				<div class="swiper-slide" onclick="location.href='productlist.do?product_l=수납정리'">
					<img src="${pageContext.request.contextPath}/resources/img/category_6.png">
				</div>
			</div>
			<div class="swiper-scrollbar"></div>
    	</div>
	</div>
	<div>
		<div class="newlist-pj">
			신제품 보러가기
		</div>
		<div class="newlist-box-pj">
			<c:forEach var="list" items="${mainlist}" varStatus="status" >
					<c:forEach var="imglist" items="${fn:split(list.product_img,',')}" begin="0" end="0">
						<div class="box${status.index}-pj"						
						style="background-image: url('<%=request.getContextPath()%>/resources/upload/${imglist}');
						background-size:cover; background-position: center; background-repeat: no-repeat;"
						onclick="location.href='productdetail.do?product_num=${list.product_num}&page=1'">
						<div class="newlist-text-box-pj${status.index }">
								<div class="newlist-text-name-pj">
								<div class="newlist-text-sub-pj">${list.product_l}>${list.product_m }</div>
								${list.product_name}
								</div>
								<div class="newlist-text-price-pj"><fmt:formatNumber value='${list.product_price}' pattern='#,### 원' /></div>
								<div class="newlist-text-sub-pj">${list.product_sub }</div>
							</div>
						</div>
					</c:forEach>
			</c:forEach>
		</div>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script src="${path}/resources/js/main.js"></script>
