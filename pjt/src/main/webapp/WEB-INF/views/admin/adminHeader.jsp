<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Village Admin Page</title>    
<link href="/resources/css/adminstyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
<hr>
<div class="admin-header">
	<div class="header-left">
		<h1>Admin Page</h1>
	</div>
	<div class="header-right">
		<ul class="header-rlist">
			<li class="">${alogin }</li>
			<li class=""><a href="/admin">메인으로</a></li>
		</ul>
	</div>
</div>
<hr>
<div class="admin-nav">
	<ul>
		<li><a href="/admin/order">주문관리</a></li>
		<li><a href="/admin/member">회원관리</a></li>
		<li><a href="/admin/seller">판매자관리</a></li>
		<li><a href="/admin/faq">FAQ관리</a></li>
	</ul>
</div>
<hr>