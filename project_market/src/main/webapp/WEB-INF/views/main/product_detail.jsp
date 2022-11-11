<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../fix/header.jsp"%>

<script src="${path}/resources/js/product.js"></script>
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

//product_detail 페이지로딩될때 최초로 qna_boardlist 페이지를 로드해옴.

// $(function () {
// 	$('#list').load('qna_boardlist.do?product_num=${product.product_num}&product_name=${product.product_name}');
// });

	$(function () {
	var product_num = '${product.product_num}'
// 	alert("product_detail.jsp 리턴될때 검수용 alert \n"+"product_num: "+ product_num);
	
		$('#p_index').load('p_index.do');
		$('#qnalist').load('qna_boardlist.do?product_num=' + product_num);
		$('#reviewlist').load('review_boardlist');
	});


// 상단 스크립트 매뉴로 페이지 로드함수.
function move1(product_num) {
	$('#list').load('qna_boardlist.do?product_num='+product_num);
}

function move2(y) {
	$('#list').load('review_boardlist');
}
</script>

<section class="main-pj">
	<div class="detail-content-pj">
	
		<form name="f" method="post">
			<input type="hidden" name="product_num" value=${product.product_num }>

			<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
			<div class="detail-item-box-pj">
				<table>
					<tr>
						<td rowspan="8"><img src="<%=request.getContextPath()%>/resources/upload/${product.product_img}"></td>
						<td><input type="text" readonly name="product_name" value="${product.product_name}"></td>
					</tr>
					<tr>
						<td><input type="text" readonly name="product_sub" value="${product.product_sub}"></td>
					</tr>
					<tr>
						<td>별점 ★ </td>
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
						<td><input type="text" readonly name="product_price" value="<fmt:formatNumber value="${product.product_price}" pattern="₩#,###" />"></td>
					</tr>
					<tr>
						<td><select name="options_num">
								<c:forEach var="ol" items="${optionslist}" varStatus="status">

									<option value="${ol.options_num}">${ol.options_name}
										<fmt:formatNumber value="${ol.options_price}" pattern="+#,###" /></option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><input type="number" class="cart-count" id='result' name="cart_count" value="1" min="1"></td>
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
	<hr>

			<div class="detail-content-pj">
				<div>
					 <ul class="nav nav-tabs nav-justified">
						<li class="nav-item"><a href="#" class="nav-link" style="text-decoration: none;">상품상세</a></li>
						<li class="nav-item"><a href="#reviewlist"  class="nav-link" style="text-decoration: none;">리뷰</a></li>
						<li class="nav-item"><a href="#qnalist"  class="nav-link" style="text-decoration: none;">상품문의</a></li>
						<li class="nav-item"><a href="#p_index"  class="nav-link" style="text-decoration: none;">배송/교환/반품안내</a></li>
					</ul> 

					<div  id="reviewlist"></div>
					<div  id="qnalist"></div>
					<div  id="p_index"></div>
				</div>
			</div>

</section>
<%@ include file="../fix/footer.jsp"%>
