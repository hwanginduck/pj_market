<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../fix/header.jsp"%>

<section class="main">
	<div class="detail-content">
			<form name="f" method="post">
			<input type="hidden" name="product_num" value=${product.product_num }>
			
				<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
				<div class="detail-item-box">
					<table>
						<tr>
							<td rowspan="8"><img
								src="<%=request.getContextPath()%>/resources/upload/${product.product_img}">
							</td>
							<td>
								<input type="text" readonly name="product_name" value="${product.product_name}">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" readonly name="product_sub" value="${product.product_sub}">
							</td>
						</tr>
						<tr>
							<td>별점 ★  ${pnum } // ${member_id }</td>
						</tr>
						<tr>
							<td>
								<button type="submit" onclick="javascript: form.action='product_to_cart.do'">
								<img class="like-btn" src="${pageContext.request.contextPath}/resources/img/cart.png" />
								</button>
								<button type="submit" onClick="javascript: form.action='insertlike.do'">
								<img class="like-btn" src="${pageContext.request.contextPath}/resources/img/unlikeit.png" />
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<div>${product.product_content}</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" readonly name="product_price" value="<fmt:formatNumber value="${product.product_price}" pattern="₩#,###" />">
							</td>
						</tr>
						<tr>
							<td>
								<select name="options_num">
									<c:forEach var="ol" items="${optionslist}" varStatus="status" >
									
										<option value="${ol.options_num}">${ol.options_name} 
										<fmt:formatNumber value="${ol.options_price}" pattern="+#,###" /></option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td><input type="number" class="cart-count" id='result'
								name="cart_count" value="1" min="1"></td>
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

		<div>
			<div class="detail-content">

				<p>여깁니다</p>
				<ul class="nav nav-tabs nav-justified" >
					<li class="nav-item"><a class="nav-link active"	onClick="move1( ${product.product_num })">1번</a></li>
					<li class="nav-item"><a class="nav-link"  		onClick="move2( ${product.product_num })">2번</a></li>
					<li class="nav-item"><a class="nav-link" 	    onClick="move()">3번</a></li>
					<li class="nav-item"><a class="nav-link"		onClick="move()">4번</a></li>
				</ul>
				
				<div id="list"></div>
			</div>
		</div>

	</div>
		<div class="detail-content">
			<div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
				<div>qweqweqweqweqweqweqweqwe</div>
			</div>
		</div>
</section>
<%@ include file="../fix/footer.jsp"%>
