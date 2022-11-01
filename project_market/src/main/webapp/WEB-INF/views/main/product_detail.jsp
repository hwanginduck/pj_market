<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../fix/header.jsp"%>
<style>
	select {
		width: 200px; 
		padding: .8em .5em; 
		border: 1px solid #999;
		font-family: inherit;  
		background: url('arrow.jpg') no-repeat 95% 50%; 
		border-radius: 0px; 
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
	}
	
	select::-ms-expand {
	    display: none;
	}
	
</style>


<section class="main">
	<div class="main-img">
		<div class="cart-content">
			<form name="f" method="post" action="">
			<input type="hidden" name="product_num" value=${product.product_num }>
				<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
				<div class="product-insert-table">
					<table width="1000px" border="1">
						<tr>
							<td rowspan="7">
								<img src="<%=request.getContextPath()%>/resources/upload/${product.product_img}">
							</td>
							<td>
								<input type="text" name="product_name" value="${product.product_name}">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="product_sub" value="${product.product_sub}">
							</td>
						</tr>
						<tr>
							<td>
								별점 ★★★★★ (123)
							</td>
						</tr>
						<tr>
							<td>
								<button type="submit" onClick=''>
								<img class="like-btn" src="${pageContext.request.contextPath}/resources/img/cart.png" />
								</button>
								<button type="submit" onClick="javascript: form.action='likeinsert.do';">
								<img class="like-btn" src="${pageContext.request.contextPath}/resources/img/unlikeit.png" />
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<textarea>${product.product_content}</textarea>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="product_price" value="<fmt:formatNumber value="${product.product_price}" pattern="₩#,###" />">
							</td>
						</tr>
						<tr>
							<td>
								<select name="options_num">
									<c:forEach var="ol" items="${optionslist}" varStatus="status" >
										<option value="${ol.options_num}">${ol.options_name} 
										<fmt:formatNumber value="${ol.options_price}" pattern="+#,###" /></option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit">구매하기</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../fix/footer.jsp"%>
