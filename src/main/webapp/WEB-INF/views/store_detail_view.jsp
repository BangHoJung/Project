<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 API KEY를 사용하세요&libraries=services"></script>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/pc2.css" media="screen and (max-width:1023px)">
<link rel="stylesheet" href="../css/nav.css" media="screen and (min-width:1024px)">
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

<style type="text/css">
.body, .midbody{
width: 1000px;

}
.midbody{
margin: 20% 0px;
}
.body, .midbody, .main{
padding:0px;
margin:0px;
/*border: 1px solid black;*/
}
.img{
width: 100%;
margin: 0px;
padding: 1%;
}
th{
width: 90px;
padding: 1% 0px;
}
.star{
width: 300px;
}
.pro{
width: 100px;
}
.menu{
padding: 2%;
width: 100%;
}
.menulist{
display:flex;
flex-direction:row;
padding:0px;
width: 300px;
left: 20%;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form action="">
<div class="container body">

<div class="row midbody">
<div class="col-md-4 main ">
<img src="image_load.do?writer=${dto.store_id}&fileName=${dto.store_photo}" class="img">
</div>
<div class="col-md-4 main  ">
<img alt="" src="img/bakery/bakery2.jpg" class="img">
</div>
<div class="col-md-4 main  ">
<img alt="" src="img/bakery/bakery3.jpg" class="img">
</div>

</div>
<div class="row">
<div class="col-md-12" style="text-align: right;">

  <span style="color:#FFE400; font-size: 30px;" > ★ </span> 
  <span style="font-size: 25px;">4.5점</span>   <span style="font-size: 25px;"> ${requestScope.dto.store_name}</span>

</div>
 </div>
 
<div class="row midbody">
<div class="col-md-12 main">
<table>
<tr>
<th>
 주소
 </th>
 <td colspan="2">
  	${requestScope.dto.store_addr}
 </td>
 </tr>
 
 <tr>
 <th>
 전화번호 
 </th>	
 <td colspan="2">
 ${requestScope.dto.store_tel}
 </td>
 </tr>
 <tr>
 <th>
 음식  종류	
 </th>
 <td colspan="2">  ${requestScope.dto.store_category}</td>
 
 </tr>
 
 <tr>
 <th>
 주차 
 </th>
 <td colspan="2">
 	무료주차 가능  
</td>
 </tr>
 <tr>
 <th>
 영업시간
  	</th>
  	<td colspan="2">
  	 ${requestScope.dto.store_time}
</td>
 </tr>
 
<tr>
<th>
 휴일
 </th>
 <td>
 	토, 일 
</td>
 </tr>

 <tr>
 <th>
 메뉴 
 </th>
 <c:forEach var="menu" items="${requestScope.menuList}">
<td>
  ${menu.menu_name}    
</td>
 </c:forEach>
 
<c:forEach var="menu" items="${requestScope.menuList}">
<td>
  ${menu.menu_price}    
</td>
 </c:forEach>

</tr>
<tr>
 <th>

 </th>
<td>
해물 로스
</td>
<td>
fdsfsdffsd
</td>

</tr>

</table>
</div>
</div>

<div class="row midbody">
<div class="col-md-12 menulist">
<c:forEach var="menu" items="${menuList}">
						<img src="menu_image_load.do?writer=${dto.store_id}&fileName=${menu.menu_photo}" class="menu">
			</c:forEach>


</div>
</div>

<div class="row midbody">
<div class="col-md-12">

<input type="text" id="sample5_address" placeholder="주소">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
</div>
</div>



<div class="row  midbody">
  <div class="col-md-4 main" ><p>리뷰</p></div>
  <div class="col-md-4 col-md-offset-4 "  style="text-align: right;"> <span> 전체보기 좋아요보기 </span> <button src="reviewRegisterView.do?store_id=${dto.store_id}" style=" background-color:  #FA0050; color: white; border: none; padding: 1%; border-radius: 5px;"> 리뷰쓰기</button></div>
</div>

<div class="row main">
<div class="col-md-2 main" style="text-align: center;"> 
<img alt="" src="img/cake/cake1.jpg" class="pro" style=" width: 100%;"> <br>
<p>닉네임</p>
</div>
<div class="col-md-9 col-md-offset-1">
 <p style="margin-top: 2%;"> 날짜 너주세여  </p>

<p>맛있습니다</p>

</div>
</div>



<div class="row midbody">
<div class="col-md-12 main">
주변카페,주차장
</div>
</div>

</div>



</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>