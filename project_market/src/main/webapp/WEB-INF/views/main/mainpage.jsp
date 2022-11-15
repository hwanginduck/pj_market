<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../fix/header.jsp"%>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <!-- Demo styles -->
    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        cursor: pointer;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }
		
		.swiper-wrapper{
			column-gap: 30px;
		}


      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      
      .category-link-pj{
      	font-size: 40px;
      	margin-bottom: 50px;
      }
      .newlist-pj{
      	font-size: 40px;
      	margin-bottom: 50px;
      	margin-top: 50px;
      }
      .newlist-box-pj{
      	width: 100%;
      	height: auto;
		display: grid;
		grid-template-columns: repeat(6, 185px);
		grid-template-rows: repeat(15, 150px);
		gap:20px;
		justify-items: stretch;
      }
      .newlist-img-box{
      	height: 380px;
      	width: 380px;
      	border: 1px solid black;
 		box-sizing: border-box;
      }
       .box0-pj{
       	grid-column: 1 / span 6;
       	grid-row: 1 / span 3;
      	border-radius: 20px;
      	padding-top:300px;
      	padding-right:30px;
      	font-size:30px;
		padding-left:900px;
		cursor: pointer;
      } 
      .box0-pj:hover > .newlist-text-box-pj0{
      	display:block;
      	position: absolute;
      }


      
     	.box1-pj{
      	grid-column: 1 / span 2;
       	grid-row: 4 / span 4;
      	border-radius: 20px;
      	padding-top:500px;
      	padding-left:150px;
      	font-size:30px;
		cursor: pointer; 
      }
        .box1-pj:hover > .newlist-text-box-pj1{
      	display:block;
      	position: absolute;
      }
      	.box2-pj{
      	grid-column: 3 / span 2;
       	grid-row: 4 / span 3;
      	border-radius: 20px;
      	padding-top:350px;
      	padding-left:150px;
      	font-size:30px;
		cursor: pointer; 
      }
        .box2-pj:hover > .newlist-text-box-pj2{
      	display:block;
      	position: absolute;
      }
      .box3-pj{
      	grid-column: 5 / span 2;
       	grid-row: 4 / span 4;
      	border-radius: 20px;
      	padding-top:500px;
      	padding-left: 150px;
      	font-size:30px;
		cursor: pointer; 
      }
        .box3-pj:hover > .newlist-text-box-pj3{
      	display:block;
      	position: absolute;
      }
      .box4-pj{
		grid-column: 1 / span 2;
       	grid-row: 8 / span 4;
      	border-radius: 20px;
      	padding-top:500px;
      	padding-left: 150px;
      	font-size:30px;
		
		cursor: pointer; 
      }
        .box4-pj:hover > .newlist-text-box-pj4{
      	display:block;
      	position: absolute;
      }
      .box5-pj{
      	grid-column: 3 / span 2;
       	grid-row: 7 / span 4;
      	border-radius: 20px;
      	padding-top:500px;
      	 padding-left: 150px;
      	font-size:30px;
		
		cursor: pointer;
      }
        .box5-pj:hover > .newlist-text-box-pj5{
      	display:block;
      	position: absolute;
      }
      .box6-pj{
      	grid-column: 5 / span 2;
       	grid-row: 8 / span 4;
      	border-radius: 20px;
      	padding-top:500px;
      	padding-left: 150px;
      	font-size:30px;
		
		cursor: pointer; 
      }
        .box6-pj:hover > .newlist-text-box-pj6{
      	display:block;
      	position: absolute;
      }
      .box7-pj{
      	grid-column: 1 / span 2;
       	grid-row: 12 / span 4;
      	border-radius: 20px;
      	padding-top:500px;
      padding-left: 150px;
      	font-size:30px;
		
		cursor: pointer; 
      }
        .box7-pj:hover > .newlist-text-box-pj7{
      	display:block;
      	position: absolute;
      }
      .box8-pj{
      	grid-column: 3 / span 2;
       	grid-row: 11 / span 4;
      	border-radius: 20px;
      	padding-top:500px;
      padding-left: 150px;
      	font-size:30px;
		
		cursor: pointer; 
      }
        .box8-pj:hover > .newlist-text-box-pj8{
      	display:block;
      	position: absolute;
      }
      .box9-pj{
      	grid-column: 5 / span 2;
      	grid-row: 12 / span 4;
      	border-radius: 20px;
      	padding-top:500px;
      	padding-left: 150px;
      	font-size:30px;
	
		cursor: pointer; 
      } 
        .box9-pj:hover > .newlist-text-box-pj9{
      	display:block;
      	position: absolute;
      }
      .newlist-text-box-pj0{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;

      }
      .newlist-text-box-pj1{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
        box-shadow: 2px 2px 2px gray;

      }
      .newlist-text-box-pj2{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;
      }
      .newlist-text-box-pj3{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;
      }
      .newlist-text-box-pj4{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;
      }
      .newlist-text-box-pj5{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;
      }
      .newlist-text-box-pj6{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;
      }
      .newlist-text-box-pj7{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;
      }
      .newlist-text-box-pj8{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;
      }
      .newlist-text-box-pj9{
      display:none;
      background-color: white;
      width: 200px;
      height: 90px;
	    padding-top: 30px;
    padding-left: 10px;
    position: absolute;
    box-shadow: 2px 2px 2px gray;
      }

      .newlist-text-name-pj{
      	font-size: 15px;
      	 white-space: nowrap;
	    text-overflow: ellipsis;
    overflow: hidden; 
      }
      .newlist-text-price-pj{
      	font-size: 20px;
      	 white-space: nowrap;
	    text-overflow: ellipsis;
    overflow: hidden; 
      }
      .newlist-text-sub-pj{
      	font-size: 10px;
      	 white-space: nowrap;
	    text-overflow: ellipsis;
    overflow: hidden; 
      }
      
      
      
      

    </style>
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

  <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 3,
        loop: true,
        scrollbar: {
            el: ".swiper-scrollbar",
            hide: true,
        },
      });
    </script>
