<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	   		 $("#map_parking").css("display", "block");  
	    		$("#map_cafe").css("display", "none");
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
		    		$("#map_cafe").css("display", "block");
	    		 $("#map_parking").css("display", "none");  
	    		
		    	//새로운거
		    	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		    	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

		    	var mapContainercafe = document.getElementById('map_cafe'), // 지도를 표시할 div 
		    	    mapOption = {
		    	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		    	        level: 3 // 지도의 확대 레벨
		    	    };  

		    	// 지도를 생성합니다    
		    	var map_cafe = new kakao.maps.Map(mapContainercafe, mapOption); 

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
	        map_cafe.setBounds(bounds);
	       } 
	      }

	   // 지도에 마커를 표시하는 함수입니다
	   function displayMarker(place) {
		   var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		   var imageSize = new kakao.maps.Size(24, 35); 
		   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);    
	    // 마커를 생성하고 지도에 표시합니다
	   	 var marker = new kakao.maps.Marker({
	        map: map_cafe,
	        position: new kakao.maps.LatLng(place.y, place.x),
	        image : markerImage // 마커 이미지 
	    	});

	    // 마커에 클릭이벤트를 등록합니다
	    	kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map_cafe, marker);
	   		 });
	   	}
		 
	});
	    	var count=1;
	        var text="";
	        $("#btn_more_review_info").click(function() {
	            text = "<div>";
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
	        				text +="<div class='row' style='background-color:#F6F6F6; border-radius: 4px; display:flex;width:1000px; align-items: center; padding: 1%;'><div class='col-md-12' style='  text-align: right; padding: 0px;' >" 
                              text += "<input type='hidden'  value='"+arr[i].review_no+"'>"
	        					text+="<p>"+ arr[i].review_date

	        					if(${sessionScope.id==requestScope.dto.store_member_id}){ 
	        					text +=" | <button style='border: none; background-color: #F6F6F6;'class='btn_report' type='button' >신고하기</button>"
	        					

	        					text +=" </p> "
	        					}
	        					text+=" <div class='col-md-2' style=' text-align: center; display: flex; flex-direction: column;'><p style='font-weight: bold; font-size: 20px; border: 1px solid gray;'>"
	        					text +=arr[i].review_member_id+"</p></div><div class='col-md-10' style='padding: 0px; border: 1px solid #EAEAEA; display:flex; align-content: center; text-align: left;'>"

	        					if( arr[i].review_photo != null){
	        						 text +="<img src='review_image_load.do?review_member_id="+arr[i].review_member_id+"&review_store_id="+arr[i].review_store_id+"&fileName="+arr[i].review_photo+"'  class='reviewimg' >"
	        						}
	        					text+="<br>"+
	        					"<span style='white-space: pre-wrap;'>";
	        					text+=arr[i].review_content+"</span></div></div></div>";
	        			}
	        		text += "</div>";
	        		
	        		$("#review_container_box").html(text);
	        		}
	        	});
	        
	        });
	        
	        $(document).on("click",".btn_report",function(){
	        if(confirm("신고하겠습니까?")){ 
	        	var review_no = $(this).parent().parent().find("input").val();
	        	var data = "review_no="+review_no;
	            $.ajax({
	                url:"businessReportAction.do",
	                data: data,
	                method:"get",
	                success:function(d){
	                 console.log(d);
	                 if(d=="true"){
	                    alert("신고 정상처리 완료했습니다");
	                 }else{
	                    alert("신고 정상처리 실패했습니다");                                    
	                 }                            
	                      }
	               });
		     }
     });
	        $("#btn_wish").click(function() {
	        	var wish="❤️red";//빨간색 하트
	        	var not_wish="🤍white";//흰색 하트
	        	var val=$(this).val();
	        	if(val == "🤍white"){
                   var data = "store_id=${dto.store_id}";
                   $.ajax({
                	  url : "insertWishList.do",
                	  data : data,
                	  method: "post",
                	  success:function(d){
                		  console.log(d);
                		  if(d=="true"){
                			  $("#btn_wish").html("❤️");//빨간색 하트
                			  $("#btn_wish").val(wish);
                		  }else{
                			 alert("위시리스트 추가 실패했습니다");
                		  }
                	  }
                   });
	        	}
	        	if(val == "❤️red"){
	        	     var data = "store_id=${dto.store_id}";
	                   $.ajax({
	                	  url : "deleteWishList.do",
	                	  data : data,
	                	  method: "post",
	                	  success:function(d){
	                		  console.log(d);
	                		  if(d=="true"){
	                			  $("#btn_wish").html("🤍");//흰색 하트
	                			  $("#btn_wish").val(not_wish);
	                		  }else{
	                			 alert("위시리스트 삭제 실패했습니다");
	                		  }
	                	  }
	                   });
	        	}
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
.container{
 width: 1000px !important;
 }
.store_img_item{
width: 100%;
margin: 0px;
padding: 1%;
height: 400px;
}
.subject_items{
 font-size: 15px;
 font-weight: 500;
 color: #FA0050;
}
.menu_list_box{
background-color:#F6F6F6 ; 
margin-top: 50px;
text-align: center;
}
.table>tbody>tr>td, .table>tbody>tr>th , .table>tbody>tr{
 border: none !important;
}
caption{
 text-align: center !important;
 font-size: 20px;
 font-weight: 500;
}
.menu_img_box{
display:flex;
flex-wrap: wrap; 
}
.menu_img_items{
margin: 1% 1%;
width: 23%;
height: 150px;
}
.review_img_item{
width: 30%;
}
.map_box{
width:100%;
height:300px;
margin:10px 0px;
display:none;
}
.btn_parking, .btn_cafe{
width:100%;
padding: 1%;
border-radius: 5px !important;
font-size: 1vw;
}
.btn_parking{
border: 1px solid #005eff;
color: #005eff;
font-weight: bold;
margin-bottom: 2px; 
}
.btn_cafe{
border: 1px solid #ffd700;
color: #ffd700;
font-weight: bold;
}
.btn_more_info_box{
padding: 0!important;
}
.btn_more_info{
border: none;
width: 100%;
padding: 12px 12px;
background-color: #FA0050;
color: white;
border-radius: 5px !important;
margin-bottom: 50px;
}
.wish{
 float: right;
 font-size: 40px;
}
button:focus{ 	
    outline:none;
    }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form action="">
<div class="container">
<div class="row">
    <div class="col-md-6">
       <img src="image_load.do?writer=${dto.store_id}&fileName=${dto.store_photo}&divide=store" class="store_img_item">
    </div>
    <div class="col-md-6">
  <span style="font-size: 25px;"> ${requestScope.dto.store_name}</span>&ensp;&ensp;
  <span style="color:#FA0050; font-size: 25px;" > ★</span><span style="font-size: 20px; color:#FA0050;">&ensp;<fmt:formatNumber  value="${dto.review%10}" pattern=".0" /></span> 
  &ensp;<fmt:parseNumber var= "review_count" integerOnly= "true" value= "${dto.review/10}"/> 
  <span style="font-size: 15px;">(${review_count})</span><c:if test="${sessionScope.login==true}"><c:choose><c:when test="${requestScope.wish == null}"><button id="btn_wish" type="button" class="wish" value="🤍white">🤍</button></c:when><c:otherwise><button id="btn_wish" type="button" class="wish" value="❤️red">❤️</button></c:otherwise></c:choose></c:if><br><br>   
  <span class="subject_items">주소</span><br>&ensp;${requestScope.dto.store_addr}<br>
  <span class="subject_items">전화번호</span><br>&ensp;${requestScope.dto.store_tel}<br>
  <span class="subject_items">음식  종류</span><br>&ensp;${requestScope.dto.store_category}<br>
  <span class="subject_items">영업시간</span><br>
  <span style="white-space:pre-wrap; word-break:break-all;"> ${requestScope.dto.store_time}</span>
    </div>
</div>
<div class="row menu_list_box">
  <div class="col-md-12" style="padding: 2%;">
    <table class="table">
      <caption>메&ensp;&ensp;뉴</caption>
      <c:forEach var="menu" items="${requestScope.menuList}">
		<tr class="active">
			<th>
  				${menu.menu_name} 
    		</th>
 			 <td>
   			 ----------------------------------------------------------------------------------------
  			</td>
  			<td>
  			${menu.menu_price}&ensp;&ensp; <span style="color:#FA0050;">★&ensp;&ensp;${menu.menu_score}</span>
    		</td>
   	   </tr>
     </c:forEach>
    </table>
  </div>
</div>

<div class="row">
<div class="col-lg-12 menu_img_box" >
<c:forEach var="menu" items="${menuList}">
<img src="image_load.do?writer=${dto.store_id}&fileName=${menu.menu_photo}&divide=menu" class="menu_img_items" onerror="this.src='img/img_null.png'">
</c:forEach>
<img alt="" src="img/img_null.png" class="menu_img_items">
</div>
</div>

<div class="row" style="background-color:#F6F6F6; border-radius: 4px;">
<div class="col-md-12" >


<div id="map" class="map_box"></div>
</div>
</div>



<div class="row" style=" background-color:#F6F6F6; border-radius: 4px; display:flex; align-items: center;">

 <div class="col-md-4" style="font-size: 20px; font-weight: bold;padding: 1%; " ><p style="margin: 0px;">리뷰 (${review_count }건 평가 )</p></div>
  <div class="col-md-4 col-md-offset-4 "  style="text-align: right;"><a href="reviewRegisterView.do?store_id=${dto.store_id}" style=" background-color:  #FA0050; color: white; width:100px; border: none; padding: 1%; border-radius: 5px;"> 리뷰쓰기</a></div>
</div>

<!-- 리뷰 테이블 -->
<div id="review_container_box">
<c:forEach var="review" items="${reviewList}">
<div class="row" style=" background-color:#F6F6F6; border-radius: 4px; display:flex;width:1000px; align-items: center; padding: 1%;">
<div class="col-md-12" style="text-align: right; padding: 0px; "> 
<input type="hidden"  value="${review.review_no}">
<p> ${review.review_date}<c:if test="${sessionScope.id==requestScope.dto.store_member_id}"> | <button style="border: none; background-color: #F6F6F6;" class="btn_report" type="button" >신고하기</button></c:if></p>
<div class="col-md-2" style=" text-align: center; display: flex; flex-direction: column;">
<p style="font-weight: bold; font-size: 20px; border: 1px solid gray;">${review.review_member_id} </p>
</div>
<div class="col-md-10" style=" padding: 0px; border: 1px solid #EAEAEA; display:flex; align-content: center; text-align: left;">
<c:if test="${review.review_photo != null}">
   <img src="review_image_load.do?review_member_id=${review.review_member_id}&review_store_id=${review.review_store_id}&fileName=${review.review_photo}"  class="review_img_item" >
</c:if>
<br>
 <span style="white-space:pre-wrap; word-break:break-all;">${review.review_content}</span>
</div>
</div>
</div>
</c:forEach>
</div>

<div class="row">
<div class="col-md-1 col-md-offset-11 btn_more_info_box">
<button id="btn_more_review_info" type="button" class="btn_more_info">더보기</button>
</div>
</div>
<div class="row">
<div class="col-md-12">
<button type="button" id="btn_parking" class="btn_parking" style="width: 100%;">${requestScope.dto.store_name} 주변 주차장</button>
<div id="map_parking"  class="map_box"></div>
<button type="button" id="btn_cafe" class="btn_cafe" style="width: 100%;">${requestScope.dto.store_name} 주변 카페</button>
<div id="map_cafe"  class="map_box"></div>
</div>
</div>

</div>


</form>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>