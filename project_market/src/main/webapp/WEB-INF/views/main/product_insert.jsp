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
							<td rowspan="8" colspan="2">
								<div class="image-box">
								<div id="image_container"></div>
								</div>
							</td>
							<th id="product-insert-table-th">상품명</th>
							<td><input type="text" name="product_name" id="product-insert-bar" /></td>
						</tr>
						<tr>
							<th id="product-insert-table-th">대분류</th>
							<td><select onchange="categoryChange(this)" class="pl" name="product_l">
									<option>=대분류선택=</option>
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
							</select></td>
						</tr>
						<tr>
							<th id="product-insert-table-th">중분류</th>

							<td><select id="good" class="pl" name="product_m">
									<option>=중분류=</option>
							</select></td>
						</tr>

						<tr>
							<th id="product-insert-table-th">소분류</th>
							<td><input type="text" id="product-insert-bar" name="product_s"/></td>
						</tr>

						<tr>
							<th id="product-insert-table-th">가격</th>
							<td><input type="text" id="product-insert-bar" name="product_price"/></td>
						</tr>

						<tr>
							<th id="product-insert-table-th">색상</th>
							<td><input type="text" id="product-insert-bar" name="product_color" /></td>
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
				<input type="submit" value="상품등록" class="insert-product-btn">
				</div>
				<div class="option-insert-table">
					<table id = "option_space">
						<tr>
							<!-- <th rowspan="2" style="padding: 30px 30px;">옵션</th> -->
							<th>옵션이름</th>
							<th>변동가격</th>
							<th>할인율(%)</th>
							<th rowspan="2">
								<input type="button" value="+" id="option_plus"  onclick='return submit2(this.form)'
								style="margin: 10px 10px; padding: 0px 20px; font-size: 50px; border-radius: 10px; background-color: #5FB404; color: white;" />
							</th>
							<th rowspan="2">
								<input type="button" value="옵션등록" id="option_plus"  onclick='return submit2(this.form)'
								style="margin: 10px 10px; padding: 5px 20px; font-size: 40px; border-radius: 10px; background-color: #5FB404; color: white;" />
							</th>
							
						</tr>
						<tr>
							<td><input type="text" id="option-insert-bar" name="options_name"/></td>
							<td><input type="text" id="option-insert-bar"name="options_price"/></td>
							<td><input type="text" id="option-insert-bar"name="options_sale"/></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
