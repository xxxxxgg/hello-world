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
			<div id="mypage-sub-title"><a href="/member/mypageTicket">이용권</a></div>			
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
				<c:forEach items="${orderList2}" var="orderList2">
				<tr>
					<td class="gubun">${orderList2.order_id}</td>
					<td>${orderList2.product_name}</td>
					<td><fmt:formatNumber value="${orderList2.price}" pattern="###,###,###"/></td>
					<td>${orderList2.rental_type}</td>
					<td><fmt:formatDate value="${orderList2.startdate}" type="date" dateStyle="medium"/></td>
					<td><fmt:formatDate value="${orderList2.enddate}" type="date" dateStyle="medium"/></td>
					<td class="total"><fmt:formatNumber value="${orderList2.total_price}" pattern="###,###,###"/></td>
					<td class="state">${orderList2.state}</td>
					<td class="orderdate"><fmt:formatDate value="${orderList2.orderdate}" type="date" dateStyle="medium"/></td>
				</tr>
				</c:forEach>			
			</table>
		</div>
	<script language="javascript">
	
	function rowspan(item) {
		var row = $("#tableTest tr:last");
		var cursorObj = row.children(item);
		var value = $(cursorObj).html();
		  
		var groupCount = 1;
		do {
			if ((value == row.prev().children(item).html())) {
				if (row.children().first().html() == row.prev().children().first().html()) {
					cursorObj.remove();
					groupCount++;
				} else {
					value = row.prev().children(item).html();
					cursorObj.attr("rowspan", groupCount );
					groupCount = 1;
				}
			} else {
				value = row.prev().children(item).html();
				cursorObj.attr("rowspan", groupCount );
				groupCount = 1;
			}
			
			row = row.prev();
			cursorObj = row.children(item);
		} while(row.length !=0 );
	}
	$(function(){
		//주문상태
		rowspan('.state');
		rowspan('.total');
		rowspan('.orderdate');
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
	
	
	
	
	
	</script>	
	<jsp:include page="../member/footer.jsp"></jsp:include>
</body>
</html>