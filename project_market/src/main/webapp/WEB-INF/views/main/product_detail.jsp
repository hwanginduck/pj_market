<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../fix/header.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script> -->


<style>
div {
  border: 1px solid red;
}
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

.nav {
	display: flex;
	flex-wrap: wrap;
	padding-left: 0;
	margin-bottom: 0;
	list-style: none
}

.nav-tabs {
	border-bottom: 1px solid #dee2e6
}

.nav-justified .nav-item, .nav-justified>.nav-link {
	flex-basis: 0;
	flex-grow: 1;
	text-align: center
}

.nav-link {
	display: block;
	padding: .5rem 1rem;
	color: #0d6efd;
	text-decoration: none;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out
}
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	color: #495057;
	background-color: #fff;
	border-color: #dee2e6 #dee2e6 #fff
}

.container, .container-fluid, .container-lg, .container-md,
	.container-sm, .container-xl, .container-xxl {
	width: 100%;
	padding-right: var(- -bs-gutter-x, .75rem);
	padding-left: var(- -bs-gutter-x, .75rem);
	margin-right: auto;
	margin-left: auto
}

.mt-3 {
	margin-top: 1rem !important
}
</style>


<script type="text/javascript">
	$(function () {
		
		$('#list').load('qna_boardlist.do?product_num='+'${pnum}');
	});
	
	function move1(x) {
		$('#list').load('qna_boardlist.do');
	}
	
	function move2(y) {
		$('#list').load('review_boardlist');
	}
        
              

</script> 



<section class="main">	
	<div class="main-img">
		<div class="cart-content">
			<form name="f" method="post" action="">
				<input type="hidden" name="product_num"
					value=${product.product_num }>
				<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
				<div class="product-insert-table">
					<table width="1000px" border="1">
						<tr>
							<td rowspan="8"><img
								src="<%=request.getContextPath()%>/resources/upload/${product.product_img}">
							</td>
							<td><input type="text" name="product_name"
								value="${product.product_name}"></td>
						</tr>
						<tr>
							<td><input type="text" name="product_sub"
								value="${product.product_sub}"></td>
						</tr>
						<tr>
							<td>별점 ★  ${pnum } // ${member_id }</td>
						</tr>
						<tr>
							<td>
								<button type="submit"
									onClick="javascript: form.action='cartinsert.do'">
									<img class="like-btn"
										src="${pageContext.request.contextPath}/resources/img/cart.png" />
								</button>
								<button type="submit"
									onClick="javascript: form.action='likeinsert.do';">
									<img class="like-btn"
										src="${pageContext.request.contextPath}/resources/img/unlikeit.png" />
								</button>
							</td>
						</tr>
						<tr>
							<td><textarea>${product.product_content}</textarea></td>
						</tr>
						<tr>
							<td><input type="text" name="product_price"
								value="<fmt:formatNumber value="${product.product_price}" pattern="₩#,###" />">
							</td>
						</tr>
						<tr>
							<td><select name="options_num">
									<c:forEach var="ol" items="${optionslist}" varStatus="status">
										<option value="${ol.options_num}">${ol.options_name}
											<fmt:formatNumber value="${ol.options_price}"
												pattern="+#,###" /></option>
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
			<div class="container">

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
</section>
<%@ include file="../fix/footer.jsp"%>
