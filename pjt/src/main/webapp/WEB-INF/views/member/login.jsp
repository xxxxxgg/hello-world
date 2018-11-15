<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/login.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<form action="/member/loginPost" method="post">
		<div id="login-form">
			<h1 id="table-title">로그인</h1>
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" id="inputid"/></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="password" id="inputpassword"/></td>
				</tr>
			</table>
			<div id="button-set">
				<div id="submit-button" onclick="submitBtn_click(event);"> 
					<button type="submit" >로그인</button>								
				</div>
				<div id="register-button"> 
					<button type="button" id="submit" ><a href="/member/register" style="color:white;" id="gotohome">회원가입</a></button>
				</div>
			</div>
				
		</div>
	</form>
	<script>
		function submitBtn_click(e){
			if ($("#inputid").val().length < 1) {
				alert("아이디를 입력해주세요.");	
				e.preventDefault();
			} else if ($("#inputpassword").val().length < 1) {
				alert("비밀번호를 입력해주세요.");	
				e.preventDefault();
			} 
		}
	</script>
</body>
</html>