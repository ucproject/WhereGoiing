<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="maptop.jsp" flush="true"/>
    <title>메인 페이지</title>
    
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
        </ul>  <hr>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92152a116f8b5b939671d5d8022227ed&libraries=services"></script>
<script>
    var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
        contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
        markers = [], // 마커를 담을 배열입니다
        currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.49291474389836, 127.04622318176783), // 지도의 중심좌표
            level: 9 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    var positions = [
        {
            title : '수성공원',
            latlng : new kakao.maps.LatLng(35.62788103,129.3612252)
        },
        {
            title : '대동공원',
            latlng : new kakao.maps.LatLng(35.63227751,129.362183)
        },
        {
            title : '못안공원',
            latlng : new kakao.maps.LatLng(35.62454181,129.3592257)
        }
    ];
        
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