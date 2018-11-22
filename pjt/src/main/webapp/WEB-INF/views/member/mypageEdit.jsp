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
		<h1 id="table-title">회원정보수정</h1>
		<hr style="border: solid 1px #e3edf2;">
		<div id="mypage-title">
			<div id="mypage-sub-title"><a href="/member/mypageEdit">회원정보수정</a></div>
			<div id="mypage-sub-title"><a href="/order/mypageOrderList">주문내역</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageWithdraw">회원탈퇴</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageTicket">이용권</a></div>
		</div>
		
		<form id ="registerform" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td>${login.id}</td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td> <input type="password" name="password" id="memberpassword" value="${login.password}"> </td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td> <input type="password" name="password2" id="memberpassword2" value="${login.password}"> </td>
				</tr>
				<tr>
					<td id="title">이름</td>
					<td> <input type="text" name="name" id="membername" value="${login.name}"> </td>
				</tr>
				<tr>
					<td id="title">성별</td>
					<td>
						<c:if test = "${login.gender == 'F'}">
							<input type="radio" name="gender" class="membergender1" value="M">남
					 		<input type="radio" name="gender" class="membergender2" value="F" checked = "checked">여
						</c:if>
						<c:if test = "${login.gender == 'M'}">
							<input type="radio" name="gender" class="membergender1" value="M" checked = "checked">남
					 		<input type="radio" name="gender" class="membergender2" value="F">여
						</c:if>
					</td>
				</tr>
				<tr>
					<td id="title">메일</td>
					<td> <input type="email" name="mail" id="memberemail" value="${login.mail}"> </td>
				</tr>
				<tr>
					<td id="title">전화번호</td>
					<td> <input type="text" name="phone" id="memberphone" maxlength="11" placeholder="ex)01012345678" size="20" value="${login.phone}"> </td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td> <input type="text" name="address" id="memberaddress" value="${login.address}"> </td>
				</tr>
			</table>
			<div id="submit-button"> 
				<button type="submit" id="submit" onclick="submitBtn_click(event);">수정하기</button>
			</div>
		</form>
	</div>
	<script>
		function submitBtn_click(e){
			if ($("#memberpassword").val().length < 1) {
				alert("비밀번호를 작성해 주세요.");
				e.preventDefault();
			} 
			else if ($("#memberpassword2").val().length < 1) {
				alert("비밀번호 확인을 작성해 주세요.");
				e.preventDefault();
			}
			else if ($("#memberpassword").val() != $("#memberpassword2").val()) {
				alert("비밀번호가 다릅니다.");
				e.preventDefault();
			}
			else if ($("#membername").val().length < 1) {
				alert("이름을 작성해 주세요.");	
				e.preventDefault();
			} 
			else if (($(".membergender1").prop("checked") == false) && ($(".membergender2").prop("checked") == false)) {
				alert("성별을 선택해 주세요.");	
				e.preventDefault();
			}  
			else if ($("#memberemail").val().length < 1) {
				alert("이메일을 작성해 주세요.");	
				e.preventDefault();
			} 
			else if ($("#memberphone").val().length < 1) {
				alert("전화번호를 작성해 주세요.");	
				e.preventDefault();
			} 
			else if ($("#memberaddress").val().length < 1) {
				alert("주소를 작성해 주세요.");	
				e.preventDefault();
			} 
		}
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>