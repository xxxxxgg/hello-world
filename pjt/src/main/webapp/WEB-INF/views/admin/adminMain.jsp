<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Village Admin Page</title>
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
</style>
</head>
<body>
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
		<li>결제관리</li>
		<li>회원관리</li>
		<li>판매관리</li>
	</ul>
</div>
<hr>
<div class="admin-body">
body
${alogin.id }
${alogin.pw }
${adminVO }
${alogin }
</div>

<div class="admin-footer">footer</div>
</body>
</html>