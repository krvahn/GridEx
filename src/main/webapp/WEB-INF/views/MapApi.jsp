<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:500px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2bd86f2a758837633abdec57138510a6"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.414847433326365, 127.15055500135001), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); 
var markerPosition  = new daum.maps.LatLng(37.414847433326365, 127.15055500135001);
var marker = new daum.maps.Marker({
    position: markerPosition
});
marker.setMap(map);

var iwContent = '<div style="padding:5px;">Arotec <br><a href="http://map.daum.net/link/map/Hello World!,37.414847433326365, 127.15055500135001" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new daum.maps.LatLng(33.450701, 126.570667);

var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});


</script>

</body>
</html>

