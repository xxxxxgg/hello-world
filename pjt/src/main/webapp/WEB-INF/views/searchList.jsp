<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품검색 결과 < 빌려죠</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
<div id="wrapper">
	<header id="header">
	    <div id="subheader">
	        <nav class="container">
	            <!-- <p>The Village</p> -->
	            <a href="/main" class = "heaer_link">장바구니</a>
	            <a href="/main" class = "heaer_link">마이페이지</a>
	            <a href="/main" class = "heaer_link">회원가입</a>
	            <a href="/main" class = "heaer_link">로그인</a>
	        <nav>
	    </div>
	
	    <!-- main header -->
	    <div id="main-header">
	        <!-- logo -->
	        <div id="logo">
	            <!-- <span id="ist">The</span><span id="iist">Village</span> -->
	            <img id = "img_logo" src = "/resources/img/logo.png">
	        </div>
	        <!-- search area -->
	        <div id="search">
	                <form action="/search">
	                    <input class="search-area" type="text" name="keyword" value="${keyword }" placeholder="검색어 입력">
	                    <input class="search-btn" type="submit" value="SEARCH">
	                </form>
	        </div>
	    </div>
	    
	</header>
	<!-- navigation bar -->
	<div id="navigation">
	    <nav>
	        <a href="#">Home</a>
	        <a href="#">New arrivals</a>
	        <a href="#">Deals</a>
	        <a href="#">Electronics</a>
	        <a href="#">Accessories</a>
	        <a href="#">Products</a>
	        <a href="#">Order</a>
	    </nav>
	</div>
</div>


<div>

</div>
</body>
</html>