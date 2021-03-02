<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
 <meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<link rel="stylesheet" href="css/mypage_header.css?a" type="text/css">

</head>
<body>
<div class="top">
<div class="hader">
<h2 class="title"> <a class="main" href="/" > taste factory </a></h2>
<div class="locomotion"> <p class="logout"> <a href="/logout.do">로그아웃</a></p></div>
</div>

<div  class="total">

<div class="profile">
<img alt="" src="img/login.png" class="loginimg">
<div class="fosizs">
<p class="name">${sessionScope.id}님</p> 
<p class="grade">적립한 포인트</p>
<p class="Balance">14.222point</p>
</div>
</div>

<div class="pointtotal">
 <div class="point">
 <img alt="" src="img/momo.png" class="pointimg">
  <p> 적립금</p>
 </div>
 <div class="point">
 <img alt="" src="img/momo.png" class="pointimg">
 <p> 적립금</p>
 </div>
 <div class="point">
 <img alt="" src="img/momo.png" class="pointimg">
 <p> 적립금</p>
 </div>
 </div>
</div>
</div>
</body>
</html>