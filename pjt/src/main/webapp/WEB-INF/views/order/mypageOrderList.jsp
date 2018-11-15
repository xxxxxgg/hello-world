<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<jsp:include page="../member/header.jsp"></jsp:include>
	<div id="register-form">
		<h1 id="table-title">주문내역</h1>
		<hr style="border: solid 1px #e3edf2;">
		<div id="mypage-title">
			<div id="mypage-sub-title"><a href="/member/mypageEdit">회원정보수정</a></div>
			<div id="mypage-sub-title"><a href="/order/mypageOrderList">주문내역</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageWithdraw">회원탈퇴</a></div>
		</div>
			<table id="tableTest">
				<tr>
					<td id="title">주문번호</th>
					<td id="title">주문상품</th>
					<td id="title">주문금액</th>
					<td id="title">대여유형</th>
					<td id="title">시작일</th>
					<td id="title">만료일</th>
					<td id="title">주문총액</th>
					<td id="title">주문상태</th>
					<td id="title">주문일자</th>
				</tr>		
				<c:forEach items="${orderList}" var="orderList">
				<tr>
					<td class="gubun">${orderList.order_id}</td>
					<td>${orderList.product_name}</td>
					<td><fmt:formatNumber value="${orderList.price}" pattern="###,###,###"/></td>
					<td>${orderList.rental_type}</td>
					<td><fmt:formatDate value="${orderList.startdate}" type="date" dateStyle="medium"/></td>
					<td><fmt:formatDate value="${orderList.enddate}" type="date" dateStyle="medium"/></td>
					<td class="total"><fmt:formatNumber value="${orderList.total_price}" pattern="###,###,###"/></td>
					<td class="state">${orderList.state}</td>
					<td><fmt:formatDate value="${orderList.orderdate}" type="date" dateStyle="medium"/></td>
				</tr>
				</c:forEach>			
			</table>
		</div>
	<script language="javascript">
	
	//주문상태
	$(function(){
		var row = $("#tableTest tr:last");
		var cursorObj = row.children('.state');
		var value = $(cursorObj).html();
		var groupCount = 1;
		  
		do {
			if ((value == row.prev().children('.state').html())) {
				if (row.children().first().html() == row.prev().children().first().html()) {
					cursorObj.remove();
					groupCount++;
				}
			}
			else {
				value = row.prev().children('.state').html();
				cursorObj.attr("rowspan", groupCount );
				groupCount = 1;
			}
			row = row.prev();
			cursorObj = row.children('.state');
		} while(row.length !=0 );
	});
	
	//주문번호
	$(function(){
		var row = $("#tableTest tr:last");
		var cursorObj = $(row.children().first());
		var value = $(cursorObj).html();
		var groupCount = 1;
		  
		do {
			if (value == row.prev().children().first().html()) {
				cursorObj.remove();
				groupCount++;
			}
			else {
				value = row.prev().children().first().html();
				cursorObj.attr("rowspan", groupCount );
				groupCount = 1;
			}
			row = row.prev();
			cursorObj = row.children().first();
		} while(row.length !=0 );
	});
	
	//주문일자
	$(function(){
		var row = $("#tableTest tr:last");
		var cursorObj = row.children().last();
		var value = $(cursorObj).html();
		var groupCount = 1;
		  
		do {
			if (value == row.prev().children().last().html()) {
				cursorObj.remove();
				groupCount++;
			}
			else {
				value = row.prev().children().last().html();
				cursorObj.attr("rowspan", groupCount );
				groupCount = 1;
			}
			row = row.prev();
			cursorObj = row.children().last();
		} while(row.length !=0 );
	});
	
	//주문총액
	$(function(){
		var row = $("#tableTest tr:last");
		var cursorObj = row.children('.total');
		var value = $(cursorObj).html();
		var groupCount = 1;
		  
		do {
			if (value == row.prev().children('.total').html()) {
				cursorObj.remove();
				groupCount++;
			}
			else {
				value = row.prev().children('.total').html();
				cursorObj.attr("rowspan", groupCount );
				groupCount = 1;
			}
			row = row.prev();
			cursorObj = row.children('.total');
		} while(row.length !=0 );
	});
	
	
	</script>	
</body>
</html>