<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="pc.css" media="screen and (min-width:1024px)">

<style type="text/css">
.background{
 margin: 0 auto;
 margin-top: 200px;
 width: 400px;
 text-align:  center;
 border: 1px solid #D5D5D5;
 position: relative;
 
}
h3{
text-align: center;
margin: 30px;
}
.id, .pass {
width: 300px;
height: 40px;
margin: 5px;
border: none;
border-bottom: 1px solid #D5D5D5;

} 

.btn{
 width: 200px;
 height: 50px;
 margin: 10px;
}
.member{
position: absolute;
left: 10px;
}
.Find{
text-align: right;
}

 :hover,:visited{
color: black;
text-decoration: none;
}
:active {
	text-decoration: none;
}
</style>
</head>
<body>
<div class="container col-xs-">
<div class="background">
 
 <h3>취업시켜 조를 이용하고 싶으신가요?ㅎㅎ</h3>
 
 <form action="login">

  <input type="text" name="id"  placeholder="아이디를 입력해주세요" class="id" > <br>
 <input type="password" name="pass"  placeholder="비밀번호를 입력해주세요" class="pass"> <br>
 <button type="submit" class="btn">로그인</button>
 
 <p class="member"> <a href="#"> 회원가입 </a></p>    <p class="Find"> <a href="#">아이디 찾기 </a>| <a href="#"> 비밀번호 찾기 </a></p>
 </form>
 
</div>
</div>
</body>
</html>