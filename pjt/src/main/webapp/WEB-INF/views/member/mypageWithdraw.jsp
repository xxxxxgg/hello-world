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
		<h1 id="table-title">회원탈퇴</h1>
		<hr style="border: solid 1px #e3edf2;">
		<div id="mypage-title">
			<div id="mypage-sub-title"><a href="/member/mypageEdit">회원정보수정</a></div>
			<div id="mypage-sub-title"><a href="/order/mypageOrderList">주문내역</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageWithdraw">회원탈퇴</a></div>
		</div>
		
		<form id ="registerform" method="post">
			<table>
			<caption>회원탈퇴 전 유의사항에 동의해주세요.</caption>
				<tr>
					<td colspan = "2">				
						<textarea cols="90" rows="10" readonly="readonly">더빌리지 아이디를 탈퇴하시면 서비스 부정 이용 방지를 위하여 더빌리지 회원정책에 따라 일정 기간 동안 회원 재 가입이 불가합니다.

더빌리지 탈퇴 시, 더빌리지에서 사용하시던 포인트 및 쿠폰 등은 복원할 수 없습니다.

더빌리지에서 진행중인 주문 또는 이용중인 서비스가 있을 경우 탈퇴가 불가합니다.

탈퇴 즉시 개인정보가 삭제되면, 어떠한 방법으로도 복원할 수 없습니다. (전자상거래 서비스 등의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 보호됩니다.)

						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan = "2" class=right-align>
						<input type="checkbox"  id="agree-checkbox" >약관에 동의	
					</td>
				</tr>
				<tr>
					<td id="title">아이디</td>
					<td>${login.id}</td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td> <input type="password" name="password" id="memberpassword"> </td>
				</tr>
			</table>
			<div id="submit-button"> 
				<button type="submit" id="submit" onclick="submitBtn_click(event);">탈퇴하기</button>
			</div>
		</form>
	</div>
</body>
	<script>
		function submitBtn_click(e){
			if ($("#agree-checkbox").prop("checked") == false) {
				alert("약관에 동의해 주시기 바랍니다.");
				e.preventDefault();
			}
			else if ($("#memberpassword").val().length < 1) {
				alert("비밀번호를 작성해 주세요.");
				e.preventDefault();
			} 
			else if ($("#memberpassword").val().equal(login.mail)) {
				alert("비밀번호가 틀립니다.");
				e.preventDefault();
			} 
			
		}
	</script>
</html>