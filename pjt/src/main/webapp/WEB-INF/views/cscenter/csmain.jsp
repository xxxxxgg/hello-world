<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>The Village</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/cscenter.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link href="/resources/css/cart.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
<jsp:include page="../member/header.jsp"></jsp:include>
<br><br><br>

<div class="wrapper">
	<div class="box1">
		<div class="tab">
			<button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">자주 묻는 질문</button>
			<button class="tablinks" onclick="openCity(event, 'paris')">1:1 문의 등록</button>
			<button class="tablinks" onclick="openCity(event, 'new york')">공지사항</button>
			<button class="tablinks" onclick="openCity(event, 'new york')">매장안내</button>			
		</div>
		<section class="csmain">
			<div class="subtitle">
				<div class="title">
					<h3 class="h">고객센터</h3>	
				</div>
				<div class="csmainlocation">
					<span>메인</span>
					<em>></em>
					<span>고객센터</span>
				</div>
			</div>
			<hr style="margin:30px 0px 30px 0px;">
			<div class="cscontent">
				<div class="schbox" style="margin:30px 0px 30px 0px;">
					q
				</div>
				<div class="faqlist">
					<div>자주 묻는 질문</div>
					<ul class="faqul" style="border-top:5px solid red;padding-top:30px;">
						<c:forEach items="${faqlist}" var="faq">
						<li>
							<div class="hbox">
								<span class="hindex">1</span>
								${faq.title}
								<a class="btnTog" href="javascript:;">열기</a>
							</div>
							<div class="cbox" style="display:none;">
								<p>${faq.content}</p>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>
	</div>
</div>

<script type="text/javascript">

</script>
<jsp:include page="../member/footer.jsp"></jsp:include>
</body>

</html>
