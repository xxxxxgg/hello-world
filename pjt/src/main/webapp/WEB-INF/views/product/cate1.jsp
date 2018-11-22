<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>카테고리1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/product.css" rel="stylesheet" type="text/css">  
</head>
<body>
	<jsp:include page="../member/header.jsp"></jsp:include>
	<div id="register-form">
		<h1 id="table-title">유아동</h1>
		<hr style="border: solid 1px #e3edf2;">
		<table>
			<tr>
				<td id="title">상품명</th>
				<td id="title">카테고리</th>
				<td id="title">1주가격</th>
				<td id="title">1개월가격</th>
				<td id="title">새상품가격</th>
				<td id="title">메인사진</th>
			</tr>
			<c:forEach items="${list}" var="productVO">
				<tr>
					<td>${productVO.product_name}</td>
					<td>${productVO.category}</td>
					<td>${productVO.priceforweek}</td>
					<td>${productVO.priceformonth}</td>
					<td>${productVO.pricefornew}</td>
					<td><a href='/product/detail?product_id=${productVO.product_id}'><img src="/resources/img/product/${productVO.mainimg}" width="120px" height = "120px"></a></td>
				</tr>
			</c:forEach>	
						
		</table>
	</div>
	<jsp:include page="../member/footer.jsp"></jsp:include>
</body>
</html>