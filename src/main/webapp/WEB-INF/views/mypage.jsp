<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

.top{
width: 100%;
background-color: #FF7012;
}
.hader{
margin:0 auto;
text-align: center;
display: flex;
justify-content: space-between;

}
.title{
font-weight: bold;

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



.list{
width: 200px;
height: 60px;
list-style-type: none;
text-align: center;
display: flex;
flex-direction: column;
justify-content: center;
}
.bady{
display:flex;
flex-direction: row;

margin-top: 2%;
}
.maintitle{

margin: 0px;
margin-bottom: 1%;
}
.menulist{

}
.main{
box-sizing: border-box;
width: 1400px;
}
@media screen and (max-width: 992px){
.menulist{
border: none;
margin: 0 auto;
}
.main{
display: none;
}
.list{
border: none;
width: 100%;
font-size: 200%;

}
.total{
display: flex;
flex-direction: column;
}
.point{
padding-top: 0px;
}
}
@media screen and (max-width: 768px){


}
</style>
</head>
<body>
<form action="mypage.do" method="post">
<div class="top">
<div class="hader">
<h2 class="title">My Page</h2>

<div class="locomotion"> <p class="logout"> <a href="#">로그아웃</a></p></div>
</div>

<div  class="total">

<div class="profile">
<img alt="" src="img/login.png" class="loginimg">
<div class="fosizs">
<p class="name">닉네임</p> 
<p class="grade">Lv.등급</p>
<p>다음등급까지 14.222point남으셨습니다</p>
</div>
</div>

<div class="pointtotal">
 <div class="point">
 <img alt="" src="img/money.png" class="pointimg">
 fdsfdsfs
 </div>
 <div class="point">
 <img alt="" src="img/money.png" class="pointimg">
 fdsfdsfs
 </div>
 <div class="point">
 <img alt="" src="img/money.png" class="pointimg">
 fdsfdsfs
 </div>
 </div>
 
</div>
</div>

<div class="bady">

<div class="menulist">
<ul>
<li class="list">Menu1</li>
<li class="list">Menu2</li>
<li class="list">Menu3</li>
<li class="list">Menu4</li>
<li class="list">Menu5</li>
</ul>
</div>

<div class="main"> 
<h3 class="maintitle">menu</h3>
<table class="table">
<tr>
<th>가게1</th>
<th>가게2</th>
<th>가게3</th>
<th>가게4</th>
</tr>

<tr>
<td>가게1</td>
<td>가게2</td>
<td>가게3</td>
<td>가게4</td>
</tr>

</table>


<h3 class="maintitle">menu</h3>
<table class="table">
<tr>
<th>가게1</th>
<th>가게2</th>
<th>가게3</th>
<th>가게4</th>
</tr>

<tr>
<td>가게1</td>
<td>가게2</td>
<td>가게3</td>
<td>가게4</td>
</tr>

</table>
<h3 class="maintitle">menu</h3>
<table class="table">
<tr>
<th>가게1</th>
<th>가게2</th>
<th>가게3</th>
<th>가게4</th>
</tr>

<tr>
<td>가게1</td>
<td>가게2</td>
<td>가게3</td>
<td>가게4</td>
</tr>

</table>
 
 </div>

</div>
 </form>
</body>
</html>