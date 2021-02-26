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
<style type="text/css">
.body, .midbody{
width: 1000px;

}
.body, .midbody, .main{
padding:0px;
margin:0px;
border: 1px solid black;
}
.img{
width: 100%;
margin: 0px;
padding: 0px;
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
<div class="col-md-4 main  ">
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
<div class="col-md-12">

  <span class="glyphicon glyphicon-star btn-warning"  aria-hidden="true"></span> 
  <span>4.5점</span>   <span> ${requestScope.dto.store_name}</span>

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
지도 들어갈 공간
</div>


<div class="row midbody">
<div class="col-md-4 main">
<p>리뷰</p>
</div>
<div class=" col-md-offset-4  col-md-4  main" style="text-align: right;">
 <span> 전체보기 좋아요보기 </span> <button src="reviewRegisterView.do?store_id=${dto.store_id}"> 리뷰쓰기</button>
</div>

</div>

<div class="row main">
<div class="col-md-2 main" style="text-align: center;"> 
<img alt="" src="img/momo.png" class="pro"> <br>
<p>닉네임</p>
</div>
<div class="col-md-8 col-md-offset-2">
 <span> 날짜 너주세여 </span> 
<p>맛있습니다
</div>
</div>



<div class="row midbody">
<div class="col-md-12 main">
주변카페,주차장
</div>
</div>

</div>
</div>


</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>