<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Village Admin Order Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="/resources/css/adminstyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
<hr>
<div class="admin-header">
	<div class="header-left">
		<h1>Admin Order</h1>
	</div>
	<div class="header-right">
		<ul class="header-rlist">
			<li>${alogin }</li>
			<li><a href="/admin">메인으로</a></li>
		</ul>
	</div>
</div>
<hr>
<div class="admin-nav">
	<ul>
		<li><a href="/admin/order">주문관리</a></li>
		<li><a href="/admin/payment">결제관리</a></li>
		<li><a href="/admin/member">회원관리</a></li>
		<li><a href="/admin/sell">판매관리</a></li>
	</ul>
</div>

<div class="admin-body">


<div class="box-body" style="margin:10px;">
	<select name="searchType">
		<option value="NONE" <c:out value="${pcr.searchType == null?'selected':'' }"/>>NONE</option>
		<option value="ORDER_NO" <c:out value="${pcr.searchType eq 'ORDER_NO'?'selected':'' }"/>>ORDER_NO</option>
		<option value="CONTENT" <c:out value="${pcr.searchType eq 'CONTENT'?'selected':'' }"/>>Content</option>
		<option value="WIRTER" <c:out value="${pcr.searchType eq 'WIRTER'?'selected':'' }"/>>Writer</option>
		<option value="TITLE_CONTENT" <c:out value="${pcr.searchType eq 'TITLE_CONTENT'?'selected':'' }"/>>Title OR Content</option>
		<option value="CONTENT_WRITER" <c:out value="${pcr.searchType eq 'CONTENT_WRITER'?'selected':'' }"/>>Content OR Writer</option>
		<option value="TITLE_CONTENT_WRITER" <c:out value="${pcr.searchType eq 'TITLE_CONTENT_WRITER'?'selected':'' }"/>>Title OR Content OR Writer</option>
	</select>
	
	<input type="text" name="keyword" id="keywordInput" value="${pcr.keyword }">
	<button id="searchBtn">Search</button>
	<button id="newBtn">New Board</button>
</div>

<div class="divTable blueTable">
	<div class="divTableHeading">
		<div class="divTableRow">
			<div class="divTableHead">주문번호</div>
			<div class="divTableHead">주문상태</div>
			<div class="divTableHead">주문자번호</div>
			<div class="divTableHead">주문날짜</div>
			<div class="divTableHead">주문요구사항</div>
			<div class="divTableHead">가격합계</div>
		</div>
	</div>
	<div class="divTableBody">
<c:forEach items="${orderList}" var="orderVO">
	<div class="divTableRow">
		<div class="divTableCell"><a href="/admin/order/detail?ono=${orderVO.no}">${orderVO.no}</a></div>
		<%-- <div class="divTableCell"><a href='/board/read${pageMaker.makeQuery(pageMaker.pcr.pageNum) }&no=${orderVO.no}'>${orderVO.state}</a></div> --%>
		<div class="divTableCell">${orderVO.state }</div>
		<div class="divTableCell">${orderVO.mno}</div>
		<div class="divTableCell"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${orderVO.orderdate}" /></div>
		<div class="divTableCell"><span class="badge bg-red">${orderVO.comment}</span></div>
		<div class="divTableCell">${orderVO.totalprice }</div>
	</div>
</c:forEach>
	</div>
</div>


<div class="blueTable outerTableFooter">
<div class="tableFootStyle">
<div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
</div>
</div>

<div class="blueTable outerTableFooter">
<div class="tableFootStyle">
<div class="links">
		<c:if test="${pageMaker.prev }">
			<a href="order${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	
				<%-- <c:out value="${pageMaker.pcr.pageNum == idx?'class =active':''}"/> --%>
				<a href="order${pageMaker.makeSearch(idx) }" <c:out value="${pageMaker.pcr.pageNum == idx?'class =active':''}"/>>${idx }</a>

		</c:forEach>

		<c:if test="${pageMaker.next }">
			<a href="order${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a>
		</c:if>
</div>
</div>
</div>


</div>
<hr>
<div class="admin-footer">footer</div>
<script type="text/javascript">
//<![CDATA[
	$(document).ready(function() {
		$("#searchBtn").on("click", function(event) {
			self.location = "order"
				+ "${pageMaker.makeQuery(1)}"
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($("#keywordInput").val());
		});

		$("#newBtn").on("click", function() {
			self.location = "registerPage";
		}
		);}
	);
//]]>
</script>
</body>
</html>