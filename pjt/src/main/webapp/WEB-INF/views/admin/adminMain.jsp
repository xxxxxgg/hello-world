<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Village Admin Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="/resources/css/adminstyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
<hr>
<div class="admin-header">
	<div class="header-left">
		<h1>Admin Main</h1>
	</div>
	<div class="header-right">
		<ul class="header-rlist">
			<li class="">mypage</li>
			<li class="">wishlist</li>
		</ul>
	</div>
</div>
<hr>
<div class="admin-nav">
	<ul>
		<li><a href="/admin/order">주문관리</a></li>
		<li><a href="/admin/payment">결제관리</a></li>
		<li><a href="/admin/member">회원관리</a></li>
		<li><a href="/admin/sell">판매관리</a></li>
	</ul>
</div>
<hr>
<div class="admin-body">
body
${alogin }
</div>

<div class="admin-footer">footer</div>
</body>
</html>