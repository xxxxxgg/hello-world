<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>The Village</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <link href="/resources/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <script>
            $(document).ready(function(){
             $('.slider').bxSlider({
                 mode: 'horizontal',
                 auto: true,
                 autoControls: true,
                 stopAutoOnClick: true,
                 pager: true
             });
            });
    </script>
    
	<script>
	function javascript(){
	    window.location.href="member/register";
	}
	</script>

</head>
<body>

	
<jsp:include page="member/header.jsp"></jsp:include>


        <div class="slider">
            <img class="slides" src="/resources/img/high.jpg">
        	<img class="slides" src="/resources/img/high3.jpg">
            <img class="slides" src="/resources/img/high2.jpg">
            <img class="slides" src="/resources/img/high4.jpg">
        </div>

        <div class="container">
            <div id="heading-block">
                <h2>Category</h2>
            </div>
            <!-- first box -->
            <a href="#">
                <div class="catbox">
                    <img src="/resources/img/Children`s goods.jpg" alt="Children`s goods">
                    <span>유/아동</span>
                </div>
            </a>
            <!-- second box -->
            <a href="#">
                <div class="catbox">
                    <img src="/resources/img/LeisureHobby.jpg" alt="Leisure/Hobby">
                    <span>레져/취미</span>
                </div>
            </a>
            <!-- third box -->
            <a href="#">
                <div class="catbox">
                    <img src="/resources/img/FashionBeauty.jpg" alt="Fashion/Beauty">
                    <span>패션/뷰티</span>
                </div>
            </a>
            <!-- fourth box -->
            <a href="#">
                <div class="catbox">
                    <img src="/resources/img/Living.jpg" alt="Living">
                    <span>리빙</span>
                </div>
            </a>
            <!-- fifth box -->
            <a href="#">
                <div class="catbox">
                    <img src="/resources/img/pet.jpg" alt="Pet">
                    <span>애완동물</span>
                </div>
            </a>
            <!-- sixth box -->
            <a href="#">
                <div class="catbox">
                    <img src="/resources/img/Second-hand sales.jpg" alt="Second-hand sales">
                    <span>중고 판매관</span>
                </div>
            </a>
            <!-- HEADING OF CATEGORY -->
            <div id="heading-block">
                <h2>Products</h2>
            </div>
            <div class="prod-container">
                <!--First product-->
                <div class="prod-box">
                    <img src="/resources/img/Car-seat.jpg" alt="Car seat">
                    <div class="prod-trans">
                    <div class="prod-feature">
                        <p>제품명: 카시트</p>
                        <p>가격: 10000원</p>
                        <input type="button" value="장바구니 담기">
                    </div>
                    </div>
                </div>
                
                <!--Second product-->
                <div class="prod-box">
                    <img src="/resources/img/Refrigirator.png" alt="Refrigirator">
                    <div class="prod-trans">
                    <div class="prod-feature">
                        <p>제품명: 냉장고</p>
                        <p>가격: 10000원</p>
                        <input type="button" value="장바구니 담기">
                    </div>
                    </div>
                </div>
                
                <!--Third product-->
                <div class="prod-box">
                    <img src="/resources/img/Childrenas-clothes.jpg" alt="Childrenas clothes">
                    <div class="prod-trans">
                    <div class="prod-feature">
                        <p>제품명: 애기옷</p>
                        <p>가격: 10000원</p>
                        <input type="button" value="장바구니 담기">
                    </div>
                    </div>
                </div>

                <!--Fourth product-->
                <div class="prod-box">
                    <img src="/resources/img/Pet's-bag.jpg" alt="Pet`s bag">
                    <div class="prod-trans">
                    <div class="prod-feature">
                        <p>제품명: 애견가방</p>
                        <p>가격: 10000원</p>
                        <input type="button" value="장바구니 담기">
                    </div>
                    </div>
                </div>

                <!--Fifth product-->
                <div class="prod-box">
                    <img src="/resources/img/Running-machine.jpg" alt="Running machine">
                    <div class="prod-trans">
                    <div class="prod-feature">
                        <p>제품명: 러닝머신</p>
                        <p>가격: 10000원</p>
                        <input type="button" value="장바구니 담기">
                    </div>
                    </div>
                </div>

                <!--Sixth product-->
                <div class="prod-box">
                    <img src="/resources/img/tv.jpg" alt="Television">
                    <div class="prod-trans">
                    <div class="prod-feature">
                        <p>제품명: TV</p>
                        <p>가격: 10000원</p>
                        <input type="button" value="장바구니 담기">
                    </div>
                    </div>
                </div>

            </div>
          </div><!-- container -->


		<jsp:include page="member/footer.jsp"></jsp:include>

        </div>

    </div>

</body>

</html>
