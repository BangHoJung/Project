<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>메인페이지</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">

.btn{
 width: 200px;
 height: 50px;
 margin: 30px 0px;
 border: none;
 text-decoration: none;
}
h3{
margin: 30px;
}

.container{
margin-top: 200px;
}
.Total{
border: 1px solid gray;
text-align: center;
box-sizing: border-box; 
position: relative;
width: 400px;

}

.id, .pass{
border: none;
border-bottom: 1px solid gray;
width: 300px;
height: 40px;
}
.member> :link, .Find > :link{
color: black;
text-decoration: none;
}
.member> :hover, .Find > :hover {
text-decoration: none;
	color: gray;
}
.btn:active{
background-color: #BDBDBD
}
strong{
font-size: 25px;
margin: 15px 0px;
}

.click{
display: flex;
justify-content: space-around;
gap : 10px;
margin: 20px 0px;
}
img{
width: 450px;
margin-top:-10px;
}

@media screen and (max-width: 992px) {
#pon{
display: none;

}
.col-md-6{
display: flex;
justify-content: center;
}
}
@media screen and (max-width: 768px){
.col-md-6{

}
.Total{
border: none;
}
.id, .pass{
width: 100%;
}
.btn{
width: 100%;
margin: 50px 0px;
}
.click{
display: flex;
justify-content: space-around;
gap: 30%;
}
h3{
margin-bottom: 50px;
}
}

</style>

</head>
<body>
<div class="container">
<div class="row">
<div class="col-md-6" id="pon"> 
<strong>더 이상 고민하지 마세요</strong> <br>
<p>너무 많아진 식당 믿지 못할 맛집추천 최고의 리뷰로 정해드리겠습니다</p> <br>
<img src="img/loginimg2.jpg">

</div>
<div class="col-md-6">
<div class="Total">
 <h3>취업시켜 조를 이용하고 싶으신가요?</h3>
 <form action="login">
  <input type="text" name="id"  placeholder="아이디를 입력해주세요" class="id" > <br>
 <input type="password" name="pass"  placeholder="비밀번호를 입력해주세요" class="pass"> <br>
 <button type="submit" class="btn">로그인</button>
 <div class="click">
 <p class="member"> <a href="register"> 회원가입 </a></p>  <p class="Find"> <a href="#">아이디 찾기 </a>| <a href="#"> 비밀번호 찾기 </a></p>
 </div>
 </form>

 </div>
 </div>
</div>
</div>

</body>
</html>