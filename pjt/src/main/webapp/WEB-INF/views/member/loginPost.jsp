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
	
	<script type="text/javascript">
		self.location = "/member/mypage";
	</script>	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>