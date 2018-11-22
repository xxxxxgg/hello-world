<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../adminHeader.jsp"></jsp:include>

<div class="admin-body">
<button id="modify">수정</button>
<button id="remove">삭제</button>
<button id="list">목록보기</button>
<div class="divTable blueTable">
	<div class="divTableHeading">
		<div class="divTableRow">
			<div class="divTableHead">faq번호</div>
			<div class="divTableHead">faq제목</div>
			<div class="divTableHead">날짜</div>
		</div>
	</div>
	<div class="divTableBody">
		<div class="divTableRow">
			<div class="divTableCell" style="width:60px;">${faqVO.no}</div>
			<div class="divTableCell"><a href="/admin/faq/detail?fno=${faqVO.no}">${faqVO.title}</a></div>
			<div class="divTableCell" style="width:110px;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${faqVO.regdate}" /></div>
		</div>
	</div>
</div>
<div class="divTable blueTable">
	<div class="divTableHeading">
		<div class="divTableRow">
			<div class="divTableHead">faq내용</div>
		</div>
	</div>
	<div class="divTableBody">
		<div class="divTableRow">
			<div class="divTableCell">${faqVO.content}</div>
		</div>
	</div>
</div>
<div style="text-align:center">
	번호 : <label>${faqVO.no }</label><br>
	제목 : <input type="text" name="title" id="title" value="${faqVO.title }"><br>
	내용 : <textarea name="content" id="content" row="300" col="1000">${faqVO.content }</textarea><br>
	저장날짜 : <label><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${faqVO.regdate}" /></label>
</div>
</div><!-- admin body -->

<script>


$("#modify").on("click", function() {
	var title = $("#title").val();
	var content = $("#content").val();
	var fno = ${faqVO.no};
	
	$.ajax({
		type : 'put',
		url : '/admin/faq/' + fno,
		headers : {
			"Content-Type" : "application/json; charset=UTF-8",
			"X-HTTP-Method-Overrid" : "PUT"
		},
		dataType : 'text',
		data : JSON.stringify({
			title : title,
			content : content
		}),
		success : function(result) {
			if(result == 'faq modify Success') {
				alert("FAQ 수정 완료");
				location.replace("/admin/faq");
			}
		}
	});
});
$("#remove").on("click", function() {
	var fno = ${faqVO.no};
	
	$.ajax({
		type : 'delete',
		url : '/admin/faq/' + fno,
		headers : {
			"Content-Type" : "application/json; charset=UTF-8",
			"X-HTTP-Method-Overrid" : "DELETE"
		},
		dataType : 'text',
		success : function(result) {
			if(result == 'faq remove Success') {
				alert("FAQ 삭제 완료");
				location.replace("/admin/faq");
			}
		}
	});
});
$("#list").on("click", function() {
		location.href = "/admin/faq";
	}
);
</script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<div class="admin-footer">footer</div>
<jsp:include page="../adminFooter.jsp"></jsp:include>