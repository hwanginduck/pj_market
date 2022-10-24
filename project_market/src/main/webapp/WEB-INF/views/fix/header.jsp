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
.login > a {
	text-decoration:none;
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
.welcome{
	padding-top: 300px;
	padding-left: 300px;
}

#welcome_wording{
	text-align:center;
	font-family: 'Luckiest Guy', cursive;
	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
	text-shadow:1px 1px 1px #000;
}

.bubbles {
	display: inline-block;
	font-family: arial;
	position: relative;
}

.bubbles h1 {
	position: relative;
	margin: 1em 0 0;
	font-size:100px;
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

.like-content{
	padding-top: 300px;
}

.like-table {
	margin: 0 auto;
	border: 1px #a39485 solid;
	font-size: 25px;
	box-shadow: 0 2px 5px rgba(0,0,0,.25);
	width: 800px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden
	
	position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);;
    

}

.like-table > table {
	text-align: center;
	margin: auto;
}

#like-table-th{
	font-weight: bold;
	height:50px;
	color: #fff;
	background: #5FB404;
}
#like-table-tr{
	border-bottom: 1px solid #a39485;
}

.like-table-btn{
	margin:auto;
	padding: 5px 5px 5px 5px;
	width: 50px;
	height: 50px;
	/* 기본테두리 없애기 */
	border: none;
	/* 클릭시 나오는 테두리 없애기 */
	outline: none;
	background-color: transparent;
}

.like-btn{
	width:50px;
	height: 50px;
	
	
}

.cart-content{
	padding-top: 300px;
}

.cart-table {
	margin: 0 auto;
	border: 1px #a39485 solid;
	font-size: 25px;
	box-shadow: 0 2px 5px rgba(0,0,0,.25);
	width: 800px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden
	
	position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);;

}


.cart-table > table {
	text-align: center;
	margin: auto;
}

#cart-table-th{
	font-weight: bold;
	height:50px;
	color: #fff;
	background: #5FB404;
}
#cart-table-tr{
	border-bottom: 1px solid #a39485;
}


</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($){
	 
    // Define a blank array for the effect positions. This will be populated based on width of the title.
    var bArray = [];
    // Define a size array, this will be used to vary bubble sizes
    var sArray = [4,6,8,10];
 
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
    setInterval(function(){
         
        // Get a random size, defined as variable so it can be used for both width and height
        var size = randomValue(sArray);
        // New bubble appeneded to div with it's size and left position being set inline
        // Left value is set through getting a random value from bArray
        $('.bubbles').append('<div class="individual-bubble" style="left: ' + randomValue(bArray) + 'px; width: ' + size + 'px; height:' + size + 'px;"></div>');
         
        // Animate each bubble to the top (bottom 100%) and reduce opacity as it moves
        // Callback function used to remove finsihed animations from the page
        $('.individual-bubble').animate({
            'bottom': '100%',
            'opacity' : '-=0.7'
        }, 3000, function(){
            $(this).remove()
        }
        );
 
 
    }, 350);
 
});
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
					<a href="loginform.do">login</a> <a>join</a>
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
							<a href="#">홈스마트</a>
							<a href="#">가구</a>
							<a href="#">홈오피스</a>
							<a href="#">침대/매트리스</a> 
							<a href="#">어린이IKEA</a> 
							<a href="#">조명</a>
							<a href="#">수납/정리</a> 
							<a href="#">주방용품</a>
							<a href="#">주방가구</a> 
							<a href="#">아웃도어/야외용품</a>
							<a href="#">욕실</a> 
							<a href="#">텍스타일</a>
						</div>
					</div>
				</li>
				<li><div class="menu-box active">
						<a href="">Rangking</a>
					</div></li>
				<li><div class="dropdown menu-box">
					<button class="dropbtn">My Page</button>
						<div class="dropdown-content">
							<a href="like_list.do">찜목록</a>
							<a href="cart_list.do">장바구니</a>
							<a href="#">내정보수정</a>
						</div>	
					</div></li>
				<li><div class="menu-box">
						<a href="">Manager</a>
					</div></li>
			</ul>
		</div>
	</header>
</body>
</html>