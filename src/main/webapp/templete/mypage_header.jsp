<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 헤더</title>
<style>

 @media (min-width: 769px) {
  .container {
    width: 1170px;
    position: relative;
     }
     .top{
width: 100%;
background-color: #FA0050;
}
.title > .main:link{
color: white;
}
.title a{
color: white;
}
.hader{
margin:0 auto;
text-align: center;
display: flex;
justify-content: space-between;
}
.title{
font-weight: bold;
color:white;
padding-left: 3%;
}
.logout > a{
color: white;
}
.logout {
margin-top: 10px;
font-size: 17px;
padding-right: 5%;
width: 100px;
}
.profile{
display: flex;
flex-direction: row;
}
.loginimg{
width: 200px;
height: 200px;
border-radius: 100%;
}
.pointtotal{
display: flex;
justify-content: space-around;
gap: 10%;
padding-left: 10px;
}
.pointimg{
width: 70px;
height: 70px;
}
.total{
display: flex;
justify-content: space-around;
gap: 15%;
}
.point{
display: flex;
flex-direction: column;
padding-top: 60px;
color: white;
}
.name{
font-weight: bold;
font-size: 250%;
margin-top: 10%;
}
.grade{
font-weight: bold;
font-size: 30px;
}

.Balance{
color: white;
}
}
@media (max-width: 768px){
.container{
   width: 414px;
   position: relative;
  }
.loginimg{
width: 100px;
height: 100px;
}
.name{
font-size: 200%;
font-weight: bold;
}
.grade{
font-size: 200%;
font-weight: bold;
}
.pointimg{
width: 50%;
height: 50%;
}
.top{
width: 100%;
background-color: #FA0050;
}
.title a{
color: white;
}
.title > .main:link{
color: white;
}
.hader{
margin:0 auto;
text-align: center;
display: flex;
justify-content: space-between;
}
.title{
font-weight: bold;
color:white;
padding-left: 3%;
}
.logout > a{
color: white;
}
.logout {
margin-top: 10px;
font-size: 17px;
padding-right: 5%;
width: 100px;
}
.profile{
display: flex;
flex-direction: row;
}
.pointtotal{
display: flex;
justify-content: space-around;
gap: 10%;
width: 50% !important;
}
.total{
display: flex;
justify-content: space-around;
gap: 15%;
}
.point{
display: flex;
flex-direction: column;
padding-top: 60px;
color: white;
}
.point p{
font-size: 100%;
margin-top: 10px;
}
.Balance{
width: 80%;
color: white;
font-size: 100%;
}

}
@media (max-width: 414px){
   .container{
   width: 320px;
   position: relative;
  }
 .point p{
font-size: 70% !important;
 }
.loginimg{
width: 64px !important;
height: 64px !important;
}
.name{
font-size: 100% !important;
}
.grade{
font-size: 90% !important;
}
.Balance{
width: 60px !important;
font-size: 30% !important;
}
}
</style>
</head>
<body>
<div class="top">
<div class="hader">
<h2 class="title"> <a class="main" href="/"> taste factory </a></h2>
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
 </div>
 <div class="point">
 </div>
 <div class="point">
 </div>
 </div>
</div>
</div>
</body>
</html>