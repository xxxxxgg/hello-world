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
    
    <link href="/resources/css/mypage.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="register-form">
		<h1 id="table-title">이용권</h1>
		<hr style="border: solid 1px #e3edf2;">
		<div id="mypage-title">
			<div id="mypage-sub-title"><a href="/member/mypageEdit">회원정보수정</a></div>
			<div id="mypage-sub-title"><a href="/order/mypageOrderList">주문내역</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageWithdraw">회원탈퇴</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageTicket">이용권</a></div>
		</div>
		
		<form id ="registerform" method="post">
			<br><br><br>
			<h3 id="table-title">나의 이용권 정보</h3>
			<table id="ticket-info">
				<c:forEach items="${ticketList}" var="ticketList">
					<tr><td>이용권 종류 : ${ticketList.rental_type}  /  잔여 이용 횟수 : ${ticketList.count}회</td></tr>
				</c:forEach>	
			</table>
			
			<br><br><br>
			<h3 id="table-title">이용권 구매하기</h3>
			<table id="ticket-table">
				<tr>
					<td class="chk"><input type="radio" name="ticket_type" value="gold" id="gold"></td>
					<td>
						<div class="ticket">
							<h1 id="gold" > GOLD </h1>
							<hr style="border: dashed 2px #cecece;">
							<h3>\80,000 (월 5회 이용)</h3>
						</div>
					</td>
				</tr>
				<tr>
					<td class="chk"><input type="radio" name="ticket_type" value="silver" id="silver"></td>					
					<td>
						<div class="ticket">
							<h1 id="silver"> SILVER </h1>
							<hr style="border: dashed 2px #cecece;">
							<h3>\50,000 (월 3회 이용)</h3>
						</div>
					</td>
				</tr>
				<tr>
					<td class="chk"><input type="radio" name="ticket_type" value="bronze" id="bronze"></td>					
					<td>
						<div class="ticket">
							<h1 id="bronze"> BRONZE </h1>
							<hr style="border: dashed 2px #cecece;">
							<h3>\18,000 (월 1회 이용)</h3>
						</div>
					</td>
				</tr>
			</table>
			<div id="submit-button"> 
				<button type="submit" id="submit" onclick="submitBtn_click(event);">구매하기</button>
			</div>
		</form>
	</div>
	<script>
		function submitBtn_click(e){
			if (($("#gold").prop("checked") == false) && ($("#silver").prop("checked") == false) && ($("#bronze").prop("checked") == false)) {
				alert("구매할 이용권을 선택해 주세요.");	
				e.preventDefault();
			}  else {
				alert("이용권 구매가 완료되었습니다.");
			}
		}
		
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>