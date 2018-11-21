<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>The Village main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="/resources/css/success.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="register-form">
		<form method="post">
			<h1 id="table-title">회원탈퇴가 완료되었습니다.</h1>
			<div id="submit-button"> 
				<button type="button" id="submit" ><a href="../" style="color:white;" id="gotohome">처음으로</a></button>
				
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
