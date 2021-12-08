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
    </form>
    <hr>
    <!-- var category = [];
    var name = [];
    var address = [];
    var lat = [];
    var lon = [];

    <c:forEach var= "dto" items = "${hospitalmaps}">
        ${dto.category}
        ${dto.name}"
        ${dto.address}
        ${dto.latitude}
        ${dto.longitude}
    </c:forEach> -->
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92152a116f8b5b939671d5d8022227ed&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
//var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450705, 126.570677), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// //교통상황 오버레이
// map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 
//마커 배열
var markers = [];
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

kakao.maps.event.addListener(map, 'bounds_changed', function() {             
    getMarkerOnMap();
});

function getMarkerOnMap(){
    // 지도 영역정보를 얻어옵니다 
    var bounds = map.getBounds();
    
    // 영역정보의 남서쪽 정보를 얻어옵니다 
    var sw = bounds.getSouthWest();
    
    // 영역정보의 북동쪽 정보를 얻어옵니다 
    var ne = bounds.getNorthEast();
    
    var message = '<p>영역좌표는 남서쪽 위도, 경도는  ' + sw.toString() + '이고 <br>';  
    message += '북동쪽 위도, 경도는  ' + ne.toString() + '입니다 </p>'; 
    getLocation('대형마트', sw, ne);
    
    // console.log(message);
}

$(document).ready(function(){
    // $.get("/hospital",function(data){
    //     console.log(data);
    // });
    getMarkerOnMap();
});

// function parsing(){
//     var mapdata;

//     $.get('/hospital', function(data){
        
//         // var aJsonArray = new Array();

//         // $.each(data, function(i, item){
//             // var jsondata = JSON.stringify(item);

//             // var obj = eval("("+jsondata+")");

//             // var aJson = new Object();

//             // aJson.category = obj.category;
//             // aJson.name = obj.name;
//             // aJson.address = obj.address;
//             // aJson.lat = obj.lat;
//             // aJson.lon = obj.lon;

//             // aJsonArray.push(aJson);
//             // mapdata = aJsonArray;
//             alert(JSON.stringify(data));
//         })
//         console.log(mapdata);
//         // 마커 이미지의 이미지 주소입니다
//         var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
//     for (var i = 0; i < 100; i ++) {
        
//         // 마커 이미지의 이미지 크기 입니다
//         var imageSize = new kakao.maps.Size(24, 35); 
        
//         // 마커 이미지를 생성합니다    
//         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
        
//         // 마커를 생성합니다
//         var marker = new kakao.maps.Marker({
//             map: map, // 마커를 표시할 지도
//             position: aJsonArray[i].address, // 마커를 표시할 위치
//             title : aJsonArray[i].name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
//             image : markerImage // 마커 이미지 
//         });

        
//     }
//     marker.setmap(map);
// }
       
//     })
// }

let getLocation = (cate, sw, ne)=>{
    $.ajax({
        type : "GET",
        url : "/api/park",
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
            // alert(JSON.stringify(data));
            // console.log("success");
            const data = rslt.data;
            $.each(data, (i, d)=>{
                // if(i < 10){
                //     console.log(i + ', '+d.name+" "+d.address);
                // }

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
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
}

            });


            // var positions = [];
            // for(var i=0; i<positions.length; i++){
            //     positions.push({
            //         title : positions[i].name, //마커에 타이틀 표시
            //         latlng : new kakao.maps.LatLng(positions[i].lat, positions[i].lon)
            //     });
            // }
            //     // 마커 이미지의 이미지 크기 입니다
            //     var markers = [];
            //     for(var i=0; i<positions.length; i++){
                
                
            //         var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
            //     var imageSize = new kakao.maps.Size(24, 35); 
                
            //     // 마커 이미지를 생성합니다    
            //     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
            //     // 마커를 생성합니다
            //     var marker = new kakao.maps.Marker({
            //         map: map, // 마커를 표시할 지도
            //         position: positions[i].latlng, // 마커를 표시할 위치
            //         title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            //         image : markerImage // 마커 이미지 
            //     });
            //     marker.setMap(map);
                    
            //         // LatLngBounds 객체에 좌표를 추가합니다
            //     bounds.extend(positions[i]);
            //     markers.push(marker);
            // }
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