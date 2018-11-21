<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="../adminHeader.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchBtn").on("click", function(event) {
			self.location = "listSearch"
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
</script>


<div class="admin-body">

<div class="divTable blueTable" style="margin-top:10px;">
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
		<div class="divTableRow">
			<div class="divTableCell">${orderinfo.no}</div>
			<div class="divTableCell">
				<select id="state">
					<option value="발송대기" <c:if test="${orderinfo.state == '발송대기'}">selected</c:if>>발송대기</option>
					<option value="발송완료" <c:if test="${orderinfo.state == '발송완료'}">selected</c:if>>발송완료</option>
					<option value="배송중" <c:if test="${orderinfo.state == '배송중'}">selected</c:if>>배송중</option>
					<option value="배송완료" <c:if test="${orderinfo.state == '배송완료'}">selected</c:if>>배송완료</option>
				</select>
				<button id="modifyState" ></button>
			</div>
			<div class="divTableCell">${orderinfo.mno}</div>
			<div class="divTableCell"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${orderinfo.orderdate}" /></div>
			<div class="divTableCell"><span class="badge bg-red">${orderinfo.comment}</span></div>
		<div class="divTableCell">${orderinfo.totalprice }</div>
		</div>
	</div>
</div>

<h2>주문상품</h2>
<div class="divTable blueTable">
	<div class="divTableHeading">
		<div class="divTableRow">
			<div class="divTableHead">번호</div>
			<div class="divTableHead">주문번호</div>
			<div class="divTableHead">상품번호</div>
			<div class="divTableHead">상품개수</div>
			<div class="divTableHead">가격합계</div>
		</div>
	</div>
	<div class="divTableBody">
<c:forEach items="${ordereditemList}" var="orderedItemVO">
		<div class="divTableRow">
			<div class="divTableCell">${orderedItemVO.no}</div>
			<div class="divTableCell">${orderedItemVO.order_no }</div>
			<div class="divTableCell">${orderedItemVO.item_no}</div>
			<div class="divTableCell"><span class="badge bg-red">${orderedItemVO.count}</span></div>
			<div class="divTableCell">${orderedItemVO.totalprice }</div>
		</div>
</c:forEach>
	</div>
</div>

<br>

<h2>주문자 정보</h2>
<div class="divTable blueTable">
	<div class="divTableHeading">
		<div class="divTableRow">
			<div class="divTableHead">주문자 번호</div>
			<div class="divTableHead">주문자 아이디</div>
			<div class="divTableHead">주문자 이름</div>
			<div class="divTableHead">주문자 가입일</div>
		</div>
	</div>
	<div class="divTableBody">
		<div class="divTableRow">
			<div class="divTableCell">${memberinfo.no}</div>
			<div class="divTableCell">${memberinfo.id }</div>
			<div class="divTableCell">${memberinfo.name}</div>
			<div class="divTableCell"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${memberinfo.regdate}" /></div>
		</div>
	</div>
</div>

<br>

<h2>배송정보`~</h2>
<h2>결제정보</h2>


</div>
<hr>
<div class="admin-footer">footer</div>

<jsp:include page="../adminFooter.jsp"></jsp:include>