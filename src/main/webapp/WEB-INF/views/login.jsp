<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>메인페이지</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}

</style>
<link rel="stylesheet" href="../css/pc2.css" media="screen and (max-width:1023px)">
<link rel="stylesheet" href="../css/pc.css" media="screen and (min-width:1024px)">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#pop").html($(window).width());
		$(window).resize(function() {
			$("#pop").html($(window).width());
		});		
	});
	

</script>
</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
<div class="container col-xs-">
<div class="background">
 
 <h3>취업시켜 조를 이용하고 싶으신가요?ㅎㅎ</h3>
 
 <form action="login">

  <input type="text" name="id"  placeholder="아이디를 입력해주세요" class="id" > <br>
 <input type="password" name="pass"  placeholder="비밀번호를 입력해주세요" class="pass"> <br>
 <button type="submit" class="btn">로그인</button>
 
 <p class="member"> <a href="register"> 회원가입 </a></p>    <p class="Find"> <a href="#">아이디 찾기 </a>| <a href="#"> 비밀번호 찾기 </a></p>
 </form>
 
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include> 
</body>
</html>