<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/ab0cffe9ae.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
/* 전체적인 폰트등 스타일 먹일때 */
#root, html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	font-family: 'Jua', sans-serif;
}
/* 전체로 안먹는 것들은 별도로 지정하여 폰트 적용 */
input, select, textarea, button {
	font-family: 'Jua', sans-serif;
}

body {
	position: relative;
}

body::after {
	content: "";
	background-image:
		url("${pageContext.request.contextPath}/resources/img/main.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	/* 스크롤에 따라서 배경이미지가 따라다님 */
	background-color: #212529;
	opacity: 0.5;
	position: fixed;
	top: 0;
	height: 100%;
	width: 100%;
	z-index: -1;
}

header {
	width: 100%;
	height: 25%;
	/* 상단 고정 */
	position: absolute;
	top: 0;
	z-index: 1;

	/* 영역확인용 */
	/* background-color: pink; */
}

.header {
	/* margin : 1번째는 위에서거리 2번째는 오른쪽 3번째는 아래 4번째는 왼쪽 */
	margin: 0 auto;
	width: 1200px;
	height: 70%;
	/* 테두리를 아래만 설정: 굵기, 종류, 색깔 */
	border-bottom: 2px solid green;
	/* div로 설정되어 잇는 것들을 공간 낭비를 없애고 겹치게 해준다 */
	display: flex;
	/* 문단기준으로 골고루 시작과 끝 사이에 균등 분배 */
	justify-content: space-between;
	/* 영역확인용 */
	/* background-color: blue; */
}

.logo {
	width: 200px;
	height: 100%;
	display: flex;
	/* 영역 확인용  */
	/* background: red; */
}

.login-box {
	width: 200px;
	height: 100%;
	padding-right: 10%;
	display: flex;
	justify-content: flex-end;

	/* 영역확인용 */
	/* background-color: green; */
}

.login>a {
	text-decoration: none;
	color: #5FB404;
}

.login {
	margin-right: -100px;
	padding: 10px 0 0 0;
	color: #5FB404;
	font-size: 30px;
}

.center-box {
	width: 50%;
	height: 100%;
	/* 영역확인용 */
	/* background-color: pink; */
}

.input-box {
	margin-top: 50px;
	margin-left: 30px;
	margin-right: 30px;
	background-color: #5FB404;
	border: 1px solid #5FB404;
	display: flex;
	align-items: center;
	justify-content: center;
}

#search-bar {
	width: 80%;
	height: 50px;
	font-size: 35px;
	border-radius: 10px;
	margin-right: 4px;
	/* 기본테두리 없애기 */
	border: none;
	/* 클릭시 나오는 테두리 없애기 */
	outline: none;
	/* 영역확인용 */
	/* background: red; */
}

#search-button {
	/* 기본테두리 없애기 */
	border: none;
	/* 클릭시 나오는 테두리 없애기 */
	outline: none;
	color: white;
	background-color: #5FB404;
	height: 50px;
	width: 50px;
	display: flex;
	justify-content: center;
	padding-top: 6px;
}

.navbar {
	margin: 0px auto;
	width: 1200px;
	height: 30%;
	display: flex;
	justify-content: space-between;
	border-bottom: 2px solid green;

	/* 영역확인용 */
	/* background-color: white; */
}

.menu-bar {
	width: 100%;
	list-style-type: none;
	margin: 0;
	padding: 0;
	border: 1px solid #e7e7e7;
	background-color: #f3f3f3;
	display: flex;
}

.menu-bar>li {
	height: 100%;
}

.menu-box {
	height: 100%;
}

.menu-box>a, button {
	color: #666;
	height: 100%;
	font-size: 16px;
	padding: 0 16px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.menu-box>a {
	text-decoration: none;
}

/* 현재 있는 페이지 메뉴에 클래스에 active 속성 먹이기 */
.menu-box>a.active {
	background: pink;
}

*, *:before, *:after {
	box-sizing: inherit;
}

.dropdown {
	position: relative;
}

.dropbtn {
	/* 	background-color: #04AA6D; */
	/* color: white; */
	border: none;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	top: 56px;
	left: 0;
}

.dropdown-content a {
	color: #666;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #31B404;
	color: white;
}

.dropdown:hover  
	.dropdown-content {
	display: block;
}

.menu-box:hover>a, .menu-box:hover>.dropbtn {
	background-color: #5FB404;
	color: white;
}

/* footer css */
footer {
	color: black;
	width: 100%;
	padding-bottom: 30px;
	padding-top: 20px;
	opacity: 0.8;
	background-color: gray;
}

.corporate {
	width: 1200px;
	margin: auto;
}

/* 메인 css */
.main-img {
	width: 100%;
	height: 2000px;
	/* background-color: #212529; */
	/* opacity: 0.5; */
}

/* 버블효과 */
.welcome {
	padding-top: 300px;
	padding-left: 300px;
}

#welcome_wording {
	text-align: center;
	font-family: 'Luckiest Guy', cursive;
	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
	text-shadow: 1px 1px 1px #000;
}

.bubbles {
	display: inline-block;
	font-family: arial;
	position: relative;
}

.bubbles h1 {
	position: relative;
	margin: 1em 0 0;
	font-size: 100px;
	color: #fff;
	z-index: 2;
}

.individual-bubble {
	position: absolute;
	border-radius: 100%;
	bottom: 10px;
	background-color: #fff;
	z-index: 1;
}

.like-content {
	padding-top: 300px;
}

.like-table {
	margin: 0 auto;
	border: 1px #a39485 solid;
	font-size: 25px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 800px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden position: relative;
	padding-bottom: 0;
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);;
}

.like-table>table {
	text-align: center;
	margin: auto;
}

#like-table-th {
	font-weight: bold;
	height: 50px;
	color: #fff;
	background: #5FB404;
}

#like-table-tr {
	border-bottom: 1px solid #a39485;
}

.like-table-btn {
	margin: auto;
	padding: 5px 5px 5px 5px;
	width: 50px;
	height: 50px;
	/* 기본테두리 없애기 */
	border: none;
	/* 클릭시 나오는 테두리 없애기 */
	outline: none;
	background-color: transparent;
}

.like-btn {
	width: 50px;
	height: 50px;
}

.cart-content {
	padding-top: 300px;
}

.cart-table {
	margin: 0 auto;
	border: 1px #a39485 solid;
	font-size: 25px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 800px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden position: relative;
	padding-bottom: 0;
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);;
}

.cart-right-table {
	margin: 0 auto;
	border: 1px #a39485 solid;
	font-size: 25px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 500px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden position: relative;
	padding-bottom: 0;
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);;
}

.cart-table>table {
	text-align: center;
	margin: auto;
}

#cart-table-th {
	font-weight: bold;
	height: 50px;
	color: #fff;
	background: #5FB404;
}

#cart-table-tr {
	border-bottom: 1px solid #a39485;
}

.cart-btn {
	width: 50px;
	height: 50px;
}

.cart-count {
	font-size: 35px;
	padding-left: 10px;
	padding-right: 10px;
	vertical-align: super;
}

.cart-table-btn {
	margin: auto;
	padding: 5px 5px 5px 5px;
	width: 50px;
	height: 50px;
	/* 기본테두리 없애기 */
	border: none;
	/* 클릭시 나오는 테두리 없애기 */
	outline: none;
	background-color: transparent;
}

.buy-button {
	margin-top: 10px; margin-bottom : 20px; margin : auto;
	padding: 10px 30px 10px 30px;
	font-size: 30px;
	background-color: #ce6d39;
	color: #ffeee4;
	border: none;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	border-radius: 15px;
	margin-bottom: 20px;
	margin: auto;
}

.cart-checkbox {
	width: 30px;
	height: 30px;
}

.product-insert-table {
	margin: 0 auto;
	border: 1px #a39485 solid;
	font-size: 25px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 1000px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden position: relative;
	padding-bottom: 0;
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);;
}

.product-insert-table>table {
	text-align: center;
	margin: auto;
}

#product-insert-table-th {
	font-weight: bold;
	height: 80px;
	color: #fff;
	background: #5FB404;
}

#product-table-tr {
	border-bottom: 1px solid #a39485;
}

#product-insert-bar {
	width: 350px;
	height: 50px;
	font-size: 35px;
	border-radius: 10px;
	margin-right: 4px;
	border-color: #5FB404;
	/* 기본테두리 없애기 */
	/* border: none; */
	/* 클릭시 나오는 테두리 없애기 */
	outline: none;
	/* 영역확인용 */
	/* background: red; */
}
#product-insert-textarea {
	width: 350px;
	height: 200px;
	font-size: 20px;
	border-radius: 10px;
	margin-right: 4px;
	border-color: #5FB404;
	/* 기본테두리 없애기 */
	/* border: none; */
	/* 클릭시 나오는 테두리 없애기 */
	outline: none;
	/* 영역확인용 */
	/* background: red; */
}
.pl {
	width: 350px;
	height: 50px;
	border: 1px solid #5FB404;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-weight: 400;
	font-size: 25px;
	line-height: 16px;
}

.pl:focus {
	border: 1px solid #9B51E0;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #F8E4FF;
	border-radius: 10px;
}

input[type=file]::file-selector-button {
	width: 100px;
	height: 50px;
	background: #fff;
	border: 1px solid #5FB404;
	border-radius: 10px;
	cursor: pointer; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
}

}
.image-box {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 500px;
	height: 500px;
}

#image_container {
	object-fit: cover;
}

.option-insert-table {
	margin: 0 auto;
	border: 1px #a39485 solid;
	font-size: 25px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 1000px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden position: relative;
	padding-bottom: 0;
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);;
}

.option-insert-table>table {
	text-align: center;
	margin: auto;
}
#option-insert-bar {
	width: 200px;
	height: 50px;
	font-size: 35px;
	border-radius: 10px;
	margin-right: 4px;
	border-color: #5FB404;
	/* 기본테두리 없애기 */
	/* border: none; */
	/* 클릭시 나오는 테두리 없애기 */
	outline: none;
	/* 영역확인용 */
	/* background: red; */
}

.insert-product-btn{
	display: flex; 
	justify-content: center;
	margin:auto;
	margin-bottom:10px;
	margin-top: 10px;
	padding: 10px 30px; 
	font-size: 30px; 
	border-radius: 10px; 
	background-color: #5FB404; 
	color: white;"
}
</style>
<script type="text/javascript">
	jQuery(document).ready(
			function($) {

				// Define a blank array for the effect positions. This will be populated based on width of the title.
				var bArray = [];
				// Define a size array, this will be used to vary bubble sizes
				var sArray = [ 4, 6, 8, 10 ];

				// Push the header width values to bArray
				for (var i = 0; i < $('.bubbles').width(); i++) {
					bArray.push(i);
				}

				// Function to select random array element
				// Used within the setInterval a few times
				function randomValue(arr) {
					return arr[Math.floor(Math.random() * arr.length)];
				}

				// setInterval function used to create new bubble every 350 milliseconds
				setInterval(function() {

					// Get a random size, defined as variable so it can be used for both width and height
					var size = randomValue(sArray);
					// New bubble appeneded to div with it's size and left position being set inline
					// Left value is set through getting a random value from bArray
					$('.bubbles').append(
							'<div class="individual-bubble" style="left: '
									+ randomValue(bArray) + 'px; width: '
									+ size + 'px; height:' + size
									+ 'px;"></div>');

					// Animate each bubble to the top (bottom 100%) and reduce opacity as it moves
					// Callback function used to remove finsihed animations from the page
					$('.individual-bubble').animate({
						'bottom' : '100%',
						'opacity' : '-=0.7'
					}, 3000, function() {
						$(this).remove()
					});

				}, 350);

			});

	/* 장바구니 숫자 증가 감소 */
	function count(type, num) {
		
		// 결과를 표시할 element
		const resultElement = document.getElementById('result'+num);
		
		// 현재 화면에 표시된 값
		let number = resultElement.innerText;
		
		// 더하기/빼기
		if (type === 'plus'+num) {
			number = parseInt(number) + 1;
		} else if (type === 'minus'+num) {
			number = parseInt(number) - 1
			if (number == 0) {
				alert("1 이하로는 내릴수 없습니다.");
				number = 1;
			}
		}

		// 결과 출력
		resultElement.innerText = number;
	}
</script>
<!-- <script>	
/* 찜 > 장바구니로 이동 */

$(document).on('click', '#addcart', function(e){
	
	alert("스크립트 실행");
	

	var options_num = request.getParameter("options_num");
	var product_num = ${product_num}
	var member_id = $("#member_id").val();
	var cart_count = 1;
	
	alert("member_id");

	console.log(options_num);
	console.log(product_num);
	console.log(member_id);
	console.log(cart_count);
	
	
	var formData = new FormData();
	formData.append("options_num", options_num);
	formData.append("product_num", product_num);
	formData.append("member_id", member_id);
	formData.append("1", 1);
	
	$.ajax({
		enctype : 'multipart/form-data',
		processData : false,
		contentType : false,
		cache : false,
		url : "insertCart.do",
		data : formData,
		type : "POST",
		success : function(res){
			if(confirm("장바구니로 이동하시겠습니까?")==true){
				location.href="cart_list.do";
			}else{
				return false;
			}
		}
		
	})
	
});
 
</script> -->
<!-- 첫번째 드롭바를 기준으로 두번째 드롭바 벼꾸기 -->
<script>
	function categoryChange(e) {

		var good_홈스마트 = [ "스마트 조명", "스마트 전동 블라인드", "스마트 공기청정기", "스마트 컨르롤 시스템",
				"와이파이 스피커" ];
		var good_가구 = [ "게임용가구", "가구세트", "침대", "쇼파", "책상/선반유닛", "식탁/책상",
				"수납장/장식장", "TV/멀티가구", "서랍장/서랍장유닛", "옷장", "의자", "야외용 가구",
				"거실장/찬장/콘솔테이블", "어린이가구", "칸막이/파티션", "이동식 선반", "바테이블/의자",
				"암체어/카우치", "카페가구", "영유아 가구" ];
		var good_홈오피스 = [ "사무용의자", "책상/컴퓨터책상", "책상/의자 세트", "서랍 유닛", "수납유닛/수납장",
				"칸막이/파티션", "작업등", "케이블/충전기", "서류/미디어정리용품" ];
		var good_침대매트리스 = [ "침대", "침구", "매트리스", "침대협탁", "매트리스 베이스", "침대헤드",
				"침대수납", "침대갈빗살", "침대다리" ];
		var good_어린이GaGu = [ "어린이", "영유아" ];
		var good_조명 = [ "일반조명", "장식조명", "시스템조명", "스마트조명", "야외용조명", "욕실조명",
				"LED전구" ];
		var good_수납정리 = [ "책상/선반유닛", "수납솔루션시스템", "수납장/장식장", "TV/멀티미디어 가구",
				"서랍장/서랍장유닛", "옷장", "소형수납/정리", "거실장/찬장/콘솔테이블", "후크/벽수납",
				"스텐드옷걸이/신발수납", "이동식선반", "가방", "이동보조상품", "벽선반", "슬라이딩도어시스템" ];
		var good_주방용품 = [ "식품보관정리", "디너웨어", "서빙웨어", "커피/차", "테이블텍스타일", "조리도구",
				"유리제품/유리병", "주방가구", "식기세척용품", "식기도구", "칼/도마", "제빵도구", "주방텍스타일",
				"넵킨/넵킨홀더", "어린이식기" ];
		var good_주방가구 = [ "주방 부속품", "주방 팬트리", "주방 벽수납", "주방 조리대", "주방 가전",
				"주방 아일랜드/카트", "주방 손잡이", "주방조명", "주방 싱크대/수도꼭지", "주방 벽패널",
				"주방 모듈형", "주방 도어/서랍앞판", "주방 캐비넷" ];
		var good_욕실 = [ "욕실 세면대하부장", "욕실 용품", "욕실 수납", "욕실 거울", "욕실 세탁용품",
				"욕실 텍스타일", "욕실 조명", "욕실 세면대 세트", "욕실 스툴/벤치", "욕실 세면기",
				"욕실 사워기", "욕실 수도꼭지" ];
		var good_텍스타일 = [ "침구", "커튼/블라인드", "쿠션/쿠션커버", "어린이 텍스타일", "야외용 쿠션",
				"담요/스로우", "테이블 텍스타일", "패브릭/재봉용품", "주방 텍스타일", "영유아 텍스타일",
				"목욕가운/판쵸우의", "위자패드", "러그" ];
		var target = document.getElementById("good");

		if (e.value == "홈스마트")
			var d = good_홈스마트;
		else if (e.value == "가구")
			var d = good_가구;
		else if (e.value == "홈오피스")
			var d = good_홈오피스;
		else if (e.value == "침대매트리스")
			var d = good_침대매트리스;
		else if (e.value == "어린이GaGu")
			var d = good_어린이GaGu;
		else if (e.value == "조명")
			var d = good_조명;
		else if (e.value == "수납정리")
			var d = good_수납정리;
		else if (e.value == "주방용품")
			var d = good_주방용품;
		else if (e.value == "주방가구")
			var d = good_주방가구;
		else if (e.value == "욕실")
			var d = good_욕실;
		else if (e.value == "텍스타일")
			var d = good_텍스타일;
		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>

<!-- 업로드 이미지 미리보기 기능 -->
<script>
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>

<!-- 옵션 + 누르면 증가해주는 기능 -->
<script>
$(document).ready(function() {
	var i=1; // 변수설정은 함수의 바깥에 설정!
  $("#option_plus").click(function() {
    
    $("#option_space").append("<tr><td><input type='text' id='option-insert-bar'/></td><td><input type='text' id='option-insert-bar'/></td><td><input type='text' id='option-insert-bar'/></td></tr>");
    
    i++; // 함수 내 하단에 증가문 설정
    

  });
});
</script>

<!-- 옵션등록버튼 -->
<script> 
  function submit2(frm) { 
    frm.action='두번째로 보낼 경로'; 
    frm.submit(); 
    return true; 
  } 
</script> 
</head>
<body>
	<header>
		<div class="header">

			<div class="logo">
				<img
					src="${pageContext.request.contextPath}/resources/img/gagu_logo1.png" />
			</div>

			<div class="center-box">
				<div class="input-box">
					<input id="search-bar" type="text" placeholder=" Search" />
					<button id="search-button">
						<i class="fa-solid fa-magnifying-glass fa-3x"></i>
					</button>
				</div>
			</div>

			<div class="login-box">
				<div class="login">
					<a href="loginform.do">login</a> <a href="member_join.do">join</a>
				</div>
			</div>
		</div>
		<!-- <hr width="1200px"  style="border: solid 1px green; margin: 0px;"> -->
		<div class="navbar">
			<ul class="menu-bar">
				<li>
					<div class="menu-box">
						<a href="mainpage.do">Home</a>
					</div>
				</li>
				<li>
					<div class="dropdown menu-box">
						<button class="dropbtn">Category</button>
						<div class="dropdown-content">
							<a href="#">홈스마트</a> <a href="#">가구</a> <a href="#">홈오피스</a> <a
								href="#">침대/매트리스</a> <a href="#">어린이IKEA</a> <a href="#">조명</a>
							<a href="#">수납/정리</a> <a href="#">주방용품</a> <a href="#">주방가구</a> <a
								href="#">아웃도어/야외용품</a> <a href="#">욕실</a> <a href="#">텍스타일</a>
						</div>
					</div>
				</li>
				<li><div class="menu-box active">
						<a href="">Rangking</a>
					</div></li>
				<li><div class="menu-box active">
						<a href="qna_boardlist.do">Q&A</a>
					</div></li>
				<li><div class="dropdown menu-box">
						<button class="dropbtn">My Page</button>
						<div class="dropdown-content">
							<a href="like_list.do">찜목록</a> <a href="cart_list.do">장바구니</a> <a
								href="#">내정보수정</a>
						</div>
					</div></li>
				<li><div class="dropdown menu-box">
						<button class="dropbtn">Manager</button>
						<div class="dropdown-content">
							<a href="product_insert.do">상품등록</a> <a href="cart_list.do">매출현황</a>
						</div>
					</div></li>
			</ul>
		</div>
	</header>
</body>
</html>