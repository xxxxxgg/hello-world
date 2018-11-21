<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>${productVO.product_name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    
    <link href="/resources/css/detail.css" rel="stylesheet" type="text/css">  
</head>
<body>
	<jsp:include page="../member/header.jsp"></jsp:include>
	
	<form id ="cartform" method="post">
	<div class="product_container">
	    <!-- Left Column -->
	    <div class="left-column">
	        <img src="/resources/img/product/${productVO.mainimg}" >
	    </div>
	
	    <div class="right-column">
	        <div class="product-description">
	            <span>${productVO.category}</span>
	            <h1>${productVO.product_name}</h1>
	            <p>굉장히 편안합니다!</p>
	        </div>
	
		
		    <!-- cable configuration -->
		    <div class="cable-config">
		        <span>구매 옵션</span>
		
		        <div class="cable-choose">
			        <div class="rental_type"><input type="radio" name="rental_type"  id="week" value="1주"> 1주 렌탈</div>
			        <div class="rental_type"><input type="radio" name="rental_type"  id="month" value="1개월"> 1개월 렌탈</div>
			        <div class="rental_type"><input type="radio" name="rental_type"  id="newpro" value="새상품(1개월)"> 새상품 렌탈</div>
		        </div>
		        <div class="quantity">
		        	<span>수량 : </span>
	                <input id="pro_quantity" name="quantity" type="number" value="1" min="1" max="5" />
	                <input type=button value="+" id="plus" onClick="javascript:this.form.pro_quantity.value++;">
					<input type=button value="-" id="minus" onClick="javascript:this.form.pro_quantity.value--;">
		        </div>	
		    </div>
			<script type="text/javascript">
			
			document.getElementById("week").onclick = function() { 
    			document.getElementById("show").innerText = "${productVO.priceforweek}"*$("#pro_quantity").val();
    		}
            document.getElementById("month").onclick = function() { 
    			document.getElementById("show").innerText = "${productVO.priceformonth}"*$("#pro_quantity").val();
    		}
            document.getElementById("newpro").onclick = function() { 
    			document.getElementById("show").innerText = "${productVO.pricefornew}"*$("#pro_quantity").val();
    		} 
            document.getElementById("plus").onclick = function() { 
            	var text = document.getElementById("pro_quantity"); // 폼 선택
            	text_val = parseInt(text.value); // 폼 값을 숫자열로 변환
            	text_val += 1; // 계산
           		text.value = text_val; 
				if($("#week").prop("checked")){
	           		document.getElementById("show").innerText = "${productVO.priceforweek}"*$("#pro_quantity").val();
				}
				if($("#month").prop("checked")){
	           		document.getElementById("show").innerText = "${productVO.priceformonth}"*$("#pro_quantity").val();
				}
				if($("#newpro").prop("checked")){
	           		document.getElementById("show").innerText = "${productVO.pricefornew}"*$("#pro_quantity").val();
				}
    		}   
            document.getElementById("minus").onclick = function() { 
            	var text = document.getElementById("pro_quantity"); // 폼 선택
            	text_val = parseInt(text.value); // 폼 값을 숫자열로 변환
            	text_val -= 1; // 계산
           		text.value = text_val; 
				if($("#week").prop("checked")){
	           		document.getElementById("show").innerText = "${productVO.priceforweek}"*$("#pro_quantity").val();
				}
				if($("#month").prop("checked")){
	           		document.getElementById("show").innerText = "${productVO.priceformonth}"*$("#pro_quantity").val();
				}
				if($("#newpro").prop("checked")){
	           		document.getElementById("show").innerText = "${productVO.pricefornew}"*$("#pro_quantity").val();
				}
    		}  
            
       		</script>
			<div class="product-price">
		    	<span>￦</span>
		    	<span id="show"></span>   
		    	<div id="submit-button"> 
					<button type="submit" id="submit" class="cart-btn" onclick="submitBtn_click(event);">장바구니</button>
				</div>                
			</div>
		</div>
	</div>
	</form>
	<script>
		function submitBtn_click(e){
			if (($("#week").prop("checked") == false) && ($("#month").prop("checked") == false) && ($("#newpro").prop("checked") == false)) {
				alert("렌탈 옵션을 선택해 주세요.");	
				e.preventDefault();
			}
		}
	</script>

	<div class="des_container">
	    <div class="des_box">
	            <img src="/resources/img/product/${productVO.detailimg}" >
	    </div>
	</div>
	
	<jsp:include page="../member/footer.jsp"></jsp:include>
</body>
</html>