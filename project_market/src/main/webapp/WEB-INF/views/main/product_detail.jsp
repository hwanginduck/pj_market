<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../fix/header.jsp"%>

<style>
.nav-fill .nav-item .nav-link, .nav-justified .nav-item .nav-link {
    width: ;
}

.nav-link {
    display: block;
    padding: var(--bs-nav-link-padding-y) var(--bs-nav-link-padding-x);
    font-size: var(--bs-nav-link-font-size);
    font-weight: var(--bs-nav-link-font-weight);
    color: #212529;
    text-decoration: none;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out;
}

</style>

<section id="productresource">
<form name="f" method="post">
	<div class="product-detail-box-pj"  >
		<div class="product-datail-inner-box-pj">
			<div class="product-datail-img-pj">
			    <div class="product-detail-imageContainer-pj" id="slideShow">
			    <ul class="slides">
					<c:forEach var="img" items="${product_imgArr}" begin="1">
						<li><img src="<%=request.getContextPath()%>/resources/upload/${img}"></li>
					</c:forEach>
				</ul>
				<p class="controller">      
	    		 <span class="prev">&lang;</span>  
	     		 <span class="next">&rang;</span>
	    		</p>
				</div> 
			</div>
			<div class="product-datail-text-pj">
				<input type="hidden" name="product_num" value=${product.product_num }>
				<div class="product-detail-first-box-pj">
					<div class="product-detail-category-pj">${product.product_l} > ${product.product_m}</div>
					<div class="product-detail-name-pj"> ${product.product_name } </div>
					<div class="product-detail-star-pj"> ★★★★★(100)  </div>
				</div>
				<div class="product-detail-second-box-pj">
					<div class="product-detail-price-pj">
						<fmt:formatNumber value="${product.product_price}" pattern="###,###,###원" />
					</div>
					<div class="product-detail-option-pj">
						<select name="options_num">
							<c:forEach var="ol" items="${optionslist}" varStatus="status">
								<option value="${ol.options_num}">${ol.options_name}
									<fmt:formatNumber value="${ol.options_price}" pattern="+#,###" />
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="product-detail-sub-pj">
					 	${product.product_sub}
					 </div>
				 </div>
				<div class="product-detail-clc-pj">
					<input type="number" min="1" value="1">
					<button type="submit" onclick="javascript: form.action='product_to_cart.do'">
						장바구니 추가
					</button>
					<button type="submit" onClick="javascript: form.action='insertlike.do'">
						찜 추가
					</button>
				</div>
				<div class="product-detail-buy-pj">
						<button type="submit">구매하기</button>
				</div>
			</div>
		</div>
		<div class="product-detail-content-pj">
			<c:forEach var="content" items="${product_contentArr}" begin="1">
				<img src="<%=request.getContextPath()%>/resources/upload/${content}">
			</c:forEach>
		</div>
	</div>
	</form>

		<input type="hidden" name="product_num" value=${product.product_num }>
		
			<div class="detail-content-pj" >
				<div>
					<div >
					 <ul class="nav nav-tabs nav-justified sticky-top" style="background-color: white;">
						<li class="nav-item active"><a href="#productresource" class="nav-link" style="text-decoration: none;">상품상세</a></li>
						<li class="nav-item"><a href="#reviewlist"  class="nav-link" style="text-decoration: none;">리뷰</a></li>
						<li class="nav-item"><a href="#qnalist"  class="nav-link" style="text-decoration: none;">상품문의</a></li>
						<li class="nav-item"><a href="#p_index"  class="nav-link" style="text-decoration: none;">배송/교환/반품안내</a></li>
					</ul> 
					<div  id="reviewlist" class="section target"></div>
					<div  id="qnalist" class="section target"></div>
					<div  id="p_index" class="section target"></div>
					</div>
				</div>
			</div>

</section>

<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path}/resources/js/product_detail.js"></script>
<script>
$(function () {
	var product_num = '${product.product_num}'
	
		$('#reviewlist').load('review_boardlist?product_num='+product_num);
		$('#qnalist').load('qna_boardlist.do?product_num=' + product_num);
		$('#p_index').load('p_index.do');
	});
</script>

<script>
$('a').click(function() {
    $('html, body').animate({
        scrollTop: $($.attr(this, 'href')).offset().top
    });
    return false;
});

// 퀵메뉴
$('.nav li a').click(function() {
    // 버튼 hover 이벤트
    return false
    $(this).parent().addClass('on');
    $(this).parent().siblings().removeClass('on');
});
// target 위치 표시와, 이동  
var sections = $('.target'),
    nav = $('.nav'),
    nav_height = nav.outerHeight();
	console.log('sections :'+sections);
	console.log('nav_height :'+nav_height);
    
$(window).on('scroll', function() {
    var cur_pos = $(this).scrollTop();
    sections.each(function() {
        var top = $(this).offset().top - nav_height,
            bottom = top + $(this).outerHeight();
        console.log('top :'+top);
        console.log('bottom :'+bottom);
        if (cur_pos >= top && cur_pos <= bottom) {
            nav.find('a').parent().removeClass('active');
            sections.removeClass('active');

            $(this).parent().addClass('nav-item');
            nav.find('a[href="#' + $(this).attr('id') + '"]').parent().addClass('active');
        }
    });
});



</script>







<%@ include file="../fix/footer.jsp" %>
