<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>중고판매관</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/register.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<jsp:include page="../member/header.jsp"></jsp:include>
	<div id="register-form">
		<form id ="registerform" method="post">
			
			<h1 id="table-title">중고판매관</h1>
			<h4 id="table-title">필요하지 않은 물건을 처분하세요!</h4>
			<table>	
		
				<tr>
					<td id="title">제품종류</td>
					<td> <input type="text" name="" id=""> </td>
				</tr>
				<tr>
					<td id="title">모델명</td>
					<td> <input type="text" name="" id=""> </td>
				</tr>
				<tr>
					<td id="title">구입시기</td>
					<td> <input type="text" name="" id=""> </td>
				</tr>
				<tr>
					<td id="title">사용정도</td>
					<td> <input type="text" name="" id=""> </td>
				</tr>
				<tr>
					<td id="title">연락처</td>
					<td> <input type="text" name="" id=""> </td>
				</tr>	
				<tr>
					<td id="title">기타사항</td>
					<td> <input type="text" size="40" name="" id=""> </td>
				</tr>
			</table>
			<div id="submit-button"> 
				<button type="submit" id="submit" onclick="submitBtn_click(event);">매입신청</button>
			</div>
		</form>
	</div>
	
	<script>
		function submitBtn_click(e){
			if ($("#agree-checkbox").prop("checked") == false) {
				alert("약관에 동의해 주시기 바랍니다.");
				e.preventDefault();
			}
		}
	</script>
	<jsp:include page="../member/footer.jsp"></jsp:include>
</body>
</html>