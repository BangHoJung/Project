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

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/pc2.css" media="screen and (max-width:1023px)">
<link rel="stylesheet" href="../css/nav.css" media="screen and (min-width:1024px)">

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=694036a0826cddf069058d298e360001&libraries=services"></script>
<script>
	$(function () {
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
	    	geocoder.addressSearch("${dto.store_addr}", function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용
					console.log(result);
                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords);
                }
           
		});
	    	$("#btn_parking").click(function() {
			
	    	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	    	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	    	var mapContainerParking = document.getElementById('map_parking'), // 지도를 표시할 div 
	    	    mapOption = {
	    	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	    	        level: 3 // 지도의 확대 레벨
	    	    };  

	    	// 지도를 생성합니다    
	    	var map_parking = new kakao.maps.Map(mapContainerParking, mapOption); 

	    	// 장소 검색 객체를 생성합니다
	    	var ps = new kakao.maps.services.Places(); 

	    	// 키워드로 장소를 검색합니다
	    	ps.keywordSearch('${dto.store_addr} 주차장', placesSearchCB); 

	    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
     function placesSearchCB (data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {

           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
           // LatLngBounds 객체에 좌표를 추가합니다
           var bounds = new kakao.maps.LatLngBounds();

          for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
          }       
 
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map_parking.setBounds(bounds);
       } 
      }

   // 지도에 마커를 표시하는 함수입니다
   function displayMarker(place) {
	    
    // 마커를 생성하고 지도에 표시합니다
   	 var marker = new kakao.maps.Marker({
        map: map_parking,
        position: new kakao.maps.LatLng(place.y, place.x) 
    	});

    // 마커에 클릭이벤트를 등록합니다
    	kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map_parking, marker);
   		 });
   	}
	   
});
	    	$("#btn_cafe").click(function() {
		    	//새로운거
		    	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		    	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

		    	var mapContainerParking = document.getElementById('map_parking'), // 지도를 표시할 div 
		    	    mapOption = {
		    	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		    	        level: 3 // 지도의 확대 레벨
		    	    };  

		    	// 지도를 생성합니다    
		    	var map_parking = new kakao.maps.Map(mapContainerParking, mapOption); 

		    	// 장소 검색 객체를 생성합니다
		    	var ps = new kakao.maps.services.Places(); 

		    	// 키워드로 장소를 검색합니다
		    	ps.keywordSearch('${dto.store_addr} 카페', placesSearchCB); 

		    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
	     function placesSearchCB (data, status, pagination) {
	          if (status === kakao.maps.services.Status.OK) {

	           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	           // LatLngBounds 객체에 좌표를 추가합니다
	           var bounds = new kakao.maps.LatLngBounds();

	          for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	          }       
	 
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map_parking.setBounds(bounds);
	       } 
	      }

	   // 지도에 마커를 표시하는 함수입니다
	   function displayMarker(place) {
		    
	    // 마커를 생성하고 지도에 표시합니다
	   	 var marker = new kakao.maps.Marker({
	        map: map_parking,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    	});

	    // 마커에 클릭이벤트를 등록합니다
	    	kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map_parking, marker);
	   		 });
	   	}
		   
	});
	    	var count=1;
	        var text="";
	        $("#btn_more_review_info").click(function() {
	      
	        	count++;
	        	var data="store_id=${requestScope.dto.store_id}&no="+count;
	        	$.ajax({
	        		url:"selectStoreReviewListMore.do",
	        		data : data,
	        		method: "get",
	        		success:function(d){
	        			console.log(d);
	        			var result=JSON.parse(d);
	        			console.log(result);
	        			var arr=result.result;
	        			for(i=0;i<arr.length;i++){
	        				text +="<div class='row main' style='margin: 2% 0px; background-color:#F6F6F6; border-radius: 4px; display:flex;width:1000px; align-items: center; padding: 1%;'><div class='col-md-12 main' style='text-align: right;'>" 

	        					text+="<p>"+ arr[i].review_date

	        					if(${sessionScope.id==requestScope.dto.store_member_id}){ 
	        					text +=" | <button style='border: none; background-color: #F6F6F6;' class='btn_report' type='button' >신고하기</button>"
	        					}

	        					text +="</p>"
	        					text+="<div class='col-md-2 main' style=' text-align: center; display: flex; flex-direction: column;'><p style='font-weight: bold; font-size: 20px; border: 1px solid gray;' >"
	        					text +=arr[i].review_member_id+"</p></div><div class='col-md-10' style='border: 1px solid #EAEAEA; text-align: left;'>"

	        					if(${review.review_photo != null}){
	        					 text +="<img src='review_image_load.do?review_member_id=${review.review_member_id}&review_store_id=${review.review_store_id}&fileName=${review.review_photo}'  class='reviewimg' >"
	        					}
	        					text+="<br><span style='white-space: pre-wrap;'>"
	        					text+=arr[i].review_content+"</span></div></div></div>"
	        			}
	        		
	        		$("#review_container_box").html(text);
	        		}
	        	});
	        });
	
	});
    
/*
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
				console.log(addr);
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용
						console.log(result);
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                    }
                });
            }
        }).open();
    }
    */
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
width: 200px;
height: 150px;
}
.menulist{
display:flex;
flex-direction:row;
padding:0px;
width: 300px;
left: 20%;
}
.addr, .tel, .menue, .Food, .time{
width: 100px;

}
.Sum{
display: flex;
flex-direction: row;
margin: 10px 0px;
}

.reviewimg{
width: 30%;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form action="">
<div class="container body">

<div class="row midbody">
<div class="col-md-4 main ">
<img src="image_load.do?writer=${dto.store_id}&fileName=${dto.store_photo}&divide=store" class="img">
</div>
<div class="col-md-4 main  ">
<img alt="" src="img/bakery/bakery2.jpg" class="img">
</div>
<div class="col-md-4 main  ">
<img alt="" src="img/bakery/bakery3.jpg" class="img">
</div>

</div>
<div class="row" style="width:1000px;">
<div class="col-md-12" style="text-align: right;">

  <span style="color:#FA0050; font-size: 30px;" > ★ </span> 
  <span style="font-size: 25px;"><%-- ${requestScope.dto.review_score} --%>5</span>   <span style="font-size: 25px;"> ${requestScope.dto.store_name}</span>

</div>
 </div>
 
<div class="row midbody" style="margin: 2% 0px;background-color:#F6F6F6 ; border-radius: 4px; ">
<div class="col-md-12 main" style="padding: 2%;  ">

<div class="Sum">
 <div class="addr">주소 </div><div>${requestScope.dto.store_addr}</div>
</div>


<div class="Sum">
<div class="tel">전화번호</div> 
 <div> ${requestScope.dto.store_tel}</div>
</div>
<div class="Sum">
<div class="Food"> 음식  종류</div>	
<div>
${requestScope.dto.store_category}
 </div>
 </div>
 <div class="Sum">
 <div class="time"> 영업시간</div>
  <div> ${requestScope.dto.store_time}</div>
</div>
<div class="Sum">
<div class="menue"> 메뉴</div> 
<div>
 <c:forEach var="menu" items="${requestScope.menuList}">
<div>  ${menu.menu_name}   
 ---------------------------------------------------------------------------------------------------------------------------------------
  ${menu.menu_price}</div>
<br>
 </c:forEach>
 </div>
</div>

</div>
</div>

<div class="row midbody" style="width:1000px;">
<div class="col-md-12 menulist">

<c:forEach var="menu" items="${menuList}">
<img src="image_load.do?writer=${dto.store_id}&fileName=${menu.menu_photo}&divide=menu" class="menu" onerror="this.src='img/img_null.png'">
</c:forEach>

</div>
</div>

<div class="row midbody" style="margin: 2% 0px; background-color:#F6F6F6; border-radius: 4px;">
<div class="col-md-12" >


<div id="map" style="width:100%;height:300px;margin:10px 0px;display:none"></div>
</div>
</div>



<div class="row  midbody" style="margin: 2% 0px; background-color:#F6F6F6; border-radius: 4px; display:flex; align-items: center;">

 <div class="col-md-4 main" style="font-size: 20px; font-weight: bold;padding: 1%; " ><p style="margin: 0px;">리뷰</p></div>  <!--  store_id=${dto.store_id}-->
  <div class="col-md-4 col-md-offset-4 "  style="text-align: right;"> <span> 전체보기 | 좋아요보기 </span> <a href="reviewRegisterView.do?store_id=${dto.store_id}" style=" background-color:  #FA0050; color: white; width:100px; border: none; padding: 1%; border-radius: 5px;"> 리뷰쓰기</a></div>
</div>

<!-- 리뷰 테이블 -->
<div id="review_container_box">

<c:forEach var="review" items="${reviewList}">
<div class="row main " style="margin: 2% 0px; background-color:#F6F6F6; border-radius: 4px; display:flex;width:1000px; align-items: center; padding: 1%;">

<div class="col-md-12 main" style="text-align: right; "> 
<p> ${review.review_date}<c:if test="${sessionScope.id==requestScope.dto.store_member_id}"> | <button style="border: none; background-color: #F6F6F6;" class="btn_report" type="button" >신고하기</button></c:if></p>
<div class="col-md-2 main" style=" text-align: center; display: flex; flex-direction: column;">

<p style="font-weight: bold; font-size: 20px; border: 1px solid gray;" >${review.review_member_id} </p>
</div>
<div class="col-md-10" style="border: 1px solid #EAEAEA; text-align: left;">
 
   <c:if test="${review.review_photo != null}">
   <img src="review_image_load.do?review_member_id=${review.review_member_id}&review_store_id=${review.review_store_id}&fileName=${review.review_photo}"  class="reviewimg" >
   </c:if>
   <br>
  <span style="white-space: pre-wrap;"> ${review.review_content}</span>
</div>
</div>
</div>
</c:forEach>

</div>
<button id="btn_more_review_info" type="button">더보기</button>



<div class="row midbody">
<div class="col-md-12 main">
<button type="button" id="btn_parking">주차장</button><button type="button" id="btn_cafe">카페</button>
<div id="map_parking" style="width:100%;height:350px;"></div>
</div>
</div>

</div>



</form>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>