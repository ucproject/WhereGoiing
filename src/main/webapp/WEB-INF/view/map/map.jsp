<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"> 
            <style>
                html,
                body{
                    width : 100%;
                    height: 100%;
                    margin : 0px;
                }
                #map{
                    width : 100%;
                    height: 100%;
                }
            </style> 
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <title>메인 페이지</title>
        </head>
<body>
    <!-- 지도를 표시할 div 입니다 -->
    <div id="map"></div>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92152a116f8b5b939671d5d8022227ed"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    
    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption); 

        $(document).ready(function(){
            console.log('Start');
        $.get("getdb.php",function(data){
            console.log(data);
            });
        })    

    

    // 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
            title : '수성공원',
            latlng : new kakao.maps.LatLng(129.3612252,35.62788103)
        },
        {
            title : '대동공원',
            latlng : new kakao.maps.LatLng(129.362183,35.63227751)
        },
        {
            title : '못안공원',
            latlng : new kakao.maps.LatLng(129.3592257,35.62454181)
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
    </script>
</body>
</html>