<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <title>다음 지도 API</title>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
   
     <ul class="nav justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="main">Active</a> <!--테스트용 버튼-->
        </li>
        <li class="nav-item">
            <a class="nav-link">음식점</a>  <!--로그인버튼-->
        </li>
        <li class="nav-item">
            <a class="nav-link">도서관</a>   <!--회원가입버튼-->
        </li>
      <li class="nav-item">
            <a class="nav-link">영화관</a>   <!--회원가입버튼-->
        </li>
      <li class="nav-item">
            <a class="nav-link">병원</a>   <!--회원가입버튼-->
        </li>
      <li class="nav-item">
            <a class="nav-link">전통시장</a>   <!--회원가입버튼-->
        </li>
      <li class="nav-item">
            <a class="nav-link">공원</a>   <!--회원가입버튼-->
        </li>
      <li class="nav-item">
            <a class="nav-link">쇼핑몰</a>   <!--회원가입버튼-->
        </li>

        </ul>

   <div id="map" style="width:100%;height:500px;"></div>

   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92152a116f8b5b939671d5d8022227ed&libraries=services"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(35.538793, 129.311686), // 지도의 중심좌표
              level: 8, // 지도의 확대 레벨
              mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
          }; 

      // 지도를 생성한다 
      var map = new kakao.maps.Map(mapContainer, mapOption); 

      var geocoder = new kakao.maps.services.Geocoder();
   

      //반복문 사용?? 배열 사용???-------------------------------------------------------------------------------
      geocoder.addressSearch('울산광역시 남구 중앙로 201 울산광역시청', function(result, status) {
                        //주소 배열 or 좌표가 있는 DB라면 좌표로 
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">울산시청</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});  
      
//------------------------------------------------------------------------------------------
      // 실시간교통 타일 이미지 추가
      //map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 

      // 지도 중심 좌표 변화 이벤트를 등록한다
      kakao.maps.event.addListener(map, 'center_changed', function () {
         console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
      });

      
      

      // 지도 시점 변화 완료 이벤트를 등록한다
      kakao.maps.event.addListener(map, 'idle', function () {
         var message = '지도의 중심좌표는 ' + map.getCenter().toString() + ' 이고,' + 
                     '확대 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
         console.log(message);
      });

      // 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
      kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
         console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
      });   

      // 지도 드래깅 이벤트를 등록한다 (드래그 시작 : dragstart, 드래그 종료 : dragend)
      kakao.maps.event.addListener(map, 'drag', function () {
         var message = '지도를 드래그 하고 있습니다. ' + 
                     '지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.';
         console.log(message);
      });
      // 마커 이미지의 주소
      var markerImageUrl = 'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png', 
          markerImageSize = new kakao.maps.Size(42, 46), // 마커 이미지의 크기
          markerImageOptions = { 
              offset : new kakao.maps.Point(30, 30)// 마커 좌표에 일치시킬 이미지 안의 좌표
          };

      // 마커 이미지를 생성한다
      var markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

      // 지도에 마커를 생성하고 표시한다
      var marker = new kakao.maps.Marker({
          position: new kakao.maps.LatLng(35.538793, 129.311686), // 마커의 좌표
          draggable : true, // 마커를 드래그 가능하도록 설정한다
          image : markerImage, // 마커의 이미지
          map: map // 마커를 표시할 지도 객체
      });


      // 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
      kakao.maps.event.addListener(marker, 'click', function() {
          alert('마커를 클릭했습니다!');
      });

      // 마커에 mouseover 이벤트를 등록한다
      kakao.maps.event.addListener(marker, 'mouseover', function() {
          console.log('마커에 mouseover 이벤트가 발생했습니다!');
      });

      // 마커에 mouseout 이벤트 등록
      kakao.maps.event.addListener(marker, 'mouseout', function() {
          console.log('마커에 mouseout 이벤트가 발생했습니다!');
      });

      // 지도에 선을 표시한다 
      var polyline = new kakao.maps.Polyline({
         map: map, // 선을 표시할 지도 객체 
         path: [ // 선을 구성하는 좌표 배열
            new kakao.maps.LatLng(37.47312, 127.06084),
            new kakao.maps.LatLng(37.53712, 127.12484),
            new kakao.maps.LatLng(37.53712, 127.06084)
         ],
         strokeWeight: 5, // 선의 두께
         strokeColor: '#FF0000', // 선 색
         strokeOpacity: 0.9, // 선 투명도
         strokeStyle: 'solid' // 선 스타일
      });   
   </script>


      
<center>  
      <Font SIZE=5 color="93CC8D"> 리뷰</Font>
      <table border="1" width=500>
         
      <tr bgcolor="red">
         <th>
            번호
         </th>
         <th>
            닉네임
         </th>
         <th>
            제목
         </th>
         <th>
            내용
         </th>
      </tr>
      <tr>
         <td>
                  1
         </td>
         <td>
            1
         </td>
         <td>
            1
         </td>
         <td>
            1
         </td>
      </tr>

   </table>
</center>
</body>
</html>