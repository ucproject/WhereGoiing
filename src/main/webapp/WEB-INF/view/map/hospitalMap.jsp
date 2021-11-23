<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>메인 페이지</title>
    <style>
        html,
        body{
            width: 100%;
            height : 100%;
        }
        #map{
            width : 100%;
            height: 100%;
        }
    </style> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <ul class="nav justify-content-center">     
        <li class="nav-item">
            <a class="nav-link" href="restaurant">음식점</a>  
        </li>
        <li class="nav-item">
            <a class="nav-link" href="cineme">영화관</a>  
        </li>
        <li class="nav-item">
            <a class="nav-link" href="hospital">병원</a>   
        </li>
        <li class="nav-item">
            <a class="nav-link" href="mart">대형마트</a>   
        </li>
        <li class="nav-item">
            <a class="nav-link" href="market">시장</a>   
        </li>
        <li class="nav-item">
            <a class="nav-link" href="park">도시 공원</a>   
        </li>
        <li class="nav-justify-content-end">
            <a class="nav-link" href="logout">로그아웃</a>     
        </li>
        </ul>
       
            
     
    <hr>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92152a116f8b5b939671d5d8022227ed&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450705, 126.570677), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
//현재 위치로 지도 옮기기
if (navigator.geolocation) {
    
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
            message = '<div style="padding:5px;">    현재 위치  </div>'; // 인포윈도우에 표시될 내용
        displayMarker(locPosition, message);
      });
    
} else {
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = '현재 위치를 받아올 수 없습니다.'
        
    displayMarker(locPosition, message);
}

//------------------------------------------------------------------------------------------------------------------------------------------------------
var positions = [
    {
        title: '울산시청', 
        latlng: new kakao.maps.LatLng(35.53939658436391, 129.31123399881406)
    },
    {
        title: '울산과학대학교 동부캠퍼스', 
        latlng: new kakao.maps.LatLng(35.495911569719375, 129.4156068822835)
    },
    {
        title: '현대백화점', 
        latlng: new kakao.maps.LatLng(35.53852962614413, 129.33827638413592)
    }
];
// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
</script>
</body>
</html>