<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>장바구니</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/cart.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<jsp:include page="../member/header.jsp"></jsp:include>
	<div id="register-form">
		<h1 id="table-title">장바구니</h1>
		<hr style="border: solid 1px #e3edf2;">
		<button type="button" id="select_delete" ><a href="" style="color:white;" id="gotohome">선택삭제</a></button>
		
			<table id="tableTest">
				<tr>
					<td id="title"><input type="checkbox" id="chk_all">전체선택</th>
					<td id="title">상품정보</th>
					<td id="title">수량</th>
					<td id="title">기간</th>
					<td id="title">주문액</th>
				</tr>		
				<c:forEach items="${orderList}" var="orderList">
				<tr>
					<td><input type="checkbox" class="chk" name="chk"></td>
					<td>${orderList.product_name}</td>
					<td>1</td>
					<td>1개월</td>
					<td>10000</td>
				</tr>
				</c:forEach>			
			</table>
			
			<div id="submit-button" onclick="submitBtn_click(event);"> 
				<button type="submit" id="order_btn">주문하기</button>								
			</div>
	</div>
	
	

	<script language="javascript">	
	var chk_cnt = 0;
	$("#chk_all").click(function() {
		if($("#chk_all").is(":checked")){
			$(".chk").prop("checked", true);
			chk_cnt = $("input[name='chk']:checked").length;
		} else {
			$(".chk").prop("checked", false);
		}
	});
	
	$(".chk").click(function(){
		if($("input[name='chk']:checked").length == chk_cnt) {
			$("#chk_all").prop("checked", true);
		} else {
			$("#chk_all").prop("checked",false);
		}
	});
	//주문번호
/* 	$(function(){
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
	}); */
	</script>	
</body>
</html>