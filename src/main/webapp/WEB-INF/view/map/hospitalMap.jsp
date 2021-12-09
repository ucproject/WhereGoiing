<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="maptop.jsp" flush="true"/>
    <title>메인 페이지</title>
    
<body> 
    <form>
    <ul class="nav justify-content-center">     
            <li class="nav-item">
                <a class="nav-link btnChangeCate" data-cate="병원" href="hospital">병원</a>   
            </li>
            <li class="nav-item">
                <a class="nav-link btnChangeCate" data-cate="대형마트" href="mart">대형마트</a>   
            </li>
            <li class="nav-item">
                <a class="nav-link btnChangeCate" data-cate="시장" href="market">시장</a>   
            </li>
            <li class="nav-item">
                <a class="nav-link btnChangeCate"  data-cate="공원" href="park">도시 공원</a>   
            </li>
            <li class="nav-item">
                <a class="nav-link btnChangeCate" data-cate="화장실" href="restaurant">공중화장실</a>  
            </li>
            <li class="nav-justify-content-end">
                <a class="nav-link" href="logout">로그아웃</a>     
            </li>
        </ul>
    </form>
    <hr>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92152a116f8b5b939671d5d8022227ed&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
//var infowindow = new kakao.maps.InfoWindow({zIndex:1});
let current_cate = '병원';

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450705, 126.570677), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// //교통상황 오버레이
map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 
//마커 배열
var markers = [];
//현재 위치로 지도 옮기기
if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
            message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용
        displayMarker(locPosition, message);
      });
    
} else {
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = '현재 위치를 받아올 수 없습니다.'
        
    displayMarker(locPosition, message);
}
//------------------------------------------------------------------------------------------------------------------------------------------------------


kakao.maps.event.addListener(map, 'bounds_changed', function() {             
    getMarkerOnMap(current_cate);
});

function getMarkerOnMap(cate){
    // 지도 영역정보를 얻어옵니다 
    var bounds = map.getBounds();
    
    // 영역정보의 남서쪽 정보를 얻어옵니다 
    var sw = bounds.getSouthWest();
    
    // 영역정보의 북동쪽 정보를 얻어옵니다 
    var ne = bounds.getNorthEast();
    
    var message = '<p>영역좌표는 남서쪽 위도, 경도는  ' + sw.toString() + '이고 <br>';  
    message += '북동쪽 위도, 경도는  ' + ne.toString() + '입니다 </p>'; 
    getLocation(cate, sw, ne);
    
    // console.log(message);
}

$(document).ready(function(){
    getMarkerOnMap(current_cate);
    $('.btnChangeCate').on('click', function(e){
        
        e.preventDefault();
       

        current_cate = $(this).data('cate');
        console.log('clicked cate = '+current_cate);
        
        getMarkerOnMap(current_cate);
    })
});
    
    

let getLocation = (cate, sw, ne)=>{
    $.ajax({
        type : "GET",
        url : "/api/getLocationOnMap",
        data:{
            cate: cate,
            sw_lat: sw.getLat(),
            sw_lng : sw.getLng(),
            ne_lat: ne.getLat(),
            ne_lng: ne.getLng()
        },
        dataType: 'json',
        error : function(error){
            console.log("error");
        },
        success : function(rslt){
            console.log(rslt);
            
            const data = rslt.data;

            $.each(data, (i, d)=>{
                


                var markers = [];
                // 마커 하나를 지도위에 표시합니다 
                addMarker(new kakao.maps.LatLng(d.longitude, d.latitude));

                // 마커를 생성하고 지도위에 표시하는 함수입니다
                function addMarker(position) {
    
                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: position
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);

                //인포윈도우
                var infowindow = new kakao.maps.InfoWindow({
                    position : position, 
                    content : d.name 
                });


                kakao.maps.event.addListener(marker, 'mouseover',function(){
                    infowindow.open(map, marker); 
                })

                kakao.maps.event.addListener(marker, 'click', function(){
                    infowindow.close();
                })
                
                kakao.maps.event.addListener(map,'bounds_changed',function(mouseEvent){
                    marker.setMap(null);
                    infowindow.close();
                })
                }
            });
        },async : false
    });
};



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