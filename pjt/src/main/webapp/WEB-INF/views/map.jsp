<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>오시는 길</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link href="/resources/css/product.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rd7wsnf1i3"></script>
</head>
<body>
	<jsp:include page="member/header.jsp"></jsp:include>

	<div id="map"
		style="width: 80%; height: 600px; margin-top: 100px; margin-left: 10%; margin-bottom: 100px;"></div>

	<script>
            var HOME_PATH = window.HOME_PATH || '.';

			var cityhall = new naver.maps.LatLng(37.499841, 127.030428),
    			map = new naver.maps.Map('map', {
        		center: cityhall.destinationPoint(0, 500),
        		zoom: 10
    		}),
    		marker = new naver.maps.Marker({
        	map: map,
        	position: cityhall
    		});

	var contentString = [
        '<div class="iw_inner">',
        '       <img src="'+ HOME_PATH +'/resources/img/logo.png" width="90" height="55" alt="TheVillage" class="thumb" /><br />',
        '   <h3>The Village</h3>',
        '   <p>서울 강남구 테헤란로7길 7 | 서울 강남구 역삼동 649-5<br />',
        '       02-120 | 물품렌탈,판매기관 &gt; 특별,광역시청<br />',
        '       <a href="http://localhost:8080/" target="_blank">www.TheVillage.go.kr/</a>',
        '   </p>',
        '</div>'
    ].join('');

	var infowindow = new naver.maps.InfoWindow({
    	content: contentString
	});

		naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
	
		});

infowindow.open(map, marker);
        </script>





	<jsp:include page="member/footer.jsp"></jsp:include>
</body>
</html>