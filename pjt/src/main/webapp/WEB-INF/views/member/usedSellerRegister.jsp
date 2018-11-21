<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>중고업자 신청</title>
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
			
			<h1 id="table-title">업체 정보 등록</h1>
			<h3 id="table-title">THE VILLAGE와 함께해요.</h3>
			
			<table>
				<tr>
					<td id="title">업체명</td>
					<td> 
						<input type="text" name="id" id="memberid">   
						<input type="button" value ="중복확인" id="user_id_checkBtn" onclick="checkBtn_click();">
						<script>
							var ckId = 0;
							function checkBtn_click(){
								var userId = $("#memberid").val();
								var userData = {"id" : userId};
								if(userId.length < 1 ) {
									alert("아이디를 입력해 주세요.");	
								} else {
									$.ajax({
										type : "POST",
										url : "usedSellerCheck",
										data : userData,
										dataType : "json",
										success : function(result) {
											if (result == 0) {
												alert("등록가능한 업체입니다. ");
												$("#submit").prop("disabled", false);
												ckId= 1;
											} else if (result == 1) {
												$("#submit").prop("disabled", true);
												alert("이미 등록된 업체입니다.");
											} else {
												$("#submit").prop("disabled", true);
												alert("에러가 발생했습니다.");
											}
										}
									});
								}
							}
						</script>
					</td>
				</tr>
				
				<tr>
					<td id="title">사업자번호</td>
					<td> <input type="text" name="usedSellerNum" id="usedSellerNum"> </td>
				</tr>
				<tr>
					<td id="title">전화번호</td>
					<td> <input type="text" name="usedSellerPhone" id="usedSellerPhone"> </td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td> <input type="text" name="usedSellerAddress" id="usedSellerAddress" size="50"> </td>
				</tr>
				<tr>
					<td id="title">업체소개</td>
					<td> <input type="text" name="usedSellerMsg" id="usedSellerMsg" size="50"> </td>
				</tr>
				
				
			</table>
			<div id="submit-button"> 
				<button type="submit" id="submit" onclick="submitBtn_click(event);">등록신청</button>
			</div>
		</form>
	</div>
	
	<script>
		function submitBtn_click(e){
			if (ckId == 0) {
				alert("등록된 업체인지 중복확인을 해주세요.");	
				e.preventDefault();
			}
			else if ($("#usedSellerNum").val().length < 1) {
				alert("사업자 번호를 등록해 주세요.");
				e.preventDefault();
			} 
			else if ($("#usedSellerPhone").val().length < 1) {
				alert("전화번호를 등록해 주세요.");
				e.preventDefault();
			}
			else if ($("#usedSellerAddress").val().length < 1) {
				alert("주소를 등록해 주세요.");	
				e.preventDefault();
			} 
			else if ($("#usedSellerMsg").val().length < 1) {
				alert("업체 소개를 작성해 주세요.");	
				e.preventDefault();
			} else {
				alert("업체 등록이 완료되었습니다.");
			}
		}
	</script>
	<jsp:include page="../member/footer.jsp"></jsp:include>
</body>
</html>