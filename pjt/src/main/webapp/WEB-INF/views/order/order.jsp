<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>주문하기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/order.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<jsp:include page="../member/header.jsp"></jsp:include>

	<div id="register-form">
	<form id ="payForm" method="post">
		<h1 id="table-title">주문서</h1>
		<hr style="border: solid 1px #e3edf2;">
		<br>
		
		<h4 id="table-sub">주문자 정보</h4>
		<hr style="border: solid 1px #e3edf2;">
		<dev id="table_dev">
			<table>
				<tr>
					<td id="title" class="buyer">아이디</td>
					<td>   ${login.name}</td>
	
					<td id="title" class="buyer">전화번호</td>
					<td>   ${login.phone}</td>
	
					<td id="title" class="buyer">이메일</td>
					<td>   ${login.mail}</td>
				</tr>
			</table>
		</dev>
		
		<h4 id="table-sub">상품 정보</h4>
		<hr style="border: solid 1px #e3edf2;">
			<table id="tableTest">
				<tr>
					<td id="title"></td>
					<td id="title">주문상품</td>
					<td id="title">수량</td>
					<td id="title">기간</td>
					<td id="title">가격</td>
					<td id="title">시작일</td>
					<td id="title">만료일</td>
				</tr>		
				<c:forEach items="${cartTOorder}" var="cartTOorder">
				<tr>
					<td><a href='/product/detail?product_id=${cartTOorder.product_id}'><img src="/resources/img/product/${cartTOorder.mainimg}" width="120px" height = "120px"></a></td>
					<td>${cartTOorder.product_name}</td>
					<td>${cartTOorder.quantity}</td>
					<td>${cartTOorder.rental_type}</td>
					<td><fmt:formatNumber value="${cartTOorder.price}" pattern="###,###,###"/>원</td>
					<c:set var="now" value="<%=new Date()%>" />
					<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
					<c:if test = "${cartTOorder.rental_type eq'1주'}">
						<td><fmt:formatDate value="${week}" pattern="yyyy.MM.dd" /></td>
					</c:if>
					<c:if test = "${cartTOorder.rental_type ne'1주'}">
						<td><fmt:formatDate value="${mon}" pattern="yyyy.MM.dd" /></td>
					</c:if>
				</tr>
				</c:forEach>			
			</table>

		
		<h4 id="table-sub">배송지 정보</h4>
		<hr style="border: solid 1px #e3edf2;">
		<table id="tableTest">
			<tr>
				<td class="delivery">수령인</td>
				<td><input type="text" name="name" id="deliveryname"></td>
			</tr>	
			
			<tr>
				<td class="delivery">연락처</td>
				<td><input type="text" name="name" id="deliveryphone"></td>
			</tr>	
			
			<tr>
				<td class="delivery">주소</td>
				<td><input type="text" name="name" size="80" id="deliveryaddress"></td>
			</tr>	
			
			<tr>
				<td class="delivery">배송메세지</td>
				<td><input type="text" name="name" size="80" id="deliverymsg"></td>
			</tr>			
		</table>	
		
		<h4 id="table-sub">결제 금액</h4>
		<hr style="border: solid 1px #e3edf2;">
		<table id="tableTest">
			<tr>
				<td class="delivery">결제금액</td>
				<td>10000원</td>
			</tr>		
		</table>
		
		<h4 id="table-sub">결제 수단</h4>
		<hr style="border: solid 1px #e3edf2;">
		<table id="tableTest">
			<tr>
				<td class="payment1">
				 	<input type="radio" name="payment" value="cart" id="payment2" class="card"> 카드 결제
				</td>
				<td class="payment1">
				 	<input type="radio" name="payment" value="ticket" id="payment2" class="ticket"> 이용권 결제
				</td>
			</tr>		
			
		</table>
		
		<div id="submit-button"> 
			<button type="submit" id="submit" onclick="submitBtn_click(event);" href="../order/success" ><a style="color:white;" id="gotohome" >결제하기</a></button>
		</div>
	</form>
	</div>

	<jsp:include page="../member/footer.jsp"></jsp:include>
	<script>
		function submitBtn_click(e){
			if ($("#deliveryname").val().length < 1) {
				alert("수령인을 입력해 주세요.");	
				e.preventDefault();
			} 
			else if ($("#deliveryphone").val().length < 1) {
				alert("연락처를 입력해 주세요.");	
				e.preventDefault();
			} 
			else if ($("#deliveryaddress").val().length < 1) {
				alert("배송지를 입력해 주세요.");	
				e.preventDefault();
			} 
			else if (($(".card").prop("checked") == false) && ($(".ticket").prop("checked") == false)) {
				alert("결제 수단을 선택해 주세요.");	
				e.preventDefault();
			}  
					
			
		}
	</script>
</body>
</html>