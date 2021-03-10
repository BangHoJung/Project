<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>메인페이지</title>

<!-- login css 경로 -->
<link rel="stylesheet" href="css/loginCss.css" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	if(${sessionScope.login == false}){alert("아이디와 암호를 확인해주세요");};
	
	$("#btn_login").click(function () {
		event.preventDefault();
		if($("#id").val().trim().length == 0){alert("아이디를 입력해주세요"); return false;};
		if($("#pass").val().trim().length == 0){alert("암호를 입력해주세요"); return false;};
		 $("#frm_login").submit();
	});
	$("h3").click(function() {
		history.back();
	});
	
})

</script>






</head>
<body> 



<div class="container">
<div class="row">
<div class="col-md-6" id="pon"> 
<strong>더 이상 고민하지 마세요</strong> <br>
<p>너무 많아진 식당 믿지 못할 맛집추천 최고의 리뷰로 정해드리겠습니다</p> <br>
<img src="/img/lolo.png">

</div>
<div class="col-md-6">
<div class="Total">
 <h3>Taste Factory</h3>
<form action="loginAction.do" id="frm_login" method="post">
 <input type="text" name="id"  placeholder="아이디를 입력해주세요" class="id"  maxlength='14' id="id"> <br>
 <input type="password" name="pass"  placeholder="비밀번호를 입력해주세요" class="pass" maxlength='20' id="pass"> <br>
<button  class="btn" id="btn_login" >로그인</button>
</form>
 
 <div class="click">
 <p class="member"><a  href="registerView.do" class="m" >회원가입 </a></p>  <p class="Find"> <a href="#" class="m">아이디 찾기 </a>| <a href="#" class="m"> 비밀번호 찾기 </a></p>
 </div>
 


 </div>
</div>
</div>
</div>
</body>
</html>