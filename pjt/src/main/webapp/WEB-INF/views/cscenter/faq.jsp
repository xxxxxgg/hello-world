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
			<button onclick="faq()">자주 묻는 질문</button>
			<button onclick="ask()">1:1 문의 등록</button>
			<button onclick="notice()">공지사항</button>
			<button onclick="storeguide()">매장안내</button>			
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
					<div class="box-body" style="margin:10px;">
						<!-- <input type="hidden" name="searchType" id="searchTypeInput" value="TITLE"> -->
						검색하기
						<input type="text" name="keyword" id="keywordInput" value="${pcr.keyword }">
						<button id="searchBtn">검색</button>
					</div>
				</div>
				<div class="faqlist" style="margin:30px 0px 30px 0px;">
					<div><a href="#">전체</a> | <a href="#">상품</a> | <a href="#">주문</a> | <a href="#">결제</a></div>
					<ul class="faqul" style="border-top:2px solid;padding-top:30px;">
						<c:forEach items="${faqlist}" var="faq" varStatus="status">
						<li>
							<button class="accordion"><span>${status.count }</span>
								${faq.title}
							</button>
							<div class="panel">
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

<script>
function faq() {
	location.replace("faq");
}
function ask() {
	location.href = "ask";
}
function notice() {
	location.href = "notice";
}
function storeguide() {
	location.href = "strguide";
}

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}

function search() {
	document.getElementById("#searchBtn").onclick;
}

$(document).ready(function() {
	$("#searchBtn").on("click", function(event) {
		self.location = "/cscenter"
			+ "${pageMaker.makeQuery(1)}"
			//+ "&searchType="
			//+ $("#searchType").val()
			+ "&keyword=" + encodeURIComponent($("#keywordInput").val());
	});
	}
);
</script>
<jsp:include page="../member/footer.jsp"></jsp:include>
</body>

</html>
