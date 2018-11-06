<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>마이페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/mypageOrderList.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="register-form">
		<h1 id="table-title">주문내역</h1>
		<hr style="border: solid 1px #e3edf2;">
		<div id="mypage-title">
			<div id="mypage-sub-title"><a href="/member/mypageEdit">회원정보수정</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageOrderList">주문내역</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageWithdraw">회원탈퇴</a></div>
		</div>
		 

			<table>
				<tr>
					<td id="title">주문번호</th>
					<td id="title">주문상품</th>
					<td id="title">주문금액</th>
					<td id="title" >대여유형</th>
					<td id="title">대여기간</th>
					<td id="title">시작일</th>
					<td id="title">만료일</th>
				</tr>
				<tr>
					<td>2018-11-06</td>
					<td>냉장고</td>
					<td>10,000원</td>
					<td>대여</td>
					<td>1개월</td>
					<td>2018-11-06</td>
					<td>2018-12-06</td>
				</tr>
			</table>
		

	</div>
	
</body>
</html>