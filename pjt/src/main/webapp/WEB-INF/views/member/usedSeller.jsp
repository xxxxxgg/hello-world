<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>제휴업체</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/mypage.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="register-form">
		<h1 id="table-title">제휴 중고업체</h1>
		<h3 id="table-title">렌탈을 원하는 상품이 없다면? THE VILLAGE의 제휴업체를 이용해보세요!</h3>
		<hr style="border: solid 1px #e3edf2;">
		
		<div id="mypage-title">
			<div id="mypage-sub-title"><a href="/member/usedSeller">제휴업체 목록</a></div>
			<div id="mypage-sub-title"><a href="/member/usedSellerRegister">제휴업체 신청하기</a></div>
		</div>
		<br><br><br>
		<c:forEach items="${sellerList}" var="sellerList">
		<table id="seller-table">
			<tr>
				<th class="seller_name">${sellerList.seller_name}</th>
			</tr>
			<tr>
				<td>${sellerList.seller_phone} / ${sellerList.seller_address} / ${sellerList.seller_msg} </td>
			</tr> 
		</table>
		</c:forEach>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>