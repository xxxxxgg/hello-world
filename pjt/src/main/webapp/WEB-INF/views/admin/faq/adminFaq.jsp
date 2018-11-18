<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../adminHeader.jsp"></jsp:include>

<div class="admin-body">

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
<c:forEach items="${faqList}" var="faqVO">
	<div class="divTableRow">
		<div class="divTableCell"><a href='/admin/order/detail${pageMaker.makeQuery(pageMaker.pcr.pageNum) }&no=${faqVO.no}'>${faqVO.no}</a></div>
		<div class="divTableCell">${faqVO.title}</div>
		<div class="divTableCell">${faqVO.content}</div>
		<div class="divTableCell"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${faqVO.orderdate}" /></div>
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

<div class="admin-footer">footer</div>
<jsp:include page="../adminFooter.jsp"></jsp:include>