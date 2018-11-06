<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Village Admin Login Page</title>
<style type="text/css">
.header-left {
	display : inline-block;
	width : 200px;
	height : 100px;
	margin : 1em;
}
.header-right {
	float : right;
	margin-top : 40px;
}
.header-right ul li {
	display : inline-block;
	margin-right : 20px;
}
.admin-nav {
	border-style : outset;
}
.admin-nav ul li {
	display : inline-block;
	margin : 0px 20px 0px 20px;
}
</style>
</head>
<body>
<hr>
<div class="admin-header">
	<div class="header-left">
		<h1>Admin Main</h1>
	</div>
	<div class="header-right">
		<ul class="header-rlist">
			<li>${alogin }</li>
			<li><a href="/admin">메인으로</a></li>
		</ul>
	</div>
</div>
<hr>
<div class="admin-nav">
	<ul>
		<li><a href="/admin/adminOrder">주문관리</a></li>
		<li><a href="/admin/order">결제관리</a></li>
		<li><a href="/admin/order">회원관리</a></li>
		<li><a href="/admin/order">판매관리</a></li>
	</ul>
</div>
<hr>
<div class="admin-body">
body
</div>
<hr>
<div class="admin-footer">footer</div>
</body>
</html>