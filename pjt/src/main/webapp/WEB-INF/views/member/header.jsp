<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="/resources/css/header.css" rel="stylesheet" type="text/css">
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
				<a href="/member/usedSeller" class = "heaer_link">제휴업체</a>
				<a href="/product/cart" class = "heaer_link">장바구니</a>
				<a href="/member/mypage" class = "heaer_link">마이페이지</a>
				<c:if test = "${login.id == null}">
					<a href="/member/register" class = "heaer_link">회원가입</a>
				</c:if>
				
				<c:if test = "${login.id == null}">
					<a href="/member/login" class = "heaer_link">로그인</a>
				</c:if>
				
				<c:if test = "${login.id != null}">
					<a href="/member/logout" class = "heaer_link">로그아웃</a>
				</c:if>
				
			<nav>
		</div>
			
		<!-- main header -->
		<div id="main-header">
			<!-- logo -->
			<div id="logo">
				<!-- <span id="ist">The</span><span id="iist">Village</span> -->
				<a href="../"><img id = "img_logo" src = "/resources/img/logo.png" ></a>
			</div>
			<!-- search area -->
			<div id="search">
				<form action="">
					<input class="search-area" type="text" name="text" placeholder="원하는 상품을 검색하세요!">
					<input class="search-btn" type="submit" name="submit" value="SEARCH">
				</form>
			</div>
		</div>
			    
		</header>
		<!-- navigation bar -->
		<div id="navigation">
			<nav>
				<a href="/product/cate1">유아동</a><span id="gubun">|</span>
				<a href="#">레저/취미</a><span id="gubun">|</span>
				<a href="#">패션/뷰티</a><span id="gubun">|</span>
				<a href="#">리빙</a><span id="gubun">|</span>
				<a href="#">반려동물</a><span id="gubun">|</span>
				<a href="/product/sell">제품요청</a>
			</nav>
		</div>
	</div>
</body>
</html>
