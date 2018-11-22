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
		<form id ="cartForm" method="post">
			<button type="submit" id="select_delete" onclick="deleteBtn_click(event);" name="btn" value="delete">선택삭제</button>
			<table id="tableTest">
				<tr>
					<td id="title" width="50px"><input type="checkbox" id="chk_all"></th>
					<td id="title" width="50px">상품명</th>
					<td id="title" width="150px">상품정보</th>
					<td id="title">수량</th>
					<td id="title">기간</th>
					<td id="title">상품가격</th>
				</tr>		
				<c:forEach items="${cartlist}" var="cartlist">
				<tr>
					<td><input type="checkbox" class="chk" name="chk_arr" value="${cartlist.cart_id}"></td>
					<td>${cartlist.product_name}</td>
					<td><a href='/product/detail?product_id=${cartlist.product_id}'><img src="/resources/img/product/${cartlist.mainimg}" width="120px" height = "120px"></td>
					<td>${cartlist.quantity}</td>
					<td>${cartlist.rental_type}</td>
					<td><fmt:formatNumber value="${cartlist.price}" pattern="###,###,###"/>원</td>
				</tr>
				</c:forEach>			
			</table>
			
			<div id="submit-button"> 
				<button type="submit" id="order_btn" name="btn" onclick="submitBtn_click(event);" value="order">주문하기</button>		
			</div>
			</form>
	</div>
	

	<script language="javascript">	
	var chk_cnt = 0;
	$("#chk_all").click(function() { 		//전체선택
		if ($("#chk_all").is(":checked")){
			$(".chk").prop("checked", true);
			chk_cnt = $("input[name='chk_arr']:checked").length;
		} else {
			$(".chk").prop("checked", false);
		}
	});
				
	$(".chk").click(function(){				// 전체선택,해제
		if ($("input[name='chk_arr']:checked").length == chk_cnt) {
			$("#chk_all").prop("checked", true);
		} else {
			$("#chk_all").prop("checked",false);
		}
	});  
	
	function deleteBtn_click(e){
		if ($("input[name='chk_arr']:checked").length == 0) {
			alert("삭제할 항목을 하나이상 체크해주세요.");
			e.preventDefault();
		} 
	}
	
	function submitBtn_click(e){
		if (($("input[name='chk_arr']:checked").length == 0)) {
		alert("주문할 항목을 하나이상 체크해주세요.");
		e.preventDefault();
		}
	}
	
	</script>	
	<jsp:include page="../member/footer.jsp"></jsp:include>
</body>
</html>