<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>메인페이지</title>


<!-- 제이쿼리 -->

<!-- login css 경로 -->
<link rel="stylesheet" href="css/loginCss.css" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script type="text/javascript">
$(function name() {
	
	$("#idbtn").click(function () {
		
		 if($("#id").val().trim() == null ){
             alert("아이디를 입력해주세요");
		 }else if($("#id").val())
		 
		 if($("#pass").val().trim() == null ){
             alert("비빌번호를 입력해주세요 입력해주세요");
         }
		 
		if( $("#id").val().trim() &&  $("#pass").val().trim() == null )
		alert("아이디와 비밀번호를 입력해주세요")
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
<img src="/img/loginimg2.jpg">

</div>
<div class="col-md-6">
<div class="Total">
 <h3>취업시켜 조를 이용하고 싶으신가요?</h3>

  <input type="text" name="id"  placeholder="아이디를 입력해주세요" class="id"  maxlength='10' > <br>
 <input type="password" name="pass"  placeholder="비밀번호를 입력해주세요" class="pass" maxlength='14'> <br>
 <button type="button" class="btn" id="idbtn" >로그인</button>
 <div class="click">
 <p class="member"> <a href="register"> 회원가입 </a></p>  <p class="Find"> <a href="#">아이디 찾기 </a>| <a href="#"> 비밀번호 찾기 </a></p>
 </div>
 


 </div>
</div>
</div>
</div>
</body>
</html>