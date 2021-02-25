<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form action="">
<div class="container body">

<div class="row midbody">
<div class="col-md-4 main  ">
<img alt="" src="img/bakery/bakery1.jpg" class="img" >
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
  	서울특별시 강남구 삼성로81길 23  
 </td>
 </tr>
 <tr>
 <th>
 지번 
 </th >
 <td colspan="2"> 서울시 강남구 대치동 901-65
 </td>
 </tr>
 <tr>
 <th>
 전화번호 
 </th>	
 <td colspan="2">02-3454-2001 
 </td>
 </tr>
 <tr>
 <th>
 음식  종류	
 </th>
 <td colspan="2">해산물 요리 </td>
 </tr>
 <tr>
 <th>
 가격대
 </th>
 <td>
   만원-2만원
   </td>  
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
  	11:00 - 23:00  
</td>
 </tr>
 <tr>
 <th>
 쉬는시간 
 </th>
 <td colspan="2">
 14:00 - 17:00 
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
<td>
해물 로스
</td>
<td>
35,000원
</td>

</tr>
<tr>
 <th>

 </th>
<td>
해물 로스
</td>
<td>
35,000원
</td>

</tr>

</table>
</div>
</div>

<div class="row midbody">
<div class="col-md-12 main">
메뉴 이미지 들어갈 공간
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
<p>전체보기 좋아요보기</p>
</div>

</div>

<div class="row main">
<div class="col-md-2 main">
<img alt="" src="img/momo.png" class="pro"> <br>
<p>닉네임</p>
</div>
<div class="col-md-8 col-md-offset-2">
<p>날짜 너주세여</p>
맛있습니따
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