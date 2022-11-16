<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="${path}/resources/css/product.css" rel="stylesheet" />
<%@ include file="../fix/header.jsp"%>
<section>
	<form name="f" method="post" action="update_product.do" enctype="multipart/form-data">
		<input type="hidden" name="product_num" value="${product.product_num}">
		<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
		<div class="product-insert-form-pj">
			<div class="product-header-pj">상품수정</div>
			<div class="product-name-box-pj">
				<div class="product-column-pj">상품명</div>
				<div class="product-insert-pj">
					<input type="text" name="product_name" id="product-insert-bar" value="${product.product_name }" required="required"/>
				</div>
			</div>
			<div class="product-name-box-pj">
				<div class="product-column-pj">대분류</div>
				<div class="product-insert-pj">
					<select onchange="categoryChange(this)" class="pl" name="product_l">
						<option value="${product.product_l }">${product.product_l }</option>
						<option value="홈스마트">홈스마트</option>
						<option value="가구">가구</option>
						<option value="홈오피스">홈오피스</option>
						<option value="침대매트리스">침대매트리스</option>
						<option value="어린이GaGu">어린이 GaGu</option>
						<option value="조명">조명</option>
						<option value="수납정리">수납/정리</option>
						<option value="주방용품">주방용품</option>
						<option value="주방가구">주방가구</option>
						<option value="욕실">욕실</option>
						<option value="텍스타일">텍스타일</option>
					</select>
				</div>
			</div>
			<div class="product-name-box-pj">
				<div class="product-column-pj">중분류</div>
				<div class="product-insert-pj">
					<select id="good" class="pl" name="product_m">
						<option value="${product.product_m }">${product.product_m }</option>
					</select>
				</div>
			</div>
			<div class="product-name-box-pj">
				<div class="product-column-pj">가격</div>
				<div class="product-insert-pj">
					<input type="text" id="product-insert-bar" name="product_price" value="${product.product_price }" required="required"/>
				</div>
			</div>
			<div class="product-content-name-box-pj">
				<div class="product-content-column-pj">상품내용</div>
				<div class="product-content-insert-pj">
					<input multiple type="file" name="product_content1" required="required">
				</div>
			</div>
			<div class="product-name-box-pj">
				<div class="product-column-pj">상품 요약</div>
				<div class="product-insert-pj">
					<input type="text" id="product-insert-bar" name="product_sub" value="${product.product_sub }"required="required"/>
				</div>
			</div>
			<div class="product-name-box-pj">
				<div class="product-column-pj">재고 수량</div>
				<div class="product-insert-pj">
					<input type="text" id="product-insert-bar" name="product_stock" value="${product.product_stock }" required="required"/>
				</div>
			</div>
			<div class="product-name-box-pj">
				<div class="product-column-pj">상품 사진</div>
				<div class="product-insert-pj">
					<input multiple type="file" id="product_img" name="product_img1" accept="image/*" onchange="setThumbnail(event);" required="required"/> 
				</div>
			</div>				
			<div class="product-option-name-box-pj">
				<div class="product-options-box">
					<button type="button" id="update_option_plus">추가하기</button>
				</div>
				<div class="product-options-box">옵션 이름</div>
				<div class="product-options-box">변동 가격</div>
				<div class="product-options-box">할인율(%)</div>
			</div>
			<input type="hidden" id="product-update-options" value="${optionscount}">
			<c:forEach var="options" items="${optionslist}" varStatus="status">
			<div class="product-name-box-pj" id='optionsbox${status.index }'>
				<div class="product-options-box"><button type="button" name="option_minus${status.index}" onClick='options_delete(${status.index})' value='${status.index }'>삭제하기</button></div>
												 <input type="hidden" name="options_num${status.index}" value="${options.options_num}" />
				<div class="product-options-box"><input type="text" id="option-insert-bar" name="options_name${status.index }" value="${options.options_name }" required="required"/></div>
				<div class="product-options-box"><input type="text" id="option-insert-bar" name="options_price${status.index }" value="${options.options_price }" required="required"/> </div>
				<div class="product-options-box"><input type="text" id="option-insert-bar" name="options_sale${status.index }" value="${options.options_sale }" required="required"/> </div>
			</div>
			</c:forEach>
			
			<div id="option_space"></div>
			<div class="product-footer-pj">
				<button type="submit">상품 수정</button>
			</div>
		</div>
	</form>
</section>
<%@ include file="../fix/footer.jsp"%>
