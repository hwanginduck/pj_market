<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../fix/header.jsp"%>
<section class="main">
	<div class="main-img">
		<div class="cart-content">
			<form name="f" method="post" action="insert_product.do"
				onsubmit="return check()" enctype="multipart/form-data">
				<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
				<div class="product-insert-table">
					<table width="1000px">
						<tr>
							<td rowspan="6" colspan="2">
								<div class="image-box">
								<div id="image_container"></div>
								</div>
							</td>
							<th id="product-insert-table-th">상품명</th>
							<td><input type="text" name="product_name" id="product-insert-bar" /></td>
						</tr>
						<tr>
							<th id="product-insert-table-th">가격</th>
							<td><input type="text" id="product-insert-bar" name="product_price"/></td>
						</tr>

						<tr>
							<th id="product-insert-table-th">상품내용</th>
							<td><textarea  id="product-insert-textarea" name="product_content"></textarea></td>
						</tr>

						<tr>
							<th id="product-insert-table-th">상품보조설명</th>
							<td><input type="text" id="product-insert-bar" name="product_sub"/></td>
						</tr>
						<tr>
							<th id="product-insert-table-th">상품 사진</th>
							<td><input type="file" id="image" name="product_img1" accept="image/*" onchange="setThumbnail(event);" /></td>
							<th id="product-insert-table-th">재고수량</th>
							<td><input type="text" id="product-insert-bar" name="product_stock"/></td>
						</tr>
					</table>
			
				
					<table id = "option_space">
						<tr>
							<!-- <th rowspan="2" style="padding: 30px 30px;">옵션</th> -->
							<th>옵션이름</th>
							<th>변동가격</th>
							<th>할인율(%)</th>
							<th rowspan="2">
								<input type="button" value="+" id="option_plus"
								style="margin: 10px 10px; padding: 0px 20px; font-size: 50px; border-radius: 10px; background-color: #5FB404; color: white;" />
							</th>
						</tr>
						<tr>
							<td><input type="text" id="option-insert-bar" name="options_name1"/></td>
							<td><input type="text" id="option-insert-bar"name="options_price1"/></td>
							<td><input type="text" id="option-insert-bar"name="options_sale1"/></td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="4"><input type="submit" value="상품등록" class="insert-product-btn"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
