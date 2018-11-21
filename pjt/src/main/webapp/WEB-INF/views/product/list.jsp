<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>상품 검색 결과</title>
  	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link href="/resources/css/product.css" rel="stylesheet" type="text/css">  
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
</head>
<body>
	<jsp:include page="../member/header.jsp"></jsp:include>
	
	<form role = "form" method = "post">
		<input type = 'hidden' name = 'category' value="{productVO.category}">
	</form>
	
		<section id="search_list">
		<div id="detail_option">
				<span id="total_count">총 ${catCount}개의 상품이 검색되었습니다.</span>

				<select class="dropdown" tabindex="5" data-settings='{"wrapperClass":"<a href="https://www.jqueryscript.net/tags.php?/metro/">metro</a>"}'>
						<option value="latest">최신순</option>
								<option value="popular" selected="selected">인기상품순</option>
								<option value="evaluation">상품평순</option>
								<option value="highprice">높은가격순</option>
								<option value="lowprice">낮은가격순</option>
				</select>

		</div>
	</section>
	
	<!-- product -->
        <div class="container">
                <div class="row">
                	<c:forEach items="${list}" var="productVO">
                      	<div class="col-md-3 product-grid">
                    		<div class="image">
                        		<a href="/product/detail?product_id=${productVO.product_id}">
                            	<img src="/resources/img/product/${productVO.mainimg}" class="w-100" width="100%" height="300px">
                            		<div class="overlay">
                                		<div class="detail">View Details</div>
                            		</div>
                        		</a>
                    		</div>
                    		
                    		<h4 class ="text-center">${productVO.product_name}</h4>
                    		<h5 class ="text-center">${productVO.priceforweek}</h5>
                    		<a href="#" class="btn" style="color:gray;">ADD TO CART</a>
        				</div>
                
                	</c:forEach>
                </div>
            </div>
            
		<%-- <div class = "text-center">
		<ul class = "pagination">
			<c:if test = "${pageMaker.prev}">
			<li><a href="category${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin = "${pageMaker.startPage }"
			end="${pageMaker.endPage }" var = "idx">
			<li
				<c:out value = "${pageMaker.cri.page == idx?'class =active':''}"/>>
				<a href="category${pageMaker.makeSearch(idx)}">${idx}</a>
			</li>
			</c:forEach>
			
			<c:if test = "${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="category${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
			</c:if>
		</ul>
		</div> --%>

            

       
       
	<jsp:include page="../member/footer.jsp"></jsp:include>
</body>
</html>