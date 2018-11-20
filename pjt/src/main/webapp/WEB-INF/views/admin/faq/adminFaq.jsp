<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../adminHeader.jsp"></jsp:include>

<div class="admin-body">

<!-- Trigger/Open The Modal************ -->
<button id="addBtn" style="margin: 20px 20px 20px 20px">FAQ 글쓰기</button>

<!-- ADD Modal ****************************************************************************** -->
<div id="addModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>FAQ 쓰기</p>
    <div>
    	제목 : <input type="text" name="title" id="faqtitle"><br><br>
    	내용 : <textarea name="content" id="faqcontent" row="10" col="200"></textarea><br><br>
		<button id="faqAddBtn">ADD FAQ</button>
    </div>
  </div>
</div>
<div id="addModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>FAQ 수정</p>
    <div>
    	제목 : <input type="text" name="title" id="faqtitle"><br><br>
    	내용 : <textarea name="content" id="faqcontent" row="10" col="200"></textarea><br><br>
		<button id="faqModifyBtn">Modify FAQ</button>
    </div>
  </div>
</div>

<div class="divTable blueTable">
	<div class="divTableHeading">
		<div class="divTableRow">
			<div class="divTableHead">faq번호</div>
			<div class="divTableHead">faq제목</div>
			<div class="divTableHead">faq내용</div>
			<div class="divTableHead">날짜</div>
		</div>
	</div>
	<div class="divTableBody">
<c:forEach items="${faqlist}" var="faqVO">
	<div class="divTableRow">
		<div class="divTableCell" style="width:60px;">${faqVO.no}</div>
		<div class="divTableCell"><a href="#" onclick="modify();">${faqVO.title}</a></div>
		<div class="divTableCell">${faqVO.content}</div>
		<div class="divTableCell" style="width:110px;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${faqVO.regdate}" /></div>
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
			<a href="faq${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	
				<%-- <c:out value="${pageMaker.pcr.pageNum == idx?'class =active':''}"/> --%>
				<a href="faq${pageMaker.makeSearch(idx) }" <c:out value="${pageMaker.pcr.pageNum == idx?'class =active':''}"/>>${idx }</a>

		</c:forEach>

		<c:if test="${pageMaker.next }">
			<a href="faq${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a>
		</c:if>
</div>
</div>
</div>

</div><!-- admin body -->

<script>
//Get the modal
var modal = document.getElementById('addModal');
var btn = document.getElementById("addBtn");
var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

$("#faqAddBtn").on("click", function() {
	var title = $("#faqtitle").val();
	var content = $("#faqcontent").val();
	
	$.ajax({
		type : 'post',
		url : '/admin/faq/new',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Overrid" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			title : title,
			content : content
		}),
		success : function(result) {
			if(result == 'faq add Success') {
				alert("FAQ 등록 완료");
				location.replace("/admin/faq");
			}
		}
	});
});
$("#faqModifyBtn").on("click", function() {
	var title = $("#faqtitle").val();
	var content = $("#faqcontent").val();
	
	$.ajax({
		type : 'post',
		url : '/admin/faq/' + fno,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Overrid" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			title : title,
			content : content
		}),
		success : function(result) {
			if(result == 'faq add Success') {
				alert("FAQ 등록 완료");
				location.replace("/admin/faq");
			}
		}
	});
});
</script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<div class="admin-footer">footer</div>
<jsp:include page="../adminFooter.jsp"></jsp:include>