<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/register.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="register-form">
		<form id ="registerform" method="post">
			
			<h1 id="table-title">회원가입</h1>
			<table>
				<tr>
					<td colspan = "2">				
						<textarea cols="90" rows="15" readonly="readonly">제1조(목적) 이 약관은 더빌리지(전자상거래 사업자)이 운영하는 더빌리지 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.<br> 
② “몰”과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.

제2조(정의)
① “몰”이란 사업자가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ ‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관등의 명시와 설명 및 개정) 
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다
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
										url : "checkUserID",
										data : userData,
										dataType : "json",
										success : function(result) {
											if (result == 0) {
												alert("사용가능한 아이디입니다. ");
												$("#submit").prop("disabled", false);
												ckId= 1;
											} else if (result == 1) {
												$("#submit").prop("disabled", true);
												alert("이미 존재하는 아이디입니다. \n 다른 아이디를 사용해주세요.");
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
					<td id="title">비밀번호</td>
					<td> <input type="password" name="password" id="memberpassword"> </td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td> <input type="password" name="password2" id="memberpassword2"> </td>
				</tr>
				<tr>
					<td id="title">이름</td>
					<td> <input type="text" name="name" id="membername"> </td>
				</tr>
				<tr>
					<td id="title">성별</td>
					<td> 
						<input type="radio" name="gender" class="membergender1" value="M">남
					 	<input type="radio" name="gender" class="membergender2" value="F">여
					 </td>
				</tr>
				<tr>
					<td id="title">메일</td>
					<td> <input type="email" name="mail" id="memberemail"> </td>
				</tr>
				<tr>
					<td id="title">전화번호</td>
					<td> <input type="text" name="phone" id="memberphone" maxlength="11" placeholder="ex)01012345678" size="20"> </td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td> <input type="text" name="address" id="memberaddress"> </td>
				</tr>
			</table>
			<div id="submit-button"> 
				<button type="submit" id="submit" onclick="submitBtn_click(event);">가입하기</button>
			</div>
		</form>
	</div>
	
	<script>
		function submitBtn_click(e){
			if ($("#agree-checkbox").prop("checked") == false) {
				alert("약관에 동의해 주시기 바랍니다.");
				e.preventDefault();
			}
			else if (ckId == 0) {
				alert("아이디 중복확인을 해주세요.");	
				e.preventDefault();
			}
			else if ($("#memberpassword").val().length < 1) {
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
	
</body>
</html>