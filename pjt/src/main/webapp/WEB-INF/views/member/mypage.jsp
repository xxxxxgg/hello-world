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
		<h1 id="table-title">마이페이지</h1>
		<hr style="border: solid 1px #e3edf2;">
		<div id="mypage-title">
			<div id="mypage-sub-title"><a href="/member/mypageEdit">회원정보수정</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageOrderList">주문내역</a></div>
			<div id="mypage-sub-title"><a href="/member/mypageWithdraw">회원탈퇴</a></div>
		</div>
		
		<form id ="registerform" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td>${login.id}</td>
				</tr>
				<tr>
					<td id="title">이름</td>
					<td>${login.name}</td>
				</tr>
				<tr>
					<td id="title">성별</td>
					<td>
						<c:if test = "${login.gender == 'F'}">
							여자
						</c:if>
						<c:if test = "${login.gender == 'M'}">
							남자
						</c:if>
					</td>
				</tr>
				<tr>
					<td id="title">메일</td>
					<td>${login.mail}</td>
				</tr>
				<tr>
					<td id="title">전화번호</td>
					<td>${login.phone}</td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td>${login.address}</td>
				</tr>
			</table>
		</form>
	</div>
	
	
</body>
</html>